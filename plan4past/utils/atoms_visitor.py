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

"""Find Atoms visitor."""
import functools
from functools import singledispatch
from typing import Set

from pylogics.syntax.base import And as PLTLAnd
from pylogics.syntax.base import Not as PLTLNot
from pylogics.syntax.base import Or as PLTLOr
from pylogics.syntax.base import _BinaryOp, _UnaryOp
from pylogics.syntax.pltl import Atomic as PLTLAtomic
from pylogics.syntax.pltl import Before
from pylogics.syntax.pltl import FalseFormula as PLTLFalse
from pylogics.syntax.pltl import Historically, Once, Since
from pylogics.syntax.pltl import TrueFormula as PLTLTrue


def find_atoms_binaryop(formula: _BinaryOp):
    """Find atoms for a binary operator."""
    return set(functools.reduce(set.union, map(find_atoms, formula.operands)))  # type: ignore[arg-type]


def find_atoms_unaryop(formula: _UnaryOp):
    """Find atoms for a unary operator."""
    return find_atoms(formula.argument)


@singledispatch
def find_atoms(obj: object) -> Set[PLTLAtomic]:
    """Find atoms for a formula."""
    raise ValueError(f"object of type {type(obj)} is not supported by this function")


@find_atoms.register
def find_atoms_true(_formula: PLTLTrue) -> Set[PLTLAtomic]:
    """Find atoms for a true formula."""
    return {PLTLAtomic("true")}


@find_atoms.register
def find_atoms_false(_formula: PLTLFalse) -> Set[PLTLAtomic]:
    """Find atoms for a false formula."""
    return {PLTLAtomic("false")}


@find_atoms.register
def find_atoms_atom(formula: PLTLAtomic) -> Set[PLTLAtomic]:
    """Find atoms for an atomic formula."""
    return {formula}


@find_atoms.register
def find_atoms_and(formula: PLTLAnd) -> Set[PLTLAtomic]:
    """Find atoms for an And formula."""
    return find_atoms_binaryop(formula)


@find_atoms.register
def find_atoms_or(formula: PLTLOr) -> Set[PLTLAtomic]:
    """Find atoms for an Or formula."""
    return find_atoms_binaryop(formula)


@find_atoms.register
def find_atoms_not(formula: PLTLNot) -> Set[PLTLAtomic]:
    """Find atoms for a Not formula."""
    return find_atoms_unaryop(formula)


@find_atoms.register
def find_atoms_before(formula: Before) -> Set[PLTLAtomic]:
    """Find atoms for a Before formula."""
    return find_atoms_unaryop(formula)


@find_atoms.register
def find_atoms_since(formula: Since) -> Set[PLTLAtomic]:
    """Find atoms for a Since formula."""
    return find_atoms_binaryop(formula)


@find_atoms.register
def find_atoms_once(formula: Once) -> Set[PLTLAtomic]:
    """Find atoms for a Once formula."""
    return find_atoms_unaryop(formula)


@find_atoms.register
def find_atoms_historically(formula: Historically) -> Set[PLTLAtomic]:
    """Find atoms for a Historically formula."""
    return find_atoms_unaryop(formula)
