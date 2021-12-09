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

"""Predicates visitor."""
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
from pylogics.syntax.pltl import Before, Historically, Once, Since
from pylogics.utils.to_string import to_string

from planning_with_past.helpers.utils import replace_symbols


def predicates_binaryop(f: _BinaryOp):
    return set(functools.reduce(set.union, map(predicates, f.operands)))


def predicates_unaryop(f: _UnaryOp):
    return predicates(f.argument)


@singledispatch
def predicates(formula: Formula) -> Set[Predicate]:
    raise NotImplementedError("handler not implemented for formula %s" % type(formula))


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
def predicates_not(_formula: PLTLNot) -> Set[Predicate]:
    """Compute predicate for a Not formula."""
    return set()


@predicates.register
def predicates_before(formula: Before) -> Set[Predicate]:
    """Compute predicate for a Before (Yesterday) formula."""
    quoted = Predicate(replace_symbols(to_string(formula.argument)))
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
    quoted = Predicate(formula_name)
    subsinces = predicates_binaryop(formula)
    return {quoted}.union(subsinces)


@predicates.register
def predicates_once(formula: Once) -> Set[Predicate]:
    """Compute predicate for a Once formula."""
    formula_name = replace_symbols(to_string(formula))
    quoted = Predicate(formula_name)
    sub = predicates_unaryop(formula)
    return sub.union({quoted})


@predicates.register
def predicates_historically(formula: Historically) -> Set[Predicate]:
    """Compute predicate for a Historically formula."""
    quoted = Predicate(f"Onot-{to_string(formula.argument)}")
    sub = predicates_unaryop(formula)
    return sub.union(
        {
            quoted,
        }
    )
