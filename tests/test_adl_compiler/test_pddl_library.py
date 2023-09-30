"""Generic tests for the PDDL library."""
import pkg_resources
import pytest
from pddl.parser.domain import DomainParser
from pddl.parser.problem import ProblemParser
from pylogics.parsers import parse_pltl

from plan4past.compiler import ADLCompiler, ProblemUnsolvableException


def test_pddl_conversion() -> None:
    """Test that the ADL compiler executes correctly."""
    domain_str = open(
        pkg_resources.resource_filename(__name__, "pddl/blocksworld/domain.pddl")
    ).read()
    problem_str = open(
        pkg_resources.resource_filename(__name__, "pddl/blocksworld/p01.pddl")
    ).read()

    domain_parser = DomainParser()
    problem_parser = ProblemParser()
    domain = domain_parser(domain_str)
    problem = problem_parser(problem_str)

    formula = parse_pltl("ontable_c & Y(on_b_a)")

    compiler = ADLCompiler(domain, problem, formula)
    compiler.compile()

    compiled_domain, compiled_problem = compiler.result
    assert compiler._before_mapping is not None


def test_pddl_conversion2() -> None:
    """Test that the ADL compiler executes correctly."""
    domain_str = open(
        pkg_resources.resource_filename(__name__, "pddl/blocksworld/domain.pddl")
    ).read()
    problem_str = open(
        pkg_resources.resource_filename(__name__, "pddl/blocksworld/p01.pddl")
    ).read()

    domain_parser = DomainParser()
    problem_parser = ProblemParser()
    domain = domain_parser(domain_str)
    problem = problem_parser(problem_str)

    formula = parse_pltl("Y(O(on_b_a))")

    compiler = ADLCompiler(domain, problem, formula)
    compiler.compile()

    _compiled_domain, _compiled_problem = compiler.result
    assert compiler._before_mapping is not None


def test_unsat_expression() -> None:
    """Test that the ADL compiler detects unsolvable problems."""
    domain_str = open(
        pkg_resources.resource_filename(__name__, "pddl/blocksworld/domain.pddl")
    ).read()
    problem_str = open(
        pkg_resources.resource_filename(__name__, "pddl/blocksworld/p01.pddl")
    ).read()

    domain_parser = DomainParser()
    problem_parser = ProblemParser()
    domain = domain_parser(domain_str)
    problem = problem_parser(problem_str)

    formula = parse_pltl("O(on_b_a) & H(!(on_b_a))")
    with pytest.raises(ProblemUnsolvableException):
        compiler = ADLCompiler(domain, problem, formula)
        compiler.compile()


def test_unsat_expression2() -> None:
    """Test that the ADL compiler detects unsolvable problems."""
    domain_str = open(
        pkg_resources.resource_filename(__name__, "pddl/blocksworld/domain.pddl")
    ).read()
    problem_str = open(
        pkg_resources.resource_filename(__name__, "pddl/blocksworld/p01.pddl")
    ).read()

    domain_parser = DomainParser()
    problem_parser = ProblemParser()
    domain = domain_parser(domain_str)
    problem = problem_parser(problem_str)

    formula = parse_pltl("on_b_a & !(on_b_a)")

    with pytest.raises(ProblemUnsolvableException):
        compiler = ADLCompiler(domain, problem, formula)
        compiler.compile()


def test_always_true_expression() -> None:
    """Test that the ADL compiler detects unsolvable problems."""
    domain_str = open(
        pkg_resources.resource_filename(__name__, "pddl/blocksworld/domain.pddl")
    ).read()
    problem_str = open(
        pkg_resources.resource_filename(__name__, "pddl/blocksworld/p01.pddl")
    ).read()

    domain_parser = DomainParser()
    problem_parser = ProblemParser()
    domain = domain_parser(domain_str)
    problem = problem_parser(problem_str)

    formula = parse_pltl("on_b_a | !(on_b_a)")

    with pytest.raises(NotImplementedError):
        compiler = ADLCompiler(domain, problem, formula)
        compiler.compile()
