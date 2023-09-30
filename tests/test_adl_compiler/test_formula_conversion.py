"""Test for formula conversions."""
import pkg_resources
from pddl.parser.domain import DomainParser
from pddl.parser.problem import ProblemParser
from pylogics.parsers import parse_pltl
from pylogics.syntax.base import Not, Or
from pylogics.syntax.pltl import Atomic, Once

from plan4past.compiler import ADLCompiler, Constant
from plan4past.compiler import Not as pddlNot
from plan4past.compiler import Or as pddlOr
from plan4past.compiler import Predicate
from plan4past.helpers.before_atom_helper import Yatom_


def test_formula_conversion() -> None:
    """Test the conversion of a formula."""
    domain_str = open(
        pkg_resources.resource_filename(__name__, "pddl/rovers/domain-fond.pddl")
    ).read()
    problem_str = open(
        pkg_resources.resource_filename(__name__, "pddl/rovers/p01.pddl")
    ).read()

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
    before_dictionary = compiler._before_dictionary
    pnf0_expected = pddlOr(
        pddlNot(a_pred), Predicate(before_dictionary[y[0]].name, *[])
    )
    pnf1_expected = pddlOr(
        pddlNot(b_pred), Predicate(before_dictionary[y[1]].name, *[])
    )
    assert compiler.pylogics2pddl(pnf[0]) == pnf0_expected
    assert compiler.pylogics2pddl(pnf[1]) == pnf1_expected
    pnf2_expected = pddlOr(
        pddlNot(pddlOr(pddlNot(pnf0_expected), pddlNot(pnf1_expected))),
        Predicate(before_dictionary[y[2]].name, *[]),
    )
    assert compiler.pylogics2pddl(pnf[2]) == pnf2_expected
    assert compiler.pylogics2pddl(pnf[3]) == pddlOr(
        pnf2_expected, Predicate(before_dictionary[y[3]].name, *[])
    )
