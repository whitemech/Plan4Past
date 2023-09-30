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
"""
Generation of the before atoms needed for the compilation.

Example 1: for "H(a) or (b S H(c))" we need to create before_H(a), before_H(c) and before_(b S H(c))
Example 2: for "H(a) or (b S H(a))" we need to create before_H(a) and before_(b S H(a))

Before atoms are kept in a dictionary <key, value> where:
    - key is a pltl formula
    - value is the before associated with such formula

To make the resulting compiled problems more readable, before atoms feautre unique numbers instead of the temporal
formula.

Therefore, in example 2 we generate before_1 and before_2.
"""
from functools import singledispatch
from typing import Dict

from pylogics.syntax.base import And, Formula, Not, Or
from pylogics.syntax.pltl import (
    Atomic,
    Before,
    Once,
    PropositionalFalse,
    PropositionalTrue,
    Since,
)

from plan4past.helpers.before_atom_helper import (
    QUOTED_ATOM,
    BeforeAtom,
    get_before_atom,
)


class BeforeGenerator:  # pylint: disable=too-few-public-methods
    """Class that generates the before atoms needed for the compilation."""

    def __init__(self) -> None:
        """Initialize the before generator."""
        self.before_dictionary: Dict[BeforeAtom, Atomic] = {}
        self.before_id = 0

    def add_quoted_atom(self, before_atom: BeforeAtom) -> None:
        """Add a before atom to the dictionary."""
        if self.before_dictionary.get(before_atom) is None:
            self.before_dictionary[before_atom] = Atomic(
                f"{QUOTED_ATOM}_{self.before_id}"
            )
            self.before_id += 1


def get_quoted_dictionary(phi: Formula) -> Dict[BeforeAtom, Atomic]:
    """Get the dictionary of before atoms."""
    before_gen = BeforeGenerator()
    populate_dictionary(phi, before_gen)
    return before_gen.before_dictionary


@singledispatch
def populate_dictionary(formula: object, _before_gen: BeforeGenerator) -> None:
    """Compute the derived predicate for a formula."""
    raise NotImplementedError(f"handler not implemented for object {type(formula)}")


@populate_dictionary.register
def _(_formula: Atomic, _before_gen: BeforeGenerator) -> None:
    """Populate dictionary for an atomic formula."""


@populate_dictionary.register
def _(_formula: PropositionalTrue, _before_gen: BeforeGenerator) -> None:
    """Populate dictionary for an atomic formula."""


@populate_dictionary.register
def _(_formula: PropositionalFalse, _before_gen: BeforeGenerator) -> None:
    """Populate dictionary for an atomic formula."""


@populate_dictionary.register
def _(formula: Not, before_gen: BeforeGenerator) -> None:
    """Populate dictionary for a Not formula."""
    populate_dictionary(formula.argument, before_gen)


@populate_dictionary.register
def _(formula: Once, before_gen: BeforeGenerator) -> None:
    """Populate dictionary for a Once formula."""
    before_gen.add_quoted_atom(get_before_atom(formula))
    populate_dictionary(formula.argument, before_gen)


@populate_dictionary.register
def _(formula: Before, before_gen: BeforeGenerator) -> None:
    """Populate dictionary for a Before formula."""
    before_gen.add_quoted_atom(get_before_atom(formula))
    populate_dictionary(formula.argument, before_gen)


@populate_dictionary.register
def _(formula: Since, before_gen: BeforeGenerator) -> None:
    """Populate dictionary for a Before formula."""
    before_gen.add_quoted_atom(get_before_atom(formula))
    populate_dictionary(formula.operands[0], before_gen)
    populate_dictionary(formula.operands[1], before_gen)


@populate_dictionary.register
def _(formula: And, before_gen: BeforeGenerator) -> None:
    """Populate dictionary for an And formula."""
    for operand in formula.operands:
        populate_dictionary(operand, before_gen)


@populate_dictionary.register
def _(formula: Or, before_gen: BeforeGenerator) -> None:
    """Populate dictionary for an Or formula."""
    for operand in formula.operands:
        populate_dictionary(operand, before_gen)
