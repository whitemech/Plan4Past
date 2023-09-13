from pddl.parser.domain import DomainParser
from pddl.parser.problem import ProblemParser
from pylogics.parsers import parse_pltl
from plan4past.helpers.compilation_helper import *
from plan4past.compiler_ce import compile_with_pddl_library, ProblemUnsolvableException
from pddl.formatter import domain_to_string, problem_to_string
import pytest
import pkg_resources

def test_pddl_conversion():
    domain_str = open(pkg_resources.resource_filename(__name__, 'pddl/blocksworld/domain.pddl')).read()
    problem_str = open(pkg_resources.resource_filename(__name__, 'pddl/blocksworld/p01.pddl')).read()

    domain_parser = DomainParser()
    problem_parser = ProblemParser()
    domain = domain_parser(domain_str)
    problem = problem_parser(problem_str)

    formula = parse_pltl("ontable_c & Y(on_b_a)")

    compiled_domain, compiled_problem, befores = compile_with_pddl_library(domain, problem, formula)
    tmp = domain_to_string(compiled_domain)
    print('ciao')


def test_pddl_conversion2():
    domain_str = open(pkg_resources.resource_filename(__name__, 'pddl/blocksworld/domain.pddl')).read()
    problem_str = open(pkg_resources.resource_filename(__name__, 'pddl/blocksworld/p01.pddl')).read()

    domain_parser = DomainParser()
    problem_parser = ProblemParser()
    domain = domain_parser(domain_str)
    problem = problem_parser(problem_str)

    formula = parse_pltl("Y(O(on_b_a))")

    res = compile_with_pddl_library(domain, problem, formula)


def test_unsat_expression():

    domain_str = open(pkg_resources.resource_filename(__name__, 'pddl/blocksworld/domain.pddl')).read()
    problem_str = open(pkg_resources.resource_filename(__name__, 'pddl/blocksworld/p01.pddl')).read()

    domain_parser = DomainParser()
    problem_parser = ProblemParser()
    domain = domain_parser(domain_str)
    problem = problem_parser(problem_str)

    formula = parse_pltl("O(on_b_a) & H(!(on_b_a))")
    with pytest.raises(ProblemUnsolvableException) as e_info:
        compile_with_pddl_library(domain, problem, formula)
        

def test_unsat_expression2():

    domain_str = open(pkg_resources.resource_filename(__name__, 'pddl/blocksworld/domain.pddl')).read()
    problem_str = open(pkg_resources.resource_filename(__name__, 'pddl/blocksworld/p01.pddl')).read()

    domain_parser = DomainParser()
    problem_parser = ProblemParser()
    domain = domain_parser(domain_str)
    problem = problem_parser(problem_str)

    formula = parse_pltl("on_b_a & !(on_b_a)")

    with pytest.raises(ProblemUnsolvableException) as e_info:
        compile_with_pddl_library(domain, problem, formula)

if __name__ == "__main__":
    test_unsat_expression2()


def test_always_true_expression():

    domain_str = open(pkg_resources.resource_filename(__name__, 'pddl/blocksworld/domain.pddl')).read()
    problem_str = open(pkg_resources.resource_filename(__name__, 'pddl/blocksworld/p01.pddl')).read()

    domain_parser = DomainParser()
    problem_parser = ProblemParser()
    domain = domain_parser(domain_str)
    problem = problem_parser(problem_str)

    formula = parse_pltl("on_b_a | !(on_b_a)")

    with pytest.raises(NotImplementedError) as e_info:
        compile_with_pddl_library(domain, problem, formula)