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

"""DNF visitor."""
from functools import singledispatch
from typing import List

from pddl.logic.base import And, Atomic, Formula, Not, Or, is_literal

from plan4past.helpers.utils import check_


def distribute_conj_over_disj(phi: Formula, psi: Or) -> Formula:
    r"""
    Distribute ands over ors.

    Input: a formula phi that is in conjunction with a disjunction psi = Or(psi1, psi2, ..., psin)

    Apply the rule And(phi, Or(psi1, psi2)) \\equiv Or(And(phi, psi1), And(phi, psi2)) to all disjuncts.

    :param phi: the and formula
    :param psi: the or formula
    :return: the formula in dnf
    """
    check_(len(psi.operands) >= 2, "expected psi with at least two operands")
    new_disjunction = []
    for psi_i in psi.operands:
        new_disjunction.append(And(phi, psi_i))
    return Or(*new_disjunction)


def merge_dnfs(dnf_list: List[Formula]) -> Formula:
    """
    Rewrite And(dnf_1, dnf_2, ..., dnf_n) as an equivalent formula phi in dnf.

    :param dnf_list: a list of formulas in dnf
    :return: a formula in dnf
    """
    # Step 1: aggregte all dnfs that are conjunction of literals or literals.
    simple_dnfs = []
    disjunctive_dnfs = []
    for subformula in dnf_list:
        if isinstance(subformula, And) or is_literal(subformula):
            simple_dnfs.append(subformula)
        else:
            disjunctive_dnfs.append(subformula)

    if not disjunctive_dnfs:
        return And(*simple_dnfs)

    disjunctive_dnfs = list(reversed(disjunctive_dnfs))
    current_dnf = disjunctive_dnfs.pop()
    while len(disjunctive_dnfs) > 0:
        next_dnf = disjunctive_dnfs.pop()
        check_(isinstance(current_dnf, Or))
        current_dnf_operands = current_dnf.operands
        current_dnf = []
        for phi_i in current_dnf_operands:
            check_(isinstance(phi_i, And) or is_literal(phi_i))
            current_dnf.append(distribute_conj_over_disj(phi_i, next_dnf))
        current_dnf = Or(*current_dnf)

    if simple_dnfs:
        return distribute_conj_over_disj(And(*simple_dnfs), current_dnf)
    return current_dnf


@singledispatch
def dnf(obj: Formula) -> Formula:
    r"""
    Compute the dnf of a formula.

    We recursively apply the rule And(a, Or(b, c)) \\equiv Or(And(a, b), And(a, c)).

    :param obj: the formula to be transformed
    """
    raise ValueError(f"object of type {type(obj)} is not supported by this function")


@dnf.register
def _(formula: And) -> Formula:
    """Compute the dnf of a conjunction."""
    # Step 1: call the DNF on the children
    dnf_operands = [dnf(operand) for operand in formula.operands]
    # Step 2: We have DFN1, DNF2, ..., DNFn. We aggregate all DNFs
    return merge_dnfs(dnf_operands)


@dnf.register
def _(formula: Or) -> Formula:
    """Compute the dnf of a disjunction."""
    # Recursively call the dnf algorithm for the childs.
    # Then the formula Or(DNF1, DNF2, ...) is already in DNF
    return Or(*[dnf(operand) for operand in formula.operands])


@dnf.register
def _(formula: Atomic) -> Formula:
    """Compute the dnf of an atom."""
    # An atom is already in DNF
    return formula


@dnf.register
def _(formula: Not) -> Formula:
    """Compute the dnf of a negation."""
    if is_literal(formula):
        return formula
    raise ValueError(
        f"Formula of type {type(formula)} is not supported by this function. \
                    Please invoke the nnf transformation before computing the DNF."
    )
