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
"""Test for formula conversions."""
from pathlib import Path

import pkg_resources
from pddl.logic import Constant, Predicate
from pddl.logic.base import Not as PddlNot
from pddl.logic.base import Or as PddlOr
from pddl.parser.domain import DomainParser
from pddl.parser.problem import ProblemParser
from pylogics.parsers import parse_pltl
from pylogics.syntax.base import Not, Or
from pylogics.syntax.pltl import Atomic, Once

from plan4past.compiler import ADLCompiler
from plan4past.helpers.formula_helper import Yatom_


def test_formula_conversion() -> None:
    """Test the conversion of a formula."""
    domain_str = Path(
        pkg_resources.resource_filename(__name__, "pddl/rovers/domain-fond.pddl")
    ).read_text(encoding="utf-8")
    # pylint: disable=R0801
    problem_str = Path(
        pkg_resources.resource_filename(__name__, "pddl/rovers/p01.pddl")
    ).read_text(encoding="utf-8")

    domain_parser = DomainParser()
    problem_parser = ProblemParser()
    domain = domain_parser(domain_str)
    problem = problem_parser(problem_str)

    a = Atomic("communicatedsoildata_waypoint2")
    b = Atomic("communicatedrockdata_waypoint3")

    a_pred = Predicate("communicatedsoildata", *[Constant("waypoint2")])
    b_pred = Predicate("communicatedrockdata", *[Constant("waypoint3")])

    formula = parse_pltl(f"H(H(H({a}) | H({b}))) | ({a} | {b})")

    temporalsubformulas = [
        Yatom_(Once(Not(a))),
        Yatom_(Once(Not(b))),
        Yatom_(Once(Not(Or(Not(Once(Not(a))), Not(Once(Not(b))))))),
        Yatom_(Once(Once(Not(Or(Not(Once(Not(a))), Not(Once(Not(b)))))))),
    ]

    y = temporalsubformulas
    pnf = [Or(Not(a), y[0]), Or(Not(b), y[1])]
    pnf.append(Or(Not(Or(Not(pnf[0]), Not(pnf[1]))), y[2]))
    pnf.append(Or(pnf[2], y[3]))

    compiler = ADLCompiler(domain, problem, formula, from_atoms_to_fluent=None)
    compiler.compile()
    translation_dictionary = (
        compiler._translation_dictionary  # pylint: disable=protected-access
    )
    assert translation_dictionary is not None
    pnf0_expected = PddlOr(
        PddlNot(a_pred), Predicate(translation_dictionary[y[0]].name, *[])
    )
    pnf1_expected = PddlOr(
        PddlNot(b_pred), Predicate(translation_dictionary[y[1]].name, *[])
    )
    assert compiler.pylogics2pddl(pnf[0]) == pnf0_expected
    assert compiler.pylogics2pddl(pnf[1]) == pnf1_expected
    pnf2_expected = PddlOr(
        PddlNot(PddlOr(PddlNot(pnf0_expected), PddlNot(pnf1_expected))),
        Predicate(translation_dictionary[y[2]].name, *[]),
    )
    assert compiler.pylogics2pddl(pnf[2]) == pnf2_expected
    assert compiler.pylogics2pddl(pnf[3]) == PddlOr(
        pnf2_expected, Predicate(translation_dictionary[y[3]].name, *[])
    )
