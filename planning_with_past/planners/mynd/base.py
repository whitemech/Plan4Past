# -*- coding: utf-8 -*-
#
# Copyright 2021 Francesco Fuggitti, Marco Favorito
#
# ------------------------------
#
# This file is part of planning-with-past.
#
# planning-with-past is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# planning-with-past is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with planning-with-past.  If not, see <https://www.gnu.org/licenses/>.
#
# pylint: disable-all

"""Wrapper to MyND."""
import shutil
import subprocess
from pathlib import Path
from tempfile import TemporaryDirectory
from typing import Dict, Optional

import networkx

from planning_with_past import PACKAGE_ROOT
from planning_with_past.helpers.utils import cd
from planning_with_past.planners.base import Planner
from planning_with_past.plans import BasePlan, Plan

repo_root = PACKAGE_ROOT.parent
DEFAULT_JAR_MYND_PATH = (repo_root / "bin" / "MyND.jar").absolute()
MYND_POLICY_OUTPUT_FILENAME = "policy"
DEFAULT_ALGORITHM = "LAOSTAR"
DEFAULT_HEURISTIC = "FF"


class MyNDPlanner(Planner):
    """Wrapper to MyND planner."""

    def __init__(
        self,
        jar_path: Path = DEFAULT_JAR_MYND_PATH,
        search: str = DEFAULT_ALGORITHM,
        heuristic: str = DEFAULT_HEURISTIC,
        timeout: float = 10.0,
    ):
        """
        Initialize.

        :param jar_path: path to the executable.
        :param search: -search argument.
        :param heuristic: -heuristic argument.
        :param timeout: timeout of execution.
        """
        assert jar_path.exists()
        self._jar_path = jar_path

        self._search = search
        self._heuristic = heuristic
        self.timeout = timeout

    @property
    def jar_path(self) -> Path:
        """Return path to the jar."""
        return self._jar_path

    @property
    def search(self) -> str:
        """Return the search argument."""
        return self._search

    @property
    def heuristic(self) -> str:
        """Return the heuristic argument."""
        return self._heuristic

    def plan(
        self, domain: Path, problem: Path, **_options: Dict[str, str]
    ) -> Plan:
        """
        Compute a (non-deterministic) policy.

        :param domain: the domain.
        :param problem: the problem.
        :param options: options for the planner.
        """
        orig_domain_path = domain.absolute()
        orig_problem_path = problem.absolute()
        with TemporaryDirectory() as tempdir_str, cd(Path(tempdir_str)):
            tempdir = Path(tempdir_str)
            tmp_domain_path = tempdir / "domain.pddl"
            tmp_problem_path = tempdir / "problem.pddl"
            tmp_output_path = tempdir / MYND_POLICY_OUTPUT_FILENAME
            shutil.copy(str(orig_domain_path), str(tmp_domain_path))
            shutil.copy(str(orig_problem_path), str(tmp_problem_path))
            self._call_mynd(tmp_domain_path, tmp_problem_path, tmp_output_path)
            return from_dot_to_policy(tmp_output_path)

    def _call_mynd(
        self,
        domain_path: Path,
        problem_path: Path,
        output_path: Path,
        cwd: Optional[Path] = None,
    ):
        """Call the MyND command."""
        output = subprocess.Popen(
            [
                "java",
                "-jar",
                self.jar_path,
                "-t",
                "FOND",
                str(domain_path),
                str(problem_path),
                "-search",
                self.search,
                "-heuristic",
                self.heuristic,
                "output.sas",
                "-exportDot",
                str(output_path),
            ],
            cwd=str(cwd),
            stdout=subprocess.PIPE,
        )
        output.wait(timeout=self.timeout)


def from_dot_to_policy(policy_dot_path: Path) -> Plan:
    """Transform a DOT policy file into a Plan object."""
    return networkx.drawing.nx_pydot.read_dot(policy_dot_path)
