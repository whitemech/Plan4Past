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
from typing import Dict, Set

from pddl.logic.base import And, Not, Or
from pddl.logic.predicates import DerivedPredicate, Predicate
from pylogics.syntax.base import And as PLTLAnd
from pylogics.syntax.base import Formula
from pylogics.syntax.base import Not as PLTLNot
from pylogics.syntax.base import Or as PLTLOr
from pylogics.syntax.pltl import Atomic as PLTLAtomic
from pylogics.syntax.pltl import Before
from pylogics.syntax.pltl import FalseFormula as PLTLFalse
from pylogics.syntax.pltl import Historically, Once, Since
from pylogics.syntax.pltl import TrueFormula as PLTLTrue
from pylogics.utils.to_string import to_string

from planning_with_past.helpers.utils import add_prime_prefix, replace_symbols


@singledispatch
def derived_predicates(
    formula: Formula, atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> Set[DerivedPredicate]:
    raise NotImplementedError("handler not implemented for formula %s" % type(formula))


@derived_predicates.register
def derived_predicates_tt(
    _formula: PLTLTrue, _atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a true formula."""
    prime = Predicate(add_prime_prefix("tt"))
    condition = Predicate("top")
    return {DerivedPredicate(prime, condition)}


@derived_predicates.register
def derived_predicates_ff(
    _formula: PLTLFalse, _atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a false formula."""
    prime = Predicate(add_prime_prefix("ff"))
    condition = Not(Predicate("top"))
    return {DerivedPredicate(prime, condition)}


@derived_predicates.register
def derived_predicates_atomic(
    formula: PLTLAtomic, atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> Set[DerivedPredicate]:
    """Compute the derived predicate for an atomic formula."""
    prime = Predicate(add_prime_prefix(formula.name))
    # condition = Predicate(formula.name.replace('"', ""))
    condition = atoms_to_fluents[formula]
    return {DerivedPredicate(prime, condition)}


@derived_predicates.register
def derived_predicates_and(
    formula: PLTLAnd, atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a PLTL And formula."""
    formula_name = to_string(formula)
    prime = Predicate(add_prime_prefix(replace_symbols(formula_name)))
    prime_ops = [
        Predicate(add_prime_prefix(replace_symbols(to_string(op))))
        for op in formula.operands
    ]
    condition = And(*prime_ops)
    der_pred_ops = [derived_predicates(op, atoms_to_fluents) for op in formula.operands]
    return {DerivedPredicate(prime, condition)}.union(*der_pred_ops)


@derived_predicates.register
def derived_predicates_or(
    formula: PLTLOr, atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a PLTL Or formula."""
    formula_name = to_string(formula)
    prime = Predicate(add_prime_prefix(replace_symbols(formula_name)))
    prime_ops = [Predicate(add_prime_prefix(to_string(op))) for op in formula.operands]
    condition = Or(*prime_ops)
    der_pred_ops = [derived_predicates(op, atoms_to_fluents) for op in formula.operands]
    return {DerivedPredicate(prime, condition)}.union(*der_pred_ops)


@derived_predicates.register
def derived_predicates_not(
    formula: PLTLNot, atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a PLTL Not formula."""
    formula_name = to_string(formula)
    prime = Predicate(add_prime_prefix(replace_symbols(formula_name)))
    condition = Not(
        Predicate(add_prime_prefix(replace_symbols(to_string(formula.argument))))
    )
    der_pred_arg = derived_predicates(formula.argument, atoms_to_fluents)
    return {DerivedPredicate(prime, condition)}.union(der_pred_arg)


@derived_predicates.register
def derived_predicates_before(
    formula: Before, atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a Before formula."""
    formula_name = to_string(formula)
    prime = Predicate(add_prime_prefix(replace_symbols(formula_name)))
    condition = And(
        Predicate(replace_symbols(to_string(formula.argument))), Predicate("Ott")
    )
    der_pred_arg = derived_predicates(formula.argument, atoms_to_fluents)
    return {DerivedPredicate(prime, condition)}.union(der_pred_arg)


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
    der_pred_ops = [derived_predicates(op, atoms_to_fluents) for op in formula.operands]
    return {DerivedPredicate(prime, condition)}.union(*der_pred_ops)


@derived_predicates.register
def derived_predicates_once(
    formula: Once, atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> Set[DerivedPredicate]:
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
    der_pred_arg = derived_predicates(formula.argument, atoms_to_fluents)
    return {DerivedPredicate(prime, condition)}.union(der_pred_arg)


@derived_predicates.register
def derived_predicates_historically(
    formula: Historically, atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> Set[DerivedPredicate]:
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
    der_pred_arg = derived_predicates(formula.argument, atoms_to_fluents)
    return {DerivedPredicate(prime, condition)}.union(der_pred_arg)
