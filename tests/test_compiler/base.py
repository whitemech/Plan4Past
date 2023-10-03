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
from functools import partial
from pathlib import Path
from typing import Callable, Dict, Optional, Sequence, Tuple, cast

import pytest
from pddl.core import Domain, Problem
from pddl.logic import Predicate
from pddl.parser.domain import DomainParser
from pddl.parser.problem import ProblemParser
from pylogics.parsers import parse_pltl
from pylogics.syntax.base import Formula
from pylogics.syntax.pltl import Atomic as PLTLAtomic

from plan4past.compiler import ADLCompiler, Compiler
from plan4past.constants import ACHIEVE_GOAL_ACTION, EVALUATE_PNF_ACTION
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

    def _get_compiler(
        self,
        domain: Domain,
        problem: Problem,
        formula: Formula,
        from_atoms_to_fluent: Optional[Dict[PLTLAtomic, Predicate]] = None,
        adl: bool = False,
        evaluate_pnf: bool = False,
        simplify_disj_goal: bool = False,
    ) -> Compiler:
        """Get the compiler."""
        if adl:
            return ADLCompiler(
                domain,
                problem,
                formula,
                from_atoms_to_fluent=from_atoms_to_fluent,
                evaluate_pnf=evaluate_pnf,
                simplify_disj_goal=simplify_disj_goal,
            )
        return Compiler(
            domain, problem, formula, from_atoms_to_fluent=from_atoms_to_fluent
        )

    def _insert_evaluate_pnf_actions(self, actions: Sequence[str]) -> Tuple[str, ...]:
        """Insert the evaluate-pnf actions."""
        result = []
        for action in actions:
            if ACHIEVE_GOAL_ACTION not in action:
                result.append(f"({EVALUATE_PNF_ACTION} )")
            result.append(action)
        return tuple(result)

    def _compute_expected_plan(
        self, instance_id: int, compiler: Compiler | ADLCompiler
    ) -> Tuple[str, ...]:
        """Return a wrapper to get_expected_plan to handle achieve-actions and evaluate-pnf actions."""
        is_adl_compiler = isinstance(compiler, ADLCompiler)
        expected_plan = self.get_expected_plan(instance_id)
        if is_adl_compiler:
            compiler = cast(ADLCompiler, compiler)
            simplify_disj_goal = compiler.simplify_disj_goal
            if simplify_disj_goal:
                pytest.skip("disjunctive goal simplification not supported yet")
            expected_plan = expected_plan + ("(achieve-goal )",)
            if compiler.evaluate_pnf:
                expected_plan = self._insert_evaluate_pnf_actions(expected_plan)
        return expected_plan

    @classmethod
    def parametrize_compiler(cls):
        """Get the parametrization for the P4P compiler."""
        return pytest.mark.parametrize(
            "compiler_builder",
            [
                partial(
                    cls._get_compiler,
                    adl=False,
                    evaluate_pnf=False,
                    simplify_disj_goal=False,
                ),
                partial(
                    cls._get_compiler,
                    adl=True,
                    evaluate_pnf=False,
                    simplify_disj_goal=False,
                ),
            ],
        )

    def _test_instance(
        self,
        instance_id: int,
        compiler_builder: Callable,
        val: VALWrapper,
        planner: BasePlannerWrapper,
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

        compiler = compiler_builder(self, domain, problem, goal)
        compiler.compile()
        compiled_domain, compiled_problem = compiler.result

        expected_plan = self._compute_expected_plan(instance_id, compiler)

        check_compilation(
            compiled_domain,
            compiled_problem,
            val,
            planner,
            expected_plan,
        )
