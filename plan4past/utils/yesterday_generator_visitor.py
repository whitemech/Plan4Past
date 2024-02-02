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
Generation of the yesterday atoms needed for the compilation.

Example 1: for "H(a) or (b S H(c))" we need to create yesterday_H(a), yesterday_H(c) and yesterday_(b S H(c))
Example 2: for "H(a) or (b S H(a))" we need to create yesterday_H(a) and yesterday_(b S H(a))

Before atoms are kept in a dictionary <key, value> where:
    - key is a pltl formula
    - value is the yesterday associated with such formula

To make the resulting compiled problems more readable, yesterday atoms feature unique numbers instead of the temporal
formula.

Therefore, in example 2 we generate yesterday_1 and yesterday_2.
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

from plan4past.helpers.formula_helper import (
    QUOTED_ATOM,
    YesterdayAtom,
    get_quoted_atom,
)


class YesterdayGenerator:  # pylint: disable=too-few-public-methods
    """Class that generates the yesterday atoms needed for the compilation."""

    def __init__(self) -> None:
        """Initialize the yesterday generator."""
        self.yesterday_dictionary: Dict[YesterdayAtom, Atomic] = {}
        self.yesterday_id = 0

    def add_quoted_atom(self, yesterday_atom: YesterdayAtom) -> None:
        """Add a yesterday atom to the dictionary."""
        if self.yesterday_dictionary.get(yesterday_atom) is None:
            self.yesterday_dictionary[yesterday_atom] = Atomic(
                f"{QUOTED_ATOM}_{self.yesterday_id}"
            )
            self.yesterday_id += 1


def get_quoted_dictionary(phi: Formula) -> Dict[YesterdayAtom, Atomic]:
    """Get the dictionary of yesterday atoms."""
    yesterday_gen = YesterdayGenerator()
    populate_dictionary(phi, yesterday_gen)
    return yesterday_gen.yesterday_dictionary


@singledispatch
def populate_dictionary(formula: object, yesterday_gen: YesterdayGenerator) -> None:
    """
    Populate the mapping from PLTL formula to PDDL atoms.

    This function does side-effect on the yesterday_gen object, by adding the yesterday atoms to the dictionary.

    The dictionary can then be accessed via yesterday_gen.yesterday_dictionary.

    :param formula: the PPLTL formula
    :param yesterday_gen: the YesterdayGenerator object
    """
    raise NotImplementedError(f"handler not implemented for object {type(formula)}")


@populate_dictionary.register
def _(_formula: Atomic, _yesterday_gen: YesterdayGenerator) -> None:
    """Populate dictionary for an atomic formula."""


@populate_dictionary.register
def _(_formula: PropositionalTrue, _yesterday_gen: YesterdayGenerator) -> None:
    """Populate dictionary for an atomic formula."""


@populate_dictionary.register
def _(_formula: PropositionalFalse, _yesterday_gen: YesterdayGenerator) -> None:
    """Populate dictionary for an atomic formula."""


@populate_dictionary.register
def _(formula: Not, yesterday_gen: YesterdayGenerator) -> None:
    """Populate dictionary for a Not formula."""
    populate_dictionary(formula.argument, yesterday_gen)


@populate_dictionary.register
def _(formula: Once, yesterday_gen: YesterdayGenerator) -> None:
    """Populate dictionary for a Once formula."""
    yesterday_gen.add_quoted_atom(get_quoted_atom(formula))
    populate_dictionary(formula.argument, yesterday_gen)


@populate_dictionary.register
def _(formula: Before, yesterday_gen: YesterdayGenerator) -> None:
    """Populate dictionary for a Before formula."""
    yesterday_gen.add_quoted_atom(get_quoted_atom(formula))
    populate_dictionary(formula.argument, yesterday_gen)


@populate_dictionary.register
def _(formula: Since, yesterday_gen: YesterdayGenerator) -> None:
    """Populate dictionary for a Before formula."""
    yesterday_gen.add_quoted_atom(get_quoted_atom(formula))
    populate_dictionary(formula.operands[0], yesterday_gen)
    populate_dictionary(formula.operands[1], yesterday_gen)


@populate_dictionary.register
def _(formula: And, yesterday_gen: YesterdayGenerator) -> None:
    """Populate dictionary for an And formula."""
    for operand in formula.operands:
        populate_dictionary(operand, yesterday_gen)


@populate_dictionary.register
def _(formula: Or, yesterday_gen: YesterdayGenerator) -> None:
    """Populate dictionary for an Or formula."""
    for operand in formula.operands:
        populate_dictionary(operand, yesterday_gen)
