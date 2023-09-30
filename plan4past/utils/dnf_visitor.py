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

from pddl.logic.base import *


def distribute_conj_over_disj(phi: Formula, psi: Or) -> Formula:
    """Distrubute and over or.
    Input: a formula phi that is in conjunction with a disjunction psi = Or(psi1, psi2, etc.)
    Apply the rule And(phi, Or(psi1, psi2)) \equiv Or(And(phi, psi1), And(phi, psi2)) to all disjuncts.
    """
    assert len(psi.operands) >= 2
    new_disjunction = []
    for psi_i in psi.operands:
        new_disjunction.append(And(phi, psi_i))
    return Or(*new_disjunction)


def merge_dnfs(dnf_list: List[Formula]) -> Formula:
    """
    Rewrite And(dnf_1, dnf_2, ..., dnf_n) as an equivalent formula phi in dnf.
    """
    # Step 1: aggregte all dnfs that are conjunction of literals or literals.
    simple_dnfs = []
    disjunctive_dnfs = []
    for dnf in dnf_list:
        if isinstance(dnf, And) or is_literal(dnf):
            simple_dnfs.append(dnf)
        else:
            disjunctive_dnfs.append(dnf)

    if not disjunctive_dnfs:
        return And(*simple_dnfs)

    disjunctive_dnfs = list(reversed(disjunctive_dnfs))
    current_dnf = disjunctive_dnfs.pop()
    while len(disjunctive_dnfs) > 0:
        next_dnf = disjunctive_dnfs.pop()
        assert isinstance(current_dnf, Or)
        current_dnf_operands = current_dnf.operands
        current_dnf = []
        for phi_i in current_dnf_operands:
            assert isinstance(phi_i, And) or is_literal(phi_i)
            current_dnf.append(distribute_conj_over_disj(phi_i, next_dnf))
        current_dnf = Or(*current_dnf)

    if simple_dnfs:
        return distribute_conj_over_disj(And(*simple_dnfs), current_dnf)
    else:
        return current_dnf


"""
DNF ALGORITHM:
    Recursively apply the rule And(a, Or(b, c)) \equiv Or(And(a, b), And(a, c))
"""


@singledispatch
def dnf(obj: Formula) -> Formula:
    """Computes the dnf of a formula"""
    raise ValueError(f"object of type {type(obj)} is not supported by this function")


@dnf.register
def _(formula: And) -> Formula:
    """Computes the dnf of a conjunction"""
    # Step 1: call the DNF on the children
    dnf_operands = [dnf(operand) for operand in formula.operands]
    # Step 2: We have DFN1, DNF2, ..., DNFn. We aggregate all DNFs
    return merge_dnfs(dnf_operands)


@dnf.register
def _(formula: Or) -> Formula:
    """Computes the dnf of a disjunction"""
    # Recursively call the dnf algorithm for the childs.
    # Then the formula Or(DNF1, DNF2, ...) is already in DNF
    return Or(*[dnf(operand) for operand in formula.operands])


@dnf.register
def _(formula: Atomic) -> Formula:
    """Computes the dnf of an atom"""
    # An atom is already in DNF
    return formula


@dnf.register
def _(formula: Not) -> Formula:
    """Computes the dnf of a negation"""
    if is_literal(formula):
        return formula
    else:
        raise ValueError(
            f"Formula of type {type(formula)} is not supported by this function. \
                        Please invoke the nnf transformation before computing the DNF."
        )
