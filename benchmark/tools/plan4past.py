import re
from abc import ABC
from enum import Enum
from pathlib import Path
from typing import List, Optional, Union

from benchmark.tools.core import Tool, Result, Status, ToolID
from benchmark.utils.base import try_to_get_float
from planning_with_past import REPO_ROOT

DEFAULT_BIN_P4P_PATH = (REPO_ROOT / "bin" / "plan4past").absolute()


class SupportedPlanners:
    MYND = "mynd"


class Plan4PastTool(Tool, ABC):
    """Implement abstract FOND4LTLfPLTLf tool wrapper."""

    def get_cli_args(
        self,
        domain: Path,
        problem: Path,
        formula: Optional[str] = None,
        mapping: Optional[Path] = None,
    ) -> List[str]:
        """Get CLI arguments."""
        assert formula is not None, "formula argument must be specified"

        cli_args = [
            self.binary_path,
            "--domain",
            domain,
            "--problem",
            problem,
            "--formula",
            formula,
        ]
        if mapping:
            cli_args += ["--map", mapping]
        return cli_args


class Plan4PastToolMyND(Plan4PastTool):

    TOOL_ID = ToolID.FOND4LTLfPLTLf_MYND
    NAME = "P4P-MyND"

    class SearchAlg(Enum):
        """MyND Search algorithms"""

        LAOSTAR = "laostar"
        AOSTAR = "aostar"

    def __init__(
        self, binary_path: str, search: Union[SearchAlg, str] = SearchAlg.LAOSTAR
    ):
        """Initialize the tool."""
        super().__init__(binary_path)

        self.search = Plan4PastToolMyND.SearchAlg(search)

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

        return Result("", [], compilation_time, tool_time, end2end_time, status)
