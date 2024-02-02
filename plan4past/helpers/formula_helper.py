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
"""This module contains the data structure that represents a "yesterday atom"."""

from pylogics.syntax.base import Formula
from pylogics.syntax.pltl import Atomic, Before, Once, Since

from plan4past.helpers.utils import check_
from typing import Set
from pylogics.syntax.base import And, Formula, Not, Or
from pylogics.syntax.pltl import (
    Atomic,
    Before,
    Once,
    PropositionalFalse,
    PropositionalTrue,
    Since,
)

VAL_ATOM = "val"
QUOTED_ATOM = "quoted"
TEMPORAL_TYPES = {Before, Once, Since}


class MetaAtom(Atomic):
    """
    Data strucure representing a meta-atom, that is, an atom representing a formula.
    """
    def __init__(self, formula: Formula, symbol: str) -> None:
        self.symbol = symbol
        self.formula = formula
        self.hash = hash((self.__class__, self.formula))
        super().__init__(f"{self.symbol}_{self.hash}")

    def __hash__(self) -> int:
        """Compute the hash."""
        return self.hash

    def __eq__(self, __o: object) -> bool:
        """Compare with another object."""
        return isinstance(__o, MetaAtom) and hash(__o) == self.hash

    def __str__(self) -> str:
        """Get the string representation."""
        return f'"{self.symbol}_{str(self.formula)}"'

    def __repr__(self) -> str:
        """Get an unambiguous string representation."""
        return f'"{self.symbol}_{self.formula}"'


class YesterdayAtom(MetaAtom):
    """
    Data strucure representing a quoted "yesterdy atom".
    """
    def __init__(self, formula: Formula) -> None:
        """
        Initialize a yesterday atom.
        """
        super().__init__(formula, QUOTED_ATOM)
    

class ValAtom(MetaAtom):
    """
    Data strucure representing a "val" atom.
    """
    def __init__(self, formula: Formula) -> None:
        """
        Initialize a yesterday atom.
        """
        super().__init__(formula, VAL_ATOM)

def ValAtom_(formula: Formula):
    return ValAtom(formula)

def Yatom_(formula: Formula):
    return YesterdayAtom(formula)

def get_subformulas(phi: Formula) -> Set[Formula]:
    """Compute the pnf of a formula."""
    return {
        Atomic: lambda phi: {phi},
        PropositionalTrue: lambda phi: {phi},
        PropositionalFalse: lambda phi: {phi},
        Not: lambda phi: {phi}.union(get_subformulas(phi.argument)),
        Before: lambda phi: {phi}.union(get_subformulas(phi.argument)),
        And: lambda phi: {phi}.union(*[get_subformulas(operand) for operand in phi.operands]),
        Or: lambda phi: {phi}.union(*[get_subformulas(operand) for operand in phi.operands]),
        Once: lambda phi: {phi}.union(get_subformulas(phi.argument)),
        Since: lambda phi: {phi}.union(*[get_subformulas(operand) for operand in phi.operands]),
    }[type(phi)](phi)


def val_set(phi: Formula) -> Set[ValAtom_]:
    """Compute the pnf of a formula."""
    return {ValAtom_(sub) for sub in get_subformulas(phi)}


def get_quoted_atom(formula: Formula) -> YesterdayAtom:
    """
    Get the quoted atom from a formula.
    This helper function distinguishes handles the difference between Y(\phi) and \phi1 S \phi2
    For example, for the formula (a S b) we will have a yesterday atom representing "Y(a S b)"
    Differently, for a formula Y(a S b) we will have a yesterday atom representing "Y(a S b)"

    Precondition: the formula either Sice, Once or Before

    :param formula: the formula to be quoted
    :return: the "quoted" atom
    """
    check_(type(formula) in TEMPORAL_TYPES)
    return Yatom_(formula) if type(formula) in {Since, Once} else Yatom_(formula.argument)

def quoted_set(phi: Formula) -> Set[YesterdayAtom]:
    """Compute the pnf of a formula."""
    return {get_quoted_atom(sub) for sub in get_subformulas(phi) if type(sub) in TEMPORAL_TYPES}