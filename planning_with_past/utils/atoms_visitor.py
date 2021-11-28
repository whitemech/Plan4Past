# -*- coding: utf-8 -*-
#
# Copyright 2021 Francesco Fuggitti, Marco Favorito
#
# ------------------------------
#
# This file is part of planning-with-past.
#
# planning-with-past is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# planning-with-past is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with planning-with-past.  If not, see <https://www.gnu.org/licenses/>.
#

"""Find Atoms visitor."""
import functools
from functools import singledispatch
from typing import Set

from pylogics.syntax.base import And as PLTLAnd
from pylogics.syntax.base import Formula
from pylogics.syntax.base import Not as PLTLNot
from pylogics.syntax.base import Or as PLTLOr
from pylogics.syntax.base import _BinaryOp, _UnaryOp
from pylogics.syntax.pltl import Atomic as PLTLAtomic
from pylogics.syntax.pltl import Before
from pylogics.syntax.pltl import FalseFormula as PLTLFalse
from pylogics.syntax.pltl import Historically, Once, Since
from pylogics.syntax.pltl import TrueFormula as PLTLTrue


def find_atoms_binaryop(f: _BinaryOp):
    return set(functools.reduce(set.union, map(find_atoms, f.operands)))


def find_atoms_unaryop(f: _UnaryOp):
    return find_atoms(f.argument)


@singledispatch
def find_atoms(_formula: Formula) -> Set[PLTLAtomic]:
    return set()


@find_atoms.register
def find_atoms_tt(_formula: PLTLTrue) -> Set[PLTLAtomic]:
    """Find atoms for a true formula."""
    return {PLTLAtomic("tt")}


@find_atoms.register
def find_atoms_ff(_formula: PLTLFalse) -> Set[PLTLAtomic]:
    """Find atoms for a false formula."""
    return {PLTLAtomic("ff")}


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
