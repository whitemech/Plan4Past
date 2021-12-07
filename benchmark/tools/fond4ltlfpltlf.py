import re
from abc import ABC
from enum import Enum
from pathlib import Path
from typing import List, Optional, Union

from benchmark.tools.core import Tool, Result, Status, ToolID
from planning_with_past import REPO_ROOT

DEFAULT_BIN_F4LP_PATH = (REPO_ROOT / "bin" / "fond4ltlfpltlf_wrapper").absolute()


class SupportedPlanners:
    MYND = "mynd"


class Fond4LtlfPltlfTool(Tool, ABC):
    """Implement abstract FOND4LTLfPLTLf tool wrapper."""

    def __init__(
            self, binary_path: str, planner_id: Union[str, SupportedPlanners]
    ):
        """Initialize the tool."""
        super().__init__(binary_path)

        self.planner_id = planner_id

    def get_cli_args(
        self,
        domain: Path,
        problem: Path,
        formula: Optional[Path] = None,
        mapping: Optional[Path] = None,
    ) -> List[str]:
        """Get CLI arguments."""
        assert formula is not None, "formula argument must be specified"
        assert mapping is None, "mapping argument not supported"

        cli_args = [self.binary_path, "-t", self.planner_id, "-d", domain, "-p", problem, "-g", formula.read_text().strip()]
        return cli_args


class Fond4LtlfPltlfMyND(Fond4LtlfPltlfTool):

    TOOL_ID = ToolID.FOND4LTLfPLTLf_MYND
    NAME = "F4LP-MyND"

    class SearchAlg(Enum):
        """MyND Search algorithms"""

        LAOSTAR = "laostar"
        AOSTAR = "aostar"

    def __init__(
        self, binary_path: str, search: Union[SearchAlg, str] = SearchAlg.LAOSTAR
    ):
        """Initialize the tool."""
        super().__init__(binary_path, SupportedPlanners.MYND)

        self.search = Fond4LtlfPltlfMyND.SearchAlg(search)

    def collect_statistics(self, output: str) -> Result:
        """Collect statistics."""
        match = re.search("Total time: +([0-9.]+) seconds", output)
        tool_time = float(match.group(1))

        solution_found_match = re.search("Result: Strong cyclic plan found", output)
        if solution_found_match is not None:
            status = Status.SUCCESS
        else:
            status = Status.FAILURE

        return Result("", [], tool_time * 1000.0, None, status)
