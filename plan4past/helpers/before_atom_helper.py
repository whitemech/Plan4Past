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
"""This module contains the data structure that represents a "before atom"."""

from pylogics.syntax.base import Formula
from pylogics.syntax.pltl import Atomic, Before, Once, Since

from plan4past.helpers.utils import check_

QUOTED_ATOM = "quoted"


class BeforeAtom(Atomic):
    """
    Data strucure that represents a "before atom".

    Example 1: for H(a) we will have "Y_H(a)"
    Example 2: for Y(O(a)) we will have "Y_O(a)"
    """

    def __init__(self, formula: Formula) -> None:
        """
        Initialize a before atom.

        The "formula" is the PPLTL formula in the scope of the before (quoted) atom.

        For example, with formula = (a S b) we have a before atom representing "Y(a S b)"

        :param formula: the formula to be quoted
        """
        self.formula = formula
        self.hash = hash((self.__class__, self.formula))
        super().__init__(f"{QUOTED_ATOM}_{self.hash}")

    def __hash__(self) -> int:
        """Compute the hash."""
        return self.hash

    def __eq__(self, __o: object) -> bool:
        """Compare with another object."""
        return isinstance(__o, BeforeAtom) and hash(__o) == self.hash

    def __str__(self) -> str:
        """Get the string representation."""
        return f'"Y_{str(self.formula)}"'

    def __repr__(self) -> str:
        """Get an unambiguous string representation."""
        return f'"Y{self.formula}"'


def Yatom_(formula: Formula):
    """
    Construct the before atom.

    :param formula: the formula to be quoted
    :return: the "before" atom
    """
    return BeforeAtom(formula)


def get_before_atom(formula: Formula) -> BeforeAtom:
    """
    Get the before atom from a formula.

    This function distinguishes between the "before" atom and the other PPLTL operators.

    :param formula: the formula to be quoted
    :return: the "before" atom
    """
    if isinstance(formula, Before):
        return Yatom_(formula.argument)
    check_(isinstance(formula, (Once, Since)))
    return Yatom_(formula)
