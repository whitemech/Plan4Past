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

"""Wrapper to Downward."""
import shutil
import subprocess
from pathlib import Path
from tempfile import TemporaryDirectory
from typing import Dict

from planning_with_past import REPO_ROOT
from planning_with_past.helpers.utils import cd
from planning_with_past.planners.base import Planner
from planning_with_past.plans import Plan

DEFAULT_BIN_FAST_DOWNWARD_PATH = (REPO_ROOT / "bin" / "fast-downward").absolute()
DEFAULT_SEARCH = "astar(blind())"

_SAS_FILENAME = "sas_plan"


class DownwardPlanner(Planner):
    """Wrapper to Downward planner."""

    def __init__(
        self, bin_path: Path = DEFAULT_BIN_FAST_DOWNWARD_PATH, search: str = DEFAULT_SEARCH
    ) -> None:
        """
        Initialize the planner.

        :param bin_path: path to the executable.
        :param search: --search argument.
        """
        assert bin_path.exists()
        self._bin_path = bin_path

        self._search = search

    @property
    def bin_path(self) -> Path:
        """Return path to the binary."""
        return self._bin_path

    @property
    def search(self) -> str:
        """Return the search argument."""
        return self._search

    def plan(self, domain: Path, problem: Path, **options: Dict[str, str]) -> Plan:
        """
        Compute a (deterministic) plan.

        :param domain: the domain.
        :param problem: the problem.
        :param options: options for the planner.
        :return: the plan.
        """
        orig_domain_path = domain.absolute()
        orig_problem_path = problem.absolute()
        with TemporaryDirectory() as tempdir_str, cd(Path(tempdir_str)):
            tempdir = Path(tempdir_str)
            tmp_domain_path = tempdir / "domain.pddl"
            tmp_problem_path = tempdir / "problem.pddl"
            shutil.copy(str(orig_domain_path), str(tmp_domain_path))
            shutil.copy(str(orig_problem_path), str(tmp_problem_path))
            self._call_planner(tmp_domain_path, tmp_problem_path)
            sas_file = tempdir / _SAS_FILENAME
            return from_sas_to_plan(sas_file)

    def _call_planner(self, domain_path: Path, problem_path: Path):
        """Call planner."""
        subprocess.check_call(
            [
                self.bin_path,
                str(domain_path),
                str(problem_path),
                "--search",
                self.search,
            ]
        )


def from_sas_to_plan(sas_file: Path) -> Plan:
    """Transform a SAS plan file into a Plan object."""
    actions = sas_file.read_text().splitlines()[:-1]
    result = Plan()
    for i, action in enumerate(actions):
        result.add_node(i + 1)
        result.add_edge(i, i + 1, action=action)
    return result
