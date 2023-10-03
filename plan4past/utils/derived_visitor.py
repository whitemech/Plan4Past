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

"""Derived Predicates visitor."""
import functools
from typing import Dict, Set

from pddl.logic.base import And, Not, Or
from pddl.logic.predicates import DerivedPredicate, Predicate
from pylogics.syntax.base import And as PLTLAnd
from pylogics.syntax.base import Not as PLTLNot
from pylogics.syntax.base import Or as PLTLOr
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


class DerivedPredicatesVisitor:
    """Visitor for computing derived predicates."""

    def __init__(
        self,
        predicate_mapping: PredicateMapping,
        from_atoms_to_fluent: Dict[PLTLAtomic, Predicate],
    ):
        """Initialize the visitor."""
        self._predicate_mapping = predicate_mapping
        self._from_atoms_to_fluent = from_atoms_to_fluent

    @functools.singledispatchmethod
    def visit(self, formula: object) -> Set[Predicate]:
        """Compute the value predicate for a formula."""
        raise NotImplementedError(
            f"handler not implemented for object of type {type(formula)}"
        )

    @visit.register
    def derived_predicates_true(
        self,
        _formula: PropositionalTrue,
    ) -> Set[DerivedPredicate]:
        """Compute the derived predicate for a true formula."""
        predicate = self._predicate_mapping.get_predicate(_formula)
        val = Predicate(add_val_prefix(predicate.name))
        return {DerivedPredicate(val, And())}

    @visit.register
    def derived_predicates_false(
        self,
        _formula: PropositionalFalse,
    ) -> Set[DerivedPredicate]:
        """Compute the derived predicate for a false formula."""
        predicate = self._predicate_mapping.get_predicate(_formula)
        val = Predicate(add_val_prefix(predicate.name))
        return {DerivedPredicate(val, Or())}

    @visit.register
    def derived_predicates_atomic(self, formula: PLTLAtomic) -> Set[DerivedPredicate]:
        """Compute the derived predicate for an atomic formula."""
        predicate = self._predicate_mapping.get_predicate(formula)
        val = Predicate(add_val_prefix(predicate.name))
        condition = self._from_atoms_to_fluent[formula]
        return {DerivedPredicate(val, condition)}

    @visit.register
    def derived_predicates_and(self, formula: PLTLAnd) -> Set[DerivedPredicate]:
        """Compute the derived predicate for a PPLTL And formula."""
        predicate = self._predicate_mapping.get_predicate(formula)
        val = Predicate(add_val_prefix(predicate.name))
        val_ops = [
            Predicate(add_val_prefix(self._predicate_mapping.get_predicate(op).name))
            for op in formula.operands
        ]
        condition = And(*val_ops)
        der_pred_ops = [self.visit(op) for op in formula.operands]
        return {DerivedPredicate(val, condition)}.union(*der_pred_ops)

    @visit.register
    def derived_predicates_or(self, formula: PLTLOr) -> Set[DerivedPredicate]:
        """Compute the derived predicate for a PPLTL Or formula."""
        predicate = self._predicate_mapping.get_predicate(formula)
        val = Predicate(add_val_prefix(predicate.name))
        val_ops = [
            Predicate(add_val_prefix(self._predicate_mapping.get_predicate(op).name))
            for op in formula.operands
        ]
        condition = Or(*val_ops)
        der_pred_ops = [self.visit(op) for op in formula.operands]
        return {DerivedPredicate(val, condition)}.union(*der_pred_ops)

    @visit.register
    def derived_predicates_not(self, formula: PLTLNot) -> Set[DerivedPredicate]:
        """Compute the derived predicate for a PPLTL Not formula."""
        predicate = self._predicate_mapping.get_predicate(formula)
        val = Predicate(add_val_prefix(predicate.name))
        condition = Not(
            Predicate(
                add_val_prefix(
                    self._predicate_mapping.get_predicate(formula.argument).name
                )
            )
        )
        der_pred_arg = self.visit(formula.argument)
        return {DerivedPredicate(val, condition)}.union(der_pred_arg)

    @visit.register
    def derived_predicates_yesterday(self, formula: Before) -> Set[DerivedPredicate]:
        """Compute the derived predicate for a Before formula."""
        predicate = self._predicate_mapping.get_predicate(formula)
        val = Predicate(add_val_prefix(predicate.name))
        condition = predicate
        der_pred_arg = self.visit(formula.argument)
        return {DerivedPredicate(val, condition)}.union(der_pred_arg)

    @visit.register
    def derived_predicates_since(self, formula: Since) -> Set[DerivedPredicate]:
        """Compute the derived predicate for a Since formula."""
        if len(formula.operands) != 2:  # pylint: disable=R0801
            head = formula.operands[0]
            tail = Since(*formula.operands[1:])
            return self.visit(Since(head, tail))
        predicate = self._predicate_mapping.get_predicate(formula)
        val = Predicate(add_val_prefix(predicate.name))
        op_or_1_predicate = self._predicate_mapping.get_predicate(formula.operands[1])
        op_or_1 = Predicate(add_val_prefix(op_or_1_predicate.name))
        op_or_2_predicate = self._predicate_mapping.get_predicate(formula.operands[0])
        op_or_2 = And(
            Predicate(add_val_prefix(op_or_2_predicate.name)),
            Predicate(f"Y-{predicate.name}"),
        )
        condition = Or(op_or_1, op_or_2)
        der_pred_ops = [self.visit(op) for op in formula.operands]
        return {DerivedPredicate(val, condition)}.union(*der_pred_ops)

    @visit.register
    def derived_predicates_once(self, formula: Once) -> Set[DerivedPredicate]:
        """Compute the derived predicate for a Once formula."""
        predicate = self._predicate_mapping.get_predicate(formula)
        val = Predicate(add_val_prefix(predicate.name))
        arg_predicate = self._predicate_mapping.get_predicate(formula.argument)
        condition = Or(
            Predicate(add_val_prefix(arg_predicate.name)),
            Predicate(f"Y-{predicate.name}"),
        )
        der_pred_arg = self.visit(formula.argument)
        return {DerivedPredicate(val, condition)}.union(der_pred_arg)
