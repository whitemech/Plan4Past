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

"""Miscellanea utilities."""
from typing import Dict

from pddl.logic import Predicate, constants
from pylogics.syntax.base import Formula
from pylogics.syntax.pltl import Atomic as PLTLAtomic
from plan4past.utils.atoms_visitor import find_atoms

def add_val_prefix(name: str):
    """Add the 'prime' prefix."""
    return "val-" + name.replace('"', "")


def remove_before_prefix(name: str):
    """Remove the 'Y' prefix."""
    return (
        name.replace("Y-", "")
        if name.startswith("Y-")
        else name.replace("Y", "", 1)
        if name.startswith("Y")
        else name
    )


def remove_val_prefix(name: str):
    """Remove the 'prime' prefix."""
    return name.replace("val-", "") if name.startswith("val-") else name


def replace_symbols(name: str):
    """Stringify symbols."""
    return (
        name.replace('"', "")
        .replace("(", "")
        .replace(")", "")
        .replace("&", "and")
        .replace("|", "or")
        .replace("~", "not-")
        .replace("!", "not-")
        .replace(" ", "-")
    )


def default_mapping(formula: Formula) -> Dict[PLTLAtomic, Predicate]:
    """Compute mapping from atoms to fluents using underscores."""
    symbols = find_atoms(formula)
    from_atoms_to_fluents = {}
    for symbol in symbols:
        name, *cons = symbol.name.split("_")
        if cons:
            from_atoms_to_fluents[symbol] = Predicate(name, *constants(" ".join(cons)))
        else:
            from_atoms_to_fluents[symbol] = Predicate(name)
    return from_atoms_to_fluents


def check_(condition: bool, message: str = "") -> None:
    """
    User-defined assert.

    This function is useful to avoid the use of the built-in assert statement, which is removed
        when the code is compiled in optimized mode. For more information, see
        https://bandit.readthedocs.io/en/1.7.5/plugins/b101_assert_used.html
    """
    if not condition:
        raise AssertionError(message)
