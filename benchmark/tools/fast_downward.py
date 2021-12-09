import re
from pathlib import Path
from typing import List, Optional

from benchmark.tools.core import Tool, ToolID, Result, Status


class FastDownwardTool(Tool):
    """Implement Downward experiments and configurations."""

    TOOL_ID = ToolID.FAST_DOWNWARD
    NAME = "FastDownward"

    def __init__(self, binary_path: str, search: str = "astar(blind())"):
        """Initialize the tool."""
        super().__init__(binary_path)

        self.search = search

    @classmethod
    def get_tool_id(cls) -> ToolID:
        """Get tool ID."""
        return ToolID.FAST_DOWNWARD

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
        return [self.binary_path, domain, problem, "--search", self.search]

    def collect_statistics(self, output: str) -> Result:
        """Collect statistics."""
        match = re.search("Total time: (.*)s", output)
        tool_time = float(match.group(1))

        solution_found_match = re.search("Solution found.", output)
        if solution_found_match is not None:
            status = Status.SUCCESS
        else:
            status = Status.FAILURE

        return Result("", [], tool_time * 1000, None, status)
