import subprocess
import time
from abc import ABC, abstractmethod
from dataclasses import dataclass
from enum import Enum
from pathlib import Path
from typing import List, Dict, Type, Union, Optional, Any

from benchmark.utils.base import CTRL_C_EXIT_CODE


class ToolID(Enum):
    FAST_DOWNWARD = "fast-downward"
    MYND = "mynd"
    FOND4LTLfPLTLf_MYND = "f4lp-mynd"


class Status(Enum):
    SUCCESS = "success"
    FAILURE = "failure"
    TIMEOUT = "timeout"
    ERROR = "error"


@dataclass()  # frozen=True
class Result:
    name: str
    command: List[str]
    millis_tool: Optional[float]
    millis_end2end: Optional[float]
    status: Status

    @staticmethod
    def headers() -> str:
        return (
            f"{'name': <10}\t"
            f"{'status': <10}\t"
            f"{'time_tool': <10}\t"
            f"{'time_end2end': <10}\t"
            f"{'command': <10}"
        )

    def json(self) -> Dict[str, Any]:
        """To json."""
        return dict(
            name=self.name,
            status=self.status.value,
            time_tool=self.millis_tool,
            time_end2end=self.millis_end2end,
            command=" ".join(self.command),
        )

    def __str__(self):
        """To string."""
        millis_tool_str = (
            f"{self.millis_tool / 1000.0: 10.5f}"
            if self.millis_tool is not None
            else f"{'None': <10}"
        )
        millis_end2end_str = (
            f"{self.millis_end2end / 1000.0: 10.5f}"
            if self.millis_end2end is not None
            else f"{'None': <10}"
        )
        return (
            f"{str(self.name): <10}\t"
            f"{self.status.value}\t"
            f"{millis_tool_str}\t"
            f"{millis_end2end_str}\t"
            f"{' '.join(map(str, self.command))}"
        )

    def to_rows(self) -> str:
        """Print results by rows."""
        return f"name={self.name}\n" \
            f"status={self.status}\n" \
            f"time_tool={self.millis_tool / 1000.0}\n" \
            f"time_end2end={self.millis_end2end / 1000.0}\n" \
            f"command={' '.join(map(str, self.command))}"


class Tool(ABC):
    """Interface for tools."""

    def __init__(self, binary_path: str):
        """
        Initialize the tool.

        :param binary_path: the binary path
        """
        self._binary_path = binary_path

    @property
    def binary_path(self) -> str:
        """Get the binary path."""
        return self._binary_path

    def plan(
        self,
        domain: Path,
        problem: Path,
        formula: Optional[str] = None,
        mapping: Optional[Path] = None,
        timeout: float = 5000.0,
        cwd: Optional[str] = None,
        name: Optional[str] = None,
    ) -> Result:
        """
        Apply the tool to a file.

        :param domain: path to the domain file
        :param problem: path to the problem file
        :param mapping: path to the mapping file
        :param formula: the PLTLf formula
        :param timeout: the timeout in milliseconds
        :param cwd: the current working directory
        :param name: the experiment name
        :return: the planning result
        """
        args = self.get_cli_args(domain, problem, formula, mapping)
        start = time.perf_counter()
        timed_out = False
        print("Running command: ", " ".join(map(str, args)))
        proc = subprocess.Popen(
            args, stdout=subprocess.PIPE, stderr=subprocess.PIPE, cwd=cwd
        )
        try:
            proc.wait(timeout=int(timeout / 1000.0))
        except subprocess.TimeoutExpired:
            proc.terminate()
            proc.wait()
            timed_out = True
        end = time.perf_counter()
        total = (end - start) * 1000.0

        stdout, _stderr = proc.communicate()
        stdout = stdout.decode("utf-8")
        result = self.collect_statistics(stdout)
        result.name = name
        result.command = args
        result.millis_end2end = total
        # CTRL+C termination happens only if timeout occurred.
        if proc.returncode != 0 and proc.returncode != CTRL_C_EXIT_CODE:
            result.status = Status.ERROR
        # we don't consider time out if we constructed the DFA.
        elif timed_out:
            result.status = Status.TIMEOUT

        return result

    @abstractmethod
    def collect_statistics(self, output: str) -> Result:
        """
        Collect statistics.

        :param output: the output from where to extract statistics.
        :return: statistics
        """

    @property
    @classmethod
    @abstractmethod
    def TOOL_ID(cls) -> ToolID:
        """Get tool id."""

    @abstractmethod
    def get_cli_args(
        self,
        domain: Path,
        problem: Path,
        formula: Optional[str] = None,
        mapping: Optional[Path] = None,
    ) -> List[str]:
        """Get CLI arguments."""


class ToolSpec:
    """A specification for a particular instance of an object."""

    def __init__(
        self,
        tool_id: ToolID,
        tool_cls: Type[Tool],
        **kwargs: Dict,
    ) -> None:
        """
        Initialize an item specification.

        :param id_: the id associated to this specification
        :param tool_cls: the tool class
        :param kwargs: other custom keyword arguments.
        """
        self.tool_id = tool_id
        self.tool_cls = tool_cls
        self.kwargs = {} if kwargs is None else kwargs

    def make(self, **kwargs: Any) -> Tool:
        """
        Instantiate an instance of the item object with appropriate arguments.

        :param kwargs: the key word arguments
        :return: an item
        """
        _kwargs = self.kwargs.copy()
        _kwargs.update(kwargs)
        tool = self.tool_cls(**_kwargs)
        return tool


class ToolRegistry:
    """Tool registry."""

    def __init__(self):
        """Initialize the registry."""
        self._specs: Dict[ToolID, ToolSpec] = {}

    def register(
        self, tool_id: Union[str, ToolID], tool_cls: Type[Tool], **kwargs: Any
    ):
        """Register a tool."""
        tool_id = ToolID(tool_id)
        self._specs[tool_id] = ToolSpec(tool_id, tool_cls, **kwargs)

    def make(self, tool_id: Union[str, ToolID], **kwargs) -> Tool:
        """
        Make the tool.

        :param tool_id: the tool ID
        :param kwargs: the overrides for keyword arguments
        :return: the tool instance
        """
        tool_spec = self._specs[ToolID(tool_id)]
        return tool_spec.make(**kwargs)
