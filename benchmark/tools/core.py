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
    time_compilation: Optional[float]
    time_tool: Optional[float]
    time_end2end: Optional[float]
    status: Status

    @staticmethod
    def headers() -> str:
        return (
            f"{'name': <10}\t"
            f"{'status': <10}\t"
            f"{'time_compilation': <10}\t"
            f"{'time_tool': <10}\t"
            f"{'time_end2end': <10}\t"
            f"{'command': <10}"
        )

    def json(self) -> Dict[str, Any]:
        """To json."""
        return dict(
            name=self.name,
            status=self.status.value,
            time_compilation=self.time_compilation,
            time_tool=self.time_tool,
            time_end2end=self.time_end2end,
            command=" ".join(self.command),
        )

    def __str__(self):
        """To string."""
        time_compilation_str = (
            f"{self.time_compilation: 10.6f}"
            if self.time_compilation is not None
            else f"{'None': <10}"
        )
        time_tool_str = (
            f"{self.time_tool: 10.6f}"
            if self.time_tool is not None
            else f"{'None': <10}"
        )
        time_end2end_str = (
            f"{self.time_end2end: 10.6f}"
            if self.time_end2end is not None
            else f"{'None': <10}"
        )
        return (
            f"{str(self.name): <10}\t"
            f"{self.status.value}\t"
            f"{time_compilation_str}\t"
            f"{time_tool_str}\t"
            f"{time_end2end_str}\t"
            f"{' '.join(map(str, self.command))}"
        )

    def to_rows(self) -> str:
        """Print results by rows."""
        return (
            f"name={self.name}\n"
            f"status={self.status}\n"
            f"time_compilation={self.time_compilation}\n"
            f"time_tool={self.time_tool}\n"
            f"time_end2end={self.time_end2end}\n"
            f"command={' '.join(map(str, self.command))}"
        )


def save_data(data: List[Result], output: Path) -> None:
    """Save data to a file."""
    content = ""
    content += Result.headers() + "\n"
    for result in data:
        content += str(result) + "\n"
    output.write_text(content)


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
        timeout: float = 5.0,
        cwd: Optional[str] = None,
        name: Optional[str] = None,
    ) -> Result:
        """
        Apply the tool to a file.

        :param domain: path to the domain file
        :param problem: path to the problem file
        :param mapping: path to the mapping file
        :param formula: the PLTLf formula
        :param timeout: the timeout in seconds
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
            proc.wait(timeout=timeout)
        except subprocess.TimeoutExpired:
            proc.terminate()
            proc.wait()
            timed_out = True
        end = time.perf_counter()
        total = end - start

        if timed_out:
            return Result(name, args, total, total, total, Status.TIMEOUT)

        stdout, _stderr = proc.communicate()
        stdout = stdout.decode("utf-8")
        result = self.collect_statistics(stdout)
        result.name = name
        result.command = args
        result.time_end2end = total
        # CTRL+C termination happens only if timeout occurred.
        if proc.returncode != 0 and proc.returncode != CTRL_C_EXIT_CODE:
            result.status = Status.ERROR

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
