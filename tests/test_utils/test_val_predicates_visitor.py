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

"""This module contains tests for the plan4past.utils.val_predicates_visitor module."""
import pytest
from pddl.logic import Predicate
from pylogics.syntax.pltl import Atomic as PLTLAtomic
from pylogics.syntax.pltl import (
    Before,
    Once,
    PropositionalFalse,
    PropositionalTrue,
    Since,
)

from plan4past.helpers.compilation_helper import PredicateMapping
from plan4past.helpers.utils import add_val_prefix
from plan4past.utils.val_predicates_visitor import ValPredicatesVisitor

# pylint: disable=redefined-outer-name


@pytest.fixture(scope="function")
def val_predicates_visitor():
    """Return a val predicates visitor."""
    m = PredicateMapping()
    return ValPredicatesVisitor(m)


def test_val_predicates_visitor_not_implemented_fail(val_predicates_visitor):
    """Test the val predicates visitor when the input argument is not supported."""
    with pytest.raises(
        NotImplementedError,
        match="handler not implemented for object of type <class 'int'>",
    ):
        val_predicates_visitor.visit(1)


def test_val_predicates_visitor_true(val_predicates_visitor):
    """Test the val predicates visitor for the propositional true."""
    assert val_predicates_visitor.visit(PropositionalTrue()) == {
        Predicate(add_val_prefix("quoted_0"))
    }


def test_val_predicates_visitor_false(val_predicates_visitor):
    """Test the val predicates visitor for the propositional false."""
    assert val_predicates_visitor.visit(PropositionalFalse()) == {
        Predicate(add_val_prefix("quoted_0"))
    }


def test_val_predicates_visitor_atomic(val_predicates_visitor):
    """Test the val predicates visitor for the atomic formula."""
    a = PLTLAtomic("a")
    assert val_predicates_visitor.visit(a) == {Predicate(add_val_prefix("quoted_0"))}


def test_val_predicates_visitor_and(val_predicates_visitor):
    """Test the val predicates visitor for the and formula."""
    a = PLTLAtomic("a")
    b = PLTLAtomic("b")

    actual_set = val_predicates_visitor.visit(a & b)

    val_a_and_b = Predicate(add_val_prefix("quoted_0"))
    val_a = Predicate(add_val_prefix("quoted_1"))
    val_b = Predicate(add_val_prefix("quoted_2"))

    expected_set = {val_a_and_b, val_a, val_b}

    assert actual_set == expected_set


def test_val_predicates_visitor_or(val_predicates_visitor):
    """Test the val predicates visitor for the or formula."""
    a = PLTLAtomic("a")
    b = PLTLAtomic("b")

    actual_set = val_predicates_visitor.visit(a | b)

    val_a_or_b = Predicate(add_val_prefix("quoted_0"))
    val_a = Predicate(add_val_prefix("quoted_1"))
    val_b = Predicate(add_val_prefix("quoted_2"))

    expected_set = {val_a_or_b, val_a, val_b}

    assert actual_set == expected_set


def test_val_predicates_visitor_not(val_predicates_visitor):
    """Test the val predicates visitor for the not formula."""
    a = PLTLAtomic("a")

    val_not_a = Predicate(add_val_prefix("quoted_0"))
    val_a = Predicate(add_val_prefix("quoted_1"))

    assert val_predicates_visitor.visit(~a) == {val_not_a, val_a}


def test_val_predicates_visitor_yesterday(val_predicates_visitor):
    """Test the val predicates visitor for the yesterday formula."""
    a = PLTLAtomic("a")
    yesterday_a = Before(a)

    val_yesterday_a = Predicate(add_val_prefix("quoted_0"))
    val_a = Predicate(add_val_prefix("quoted_1"))

    assert val_predicates_visitor.visit(yesterday_a) == {val_yesterday_a, val_a}


def test_val_predicates_visitor_since(val_predicates_visitor):
    """Test the val predicates visitor for the yesterday formula."""
    a = PLTLAtomic("a")
    b = PLTLAtomic("b")
    c = PLTLAtomic("c")
    a_since_b_since_c = Since(a, b, c)

    val_a_since_b_since_c = Predicate(add_val_prefix("quoted_0"))
    val_b_since_c = Predicate(add_val_prefix("quoted_1"))
    val_a = Predicate(add_val_prefix("quoted_2"))
    val_b = Predicate(add_val_prefix("quoted_3"))
    val_c = Predicate(add_val_prefix("quoted_4"))

    assert val_predicates_visitor.visit(a_since_b_since_c) == {
        val_a_since_b_since_c,
        val_b_since_c,
        val_a,
        val_b,
        val_c,
    }


def test_val_predicates_visitor_once(val_predicates_visitor):
    """Test the val predicates visitor for the once formula."""
    a = PLTLAtomic("a")
    once_a = Once(a)

    val_once_a = Predicate(add_val_prefix("quoted_0"))
    val_a = Predicate(add_val_prefix("quoted_1"))

    assert val_predicates_visitor.visit(once_a) == {val_once_a, val_a}
