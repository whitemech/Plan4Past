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

"""Conditional Effects visitor."""
from functools import singledispatch
from typing import Set, Dict

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

from pddl.logic.base import And
from pddl.logic.effects import When
from pddl.logic.predicates import Predicate
from planning_with_past.helpers.utils import replace_symbols
from planning_with_past.utils.condition_visitor import conditions


@singledispatch
def whens(formula: Formula, atoms_to_fluents: Dict[PLTLAtomic, Predicate]) -> Set[When]:
    raise NotImplementedError("handler not implemented for formula %s" % type(formula))


@whens.register
def whens_tt(
    _formula: PLTLTrue, _atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> Set[When]:
    """Compute the conditional effect for a true formula."""
    condition = conditions(PLTLTrue, _atoms_to_fluents)
    effect = Predicate("tt")
    return {When(condition, effect)}


@whens.register
def whens_ff(
    _formula: PLTLFalse, _atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> Set[When]:
    """Compute the conditional effect for a false formula."""
    condition = conditions(PLTLFalse, _atoms_to_fluents)
    effect = Predicate("ff")
    return {When(condition, effect)}


@whens.register
def whens_atomic(
    formula: PLTLAtomic, atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> Set[When]:
    """Compute the conditional effect for an atomic formula."""
    condition = conditions(formula, atoms_to_fluents)
    effect = Predicate(formula.name)
    return {When(condition, effect)}


@whens.register
def whens_and(
    formula: PLTLAnd, atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> Set[When]:
    """Compute the conditional effect for an And formula."""
    formula_name = to_string(formula)
    condition_ops = [conditions(op, atoms_to_fluents) for op in formula.operands]
    condition = And(*condition_ops)
    effect = Predicate(replace_symbols(formula_name))
    return {When(condition, effect)}


@whens.register
def whens_or(
    formula: PLTLOr, atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> Set[When]:
    """Compute the conditional effect for an Or formula."""
    formula_name = to_string(formula)
    condition_ops = [conditions(op, atoms_to_fluents) for op in formula.operands]
    effect = Predicate(replace_symbols(formula_name))
    return {When(c, effect) for c in condition_ops}


@whens.register
def whens_not(
    formula: PLTLNot, atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> Set[When]:
    """Compute the conditional effect for a Not formula."""
    formula_name = to_string(formula)
    condition = conditions(formula, atoms_to_fluents)
    effect = Predicate(replace_symbols(formula_name))
    return {When(condition, effect)}


@whens.register
def whens_before(
    formula: Before, atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> Set[When]:
    """Compute the conditional effect for a Before formula."""
    formula_name = to_string(formula)
    condition = conditions(formula, atoms_to_fluents)
    effect = Predicate(replace_symbols(formula_name))
    return {When(condition, effect)}


@whens.register
def whens_since(
    formula: Since, atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> Set[When]:
    """Compute the conditional effect for a Since formula."""
    formula_name = to_string(formula)
    conds = conditions(formula, atoms_to_fluents)
    effect = Predicate(replace_symbols(formula_name))
    return {When(c, effect) for c in conds.operands}


@whens.register
def whens_once(
    formula: Once, atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> Set[When]:
    """Compute the conditional effect for a Once formula."""
    formula_name = to_string(formula)
    conds = conditions(formula, atoms_to_fluents)
    effect = Predicate(replace_symbols(formula_name))
    return {When(c, effect) for c in conds.operands}


@whens.register
def whens_historically(
    formula: Historically, atoms_to_fluents: Dict[PLTLAtomic, Predicate]
) -> Set[When]:
    """Compute the conditional effect for a Historically formula."""
    formula_name = to_string(formula)
    conds = conditions(formula, atoms_to_fluents)
    effect = Predicate(replace_symbols(formula_name))
    return {When(c, effect) for c in conds.operands}
