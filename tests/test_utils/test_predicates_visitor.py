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

"""This module contains tests for the plan4past.utils.predicates_visitor module."""

import pytest
from pddl.logic.predicates import Predicate
from pylogics.syntax.pltl import Atomic as PLTLAtomic
from pylogics.syntax.pltl import (
    Before,
    Once,
    PropositionalFalse,
    PropositionalTrue,
    Since,
)

from plan4past.helpers.compilation_helper import PredicateMapping
from plan4past.utils.predicates_visitor import PredicatesVisitor

# pylint: disable=redefined-outer-name


@pytest.fixture(scope="function")
def predicates_visitor():
    """Return a val predicates visitor."""
    m = PredicateMapping()
    return PredicatesVisitor(m)


def test_predicates_visitor_not_implemented_fail(predicates_visitor):
    """Test the predicates visitor when the input argument is not supported."""
    with pytest.raises(
        NotImplementedError,
        match="handler not implemented for object of type <class 'int'>",
    ):
        predicates_visitor.visit(1)


def test_predicates_visitor_true(predicates_visitor):
    """Test the predicates visitor for the propositional true."""
    assert predicates_visitor.visit(PropositionalTrue()) == set()


def test_predicates_visitor_false(predicates_visitor):
    """Test the predicates visitor for the propositional false."""
    assert predicates_visitor.visit(PropositionalFalse()) == set()


def test_predicates_visitor_atomic(predicates_visitor):
    """Test the predicates visitor for the atomic formula."""
    assert predicates_visitor.visit(PLTLAtomic("a")) == set()


def test_predicates_visitor_and(predicates_visitor):
    """Test the predicates visitor for the and formula."""
    a = PLTLAtomic("a")
    b = PLTLAtomic("b")
    assert predicates_visitor.visit(a & b) == set()


def test_predicates_visitor_or(predicates_visitor):
    """Test the predicates visitor for the or formula."""
    a = PLTLAtomic("a")
    b = PLTLAtomic("b")
    assert predicates_visitor.visit(a | b) == set()


def test_predicates_visitor_not(predicates_visitor):
    """Test the predicates visitor for the not formula."""
    a = PLTLAtomic("a")
    assert predicates_visitor.visit(~a) == set()


def test_predicates_visitor_yesterday(predicates_visitor):
    """Test the predicates visitor for the yesterday formula."""
    a = PLTLAtomic("a")
    Ya = Before(a)
    assert predicates_visitor.visit(Ya) == {Predicate("quoted_0")}


def test_predicates_visitor_since(predicates_visitor):
    """Test the predicates visitor for the since formula."""
    a = PLTLAtomic("a")
    b = PLTLAtomic("b")
    c = PLTLAtomic("c")
    a_since_b_since_c = Since(a, b, c)
    assert predicates_visitor.visit(a_since_b_since_c) == {
        Predicate("quoted_0"),
        Predicate("quoted_1"),
    }


def test_predicates_visitor_once(predicates_visitor):
    """Test the predicates visitor for the once formula."""
    a = PLTLAtomic("a")
    once_a = Once(a)
    assert predicates_visitor.visit(once_a) == {Predicate("quoted_0")}
