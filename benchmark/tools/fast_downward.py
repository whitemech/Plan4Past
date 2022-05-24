from pathlib import Path
from typing import List, Optional, Union

from benchmark.tools.core import (
    Tool,
    Result,
    SearchAlg,
    Heuristic,
    extract_from_tool,
)
from planning_with_past import REPO_ROOT

DEFAULT_BIN_FD_PATH = (REPO_ROOT / "bin" / "fd_wrapper").absolute()


class FastDownwardTool(Tool):
    """Implement Downward experiments and configurations."""

    NAME = "FastDownward"

    def __init__(
        self,
        binary_path: str,
        search: Union[SearchAlg, str] = SearchAlg.ASTAR,
        heuristic: Union[Heuristic, str] = Heuristic.FF,
    ):
        """Initialize the tool."""
        super().__init__(binary_path)

        self.search = SearchAlg(search)
        self.heuristic = Heuristic(heuristic)

    def get_cli_args(
        self,
        domain: Path,
        problem: Path,
        formula: Optional[str] = None,
        mapping: Optional[Path] = None,
        working_dir: Optional[str] = None,
    ) -> List[str]:
        """Get CLI arguments."""
        assert formula is None, "formula argument not supported"
        assert mapping is None, "mapping argument not supported"
        cli_args = [
            self.binary_path,
            "-d",
            domain,
            "-p",
            problem,
            "--algorithm",
            self.search.value,
            "--heuristic",
            self.heuristic.value,
        ]
        if working_dir:
            cli_args += ["--working-dir", working_dir]
        return cli_args

    def collect_statistics(self, output: str) -> Result:
        """Collect statistics."""
        return extract_from_tool(output, "fd")
