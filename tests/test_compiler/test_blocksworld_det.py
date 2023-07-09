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

"""This module contain tests for the compiler module, using the blocksworld domain."""
from abc import abstractmethod
from pathlib import Path
from typing import Tuple

import pytest
from pddl.parser.domain import DomainParser
from pddl.parser.problem import ProblemParser
from pylogics.parsers import parse_pltl

from plan4past.compiler import Compiler
from tests.helpers.constants import BLOCKSWORLD_DIR
from tests.helpers.misc import check_compilation
from tests.helpers.planutils.base import BasePlannerWrapper
from tests.helpers.planutils.val import VALWrapper


class BaseTestBlocksworldDet:
    """Base test class for deterministic Blocksworld experiments."""

    PATH_TO_DOMAIN = BLOCKSWORLD_DIR / "domain.pddl"
    PATH_TO_INSTANCES_DIR = BLOCKSWORLD_DIR

    @abstractmethod
    def make_formula(self, instance_id: int, domain: Path, problem: Path) -> str:
        """Make the formula for the given instance."""
        raise NotImplementedError

    @abstractmethod
    def get_expected_plan(self, instance_id: int) -> Tuple[str, ...]:
        """Get the expected plan for the given instance."""
        raise NotImplementedError

    def _test_instance(
        self, instance_id: int, val: VALWrapper, planner: BasePlannerWrapper
    ) -> None:
        """Test the instance with the given id."""
        domain_parser = DomainParser()
        problem_parser = ProblemParser()

        domain_path = self.PATH_TO_DOMAIN
        problem_path = self.PATH_TO_INSTANCES_DIR / f"p{instance_id}.pddl"
        if not problem_path.exists():
            pytest.fail(f"Instance {instance_id} does not exist.")

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


class TestBlocksworldDetSimpleSequence(BaseTestBlocksworldDet):
    """Test class for deterministic Blocksworld experiments, simple sequence."""

    def make_formula(self, instance_id: int, domain: Path, problem: Path) -> str:
        """
        Make the formula for the given instance.

        Builds a chain of the form:

            O(on_b1_b2 & Y(O(on_b2_b3 & Y(O(... on_bn_bn+1 ...)))
        """
        formula = ""
        trailing_brackets = ""
        for i in range(1, instance_id):
            last = i == instance_id - 1
            formula += f"O(on_b{i}_b{i + 1}" + (" & Y(" if not last else "")
            trailing_brackets += "))" if not last else ")"
        return formula + trailing_brackets

    def get_expected_plan(self, instance_id: int) -> Tuple[str, ...]:
        """Get the expected plan for the given instance."""
        result = []
        for i in range(instance_id - 1, 0, -1):
            result.append(f"(pick-up b{i})")
            result.append(f"(stack b{i} b{i + 1})")
        return tuple(result)

    @pytest.mark.parametrize("instance_id", list(range(2, 11)))
    def test_run(self, instance_id, val, default_planner):
        """Test the instance with the given id."""
        self._test_instance(instance_id, val=val, planner=default_planner)
