import re
from abc import ABC
from enum import Enum
from pathlib import Path
from typing import List, Optional, Union

from benchmark.tools.core import (
    Tool,
    Result,
    Status,
    ToolID,
    SearchAlg,
    Heuristic, extract_from_tool,
)
from benchmark.utils.base import try_to_get_float
from planning_with_past import REPO_ROOT

DEFAULT_BIN_LF2F_PATH = (REPO_ROOT / "bin" / "ltlfond2fond_wrapper").absolute()


class SupportedPlanners:
    FD = "fd"
    MYND = "mynd"
    PALADINUS = "paladinus"


class LTLFond2FondTool(Tool, ABC):
    """Implement abstract LTLFond2Fond tool wrapper."""

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
        working_dir: Optional[str] = None,
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
        if working_dir:
            cli_args += ["--working-dir", working_dir]
        return cli_args


class LTLFond2FondFDTool(LTLFond2FondTool):

    NAME = "LF2F-FD"

    def __init__(
        self,
        binary_path: str,
        search: Union[SearchAlg, str] = SearchAlg.ASTAR,
        heuristic: Union[Heuristic, str] = Heuristic.FF,
    ):
        """Initialize the tool."""
        super().__init__(binary_path, SupportedPlanners.FD)

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
        cli_args = super().get_cli_args(domain, problem, formula, mapping, working_dir)
        cli_args += ["--algorithm", self.search.value]
        cli_args += ["--heuristic", self.heuristic.value]
        return cli_args

    def collect_statistics(self, output: str) -> Result:
        """Collect statistics."""
        return extract_from_tool(output, "fd")


class LTLFond2FondMyNDTool(LTLFond2FondTool):

    NAME = "LF2F-MyND"

    def __init__(
        self,
        binary_path: str,
        search: Union[SearchAlg, str] = SearchAlg.LAOSTAR,
        heuristic: Union[Heuristic, str] = Heuristic.FF,
    ):
        """Initialize the tool."""
        super().__init__(binary_path, SupportedPlanners.MYND)

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
        cli_args = super().get_cli_args(domain, problem, formula, mapping, working_dir)
        cli_args += ["--algorithm", self.search.value]
        cli_args += ["--heuristic", self.heuristic.value]
        return cli_args

    def collect_statistics(self, output: str) -> Result:
        """Collect statistics."""
        return extract_from_tool(output, "mynd")


class LTLFond2FondPaladinusTool(LTLFond2FondTool):

    NAME = "LF2F-Paladinus"

    def __init__(
        self,
        binary_path: str,
        search: Union[SearchAlg, str] = SearchAlg.ITERATIVE_DFS,
        heuristic: Union[Heuristic, str] = Heuristic.FF,
    ):
        """Initialize the tool."""
        super().__init__(binary_path, SupportedPlanners.PALADINUS)

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
        cli_args = super().get_cli_args(domain, problem, formula, mapping, working_dir)
        cli_args += ["--algorithm", self.search.value]
        cli_args += ["--heuristic", self.heuristic.value]
        return cli_args

    def collect_statistics(self, output: str) -> Result:
        """Collect statistics."""
        return extract_from_tool(output, "paladinus")
