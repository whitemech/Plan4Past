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
from functools import singledispatch
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
from pylogics.utils.to_string import to_string

from plan4past.helpers.utils import add_val_prefix, replace_symbols


@singledispatch
def derived_predicates(
    formula: object, atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a formula."""
    raise NotImplementedError(f"handler not implemented for object {type(formula)}")


@derived_predicates.register
def derived_predicates_true(
    _formula: PropositionalTrue, _atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a true formula."""
    val = Predicate(add_val_prefix("true"))
    return {DerivedPredicate(val, And())}


@derived_predicates.register
def derived_predicates_false(
    _formula: PropositionalFalse, _atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a false formula."""
    val = Predicate(add_val_prefix("false"))
    return {DerivedPredicate(val, Or())}


@derived_predicates.register
def derived_predicates_atomic(
    formula: PLTLAtomic, atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> Set[DerivedPredicate]:
    """Compute the derived predicate for an atomic formula."""
    val = Predicate(add_val_prefix(formula.name))
    condition = atoms_to_fluents[formula]
    return {DerivedPredicate(val, condition)}


@derived_predicates.register
def derived_predicates_and(
    formula: PLTLAnd, atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a PPLTL And formula."""
    formula_name = to_string(formula)
    val = Predicate(add_val_prefix(replace_symbols(formula_name)))
    val_ops = [
        Predicate(add_val_prefix(replace_symbols(to_string(op))))
        for op in formula.operands
    ]
    condition = And(*val_ops)
    der_pred_ops = [derived_predicates(op, atoms_to_fluents) for op in formula.operands]
    return {DerivedPredicate(val, condition)}.union(*der_pred_ops)


@derived_predicates.register
def derived_predicates_or(
    formula: PLTLOr, atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a PPLTL Or formula."""
    formula_name = to_string(formula)
    val = Predicate(add_val_prefix(replace_symbols(formula_name)))
    val_ops = [
        Predicate(add_val_prefix(replace_symbols(to_string(op))))
        for op in formula.operands
    ]
    condition = Or(*val_ops)
    der_pred_ops = [derived_predicates(op, atoms_to_fluents) for op in formula.operands]
    return {DerivedPredicate(val, condition)}.union(*der_pred_ops)


@derived_predicates.register
def derived_predicates_not(
    formula: PLTLNot, atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a PPLTL Not formula."""
    formula_name = to_string(formula)
    val = Predicate(add_val_prefix(replace_symbols(formula_name)))
    condition = Not(
        Predicate(add_val_prefix(replace_symbols(to_string(formula.argument))))
    )
    der_pred_arg = derived_predicates(formula.argument, atoms_to_fluents)
    return {DerivedPredicate(val, condition)}.union(der_pred_arg)


@derived_predicates.register
def derived_predicates_yesterday(
    formula: Before, atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a Before formula."""
    formula_name = to_string(formula)
    val = Predicate(add_val_prefix(replace_symbols(formula_name)))
    condition = Predicate(replace_symbols(to_string(formula)))
    der_pred_arg = derived_predicates(formula.argument, atoms_to_fluents)
    return {DerivedPredicate(val, condition)}.union(der_pred_arg)


@derived_predicates.register
def derived_predicates_since(
    formula: Since, atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a Since formula."""
    if len(formula.operands) != 2:
        head = formula.operands[0]
        tail = Since(*formula.operands[1:])
        return derived_predicates(Since(head, tail), atoms_to_fluents)
    formula_name = to_string(formula)
    val = Predicate(add_val_prefix(replace_symbols(formula_name)))
    op_or_1 = Predicate(add_val_prefix(replace_symbols(to_string(formula.operands[1]))))
    op_or_2 = And(
        Predicate(add_val_prefix(replace_symbols(to_string(formula.operands[0])))),
        Predicate(f"Y-{replace_symbols(to_string(formula))}"),
    )
    condition = Or(op_or_1, op_or_2)
    der_pred_ops = [derived_predicates(op, atoms_to_fluents) for op in formula.operands]
    return {DerivedPredicate(val, condition)}.union(*der_pred_ops)


@derived_predicates.register
def derived_predicates_once(
    formula: Once, atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a Once formula."""
    formula_name = to_string(formula)
    val = Predicate(add_val_prefix(replace_symbols(formula_name)))
    condition = Or(
        Predicate(add_val_prefix(replace_symbols(to_string(formula.argument)))),
        Predicate(f"Y-{replace_symbols(to_string(formula))}"),
    )
    der_pred_arg = derived_predicates(formula.argument, atoms_to_fluents)
    return {DerivedPredicate(val, condition)}.union(der_pred_arg)
