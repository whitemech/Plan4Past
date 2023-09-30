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
"""Tests for the compilation of the evaluate_pnf action."""
from pathlib import Path
from typing import Tuple

import pkg_resources
from pddl.parser.domain import DomainParser
from pddl.parser.problem import ProblemParser
from pylogics.parsers import parse_pltl
from pylogics.syntax.base import And, Not, Or
from pylogics.syntax.pltl import Atomic, Before, Once, PropositionalTrue

from plan4past.compiler import EVALUATE_PNF_ACTION, PNF, ADLCompiler
from plan4past.compiler import Not as pddlNot
from plan4past.compiler import Predicate, When
from plan4past.helpers.before_atom_helper import QUOTED_ATOM, Yatom_


def get_task(domain_path, problem_path) -> Tuple:
    """
    Get the domain and problem from the given paths.

    :param domain_path: the path to the PDDL domain file
    :param problem_path: the path to the PDDL problem file
    :return: the domain and problem
    """
    # pylint: disable=R0801
    domain_str = Path(pkg_resources.resource_filename(__name__, domain_path)).read_text(
        encoding="utf-8"
    )
    problem_str = Path(
        pkg_resources.resource_filename(__name__, problem_path)
    ).read_text(encoding="utf-8")

    domain_parser = DomainParser()
    problem_parser = ProblemParser()
    domain = domain_parser(domain_str)
    problem = problem_parser(problem_str)
    return domain, problem


def check_compilation(domain, problem, formula, pnf, temporalsubformulas, goal):
    """
    Check the compilation with the evaluate_pnf action.

    :param domain: the PDDL domain object
    :param problem: the PDDL problem object
    :param formula: the PPLTL formula
    :param pnf: the PNF of the formula
    :param temporalsubformulas: the list of temporal subformulas
    :param goal: the temporal goal formula
    """
    y = temporalsubformulas
    nopex = False
    compiler = ADLCompiler(domain, problem, formula, from_atoms_to_fluent=None)
    if nopex:
        compiler.evaluate_pnf = False
    compiler.compile()
    actions = compiler.result[0].actions
    evaluate_pnf = [act for act in actions if act.name == EVALUATE_PNF_ACTION][0]
    effects = evaluate_pnf.effect.operands

    for i, sub_pnf in enumerate(pnf):
        yatom_short = compiler.pylogics2pddl(y[i])
        pex = Predicate(yatom_short.name.replace(QUOTED_ATOM, PNF), *[])
        effect = When(compiler.pylogics2pddl(sub_pnf), pex)
        assert effect in effects
        assert pddlNot(compiler.goal_predicate) in evaluate_pnf.precondition.operands
        assert pddlNot(compiler.check_predicate) in evaluate_pnf.effect.operands

    for act in actions:
        if "goal" not in act.name and EVALUATE_PNF_ACTION not in act.name:
            for i in range(len(pnf)):
                yatom_short = compiler.pylogics2pddl(y[i])
                pex = Predicate(yatom_short.name.replace(QUOTED_ATOM, PNF), *[])
                assert pddlNot(pex) in act.effect.operands
                assert When(pex, yatom_short) in act.effect.operands
            assert compiler.check_predicate in act.effect.operands
            assert pddlNot(compiler.goal_predicate) in act.precondition.operands
            assert pddlNot(compiler.check_predicate) in act.precondition.operands
        elif "goal" in act.name:
            # THE GOAL IS IN THIS ACTION
            assert compiler.pylogics2pddl(goal) in act.precondition.operands
            assert compiler.check_predicate in act.precondition.operands
            assert compiler.goal_predicate in act.effect.operands
        else:
            pass

    assert compiler.goal_predicate == compiler.result[1].goal

    assert compiler.check_predicate in compiler.result[1].init
    for i in range(len(pnf)):
        yatom_short = compiler.pylogics2pddl(y[i])
        assert yatom_short not in compiler.result[1].init


def test_pddl_compilation() -> None:
    """Test the compilation of the evaluate_pnf action."""
    domain, problem = get_task("pddl/rovers/domain-fond.pddl", "pddl/rovers/p01.pddl")

    a = Atomic("communicatedsoildata_waypoint2")
    b = Atomic("communicatedrockdata_waypoint3")

    # pylint: disable=R0801
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

    goal = Or(Not(pnf[3]), a, b)
    check_compilation(domain, problem, formula, pnf, temporalsubformulas, goal)


def test_pddl_compilation2() -> None:
    """Test the compilation of the evaluate_pnf action."""
    domain, problem = get_task(
        "pddl/robot-coffee/domain-fond.pddl", "pddl/robot-coffee/coffee3next.pddl"
    )

    c = Atomic("robotat_c")
    true = PropositionalTrue()

    # pylint: disable=R0801
    formula = parse_pltl("O(robotat_c & Y(Y(Y(!Y(true)))))")

    temporalsubformulas = [
        Yatom_(PropositionalTrue()),
        Yatom_(Not(Before(PropositionalTrue()))),
        Yatom_(Before(Not(Before(PropositionalTrue())))),
        Yatom_(Before(Before(Not(Before(PropositionalTrue()))))),
        Yatom_(Once(And(c, Before(Before(Before(Not(Before(PropositionalTrue())))))))),
    ]

    y = temporalsubformulas
    pnf = [true, Not(y[0]), y[1], y[2], Or(And(c, y[3]), y[4])]

    goal = pnf[4]
    check_compilation(domain, problem, formula, pnf, temporalsubformulas, goal)


def test_pddl_compilation3() -> None:
    """Test the compilation of the evaluate_pnf action."""
    domain, problem = get_task(
        "pddl/blocksworld_fond/domain-fond.pddl", "pddl/blocksworld_fond/problem.pddl"
    )

    on_a_table = Atomic("on_a_table")
    on_b_table = Atomic("on_b_table")
    on_c_table = Atomic("on_c_table")
    on_c_a = Atomic("on_c_a")
    on_a_b = Atomic("on_a_b")
    on_c_b = Atomic("on_c_b")
    on_b_a = Atomic("on_b_a")
    on_a_c = Atomic("on_a_c")
    on_c_b = Atomic("on_c_b")

    formula = parse_pltl(
        "O((on_a_table)&(on_b_table)&(on_c_table)&Y(O((on_c_a)&(on_a_b)&Y(O((on_c_b)&(on_b_a)&"
        "Y(O((on_a_c)&(on_c_b))))))))"
    )

    subformulas = [Once(And(on_a_c, on_c_b))]

    subformulas.append(Once(And(on_c_b, on_b_a, Before(subformulas[0]))))
    subformulas.append(Once(And(on_c_a, on_a_b, Before(subformulas[1]))))
    subformulas.append(
        Once(And(on_a_table, on_b_table, on_c_table, Before(subformulas[2])))
    )

    temporalsubformulas = [Yatom_(sub) for sub in subformulas]

    y = temporalsubformulas
    pnf = [Or(And(on_a_c, on_c_b), y[0])]
    pnf.append(Or(And(on_c_b, on_b_a, y[0]), y[1]))
    pnf.append(Or(And(on_c_a, on_a_b, y[1]), y[2]))
    pnf.append(Or(And(on_a_table, on_b_table, on_c_table, y[2]), y[3]))

    goal = pnf[3]
    check_compilation(domain, problem, formula, pnf, temporalsubformulas, goal)
