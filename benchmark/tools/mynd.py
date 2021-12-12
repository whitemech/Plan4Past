import re
from enum import Enum
from pathlib import Path
from typing import List, Optional, Union

from benchmark.tools.core import Tool, ToolID, Result, Status, SearchAlg, Heuristic
from planning_with_past import REPO_ROOT

DEFAULT_BIN_MYND_PATH = (REPO_ROOT / "bin" / "mynd_wrapper").absolute()


class MyNDTool(Tool):
    """Implement MyND tool wrapper."""

    NAME = "MyND"

    def __init__(
        self, binary_path: str, search: Union[SearchAlg, str] = SearchAlg.LAOSTAR, heuristic: Union[Heuristic, str] = Heuristic.FF
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
    ) -> List[str]:
        """Get CLI arguments."""
        assert formula is None, "formula argument not supported"
        assert mapping is None, "mapping argument not supported"

        cli_args = [self.binary_path, "-d", domain, "-p", problem, "--heuristic", self.heuristic]
        is_strong_planning = self.search == SearchAlg.AOSTAR
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

        nb_nodes_expansion_match = re.search("Number of node expansions: ([0-9]+)", output)
        if nb_nodes_expansion_match:
            nb_nodes_expansions = int(nb_nodes_expansion_match.group(1))
        else:
            nb_nodes_expansions = None

        return Result("", [], 0.0, tool_time, None, nb_nodes_expansions, status)
