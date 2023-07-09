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

from plan4past.helpers.utils import (
    add_val_prefix,
    check_,
    remove_before_prefix,
    remove_val_prefix,
)


def test_val_prefix() -> None:
    """Test the add_val_prefix function."""
    assert add_val_prefix("Y-foo") == "val__Y-foo"
    assert add_val_prefix("Yfoo") == "val__Yfoo"
    assert add_val_prefix("foo") == "val__foo"
    assert add_val_prefix("Y-foo-bar") == "val__Y-foo-bar"


def test_remove_before_prefix() -> None:
    """Test the remove_before_prefix function."""
    assert remove_before_prefix("Y-foo") == "foo"
    assert remove_before_prefix("Yfoo") == "foo"
    assert remove_before_prefix("foo") == "foo"


def test_remove_val_prefix() -> None:
    """Test the remove_val_prefix function."""
    assert remove_val_prefix("val__foo") == "foo"
    assert remove_val_prefix("foo") == "foo"


def test_check() -> None:
    """Test the check_ function."""
    with pytest.raises(AssertionError, match=""):
        check_(False)

    with pytest.raises(AssertionError, match="message"):
        check_(False, message="message")
