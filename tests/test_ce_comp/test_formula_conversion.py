from pddl.parser.domain import DomainParser
from pddl.parser.problem import ProblemParser
from pylogics.parsers import parse_pltl
from plan4past.helpers.compilation_helper import *
from plan4past.compiler_ce import *
import pkg_resources


def test_formula_conversion():

    domain_str = open(pkg_resources.resource_filename(__name__, 'pddl/rovers/domain-fond.pddl')).read()
    problem_str = open(pkg_resources.resource_filename(__name__, 'pddl/rovers/p01.pddl')).read()

    domain_parser = DomainParser()
    problem_parser = ProblemParser()
    domain = domain_parser(domain_str)
    problem = problem_parser(problem_str)

    a = Atomic('communicatedsoildata_waypoint2')
    b = Atomic('communicatedrockdata_waypoint3')

    a_pred = Predicate('communicatedsoildata', *[Constant('waypoint2')])
    b_pred = Predicate('communicatedrockdata', *[Constant('waypoint3')])

    formula = parse_pltl(f"H(H(H({a}) | H({b}))) | ({a} | {b})")


    temporalsubformulas = [
        Yatom_(Once(Not(a))),
        Yatom_(Once(Not(b))),
        Yatom_(Once(Not(Or(Not(Once(Not(a))), Not(Once(Not(b))))))),
        Yatom_(Once(Once(Not(Or(Not(Once(Not(a))), Not(Once(Not(b))))))))
    ]

    y = temporalsubformulas
    pnf = [Or(Not(a), y[0]), Or(Not(b), y[1])]
    pnf.append(Or(Not(Or(Not(pnf[0]), Not(pnf[1]))), y[2]))
    pnf.append(Or(pnf[2], y[3]))


    compiler = Compiler(domain, problem, formula, from_atoms_to_fluent=None)
    compiler.compile()
    before_dictionary = compiler._before_dictionary
    pnf0_expected = pddlOr(pddlNot(a_pred), Predicate(before_dictionary[y[0]].name, *[]))
    pnf1_expected = pddlOr(pddlNot(b_pred), Predicate(before_dictionary[y[1]].name, *[]))
    assert compiler.formula_conversion(pnf[0]) == pnf0_expected
    assert compiler.formula_conversion(pnf[1]) == pnf1_expected
    pnf2_expected = pddlOr(pddlNot(pddlOr(pddlNot(pnf0_expected), pddlNot(pnf1_expected))), Predicate(before_dictionary[y[2]].name, *[]))
    assert compiler.formula_conversion(pnf[2]) == pnf2_expected
    assert compiler.formula_conversion(pnf[3]) == pddlOr(pnf2_expected, Predicate(before_dictionary[y[3]].name, *[]))    


if __name__ == '__main__':
    test_formula_conversion()