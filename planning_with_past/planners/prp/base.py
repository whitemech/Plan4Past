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

"""Wrapper to PRP."""
import shutil
import subprocess
from pathlib import Path
from tempfile import TemporaryDirectory
from typing import Dict, Optional

from pddl.core import Domain, Problem
from pddl.formatter import domain_to_string, problem_to_string

from planning_with_past import PACKAGE_ROOT
from planning_with_past.planners.base import Planner
from planning_with_past.plans import BasePlan, Plan

PRP_PLAN_OUTPUT_FILENAME = "sas_plan"


class PRPPlanner(Planner):
    """Wrapper to PRP planner."""

    def __init__(self, timeout: float = 10.0):
        """
        Initialize.

        :param timeout: timeout of execution.
        """
        self.timeout = timeout
        self._prp_executable = self._find_prp_executable()

    def _find_prp_executable(self) -> Path:
        """
        Find the path to the PRP executable.

        :return: path to PRP executable.
        """
        which_output = shutil.which("")
        if which_output is not None:
            return Path(which_output).absolute()

        repo_root = PACKAGE_ROOT.parent
        result = repo_root / "bin" / "prp" / "prp"
        assert result.exists()
        return result.absolute()

    def _call_prp(
        self, domain_path: Path, problem_path: Path, cwd: Optional[Path] = None
    ):
        """Call the PRP command."""
        output = subprocess.Popen(
            [
                str(self._prp_executable),
                str(domain_path),
                str(problem_path),
                "--dump-policy",
                "2",
            ],
            cwd=str(cwd),
            stdout=subprocess.PIPE,
        )
        output.wait(timeout=self.timeout)

    def plan(
        self, domain: Domain, problem: Problem, **_options: Dict[str, str]
    ) -> BasePlan:
        """Compute a plan."""
        with TemporaryDirectory() as tmpdir_str:
            tmpdir = Path(tmpdir_str)
            domain_path = tmpdir / "domain.pddl"
            problem_path = tmpdir / "problem.pddl"
            domain_path.write_text(domain_to_string(domain))
            problem_path.write_text(problem_to_string(problem))
            self._call_prp(domain_path, problem_path, cwd=tmpdir)
            plan_text = (tmpdir / PRP_PLAN_OUTPUT_FILENAME).read_text()
            return self._extract_plan_from_prp_output(plan_text)

    @classmethod
    def _extract_plan_from_prp_output(_cls, plan_text: str) -> BasePlan:
        """Extract a plan form PRP output."""
        plan = Plan()
        print(plan_text)
        for line in plan_text.splitlines():
            line = line.strip()
            # TODO
        return plan
