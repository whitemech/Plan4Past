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

"""Negate visitor."""
from functools import singledispatch

from pddl.logic.base import And, Atomic, Formula, Not, Or


@singledispatch
def negate(obj: Formula) -> Formula:
    """Compute the negation of a formula."""
    raise ValueError(f"object of type {type(obj)} is not supported by this function")


@negate.register
def _(formula: And) -> Formula:
    """Compute the negation of a conjunction."""
    negated_operands = [negate(operand) for operand in formula.operands]
    return Or(*negated_operands)


@negate.register
def _(formula: Or) -> Formula:
    """Compute the negation of a disjunction."""
    negated_operands = [negate(operand) for operand in formula.operands]
    return And(*negated_operands)


@negate.register
def _(formula: Atomic) -> Formula:
    """Compute the negation of a predicate."""
    return Not(formula)


@negate.register
def _(formula: Not) -> Formula:
    """Compute the negation of a formula."""
    return formula.argument
