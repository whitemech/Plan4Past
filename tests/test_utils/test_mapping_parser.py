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

"""This module contains tests for the plan4past.utils.mapping_parser module."""
from textwrap import dedent

import pytest
from pddl.logic import Constant, Predicate, constants
from pylogics.syntax.pltl import Atomic as PLTLAtomic
from pylogics.syntax.pltl import FalseFormula as PLTLFalse
from pylogics.syntax.pltl import TrueFormula as PLTLTrue

from plan4past.utils.mapping_parser import MappingParserError, mapping_parser
from tests.conftest import EXAMPLE_MAP_FILE

_on_b_a = PLTLAtomic("on_b_a")
_ontable_c = PLTLAtomic("ontable_c")

_pddl_on_b_a = Predicate("on", *constants("b a"))
_pddl_ontable_c = Predicate("ontable", Constant("c"))


@pytest.mark.parametrize(
    "formula,expected_mapping",
    [
        (PLTLTrue(), {}),
        (PLTLFalse(), {}),
        (_on_b_a, {_on_b_a: _pddl_on_b_a}),
        (_ontable_c, {_ontable_c: _pddl_ontable_c}),
        (_on_b_a & _ontable_c, {_on_b_a: _pddl_on_b_a, _ontable_c: _pddl_ontable_c}),
    ],
)
def test_mapping_parser_successful_case(formula, expected_mapping):
    """Test the mapping parser with the example map file."""
    actual_mapping = mapping_parser(EXAMPLE_MAP_FILE.read_text(), formula)
    assert actual_mapping == expected_mapping


def test_mapping_parser_empty_file():
    """Test the mapping parser when the file is empty."""
    assert not mapping_parser("", PLTLTrue())


def test_mapping_parser_empty_lines():
    """Test the mapping parser with empty lines."""
    assert not mapping_parser("\n\n", PLTLTrue())


def test_mapping_parser_with_comments():
    """Test the mapping parser with comments."""
    assert mapping_parser(";;;;\n;\non_b_a,on b a", _on_b_a) == {_on_b_a: _pddl_on_b_a}


def test_mapping_parser_when_row_has_no_comma():
    """Test the mapping parser when a row is invalid (has no comma)."""
    with pytest.raises(
        MappingParserError,
        match="invalid mapping at row 0: expected a mapping of the form '<symbol>,<predicate>'",
    ):
        mapping_parser(
            "invalid_row\n",
            PLTLTrue(),
        )


def test_mapping_parser_when_row_has_more_than_one_comma():
    """Test the mapping parser when a row is invalid (has more than two commas)."""
    with pytest.raises(
        MappingParserError,
        match="invalid mapping at row 0: expected a mapping of the form '<symbol>,<predicate>'",
    ):
        mapping_parser(
            "invalid_row,invalid_row,\n",
            PLTLTrue(),
        )


def test_mapping_parser_bad_symbol_format():
    """Test the mapping parser when a row is invalid (bad symbol format)."""
    with pytest.raises(
        MappingParserError,
        match="invalid mapping at row 0: symbol cannot be empty string and must match the regex ",
    ):
        mapping_parser(
            "not a valid symbol,some_predicate\n",
            PLTLTrue(),
        )


def test_mapping_parser_empty_predicate_name():
    """Test the mapping parser when a row is invalid (empty predicate name)."""
    with pytest.raises(
        MappingParserError,
        match="invalid mapping at row 0: predicate cannot be empty string",
    ):
        mapping_parser(
            "some_symbol,\n",
            PLTLTrue(),
        )


def test_mapping_parser_invalid_predicate_name():
    """Test the mapping parser when a row is invalid (invalid predicate name)."""
    with pytest.raises(
        MappingParserError,
        match=r"invalid mapping at row 0: got an invalid name for a predicate: 'not!'\. It must match the regex .*",
    ):
        mapping_parser(
            "some_symbol,not! a valid predicate\n",
            PLTLTrue(),
        )


def test_mapping_parser_invalid_constant_name():
    """Test the mapping parser when a row is invalid (invalid constant name)."""
    with pytest.raises(
        MappingParserError,
        match=r"invalid mapping at row 0: got an invalid constant: Value 'wrong-constant-name!' "
        r"does not match the regular expression .*",
    ):
        mapping_parser(
            "some_symbol,predicate wrong-constant-name!\n",
            PLTLTrue(),
        )


def test_mapping_parser_in_case_of_unmapped_symbols():
    """Test the mapping parser when a symbol is not mapped."""
    with pytest.raises(
        MappingParserError,
        match=r"invalid mapping: the following symbols of the formula are not mapped: {'a|b', 'b|a'}",
    ):
        mapping_parser(
            dedent(
                """\
                some_symbol,predicate some_constant
                """
            ),
            PLTLAtomic("a") & PLTLAtomic("b") & PLTLTrue(),
        )


def test_mapping_parser_symbol_occurs_more_than_once():
    """Test the mapping parser when a symbol occurs more than once."""
    with pytest.raises(
        MappingParserError,
        match="invalid mapping at row 1: symbol 'on_b_a' is mapped multiple times",
    ):
        mapping_parser("on_b_a,on b a\non_b_a,on b a", _on_b_a)
