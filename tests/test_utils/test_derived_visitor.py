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

"""This module contains tests for the plan4past.utils.derived_visitor module."""
from typing import Set

import pytest
from pddl.logic.base import And, Not, Or
from pddl.logic.predicates import DerivedPredicate, Predicate
from pylogics.syntax.pltl import Atomic as PLTLAtomic
from pylogics.syntax.pltl import (
    Before,
    Once,
    PropositionalFalse,
    PropositionalTrue,
    Since,
)

from plan4past.helpers.utils import add_val_prefix
from plan4past.utils.derived_visitor import derived_predicates


def _eq_pred(a_pred: DerivedPredicate, b_pred: DerivedPredicate) -> bool:
    """Check if two derived predicates are equal."""
    return a_pred.predicate == b_pred.predicate and a_pred.condition == b_pred.condition


def _eq(a: Set[DerivedPredicate], b: Set[DerivedPredicate]) -> bool:
    """Check if two sets of derived predicates are equal."""
    if len(a) != len(b):
        return False

    for a_pred in a:
        if not any(_eq_pred(a_pred, b_pred) for b_pred in b):
            return False

    return True


def test_derived_predicates_visitor_not_implemented_fail():
    """Test the derived predicates visitor when the input argument is not supported."""
    with pytest.raises(
        NotImplementedError, match="handler not implemented for object <class 'int'>"
    ):
        derived_predicates(1)


def test_derived_predicates_visitor_true():
    """Test the derived predicates visitor for the propositional true."""
    val = Predicate(add_val_prefix("true"))
    expected = {DerivedPredicate(val, And())}

    actual = derived_predicates(PropositionalTrue())
    assert _eq(actual, expected)


def test_derived_predicates_visitor_false():
    """Test the derived predicates visitor for the propositional false."""
    val = Predicate(add_val_prefix("false"))
    expected = {DerivedPredicate(val, Or())}

    actual = derived_predicates(PropositionalFalse())
    assert _eq(actual, expected)


def test_derived_predicates_visitor_atomic():
    """Test the derived predicates visitor for the atomic formula."""
    a = PLTLAtomic("a")
    val = Predicate(add_val_prefix("a"))
    condition = Predicate("a")
    expected = {DerivedPredicate(val, condition)}

    actual = derived_predicates(a)
    assert _eq(actual, expected)


def test_derived_predicates_visitor_and():
    """Test the derived predicates visitor for the and formula."""
    a = PLTLAtomic("a")
    b = PLTLAtomic("b")

    condition_a = Predicate("a")
    condition_b = Predicate("b")

    val = Predicate(add_val_prefix("LPAR__a__RPAR-__AND__-LPAR__b__RPAR"))
    val_a = Predicate(add_val_prefix("a"))
    val_b = Predicate(add_val_prefix("b"))

    condition = And(val_a, val_b)

    expected = {
        DerivedPredicate(val, condition),
        DerivedPredicate(val_a, condition_a),
        DerivedPredicate(val_b, condition_b),
    }

    actual = derived_predicates(a & b)
    assert _eq(actual, expected)


def test_derived_predicates_visitor_or():
    """Test the derived predicates visitor for the or formula."""
    a = PLTLAtomic("a")
    b = PLTLAtomic("b")

    condition_a = Predicate("a")
    condition_b = Predicate("b")

    val = Predicate(add_val_prefix("LPAR__a__RPAR-__OR__-LPAR__b__RPAR"))
    val_a = Predicate(add_val_prefix("a"))
    val_b = Predicate(add_val_prefix("b"))

    condition = Or(val_a, val_b)

    expected = {
        DerivedPredicate(val, condition),
        DerivedPredicate(val_a, condition_a),
        DerivedPredicate(val_b, condition_b),
    }

    actual = derived_predicates(a | b)
    assert _eq(actual, expected)


def test_derived_predicates_visitor_not():
    """Test the derived predicates visitor for the not formula."""
    a = PLTLAtomic("a")

    condition_a = Predicate("a")

    val = Predicate(add_val_prefix("NOT__LPAR__a__RPAR"))
    val_a = Predicate(add_val_prefix("a"))

    condition = Not(val_a)

    expected = {DerivedPredicate(val, condition), DerivedPredicate(val_a, condition_a)}

    actual = derived_predicates(~a)
    assert _eq(actual, expected)


def test_derived_predicates_visitor_before():
    """Test the derived predicates visitor for the before formula."""
    a = PLTLAtomic("a")
    Ya = Before(a)

    condition_a = Predicate("a")

    val = Predicate(add_val_prefix("YLPAR__a__RPAR"))
    val_a = Predicate(add_val_prefix("a"))

    condition = Predicate("YLPAR__a__RPAR")

    expected = {DerivedPredicate(val, condition), DerivedPredicate(val_a, condition_a)}

    actual = derived_predicates(Ya)
    assert _eq(actual, expected)


def test_derived_predicates_visitor_since():
    """Test the derived predicates visitor for the since formula."""
    a = PLTLAtomic("a")
    b = PLTLAtomic("b")
    c = PLTLAtomic("c")
    a_since_b_since_c = Since(a, b, c)

    val_a = Predicate(add_val_prefix("a"))
    val_b = Predicate(add_val_prefix("b"))
    val_c = Predicate(add_val_prefix("c"))
    val_a_since_b_since_c = Predicate(
        add_val_prefix("LPAR__a__RPAR-S-LPAR__LPAR__b__RPAR-S-LPAR__c__RPAR__RPAR")
    )
    val_b_since_c = Predicate(add_val_prefix("LPAR__b__RPAR-S-LPAR__c__RPAR"))
    Y_a_since_b_since_c = Predicate(
        "Y__LPAR__a__RPAR-S-LPAR__LPAR__b__RPAR-S-LPAR__c__RPAR__RPAR"
    )
    Y_b_since_c = Predicate("Y__LPAR__b__RPAR-S-LPAR__c__RPAR")

    condition_a = Predicate("a")
    condition_b = Predicate("b")
    condition_c = Predicate("c")
    condition_b_since_c = Or(val_c, And(val_b, Y_b_since_c))
    condition_a_since_b_since_c = Or(val_b_since_c, And(val_a, Y_a_since_b_since_c))

    expected = {
        DerivedPredicate(val_a_since_b_since_c, condition_a_since_b_since_c),
        DerivedPredicate(val_b_since_c, condition_b_since_c),
        DerivedPredicate(val_a, condition_a),
        DerivedPredicate(val_b, condition_b),
        DerivedPredicate(val_c, condition_c),
    }

    actual = derived_predicates(a_since_b_since_c)
    assert _eq(actual, expected)


def test_derived_predicates_visitor_once():
    """Test the derived predicates visitor for the once formula."""
    a = PLTLAtomic("a")
    once_a = Once(a)

    val_a = Predicate(add_val_prefix("a"))
    val_once_a = Predicate(add_val_prefix("OLPAR__a__RPAR"))
    Y_once_a = Predicate("Y__OLPAR__a__RPAR")

    condition_a = Predicate("a")
    condition_once_a = Or(val_a, Y_once_a)

    expected = {
        DerivedPredicate(val_a, condition_a),
        DerivedPredicate(val_once_a, condition_once_a),
    }

    actual = derived_predicates(once_a)
    assert _eq(actual, expected)
