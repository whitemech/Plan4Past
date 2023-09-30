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
"""Generic tests for the PDDL library."""
from pathlib import Path

import pkg_resources
import pytest
from pddl.parser.domain import DomainParser
from pddl.parser.problem import ProblemParser
from pylogics.parsers import parse_pltl

from plan4past.compiler import ADLCompiler, ProblemUnsolvableException


def test_pddl_conversion() -> None:
    """Test that the ADL compiler executes correctly."""
    domain_str = Path(
        pkg_resources.resource_filename(__name__, "pddl/blocksworld/domain.pddl")
    ).read_text(encoding="utf-8")
    problem_str = Path(
        pkg_resources.resource_filename(__name__, "pddl/blocksworld/p01.pddl")
    ).read_text(encoding="utf-8")

    domain_parser = DomainParser()
    problem_parser = ProblemParser()
    domain = domain_parser(domain_str)
    problem = problem_parser(problem_str)

    formula = parse_pltl("ontable_c & Y(on_b_a)")

    compiler = ADLCompiler(domain, problem, formula)
    compiler.compile()

    _compiled_domain, _compiled_problem = compiler.result
    assert compiler._before_mapping is not None  # pylint: disable=protected-access


def test_pddl_conversion2() -> None:
    """Test that the ADL compiler executes correctly."""
    domain_str = Path(
        pkg_resources.resource_filename(__name__, "pddl/blocksworld/domain.pddl")
    ).read_text(encoding="utf-8")
    problem_str = Path(
        pkg_resources.resource_filename(__name__, "pddl/blocksworld/p01.pddl")
    ).read_text(encoding="utf-8")

    domain_parser = DomainParser()
    problem_parser = ProblemParser()
    domain = domain_parser(domain_str)
    problem = problem_parser(problem_str)

    formula = parse_pltl("Y(O(on_b_a))")

    compiler = ADLCompiler(domain, problem, formula)
    compiler.compile()

    _compiled_domain, _compiled_problem = compiler.result
    assert compiler._before_mapping is not None  # pylint: disable=protected-access


def test_unsat_expression() -> None:
    """Test that the ADL compiler detects unsolvable problems."""
    domain_str = Path(
        pkg_resources.resource_filename(__name__, "pddl/blocksworld/domain.pddl")
    ).read_text(encoding="utf-8")
    problem_str = Path(
        pkg_resources.resource_filename(__name__, "pddl/blocksworld/p01.pddl")
    ).read_text(encoding="utf-8")

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
    domain_str = Path(
        pkg_resources.resource_filename(__name__, "pddl/blocksworld/domain.pddl")
    ).read_text(encoding="utf-8")
    problem_str = Path(
        pkg_resources.resource_filename(__name__, "pddl/blocksworld/p01.pddl")
    ).read_text(encoding="utf-8")

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
    domain_str = Path(
        pkg_resources.resource_filename(__name__, "pddl/blocksworld/domain.pddl")
    ).read_text(encoding="utf-8")
    problem_str = Path(
        pkg_resources.resource_filename(__name__, "pddl/blocksworld/p01.pddl")
    ).read_text(encoding="utf-8")

    domain_parser = DomainParser()
    problem_parser = ProblemParser()
    domain = domain_parser(domain_str)
    problem = problem_parser(problem_str)

    formula = parse_pltl("on_b_a | !(on_b_a)")

    with pytest.raises(NotImplementedError):
        compiler = ADLCompiler(domain, problem, formula)
        compiler.compile()
