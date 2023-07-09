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
from tempfile import TemporaryDirectory

import pytest
from pddl.formatter import domain_to_string, problem_to_string
from pddl.logic import Predicate, constants
from pddl.parser.domain import DomainParser
from pddl.parser.problem import ProblemParser
from pylogics.parsers import parse_pltl
from pylogics.syntax.pltl import Atomic as PLTLAtomic

from plan4past.compiler import Compiler
from tests.helpers.constants import EXAMPLES_DIR


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
def test_readme_example(val, lama, from_atoms_to_fluent) -> None:
    """Test the example from the README."""
    formula = "on_b_a & O(ontable_c)"
    domain_parser = DomainParser()
    problem_parser = ProblemParser()

    pddl_example_domain_path = EXAMPLES_DIR / Path("pddl/domain.pddl")
    pddl_example_problem_path = EXAMPLES_DIR / Path("pddl/p-0.pddl")

    domain = domain_parser(pddl_example_domain_path.read_text(encoding="utf-8"))
    problem = problem_parser(pddl_example_problem_path.read_text(encoding="utf-8"))
    goal = parse_pltl(formula)

    compiler = Compiler(
        domain, problem, goal, from_atoms_to_fluent=from_atoms_to_fluent
    )
    compiler.compile()
    compiled_domain, compiled_problem = compiler.result

    with TemporaryDirectory() as tmpdir:
        tmpdir_path = Path(tmpdir)
        new_domain_path = tmpdir_path / "new-domain.pddl"
        new_problem_path = tmpdir_path / "new-problem.pddl"
        with open(new_domain_path, "w+", encoding="utf-8") as d:
            d.write(domain_to_string(compiled_domain))
        with open(new_problem_path, "w+", encoding="utf-8") as p:
            p.write(problem_to_string(compiled_problem))

        result = val.validate_problem(new_domain_path, new_problem_path)
        assert result.is_valid(strict=True)

        plan_result = lama.plan(new_domain_path, new_problem_path)
        assert plan_result.plan == [
            "(unstack c d)",
            "(put-down c)",
            "(unstack a b)",
            "(put-down a)",
            "(pick-up b)",
            "(stack b a)",
        ]
