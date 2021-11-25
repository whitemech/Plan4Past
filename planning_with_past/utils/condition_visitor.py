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

"""Condition visitor for Conditional Effects."""
from functools import singledispatch
from typing import Dict

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

from pddl.logic.base import Not, And, Or, Formula as PDDLFormula
from pddl.logic.predicates import Predicate
from planning_with_past.helpers.utils import replace_symbols


@singledispatch
def conditions(
    formula: Formula, atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> PDDLFormula:
    raise NotImplementedError("handler not implemented for formula %s" % type(formula))


@conditions.register
def conditions_tt(
    _formula: PLTLTrue, _atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> PDDLFormula:
    """Compute the conditions of a true formula."""
    return Predicate("top")


@conditions.register
def conditions_ff(
    _formula: PLTLFalse, _atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> PDDLFormula:
    """Compute the conditions of a true formula."""
    return ~Predicate("top")


@conditions.register
def conditions_atomic(
    formula: PLTLAtomic, atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> PDDLFormula:
    """Compute the conditions of an atomic formula."""
    return atoms_to_fluents[formula]


@conditions.register
def conditions_and(
    formula: PLTLAnd, atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> PDDLFormula:
    """Compute the conditions of an And formula."""
    cond_ops = [conditions(op, atoms_to_fluents) for op in formula.operands]
    return And(*cond_ops)


@conditions.register
def conditions_and(
    formula: PLTLAnd, atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> PDDLFormula:
    """Compute the conditions of an And formula."""
    cond_ops = [conditions(op, atoms_to_fluents) for op in formula.operands]
    return And(*cond_ops)


@conditions.register
def conditions_or(
    formula: PLTLOr, atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> PDDLFormula:
    """Compute the conditions of an Or formula."""
    cond_ops = [conditions(op, atoms_to_fluents) for op in formula.operands]
    return Or(*cond_ops)


@conditions.register
def conditions_not(
    formula: PLTLNot, atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> PDDLFormula:
    """Compute the conditions of a Not formula."""
    return Not(conditions(formula.argument, atoms_to_fluents))


@conditions.register
def conditions_before(
    formula: Before, atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> PDDLFormula:
    """Compute the conditions of a Before formula."""
    return And(Predicate(replace_symbols(to_string(formula))), Predicate("Ott"))


@conditions.register
def conditions_since(
    formula: Since, atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> PDDLFormula:
    """Compute the conditions of a Since formula."""
    formula_name = to_string(formula)
    if len(formula.operands) != 2:
        head = formula.operands[0]
        tail = Since(*formula.operands[1:])
        return conditions(Since(head, tail), atoms_to_fluents)
    op_or_1 = conditions(formula.operands[1], atoms_to_fluents)
    op_or_2 = And(
        conditions(formula.operands[0], atoms_to_fluents),
        Predicate(replace_symbols(formula_name)),
        Predicate("Ott"),
    )
    return Or(op_or_1, op_or_2)


@conditions.register
def conditions_once(
    formula: Once, atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> PDDLFormula:
    """Compute the conditions of a Once formula."""
    formula_name = to_string(formula)
    cond_op_1 = conditions(formula.argument, atoms_to_fluents)
    cond_op_2 = And(Predicate(replace_symbols(formula_name)), Predicate("Ott"))
    return Or(cond_op_1, cond_op_2)


@conditions.register
def conditions_historically(
    formula: Historically, atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> PDDLFormula:
    """Compute the conditions of a Historically formula."""
    op_1 = conditions(formula.argument, atoms_to_fluents)
    op_2 = Not(Predicate(f"Onot-{replace_symbols(to_string(formula.argument))}"))
    op_3 = Predicate("Ott")
    cond_op_1 = And(op_1, op_2)
    cond_op_2 = And(op_1, op_3)
    return Or(cond_op_1, cond_op_2)
