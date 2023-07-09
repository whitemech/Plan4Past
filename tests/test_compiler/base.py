# -*- coding: utf-8 -*-
#
# Copyright 2021 -- 2023 WhiteMech
#
# ------------------------------
#
# This file is part of Plan4Past.
#
# Plan4Past is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Plan4Past is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with Plan4Past.  If not, see <https://www.gnu.org/licenses/>.
#

"""Base test module for testing the compiler module."""
from abc import abstractmethod
from pathlib import Path
from typing import Tuple

import pytest
from pddl.parser.domain import DomainParser
from pddl.parser.problem import ProblemParser
from pylogics.parsers import parse_pltl

from plan4past.compiler import Compiler
from tests.helpers.misc import check_compilation
from tests.helpers.planutils.base import BasePlannerWrapper
from tests.helpers.planutils.val import VALWrapper


class BaseCompilerTest:
    """Base test class for compiler tests."""

    PATH_TO_DOMAINS_DIR: Path
    PATH_TO_INSTANCES_DIR: Path

    @abstractmethod
    def make_formula(self, instance_id: int, domain: Path, problem: Path) -> str:
        """Make the formula for the given instance."""
        raise NotImplementedError

    @abstractmethod
    def get_expected_plan(self, instance_id: int) -> Tuple[str, ...]:
        """Get the expected plan for the given instance."""
        raise NotImplementedError

    def get_instance_file(self, instance_id: int) -> Path:
        """Get the instance file for the given instance."""
        return self.PATH_TO_INSTANCES_DIR / f"p{instance_id}.pddl"

    def get_domain_file(self, _instance_id: int) -> Path:
        """Get the domain file for the given instance."""
        return self.PATH_TO_DOMAINS_DIR / "domain.pddl"

    def _test_instance(
        self, instance_id: int, val: VALWrapper, planner: BasePlannerWrapper
    ) -> None:
        """Test the instance with the given id."""
        domain_parser = DomainParser()
        problem_parser = ProblemParser()

        domain_path = self.get_domain_file(instance_id)
        problem_path = self.get_instance_file(instance_id)
        if not domain_path.exists():
            pytest.fail(f"Domain {domain_path} does not exist.")
        if not problem_path.exists():
            pytest.fail(f"Instance {problem_path} does not exist.")

        domain = domain_parser(domain_path.read_text(encoding="utf-8"))
        problem = problem_parser(problem_path.read_text(encoding="utf-8"))
        goal = parse_pltl(self.make_formula(instance_id, domain_path, problem_path))

        compiler = Compiler(domain, problem, goal)
        compiler.compile()
        compiled_domain, compiled_problem = compiler.result

        check_compilation(
            compiled_domain,
            compiled_problem,
            val,
            planner,
            self.get_expected_plan(instance_id),
        )
