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

"""This module contain tests for the compiler module, readme example."""

from pathlib import Path

from pddl.parser.domain import DomainParser
from pddl.parser.problem import ProblemParser
from pylogics.parsers import parse_pltl

from plan4past.compiler import Compiler
from tests.helpers.constants import EXAMPLES_DIR
from tests.helpers.misc import check_compilation


def test_readme_example(val, default_planner) -> None:
    """Test the example from the README."""
    formula = '"on b a" & O("ontable c")'
    domain_parser = DomainParser()
    problem_parser = ProblemParser()

    pddl_example_domain_path = EXAMPLES_DIR / Path("pddl/domain.pddl")
    pddl_example_problem_path = EXAMPLES_DIR / Path("pddl/p-0.pddl")

    domain = domain_parser(pddl_example_domain_path.read_text(encoding="utf-8"))
    problem = problem_parser(pddl_example_problem_path.read_text(encoding="utf-8"))
    goal = parse_pltl(formula)

    compiler = Compiler(domain, problem, goal)
    compiler.compile()
    compiled_domain, compiled_problem = compiler.result

    expected_plan = (
        "(unstack c d)",
        "(put-down c)",
        "(unstack a b)",
        "(put-down a)",
        "(pick-up b)",
        "(stack b a)",
    )

    check_compilation(
        compiled_domain, compiled_problem, val, default_planner, expected_plan
    )
