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

"""This module contains tests for the plan4past.utils.rewrite_formula_visitor module."""
import pytest
from pylogics.syntax.base import Equivalence as PLTLEquivalence
from pylogics.syntax.base import Implies as PLTLImplies
from pylogics.syntax.pltl import Atomic as PLTLAtomic
from pylogics.syntax.pltl import (
    Before,
    Historically,
    Once,
    PropositionalFalse,
    PropositionalTrue,
    Since,
)

from plan4past.utils.rewrite_formula_visitor import rewrite


def test_rewrite_formula_visitor_not_implemented_fail():
    """Test the rewrite formula visitor when the input argument is not supported."""
    with pytest.raises(
        NotImplementedError,
        match="handler not implemented for object of type <class 'int'>",
    ):
        rewrite(1)


def test_rewrite_formula_visitor_true():
    """Test the rewrite formula visitor for the propositional true."""
    assert rewrite(PropositionalTrue()) == PropositionalTrue()


def test_rewrite_formula_visitor_false():
    """Test the rewrite formula visitor for the propositional false."""
    assert rewrite(PropositionalFalse()) == PropositionalFalse()


def test_rewrite_formula_visitor_atomic():
    """Test the rewrite formula visitor for the atomic formula."""
    a = PLTLAtomic('"a"')
    assert rewrite(a) == a


def test_rewrite_formula_visitor_and():
    """Test the rewrite formula visitor for the and formula."""
    a = PLTLAtomic('"a"')
    b = PLTLAtomic('"b"')
    c = PLTLAtomic('"c"')
    d = PLTLAtomic('"d"')
    assert rewrite(PLTLImplies(a, b) & PLTLImplies(c, d)) == (~a | b) & (~c | d)


def test_rewrite_formula_visitor_or():
    """Test the rewrite formula visitor for the or formula."""
    a = PLTLAtomic('"a"')
    b = PLTLAtomic('"b"')
    c = PLTLAtomic('"c"')
    d = PLTLAtomic('"d"')
    assert rewrite(PLTLImplies(a, b) | PLTLImplies(c, d)) == (~a | b) | (~c | d)


def test_rewrite_formula_visitor_not():
    """Test the rewrite formula visitor for the not formula."""
    a = PLTLAtomic('"a"')
    b = PLTLAtomic('"b"')
    assert rewrite(~PLTLImplies(a, b)) == ~(~a | b)


def test_rewrite_formula_visitor_implies():
    """Test the rewrite formula visitor for the implies formula."""
    a = PLTLAtomic('"a"')
    b = PLTLAtomic('"b"')
    assert rewrite(PLTLImplies(a, b)) == (~a | b)


def test_rewrite_formula_visitor_equivalence():
    """Test the rewrite formula visitor for the equivalence formula."""
    a = PLTLAtomic('"a"')
    b = PLTLAtomic('"b"')
    assert rewrite(PLTLEquivalence(a, b)) == ((a & b) | (~a & ~b))


def test_rewrite_formula_visitor_before():
    """Test the rewrite formula visitor for the before formula."""
    a = PLTLAtomic('"a"')
    before_a = Before(a)
    assert rewrite(before_a) == before_a


def test_rewrite_formula_visitor_since():
    """Test the rewrite formula visitor for the before formula."""
    a = PLTLAtomic('"a"')
    b = PLTLAtomic('"b"')
    c = PLTLAtomic('"c"')
    d = PLTLAtomic('"d"')
    a_since_b_since_c_implies_d = Since(a, b, PLTLImplies(c, d))
    assert rewrite(a_since_b_since_c_implies_d) == Since(a, Since(b, (~c | d)))


def test_rewrite_formula_visitor_once():
    """Test the rewrite formula visitor for the once formula."""
    a = PLTLAtomic('"a"')
    once_a = Once(a)
    assert rewrite(once_a) == once_a


def test_rewrite_formula_visitor_historically():
    """Test the rewrite formula visitor for the historically formula."""
    a = PLTLAtomic('"a"')
    historically_a = Historically(a)
    assert rewrite(historically_a) == ~Once(~a)
