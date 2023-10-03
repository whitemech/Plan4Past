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


class PredicatesVisitor:  # pylint: disable=R0801
    """Visitor for computing predicates."""

    def __init__(self, predicate_mapping: PredicateMapping) -> None:
        """Initialize the visitor."""
        self._predicate_mapping = predicate_mapping

    @functools.singledispatchmethod
    def visit(self, formula: object) -> Set[Predicate]:
        """Compute predicate for a formula."""
        raise NotImplementedError(
            f"handler not implemented for object of type {type(formula)}"
        )

    def predicates_binaryop(self, formula: _BinaryOp):
        """Compute predicate for a binary operator."""
        return set(functools.reduce(set.union, map(self.visit, formula.operands)))  # type: ignore[arg-type]

    def predicates_unaryop(self, formula: _UnaryOp):
        """Compute predicate for a unary operator."""
        return self.visit(formula.argument)

    @visit.register
    def predicates_true(self, _formula: PropositionalTrue) -> Set[Predicate]:
        """Compute predicate for a true formula."""
        return set()

    @visit.register
    def predicates_false(self, _formula: PropositionalFalse) -> Set[Predicate]:
        """Compute predicate for a false formula."""
        return set()

    @visit.register
    def predicates_atomic(self, _formula: PLTLAtomic) -> Set[Predicate]:
        """Compute predicate for an atomic formula."""
        return set()

    @visit.register
    def predicates_and(self, formula: PLTLAnd) -> Set[Predicate]:
        """Compute predicate for an And formula."""
        return self.predicates_binaryop(formula)

    @visit.register
    def predicates_or(self, formula: PLTLOr) -> Set[Predicate]:
        """Compute predicate for an Or formula."""
        return self.predicates_binaryop(formula)

    @visit.register
    def predicates_not(self, formula: PLTLNot) -> Set[Predicate]:
        """Compute predicate for a Not formula."""
        return self.visit(formula.argument)

    @visit.register
    def predicates_yesterday(self, formula: Before) -> Set[Predicate]:
        """Compute predicate for a Before (Yesterday) formula."""
        quoted = self._predicate_mapping.get_predicate(formula)
        sub = self.predicates_unaryop(formula)
        return sub.union({quoted})

    @visit.register
    def predicates_since(
        self, formula: Since
    ) -> Set[Predicate]:  # pylint: disable=R0801
        """Compute predicate for a Since formula."""
        if len(formula.operands) != 2:
            head = formula.operands[0]
            tail = Since(*formula.operands[1:])
            return self.visit(Since(head, tail))
        yesterday_predicate = self._predicate_mapping.get_predicate(Before(formula))
        quoted = Predicate(yesterday_predicate.name)
        subsinces = self.predicates_binaryop(formula)
        return {quoted}.union(subsinces)

    @visit.register
    def predicates_once(self, formula: Once) -> Set[Predicate]:
        """Compute predicate for a Once formula."""
        yesterday_predicate = self._predicate_mapping.get_predicate(Before(formula))
        quoted = Predicate(yesterday_predicate.name)
        sub = self.predicates_unaryop(formula)
        return sub.union({quoted})
