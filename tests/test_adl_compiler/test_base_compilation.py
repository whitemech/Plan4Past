from pddl.parser.domain import DomainParser
from pddl.parser.problem import ProblemParser
from pylogics.parsers import parse_pltl
from plan4past.helpers.compilation_helper import *
from plan4past.adl_compiler import *
from pddl.formatter import domain_to_string, problem_to_string
import pytest
import pkg_resources


def test_pddl_compilation():

    domain_str = open(pkg_resources.resource_filename(__name__, 'pddl/rovers/domain-fond.pddl')).read()
    problem_str = open(pkg_resources.resource_filename(__name__, 'pddl/rovers/p01.pddl')).read()

    domain_parser = DomainParser()
    problem_parser = ProblemParser()
    domain = domain_parser(domain_str)
    problem = problem_parser(problem_str)

    a = Atomic('communicatedsoildata_waypoint2')
    b = Atomic('communicatedrockdata_waypoint3')

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


    nopex = True
    compiler = ADLCompiler(domain, problem, formula, from_atoms_to_fluent=None)
    if nopex:
        compiler.evaluate_pnf = False
    compiler.compile()
    actions = compiler.result[0].actions
    for act in actions:
        if 'goal' not in act.name:
            effects = act.effect.operands
            for i in range(len(pnf)):
                effect = When(compiler.pylogics2pddl(pnf[i]), compiler.pylogics2pddl(y[i]))
                assert effect in effects
            assert pddlNot(compiler.goal_predicate) in act.precondition.operands
        else:
            ## THE GOAL IS IN THIS ACTION ##
            assert act.precondition == compiler.pylogics2pddl(Or(Not(pnf[3]), a , b))

if __name__ == '__main__':
    pytest.main()