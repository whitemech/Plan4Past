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

"""Predicates visitor."""
import functools
from functools import singledispatch
from typing import Set

from pddl.logic.predicates import Predicate
from pylogics.syntax.base import And as PLTLAnd
from pylogics.syntax.base import Not as PLTLNot
from pylogics.syntax.base import Or as PLTLOr
from pylogics.syntax.base import _BinaryOp, _UnaryOp
from pylogics.syntax.pltl import Atomic as PLTLAtomic
from pylogics.syntax.pltl import (
    Before,
    Once,
    PropositionalFalse,
    PropositionalTrue,
    Since,
)
from pylogics.utils.to_string import to_string

from plan4past.helpers.utils import replace_symbols


def predicates_binaryop(formula: _BinaryOp):
    """Compute predicate for a binary operator."""
    return set(functools.reduce(set.union, map(predicates, formula.operands)))  # type: ignore[arg-type]


def predicates_unaryop(formula: _UnaryOp):
    """Compute predicate for a unary operator."""
    return predicates(formula.argument)


@singledispatch
def predicates(formula: object) -> Set[Predicate]:
    """Compute predicate for a formula."""
    raise NotImplementedError(
        f"handler not implemented for object of type {type(formula)}"
    )


@predicates.register
def predicates_true(_formula: PropositionalTrue) -> Set[Predicate]:
    """Compute predicate for a true formula."""
    return set()


@predicates.register
def predicates_false(_formula: PropositionalFalse) -> Set[Predicate]:
    """Compute predicate for a false formula."""
    return set()


@predicates.register
def predicates_atomic(_formula: PLTLAtomic) -> Set[Predicate]:
    """Compute predicate for an atomic formula."""
    return set()


@predicates.register
def predicates_and(formula: PLTLAnd) -> Set[Predicate]:
    """Compute predicate for an And formula."""
    return predicates_binaryop(formula)


@predicates.register
def predicates_or(formula: PLTLOr) -> Set[Predicate]:
    """Compute predicate for an Or formula."""
    return predicates_binaryop(formula)


@predicates.register
def predicates_not(formula: PLTLNot) -> Set[Predicate]:
    """Compute predicate for a Not formula."""
    return predicates(formula.argument)


@predicates.register
def predicates_before(formula: Before) -> Set[Predicate]:
    """Compute predicate for a Before (Yesterday) formula."""
    quoted = Predicate(replace_symbols(to_string(formula)))
    sub = predicates_unaryop(formula)
    return sub.union({quoted})


@predicates.register
def predicates_since(formula: Since) -> Set[Predicate]:
    """Compute predicate for a Since formula."""
    if len(formula.operands) != 2:
        head = formula.operands[0]
        tail = Since(*formula.operands[1:])
        return predicates(Since(head, tail))
    formula_name = replace_symbols(to_string(formula))
    quoted = Predicate(f"Y-{formula_name}")
    subsinces = predicates_binaryop(formula)
    return {quoted}.union(subsinces)


@predicates.register
def predicates_once(formula: Once) -> Set[Predicate]:
    """Compute predicate for a Once formula."""
    formula_name = replace_symbols(to_string(formula))
    quoted = Predicate(f"Y-{formula_name}")
    sub = predicates_unaryop(formula)
    return sub.union({quoted})
