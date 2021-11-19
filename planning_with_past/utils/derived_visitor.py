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

"""Derived Predicates visitor."""
from functools import singledispatch
from typing import Set

from pylogics.syntax.base import (
    Formula,
    And as PLTLAnd,
    Or as PLTLOr,
    Not as PLTLNot,
)
from pylogics.syntax.pltl import (
    Atomic as PLTLAtomic,
    TrueFormula as PLTLTrue,
    FalseFormula as PLTLFalse,
    Before,
    Since,
    Once,
    Historically,
)
from pylogics.utils.to_string import to_string

from pddl.logic.base import Not, And, Or
from pddl.logic.predicates import DerivedPredicate, Predicate
from planning_with_past.helpers.utils import add_prime_prefix, replace_symbols


@singledispatch
def derived_predicates(formula: Formula) -> Set[DerivedPredicate]:
    raise NotImplementedError("handler not implemented for formula %s" % type(formula))


@derived_predicates.register
def derived_predicates_tt(_formula: PLTLTrue) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a true formula."""
    prime = Predicate(add_prime_prefix("tt"))
    condition = Predicate("top")
    return {DerivedPredicate(prime, condition)}


@derived_predicates.register
def derived_predicates_ff(_formula: PLTLFalse) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a false formula."""
    prime = Predicate(add_prime_prefix("ff"))
    condition = Not(Predicate("top"))
    return {DerivedPredicate(prime, condition)}


@derived_predicates.register
def derived_predicates_atomic(formula: PLTLAtomic) -> Set[DerivedPredicate]:
    """Compute the derived predicate for an atomic formula."""
    prime = Predicate(add_prime_prefix(formula.name))
    condition = Predicate(formula.name.replace('"',""))
    # TODO
    return {DerivedPredicate(prime, condition)}


@derived_predicates.register
def derived_predicates_and(formula: PLTLAnd) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a PLTL And formula."""
    formula_name = to_string(formula)
    prime = Predicate(add_prime_prefix(replace_symbols(formula_name)))
    prime_ops = [Predicate(add_prime_prefix(replace_symbols(to_string(op)))) for op in formula.operands]
    condition = And(*prime_ops)
    der_pred_ops = [derived_predicates(op) for op in formula.operands]
    return {DerivedPredicate(prime, condition)}.union(*der_pred_ops)


@derived_predicates.register
def derived_predicates_or(formula: PLTLOr) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a PLTL Or formula."""
    formula_name = to_string(formula)
    prime = Predicate(add_prime_prefix(replace_symbols(formula_name)))
    prime_ops = [Predicate(add_prime_prefix(to_string(op))) for op in formula.operands]
    condition = Or(*prime_ops)
    der_pred_ops = [derived_predicates(op) for op in formula.operands]
    return {DerivedPredicate(prime, condition)}.union(*der_pred_ops)


@derived_predicates.register
def derived_predicates_not(formula: PLTLNot) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a PLTL Not formula."""
    formula_name = to_string(formula)
    prime = Predicate(add_prime_prefix(replace_symbols(formula_name)))
    condition = Not(
        Predicate(add_prime_prefix(replace_symbols(to_string(formula.argument))))
    )
    der_pred_arg = derived_predicates(formula.argument)
    return {DerivedPredicate(prime, condition)}.union(der_pred_arg)


@derived_predicates.register
def derived_predicates_before(formula: Before) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a Before formula."""
    formula_name = to_string(formula)
    prime = Predicate(add_prime_prefix(replace_symbols(formula_name)))
    condition = And(
        Predicate(replace_symbols(to_string(formula.argument))), Predicate("Ott")
    )
    return {DerivedPredicate(prime, condition)}


@derived_predicates.register
def derived_predicates_since(formula: Since) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a Since formula."""
    if len(formula.operands) != 2:
        head = formula.operands[0]
        tail = Since(*formula.operands[1:])
        return derived_predicates(Since(head, tail))
    formula_name = to_string(formula)
    prime = Predicate(add_prime_prefix(replace_symbols(formula_name)))
    op_or_1 = Predicate(
        add_prime_prefix(replace_symbols(to_string(formula.operands[1])))
    )
    op_or_2 = And(
        Predicate(add_prime_prefix(replace_symbols(to_string(formula.operands[0])))),
        Predicate(replace_symbols(to_string(formula))),
        Predicate("Ott"),
    )
    condition = Or(op_or_1, op_or_2)
    der_pred_ops = [derived_predicates(op) for op in formula.operands]
    return {DerivedPredicate(prime, condition)}.union(*der_pred_ops)


@derived_predicates.register
def derived_predicates_once(formula: Once) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a Once formula."""
    formula_name = to_string(formula)
    prime = Predicate(add_prime_prefix(replace_symbols(formula_name)))
    condition = Or(
        Predicate(add_prime_prefix(replace_symbols(to_string(formula.argument)))),
        And(
            Predicate(f"O{replace_symbols(to_string(formula.argument))}"),
            Predicate("Ott"),
        ),
    )
    der_pred_arg = derived_predicates(formula.argument)
    return {DerivedPredicate(prime, condition)}.union(der_pred_arg)


@derived_predicates.register
def derived_predicates_historically(formula: Historically) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a Historically formula."""
    formula_name = to_string(formula)
    prime = Predicate(add_prime_prefix(replace_symbols(formula_name)))
    condition = And(
        Predicate(add_prime_prefix(replace_symbols(to_string(formula.argument)))),
        Or(
            Not(Predicate(f"Onot-{replace_symbols(to_string(formula.argument))}")),
            Not(Predicate("Ott")),
        ),
    )
    der_pred_arg = derived_predicates(formula.argument)
    return {DerivedPredicate(prime, condition)}.union(der_pred_arg)
