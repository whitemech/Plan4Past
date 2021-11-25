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

from pddl.logic.predicates import Predicate
from planning_with_past.helpers.utils import replace_symbols, add_prime_prefix


@singledispatch
def predicates(formula: Formula) -> Set[Predicate]:
    raise NotImplementedError("handler not implemented for formula %s" % type(formula))


@predicates.register
def predicates_tt(_formula: PLTLTrue) -> Set[Predicate]:
    """Compute the predicates for a true formula."""
    prime = Predicate(add_prime_prefix("tt"))
    non_prime = Predicate("tt")
    return {prime, non_prime}


@predicates.register
def predicates_ff(_formula: PLTLFalse) -> Set[Predicate]:
    """Compute the predicates for a true formula."""
    prime = Predicate(add_prime_prefix("ff"))
    non_prime = Predicate("ff")
    return {prime, non_prime}


@predicates.register
def predicates_atomic(formula: PLTLAtomic) -> Set[Predicate]:
    """Compute predicate for an atomic formula."""
    prime = Predicate(add_prime_prefix(formula.name))
    non_prime = Predicate(formula.name.replace('"', ""))
    return {prime, non_prime}


@predicates.register
def predicates_and(formula: PLTLAnd) -> Set[Predicate]:
    """Compute predicate for an And formula."""
    formula_name = replace_symbols(to_string(formula))
    prime = Predicate(add_prime_prefix(formula_name))
    non_prime = Predicate(formula_name)
    subands = [predicates(f_predicates) for f_predicates in formula.operands]
    return set.union({prime, non_prime}, *subands)


@predicates.register
def predicates_or(formula: PLTLOr) -> Set[Predicate]:
    """Compute predicate for an Or formula."""
    formula_name = replace_symbols(to_string(formula))
    prime = Predicate(add_prime_prefix(formula_name))
    non_prime = Predicate(formula_name)
    subors = [predicates(f_predicates) for f_predicates in formula.operands]
    return set.union({prime, non_prime}, *subors)


@predicates.register
def predicates_not(formula: PLTLNot) -> Set[Predicate]:
    """Compute predicate for a Not formula."""
    formula_name = replace_symbols(to_string(formula))
    prime = Predicate(add_prime_prefix(formula_name))
    non_prime = Predicate(formula_name)
    sub = predicates(formula.argument)
    return sub.union({prime, non_prime})


@predicates.register
def predicates_before(formula: Before) -> Set[Predicate]:
    """Compute predicate for a Before (Yesterday) formula."""
    formula_name = replace_symbols(to_string(formula))
    prime = Predicate(add_prime_prefix(formula_name))
    non_prime = Predicate(formula_name)
    sub = predicates(formula.argument)
    return sub.union({prime, non_prime})


@predicates.register
def predicates_since(formula: Since) -> Set[Predicate]:
    """Compute predicate for a Since formula."""
    if len(formula.operands) != 2:
        head = formula.operands[0]
        tail = Since(*formula.operands[1:])
        return predicates(Since(head, tail))
    formula_name = replace_symbols(to_string(formula))
    prime = Predicate(add_prime_prefix(formula_name))
    non_prime = Predicate(formula_name)
    subsinces = [predicates(f_predicates) for f_predicates in formula.operands]
    return set.union({prime, non_prime}, *subsinces)


@predicates.register
def predicates_once(formula: Once) -> Set[Predicate]:
    """Compute predicate for a Once formula."""
    formula_name = replace_symbols(to_string(formula))
    prime = Predicate(add_prime_prefix(formula_name))
    non_prime = Predicate(formula_name)
    sub = predicates(formula.argument)
    return sub.union({prime, non_prime})


@predicates.register
def predicates_historically(formula: Historically) -> Set[Predicate]:
    """Compute predicate for a Historically formula."""
    formula_name = replace_symbols(to_string(formula))
    prime = Predicate(add_prime_prefix(formula_name))
    non_prime = Predicate(formula_name)
    sub = predicates(formula.argument)
    return sub.union({prime, non_prime, Predicate(f"Onot-{to_string(formula.argument)}")})
