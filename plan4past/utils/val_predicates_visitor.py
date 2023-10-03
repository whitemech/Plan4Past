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

"""Value predicates for val predicates visitor."""
import functools
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

from plan4past.helpers.compilation_helper import PredicateMapping
from plan4past.helpers.utils import add_val_prefix


class ValPredicatesVisitor:
    """Visitor for computing value predicates."""

    def __init__(self, predicate_mapping: PredicateMapping):
        """Initialize the visitor."""
        self._predicate_mapping = predicate_mapping

    @functools.singledispatchmethod
    def visit(self, formula: object) -> Set[Predicate]:
        """Compute the value predicate for a formula."""
        raise NotImplementedError(
            f"handler not implemented for object of type {type(formula)}"
        )

    @visit.register
    def val_predicates_binaryop(self, formula: _BinaryOp):
        """Compute the value predicate for a binary operator formula."""
        return set(functools.reduce(set.union, map(self.visit, formula.operands)))  # type: ignore[arg-type]

    @visit.register
    def val_predicates_unaryop(self, formula: _UnaryOp):
        """Compute the value predicate for a unary operator formula."""
        return self.visit(formula.argument)

    @visit.register
    def val_predicates_false(self, formula: PropositionalFalse) -> Set[Predicate]:
        """Compute the value predicate for an atomic formula."""
        predicate = self._predicate_mapping.get_predicate(formula)
        return {Predicate(add_val_prefix(predicate.name))}

    @visit.register
    def val_predicates_true(self, formula: PropositionalTrue) -> Set[Predicate]:
        """Compute the value predicate for an atomic formula."""
        predicate = self._predicate_mapping.get_predicate(formula)
        return {Predicate(add_val_prefix(predicate.name))}

    @visit.register
    def val_predicates_atomic(self, formula: PLTLAtomic) -> Set[Predicate]:
        """Compute the value predicate for an atomic formula."""
        predicate = self._predicate_mapping.get_predicate(formula)
        return {Predicate(add_val_prefix(predicate.name))}

    @visit.register
    def val_predicates_and(self, formula: PLTLAnd) -> Set[Predicate]:
        """Compute the value predicate for an And formula."""
        predicate = self._predicate_mapping.get_predicate(formula)
        value = Predicate(add_val_prefix(predicate.name))
        subands = self.val_predicates_binaryop(formula)
        return {value}.union(subands)

    @visit.register
    def val_predicates_or(self, formula: PLTLOr) -> Set[Predicate]:
        """Compute the value predicate for an Or formula."""
        predicate = self._predicate_mapping.get_predicate(formula)
        value = Predicate(add_val_prefix(predicate.name))
        subors = self.val_predicates_binaryop(formula)
        return {value}.union(subors)

    @visit.register
    def val_predicates_not(self, formula: PLTLNot) -> Set[Predicate]:
        """Compute the value predicate for a Not formula."""
        predicate = self._predicate_mapping.get_predicate(formula)
        value = Predicate(add_val_prefix(predicate.name))
        sub = self.val_predicates_unaryop(formula)
        return sub.union({value})

    @visit.register
    def val_predicates_yesterday(self, formula: Before) -> Set[Predicate]:
        """Compute the value predicate for a Before (Yesterday) formula."""
        predicate = self._predicate_mapping.get_predicate(formula)
        value = Predicate(add_val_prefix(predicate.name))
        sub = self.val_predicates_unaryop(formula)
        return sub.union({value})

    @visit.register
    def val_predicates_since(self, formula: Since) -> Set[Predicate]:
        """Compute the value predicate for a Since formula."""
        if len(formula.operands) != 2:
            head = formula.operands[0]
            tail = Since(*formula.operands[1:])
            return self.visit(Since(head, tail))
        predicate = self._predicate_mapping.get_predicate(formula)
        value = Predicate(add_val_prefix(predicate.name))
        subsinces = self.val_predicates_binaryop(formula)
        return {value}.union(subsinces)

    @visit.register
    def val_predicates_once(self, formula: Once) -> Set[Predicate]:
        """Compute the value predicate for a Once formula."""
        predicate = self._predicate_mapping.get_predicate(formula)
        value = Predicate(add_val_prefix(predicate.name))
        sub = self.val_predicates_unaryop(formula)
        return sub.union({value})
