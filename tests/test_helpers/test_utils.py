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

"""This module contains tests for the plan4past.helpers.utils module."""
import pytest
from pddl.logic import Predicate, constants
from pylogics.syntax.pltl import Atomic as PLTLAtomic
from pylogics.syntax.pltl import Before, Since

from plan4past.helpers.utils import (
    add_val_prefix,
    check_,
    default_mapping,
    remove_val_prefix,
)


def test_default_mapping() -> None:
    """Test the default mapping function."""
    p_a_b = PLTLAtomic("p_a_b")
    p_b_c = PLTLAtomic("p_b_c")
    p_c_d = PLTLAtomic("p_c_d")
    p2 = PLTLAtomic("p2")
    yesterday_p_a_b = Before(p_a_b)
    p_b_c_since_p_c_d = Since(p_b_c, p_c_d)

    result = default_mapping(yesterday_p_a_b & p_b_c_since_p_c_d & p2)
    assert result == {
        p_a_b: Predicate("p", *constants("a b")),
        p_b_c: Predicate("p", *constants("b c")),
        p_c_d: Predicate("p", *constants("c d")),
        p2: Predicate("p2"),
    }


def test_val_prefix() -> None:
    """Test the add_val_prefix function."""
    assert add_val_prefix("Y-foo") == "val-Y-foo"
    assert add_val_prefix("Yfoo") == "val-Yfoo"
    assert add_val_prefix("foo") == "val-foo"
    assert add_val_prefix("Y-foo-bar") == "val-Y-foo-bar"


def test_remove_val_prefix() -> None:
    """Test the remove_val_prefix function."""
    assert remove_val_prefix("val-foo") == "foo"
    assert remove_val_prefix("foo") == "foo"


def test_check() -> None:
    """Test the check_ function."""
    with pytest.raises(AssertionError, match=""):
        check_(False)

    with pytest.raises(AssertionError, match="message"):
        check_(False, message="message")
