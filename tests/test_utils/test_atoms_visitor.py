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

"""This module contains tests for the plan4past.utils.atoms_visitor module."""
import pytest
from pylogics.syntax.pltl import Atomic as PLTLAtomic
from pylogics.syntax.pltl import Before
from pylogics.syntax.pltl import FalseFormula as PLTLFalse
from pylogics.syntax.pltl import Historically, Once, Since
from pylogics.syntax.pltl import TrueFormula as PLTLTrue

from plan4past.utils.atoms_visitor import find_atoms


def test_find_atoms_true():
    """Test find_atoms for a true formula."""
    assert find_atoms(PLTLTrue()) == {PLTLAtomic("true")}


def test_find_atoms_false():
    """Test find_atoms for a false formula."""
    assert find_atoms(PLTLFalse()) == {PLTLAtomic("false")}


def test_find_atoms_atomic():
    """Test find_atoms for an atomic formula."""
    assert find_atoms(PLTLAtomic("a")) == {PLTLAtomic("a")}


def test_find_atoms_not():
    """Test find_atoms for a not formula."""
    a = PLTLAtomic("a")
    assert find_atoms(~a) == {a}


def test_find_atoms_and():
    """Test find_atoms for an and formula."""
    a = PLTLAtomic("a")
    b = PLTLAtomic("b")
    assert find_atoms(a & b) == {a, b}


def test_find_atoms_or():
    """Test find_atoms for an or formula."""
    a = PLTLAtomic("a")
    b = PLTLAtomic("b")
    assert find_atoms(a | b) == {a, b}


def test_find_atoms_yesterday():
    """Test find_atoms for a yesterday formula."""
    a = PLTLAtomic("a")
    yesterday_a = Before(a)
    assert find_atoms(yesterday_a) == {a}


def test_find_atoms_since():
    """Test find_atoms for a since formula."""
    a = PLTLAtomic("a")
    b = PLTLAtomic("b")
    a_since_b = Since(a, b)
    assert find_atoms(a_since_b) == {a, b}


def test_find_atoms_once():
    """Test find_atoms for a once formula."""
    a = PLTLAtomic("a")
    once_a = Once(a)
    assert find_atoms(once_a) == {a}


def test_find_atoms_historically():
    """Test find_atoms for a historically formula."""
    a = PLTLAtomic("a")
    historically_a = Historically(a)
    assert find_atoms(historically_a) == {a}


def test_find_atoms_called_with_not_supported_object_raises_error():
    """Test that passing an unsupported input for 'find_atoms' will raise an error."""
    with pytest.raises(
        ValueError,
        match="object of type <class 'int'> is not supported by this function",
    ):
        find_atoms(1)
