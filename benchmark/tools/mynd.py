import re
from enum import Enum
from pathlib import Path
from typing import List, Optional, Union

from benchmark.tools.core import Tool, ToolID, Result, Status
from planning_with_past import REPO_ROOT

DEFAULT_BIN_MYND_PATH = (REPO_ROOT / "bin" / "mynd_wrapper").absolute()


class MyNDTool(Tool):
    """Implement MyND tool wrapper."""

    TOOL_ID = ToolID.MYND
    NAME = "MyND"

    class SearchAlg(Enum):
        """MyND Search algorithms"""

        LAOSTAR = "laostar"
        AOSTAR = "aostar"

    def __init__(
        self, binary_path: str, search: Union[SearchAlg, str] = SearchAlg.LAOSTAR
    ):
        """Initialize the tool."""
        super().__init__(binary_path)

        self.search = MyNDTool.SearchAlg(search)

    def get_cli_args(
        self,
        domain: Path,
        problem: Path,
        formula: Optional[str] = None,
        mapping: Optional[Path] = None,
    ) -> List[str]:
        """Get CLI arguments."""
        assert formula is None, "formula argument not supported"
        assert mapping is None, "mapping argument not supported"

        cli_args = [self.binary_path, "-d", domain, "-p", problem]
        is_strong_planning = self.search == MyNDTool.SearchAlg.AOSTAR
        cli_args += ["-s", str(int(is_strong_planning))]
        return cli_args

    def collect_statistics(self, output: str) -> Result:
        """Collect statistics."""
        match = re.search("Time needed: +([0-9.]+) seconds\.", output)
        tool_time = float(match.group(1))

        solution_found_match = re.search("Result: Strong cyclic plan found", output)
        if solution_found_match is not None:
            status = Status.SUCCESS
        else:
            status = Status.FAILURE

        return Result("", [], tool_time * 1000.0, None, status)
