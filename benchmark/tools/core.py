import os
import re
import signal
import subprocess
import time
from abc import ABC, abstractmethod
from dataclasses import dataclass
from enum import Enum
from pathlib import Path
from typing import List, Dict, Type, Union, Optional, Any

from benchmark.utils.base import try_to_get_float


class ToolID(Enum):
    FAST_DOWNWARD_FF = "fd-ff"
    FAST_DOWNWARD_HMAX = "fd-hmax"
    MYND_STRONG_FF = "mynd-s-ff"
    MYND_STRONG_CYCLIC_FF = "mynd-sc-ff"
    PALADINUS_STRONG_CYCLIC_FF = "paladinus-sc-ff"
    PLAN4PAST_FD_FF = "p4p-fd-ff"
    PLAN4PAST_FD_HMAX = "p4p-fd-hmax"
    PLAN4PAST_MYND_STRONG_FF = "p4p-mynd-s-ff"
    PLAN4PAST_MYND_STRONG_HMAX = "p4p-mynd-s-hmax"
    PLAN4PAST_MYND_STORNG_CYCLIC_FF = "p4p-mynd-sc-ff"
    PLAN4PAST_MYND_STORNG_CYCLIC_HMAX = "p4p-mynd-sc-hmax"
    PLAN4PAST_PALADINUS_STORNG_CYCLIC_FF = "p4p-paladinus-sc-ff"
    PLAN4PAST_PALADINUS_STORNG_CYCLIC_HMAX = "p4p-paladinus-sc-hmax"
    FOND4LTLfPLTLf_FD_FF = "f4lp-fd-ff"
    FOND4LTLfPLTLf_FD_HMAX = "f4lp-fd-hmax"
    FOND4LTLfPLTLf_MYND_STRONG_FF = "f4lp-mynd-s-ff"
    FOND4LTLfPLTLf_MYND_STRONG_HMAX = "f4lp-mynd-s-hmax"
    FOND4LTLfPLTLf_MYND_STORNG_CYCLIC_FF = "f4lp-mynd-sc-ff"
    FOND4LTLfPLTLf_MYND_STORNG_CYCLIC_HMAX = "f4lp-mynd-sc-hmax"
    FOND4LTLfPLTLf_PALADINUS_STORNG_CYCLIC_FF = "f4lp-paladinus-sc-ff"
    FOND4LTLfPLTLf_PALADINUS_STORNG_CYCLIC_HMAX = "f4lp-paladinus-sc-hmax"
    LTLFOND2FOND_FD_FF = "lf2f-fd-ff"
    LTLFOND2FOND_FD_HMAX = "lf2f-fd-hmax"
    LTLFOND2FOND_MYND_STRONG_FF = "lf2f-mynd-s-ff"
    LTLFOND2FOND_MYND_STRONG_HMAX = "lf2f-mynd-s-hmax"
    LTLFOND2FOND_MYND_STORNG_CYCLIC_FF = "lf2f-mynd-sc-ff"
    LTLFOND2FOND_MYND_STORNG_CYCLIC_HMAX = "lf2f-mynd-sc-hmax"
    LTLFOND2FOND_PALADINUS_STORNG_CYCLIC_FF = "lf2f-paladinus-sc-ff"
    LTLFOND2FOND_PALADINUS_STORNG_CYCLIC_HMAX = "lf2f-paladinus-sc-hmax"
    GGPLTL_FD_FF = "gg-fd-ff"
    GGPLTL_FD_HMAX = "gg-fd-hmax"
    GGPLTL_MYND_STRONG_FF = "gg-mynd-s-ff"
    GGPLTL_MYND_STRONG_HMAX = "gg-mynd-s-hmax"
    GGPLTL_MYND_STORNG_CYCLIC_FF = "gg-mynd-sc-ff"
    GGPLTL_MYND_STORNG_CYCLIC_HMAX = "gg-mynd-sc-hmax"
    GGPLTL_PALADINUS_STORNG_CYCLIC_FF = "gg-paladinus-sc-ff"
    GGPLTL_PALADINUS_STORNG_CYCLIC_HMAX = "gg-paladinus-sc-hmax"


class Status(Enum):
    SUCCESS = "success"
    FAILURE = "failure"
    TIMEOUT = "timeout"
    ERROR = "error"


class SearchAlg(Enum):
    """Search algorithms"""
    ASTAR = "astar"
    LAOSTAR = "laostar"
    AOSTAR = "aostar"
    ITERATIVE_DFS = "iterative_dfs"


class Heuristic(Enum):
    """Heuristics"""
    FF = "ff"
    HMAX = "hmax"


@dataclass()  # frozen=True
class Result:
    name: str
    command: List[str]
    time_compilation: Optional[float]
    time_tool: Optional[float]
    time_end2end: Optional[float]
    nb_node_expanded: Optional[int]
    status: Status

    @staticmethod
    def headers() -> str:
        return (
            "name\t"
            "status\t"
            "time_compilation\t"
            "time_tool\t"
            "time_end2end\t"
            "nb_node_expanded\t"
            "command"
        )

    def json(self) -> Dict[str, Any]:
        """To json."""
        return dict(
            name=self.name,
            status=self.status.value,
            time_compilation=self.time_compilation,
            time_tool=self.time_tool,
            time_end2end=self.time_end2end,
            nb_node_expanded=self.nb_node_expanded,
            command=" ".join(self.command),
        )

    def __str__(self):
        """To string."""
        time_compilation_str = (
            f"{self.time_compilation:10.6f}"
            if self.time_compilation is not None
            else "None"
        )
        time_tool_str = (
            f"{self.time_tool:10.6f}" if self.time_tool is not None else "None"
        )
        time_end2end_str = (
            f"{self.time_end2end:10.6f}" if self.time_end2end is not None else "None"
        )
        return (
            f"{self.name}\t"
            f"{self.status.value}\t"
            f"{time_compilation_str}\t"
            f"{time_tool_str}\t"
            f"{time_end2end_str}\t"
            f"{self.nb_node_expanded}\t"
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
            f"nb_node_expanded={self.nb_node_expanded}\n"
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
        working_dir: Optional[str] = None,
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
        :param working_dir: the working dir
        :return: the planning result
        """
        args = self.get_cli_args(domain, problem, formula, mapping, working_dir)
        start = time.perf_counter()
        timed_out = False
        print("Running command: ", " ".join(map(str, args)))
        proc = subprocess.Popen(
            args,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            cwd=cwd,
            preexec_fn=os.setsid,
        )
        try:
            proc.wait(timeout=timeout)
        except subprocess.TimeoutExpired:
            os.killpg(os.getpgid(proc.pid), signal.SIGTERM)
            proc.wait()
            timed_out = True
        end = time.perf_counter()
        total = end - start

        stdout, stderr = proc.communicate()
        stdout = stdout.decode("utf-8")
        stderr = stderr.decode("utf-8")

        (Path(working_dir) / "stdout.txt").write_text(stdout)
        (Path(working_dir) / "stderr.txt").write_text(stderr)

        result = self.collect_statistics(stdout)
        result.name = name
        result.command = args

        # in case time end2end not set by the tool, set from command
        if result.time_end2end is None:
            result.time_end2end = total

        if timed_out:
            result.status = Status.TIMEOUT

        if result.status is None:
            result.status = Status.ERROR

        return result

    @abstractmethod
    def collect_statistics(self, output: str) -> Result:
        """
        Collect statistics.

        :param output: the output from where to extract statistics.
        :return: statistics
        """

    @abstractmethod
    def get_cli_args(
        self,
        domain: Path,
        problem: Path,
        formula: Optional[str] = None,
        mapping: Optional[Path] = None,
        working_dir: Optional[str] = None,
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


def extract_from_tool(output: str, tool: str) -> Result:
    tool_time = try_to_get_float("Tool time: +([0-9.]+) seconds", output)
    compilation_time = try_to_get_float("Compilation time: +([0-9.]+) seconds", output)
    end2end_time = try_to_get_float(
        "Total time: +([0-9.]+) seconds", output, default=None
    )

    timed_out_match = re.search("Timed out.", output)
    if tool == "fd":
        solution_found_match = re.search("search exit code: 0", output)
        no_solution_match = re.search("search exit code: 12", output)
    elif tool == "mynd" or "paladinus":
        solution_found_match = re.search("INITIAL IS PROVEN!", output)
        no_solution_match = re.search("INITIAL IS DISPROVEN!", output)
    else:
        solution_found_match = None
        no_solution_match = True
    if solution_found_match is not None:
        status = Status.SUCCESS
    elif no_solution_match is not None:
        status = Status.FAILURE
    elif timed_out_match is not None:
        status = Status.TIMEOUT
    else:
        status = Status.ERROR

    if tool == "fd":
        nb_nodes_expansion_match = re.search("Expanded ([0-9]+) state\(s\).", output)
    elif tool == "mynd":
        nb_nodes_expansion_match = re.search("Number of node expansions: ([0-9]+)", output)
    elif tool == "paladinus":
        nb_nodes_expansion_match = re.search("# Number of Node Expansions = ([0-9]+)", output)
    else:
        nb_nodes_expansion_match = None

    if nb_nodes_expansion_match:
        nb_nodes_expansions = int(nb_nodes_expansion_match.group(1))
    else:
        nb_nodes_expansions = None

    return Result(
        "", [], compilation_time, tool_time, end2end_time, nb_nodes_expansions, status
    )
