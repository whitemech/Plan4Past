from pddl.parser.domain import DomainParser
from pddl.parser.problem import ProblemParser
from pylogics.parsers import parse_pltl
from plan4past.helpers.compilation_helper import *
from pylogics.syntax.base import Not
from plan4past.compiler import ADLCompiler
import pytest
import pkg_resources

def get_task(domain_path, problem_path):
    domain_str = open(pkg_resources.resource_filename(__name__, domain_path)).read()
    problem_str = open(pkg_resources.resource_filename(__name__, problem_path)).read()

    domain_parser = DomainParser()
    problem_parser = ProblemParser()
    domain = domain_parser(domain_str)
    problem = problem_parser(problem_str)
    return domain, problem


def check_compilation(domain, problem, formula, pnf, temporalsubformulas, goal):
    y = temporalsubformulas
    nopex = False
    compiler = ADLCompiler(domain, problem, formula, from_atoms_to_fluent=None, simplify_disj_goal = True)
    if nopex:
        compiler.evaluate_pnf = False
    compiler.compile()
    compiled_dom, compiled_prob, _ = compiler.result

    ach_actions = [a for a in compiled_dom.actions if 'goal' in a.name]
    assert len(ach_actions) > 1 


def test_pddl_compilation():

    domain, problem = get_task('pddl/rovers/domain-fond.pddl', 'pddl/rovers/p01.pddl')

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

    goal = Or(Not(pnf[3]), a, b)
    check_compilation(domain, problem, formula, pnf, temporalsubformulas, goal)

if __name__ == "__main__":
    test_pddl_compilation()
    
            

def test_pddl_compilation2():
    
    domain, problem = get_task('pddl/robot-coffee/domain-fond.pddl', 'pddl/robot-coffee/coffee3next.pddl')

    c = Atomic('robotat_c')
    true = PropositionalTrue()

    formula = parse_pltl("O(robotat_c & Y(Y(Y(!Y(true)))))")

    temporalsubformulas = [
        Yatom_(PropositionalTrue()),
        Yatom_(Not(Before(PropositionalTrue()))),
        Yatom_(Before(Not(Before(PropositionalTrue())))),
        Yatom_(Before(Before(Not(Before(PropositionalTrue()))))),
        Yatom_(Once(And(c, Before(Before(Before(Not(Before(PropositionalTrue())))))))),
    ]

    y = temporalsubformulas
    pnf = [
            true,
            Not(y[0]),
            y[1],
            y[2],
            Or(And(c, y[3]), y[4])
          ]

    goal = pnf[4]
    check_compilation(domain, problem, formula, pnf, temporalsubformulas, goal)


def test_pddl_compilation3():

    domain, problem = get_task('pddl/blocksworld_fond/domain-fond.pddl', 'pddl/blocksworld_fond/problem.pddl')

    on_a_table = Atomic('on_a_table')
    on_b_table = Atomic('on_b_table')
    on_c_table = Atomic('on_c_table')
    on_c_a = Atomic('on_c_a')
    on_a_b = Atomic('on_a_b')
    on_c_b = Atomic('on_c_b')
    on_b_a = Atomic('on_b_a')
    on_a_c = Atomic('on_a_c')
    on_c_b = Atomic('on_c_b')

    formula = parse_pltl("O((on_a_table)&(on_b_table)&(on_c_table)&Y(O((on_c_a)&(on_a_b)&Y(O((on_c_b)&(on_b_a)&Y(O((on_a_c)&(on_c_b))))))))")

    subformulas = [
        Once(And(on_a_c, on_c_b))
    ]

    subformulas.append(Once(And(on_c_b, on_b_a, Before(subformulas[0]))))
    subformulas.append(Once(And(on_c_a, on_a_b, Before(subformulas[1]))))
    subformulas.append(Once(And(on_a_table, on_b_table, on_c_table, Before(subformulas[2]))))

    temporalsubformulas = [
        Yatom_(sub) for sub in subformulas
    ]

    y = temporalsubformulas
    pnf = [
            Or(And(on_a_c, on_c_b), y[0])
        ]
    pnf.append(Or(And(on_c_b, on_b_a, y[0]), y[1]))
    pnf.append(Or(And(on_c_a, on_a_b, y[1]), y[2]))
    pnf.append(Or(And(on_a_table, on_b_table, on_c_table, y[2]), y[3]))

    goal = pnf[3]
    check_compilation(domain, problem, formula, pnf, temporalsubformulas, goal)