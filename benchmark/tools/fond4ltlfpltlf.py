import re
from abc import ABC
from enum import Enum
from pathlib import Path
from typing import List, Optional, Union

from benchmark.tools.core import Tool, Result, Status, ToolID, SearchAlg
from benchmark.utils.base import try_to_get_float
from planning_with_past import REPO_ROOT

DEFAULT_BIN_F4LP_PATH = (REPO_ROOT / "bin" / "fond4ltlfpltlf_wrapper").absolute()


class SupportedPlanners:
    MYND = "mynd"


class Fond4LtlfPltlfTool(Tool, ABC):
    """Implement abstract FOND4LTLfPLTLf tool wrapper."""

    def __init__(self, binary_path: str, planner_id: Union[str, SupportedPlanners]):
        """Initialize the tool."""
        super().__init__(binary_path)

        self.planner_id = planner_id

    def get_cli_args(
        self,
        domain: Path,
        problem: Path,
        formula: Optional[str] = None,
        mapping: Optional[Path] = None,
    ) -> List[str]:
        """Get CLI arguments."""
        assert formula is not None, "formula argument must be specified"
        assert mapping is None, "mapping argument not supported"

        cli_args = [
            self.binary_path,
            "-t",
            self.planner_id,
            "-d",
            domain,
            "-p",
            problem,
            "-g",
            formula,
        ]
        return cli_args


class Fond4LtlfPltlfMyND(Fond4LtlfPltlfTool):

    NAME = "F4LP-MyND"

    def __init__(
        self, binary_path: str, search: Union[SearchAlg, str] = SearchAlg.LAOSTAR
    ):
        """Initialize the tool."""
        super().__init__(binary_path, SupportedPlanners.MYND)

        self.search = SearchAlg(search)

    def collect_statistics(self, output: str) -> Result:
        """Collect statistics."""
        tool_time = try_to_get_float("Tool time: +([0-9.]+) seconds", output)
        compilation_time = try_to_get_float(
            "Compilation time: +([0-9.]+) seconds", output
        )
        end2end_time = try_to_get_float(
            "Total time: +([0-9.]+) seconds", output, default=None
        )

        timed_out_match = re.search("Timed out.", output)
        initial_proven_match = re.search("INITIAL IS PROVEN!", output)
        initial_disproven_match = re.search("INITIAL IS DISPROVEN!", output)
        if initial_proven_match is not None:
            status = Status.SUCCESS
        elif initial_disproven_match is not None:
            status = Status.FAILURE
        elif timed_out_match is not None:
            status = Status.TIMEOUT
        else:
            status = Status.ERROR

        nb_nodes_expansion_match = re.search("Number of node expansions: ([0-9]+)", output)
        if nb_nodes_expansion_match:
            nb_nodes_expansions = int(nb_nodes_expansion_match.group(1))
        else:
            nb_nodes_expansions = None

        return Result("", [], compilation_time, tool_time, end2end_time, nb_nodes_expansions, status)
