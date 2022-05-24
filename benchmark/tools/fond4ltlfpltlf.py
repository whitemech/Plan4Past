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
    Heuristic,
    extract_from_tool,
)
from benchmark.utils.base import try_to_get_float
from planning_with_past import REPO_ROOT

DEFAULT_BIN_F4LP_PATH = (REPO_ROOT / "bin" / "fond4ltlfpltlf_wrapper").absolute()


class SupportedPlanners:
    FD = "fd"
    MYND = "mynd"
    PALADINUS = "paladinus"


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


class Fond4LtlfPltlfFDTool(Fond4LtlfPltlfTool):

    NAME = "F4LP-FD"

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


class Fond4LtlfPltlfMyNDTool(Fond4LtlfPltlfTool):

    NAME = "F4LP-MyND"

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


class Fond4LtlfPltlfPaladinusTool(Fond4LtlfPltlfTool):

    NAME = "F4LP-Paladinus"

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
