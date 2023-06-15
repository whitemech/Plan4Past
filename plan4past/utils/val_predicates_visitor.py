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

"""Value predicates for derived predicates visitor."""
import functools
from functools import singledispatch
from typing import Set

from pddl.logic.predicates import Predicate
from pylogics.syntax.base import And as PLTLAnd
from pylogics.syntax.base import Formula
from pylogics.syntax.base import Not as PLTLNot
from pylogics.syntax.base import Or as PLTLOr
from pylogics.syntax.base import _BinaryOp, _UnaryOp
from pylogics.syntax.pltl import Atomic as PLTLAtomic
from pylogics.syntax.pltl import Before, Once, PropositionalTrue, Since
from pylogics.utils.to_string import to_string

from plan4past.helpers.utils import add_val_prefix, replace_symbols


def val_predicates_binaryop(formula: _BinaryOp):
    """Compute the value predicate for a binary operator formula."""
    return set(functools.reduce(set.union, map(val_predicates, formula.operands)))  # type: ignore[arg-type]


def val_predicates_unaryop(formula: _UnaryOp):
    """Compute the value predicate for a unary operator formula."""
    return val_predicates(formula.argument)


@singledispatch
def val_predicates(formula: Formula) -> Set[Predicate]:
    """Compute the value predicate for a formula."""
    raise NotImplementedError(f"handler not implemented for formula {type(formula)}")


@val_predicates.register
def val_predicates_true(_formula: PropositionalTrue) -> Set[Predicate]:
    """Compute the value predicate for a true formula."""
    return {Predicate(add_val_prefix("true"))}


@val_predicates.register
def val_predicates_atomic(formula: PLTLAtomic) -> Set[Predicate]:
    """Compute the value predicate for an atomic formula."""
    return {Predicate(add_val_prefix(formula.name))}


@val_predicates.register
def val_predicates_and(formula: PLTLAnd) -> Set[Predicate]:
    """Compute the value predicate for an And formula."""
    formula_name = replace_symbols(to_string(formula))
    value = Predicate(add_val_prefix(formula_name))
    subands = val_predicates_binaryop(formula)
    return {value}.union(subands)


@val_predicates.register
def val_predicates_or(formula: PLTLOr) -> Set[Predicate]:
    """Compute the value predicate for an Or formula."""
    formula_name = replace_symbols(to_string(formula))
    value = Predicate(add_val_prefix(formula_name))
    subors = val_predicates_binaryop(formula)
    return {value}.union(subors)


@val_predicates.register
def val_predicates_not(formula: PLTLNot) -> Set[Predicate]:
    """Compute the value predicate for a Not formula."""
    formula_name = replace_symbols(to_string(formula))
    value = Predicate(add_val_prefix(formula_name))
    sub = val_predicates_unaryop(formula)
    return sub.union({value})


@val_predicates.register
def val_predicates_before(formula: Before) -> Set[Predicate]:
    """Compute the value predicate for a Before (Yesterday) formula."""
    formula_name = replace_symbols(to_string(formula))
    value = Predicate(add_val_prefix(formula_name))
    sub = val_predicates_unaryop(formula)
    return sub.union({value})


@val_predicates.register
def val_predicates_since(formula: Since) -> Set[Predicate]:
    """Compute the value predicate for a Since formula."""
    if len(formula.operands) != 2:
        head = formula.operands[0]
        tail = Since(*formula.operands[1:])
        return val_predicates(Since(head, tail))
    formula_name = replace_symbols(to_string(formula))
    value = Predicate(add_val_prefix(formula_name))
    subsinces = val_predicates_binaryop(formula)
    return {value}.union(subsinces)


@val_predicates.register
def val_predicates_once(formula: Once) -> Set[Predicate]:
    """Compute the value predicate for a Once formula."""
    formula_name = replace_symbols(to_string(formula))
    value = Predicate(add_val_prefix(formula_name))
    sub = val_predicates_unaryop(formula)
    return sub.union({value})
