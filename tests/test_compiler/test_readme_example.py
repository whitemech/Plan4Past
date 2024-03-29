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

import pytest
from pddl.logic import Predicate, constants
from pddl.parser.domain import DomainParser
from pddl.parser.problem import ProblemParser
from pylogics.parsers import parse_pltl
from pylogics.syntax.pltl import Atomic as PLTLAtomic

from plan4past.compiler import Compiler
from tests.helpers.constants import EXAMPLES_DIR
from tests.helpers.misc import check_compilation


@pytest.mark.parametrize(
    "from_atoms_to_fluent",
    [
        None,
        {
            PLTLAtomic("on_b_a"): Predicate("on", *constants("b a")),
            PLTLAtomic("ontable_c"): Predicate("ontable", *constants("c")),
        },
    ],
)
def test_readme_example(val, default_planner, from_atoms_to_fluent) -> None:
    """Test the example from the README."""
    domain_path = EXAMPLES_DIR / "blocksworld" / "domain.pddl"
    problem_path = EXAMPLES_DIR / "blocksworld" / "p0.pddl"

    formula = "on_b_a & O(ontable_c)"
    domain_parser = DomainParser()
    problem_parser = ProblemParser()

    domain = domain_parser(domain_path.read_text(encoding="utf-8"))
    problem = problem_parser(problem_path.read_text(encoding="utf-8"))
    goal = parse_pltl(formula)

    compiler = Compiler(
        domain, problem, goal, from_atoms_to_fluent=from_atoms_to_fluent
    )
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
