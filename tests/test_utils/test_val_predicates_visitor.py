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

from plan4past.helpers.utils import add_val_prefix
from plan4past.utils.val_predicates_visitor import val_predicates


def test_val_predicates_visitor_not_implemented_fail():
    """Test the val predicates visitor when the input argument is not supported."""
    with pytest.raises(
        NotImplementedError,
        match="handler not implemented for object of type <class 'int'>",
    ):
        val_predicates(1)


def test_val_predicates_visitor_true():
    """Test the val predicates visitor for the propositional true."""
    assert val_predicates(PropositionalTrue()) == {Predicate(add_val_prefix("true"))}


def test_val_predicates_visitor_false():
    """Test the val predicates visitor for the propositional false."""
    assert val_predicates(PropositionalFalse()) == {Predicate(add_val_prefix("false"))}


def test_val_predicates_visitor_atomic():
    """Test the val predicates visitor for the atomic formula."""
    a = PLTLAtomic("a")
    assert val_predicates(a) == {Predicate(add_val_prefix(a.name))}


def test_val_predicates_visitor_and():
    """Test the val predicates visitor for the and formula."""
    a = PLTLAtomic("a")
    b = PLTLAtomic("b")

    val_a_and_b = Predicate(add_val_prefix("LPAR__a__RPAR-__AND__-LPAR__b__RPAR"))
    val_a = Predicate(add_val_prefix(a.name))
    val_b = Predicate(add_val_prefix(b.name))

    assert val_predicates(a & b) == {val_a_and_b, val_a, val_b}


def test_val_predicates_visitor_or():
    """Test the val predicates visitor for the or formula."""
    a = PLTLAtomic("a")
    b = PLTLAtomic("b")

    val_a_or_b = Predicate(add_val_prefix("LPAR__a__RPAR-__OR__-LPAR__b__RPAR"))
    val_a = Predicate(add_val_prefix(a.name))
    val_b = Predicate(add_val_prefix(b.name))

    assert val_predicates(a | b) == {val_a_or_b, val_a, val_b}


def test_val_predicates_visitor_not():
    """Test the val predicates visitor for the not formula."""
    a = PLTLAtomic("a")

    val_not_a = Predicate(add_val_prefix("NOT__LPAR__a__RPAR"))
    val_a = Predicate(add_val_prefix(a.name))

    assert val_predicates(~a) == {val_not_a, val_a}


def test_val_predicates_visitor_before():
    """Test the val predicates visitor for the before formula."""
    a = PLTLAtomic("a")
    before_a = Before(a)

    val_before_a = Predicate(add_val_prefix("YLPAR__a__RPAR"))
    val_a = Predicate(add_val_prefix(a.name))

    assert val_predicates(before_a) == {val_before_a, val_a}


def test_val_predicates_visitor_since():
    """Test the val predicates visitor for the before formula."""
    a = PLTLAtomic("a")
    b = PLTLAtomic("b")
    c = PLTLAtomic("c")
    a_since_b_since_c = Since(a, b, c)

    val_a_since_b_since_c = Predicate(
        add_val_prefix("LPAR__a__RPAR-S-LPAR__LPAR__b__RPAR-S-LPAR__c__RPAR__RPAR")
    )
    val_b_since_c = Predicate(add_val_prefix("LPAR__b__RPAR-S-LPAR__c__RPAR"))
    val_a = Predicate(add_val_prefix(a.name))
    val_b = Predicate(add_val_prefix(b.name))
    val_c = Predicate(add_val_prefix(c.name))

    assert val_predicates(a_since_b_since_c) == {
        val_a_since_b_since_c,
        val_b_since_c,
        val_a,
        val_b,
        val_c,
    }


def test_val_predicates_visitor_once():
    """Test the val predicates visitor for the once formula."""
    a = PLTLAtomic("a")
    once_a = Once(a)

    val_once_a = Predicate(add_val_prefix("OLPAR__a__RPAR"))
    val_a = Predicate(add_val_prefix(a.name))

    assert val_predicates(once_a) == {val_once_a, val_a}
