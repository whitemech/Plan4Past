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

"""NNF visitor."""
from functools import singledispatch

from pddl.logic.base import *

from plan4past.utils.negate_visitor import negate


@singledispatch
def nnf(obj: Formula) -> Formula:
    """Computes the nnf of a formula"""
    raise ValueError(f"object of type {type(obj)} is not supported by this function")


@nnf.register
def _(formula: And) -> Formula:
    """Computes the nnf of a conjunction"""
    return And(*[nnf(operand) for operand in formula.operands])


@nnf.register
def _(formula: Or) -> Formula:
    """Computes the nnf of a disjunction"""
    return Or(*[nnf(operand) for operand in formula.operands])


@nnf.register
def _(formula: Atomic) -> Formula:
    """Computes the nnf of an atom"""
    return formula


@nnf.register
def _(formula: Not) -> Formula:
    """Computes the nnf of a negation"""
    if is_literal(formula):
        return formula
    else:
        negated_formula = negate(formula.argument)  # Push the negation
        return nnf(negated_formula)  # Recurse
