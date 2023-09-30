"""This test checks that the compilation with the removal of the disjunctive goal is correct."""
from pathlib import Path
from typing import Tuple

import pkg_resources
from pddl.core import Domain, Problem
from pddl.parser.domain import DomainParser
from pddl.parser.problem import ProblemParser
from pylogics.parsers import parse_pltl
from pylogics.syntax.pltl import Atomic

from plan4past.compiler import ADLCompiler


def get_task(domain_path, problem_path) -> Tuple[Domain, Problem]:
    """
    Get the domain and problem from the given paths.

    :param domain_path: path to the PDDL domain file
    :param problem_path: path to the PDDL problem file
    :return: the domain and problem objects
    """
    domain_str = Path(pkg_resources.resource_filename(__name__, domain_path)).read_text(
        encoding="utf-8"
    )
    # pylint: disable=R0801
    problem_str = Path(
        pkg_resources.resource_filename(__name__, problem_path)
    ).read_text(encoding="utf-8")

    domain_parser = DomainParser()
    problem_parser = ProblemParser()
    domain = domain_parser(domain_str)
    problem = problem_parser(problem_str)
    return domain, problem


def check_compilation(domain, problem, formula):
    """
    Check the compilation with the removal of the disjunctive goal.

    :param domain: the PDDL domain object
    :param problem: the PDDL problem object
    :param formula: the PPLTL formula
    """
    nopex = False
    compiler = ADLCompiler(
        domain, problem, formula, from_atoms_to_fluent=None, simplify_disj_goal=True
    )
    if nopex:
        compiler.evaluate_pnf = False
    compiler.compile()
    compiled_dom, _compiled_prob = compiler.result

    ach_actions = [a for a in compiled_dom.actions if "goal" in a.name]
    assert len(ach_actions) > 1


def test_pddl_compilation() -> None:
    """Test the compilation with the removal of the disjunctive goal."""
    domain, problem = get_task("pddl/rovers/domain-fond.pddl", "pddl/rovers/p01.pddl")

    a = Atomic("communicatedsoildata_waypoint2")
    b = Atomic("communicatedrockdata_waypoint3")

    formula = parse_pltl(f"H(H(H({a}) | H({b}))) | ({a} | {b})")

    check_compilation(domain, problem, formula)


def test_pddl_compilation2() -> None:
    """Test the compilation with the removal of the disjunctive goal."""
    domain, problem = get_task(
        "pddl/robot-coffee/domain-fond.pddl", "pddl/robot-coffee/coffee3next.pddl"
    )

    formula = parse_pltl("O(robotat_c & Y(Y(Y(!Y(true)))))")

    check_compilation(domain, problem, formula)


def test_pddl_compilation3() -> None:
    """Test the compilation with the removal of the disjunctive goal."""
    domain, problem = get_task(
        "pddl/blocksworld_fond/domain-fond.pddl", "pddl/blocksworld_fond/problem.pddl"
    )
    formula = parse_pltl(
        "O((on_a_table)&(on_b_table)&(on_c_table)&Y(O((on_c_a)&(on_a_b)&Y(O((on_c_b)&(on_b_a)&Y(O((on_a_c)"
        "&(on_c_b))))))))"
    )
    check_compilation(domain, problem, formula)
