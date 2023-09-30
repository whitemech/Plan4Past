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
"""This module contains the class that manages the compilation of a PPLTL formula."""
from typing import List, Tuple

from pylogics.syntax.base import Formula, Not
from pylogics.syntax.pltl import (
    Atomic,
    Before,
    Once,
    PropositionalFalse,
    PropositionalTrue,
    Since,
)

from plan4past.helpers.before_atom_helper import BeforeAtom
from plan4past.helpers.utils import check_
from plan4past.utils.before_generator_visitor import get_quoted_dictionary
from plan4past.utils.ppnf_visitor import ppnf


def is_temporal_operator(formula: Formula) -> bool:
    """
    Check if the formula is a temporal operator.

    :param formula: the formula to be checked
    :return: True if the formula is a temporal operator, False otherwise
    """
    return isinstance(formula, (Before, Once, Since))


def is_unary_op(formula: Formula) -> bool:
    """
    Check if the formula is a unary operator.

    :param formula: the formula to be checked
    :return: True if the formula is a unary operator, False otherwise
    """
    return isinstance(formula, (Before, Not, Once))


def is_atomic_formula(formula: Formula) -> bool:
    """
    Check if the formula is an atomic formula.

    :param formula: the formula to be checked
    :return: True if the formula is an atomic formula, False otherwise
    """
    return isinstance(formula, (Atomic, PropositionalTrue, PropositionalFalse))


class CompilationManager:
    """Class that manages the compilation of a PPLTL formula."""

    def __init__(self, phi: Formula) -> None:
        """
        Initialize the compilation manager.

        :param phi: the PPLTL formula to be compiled
        """
        self.phi = phi
        self.before_dictionary = get_quoted_dictionary(phi)

    def get_before_mapping(self) -> str:
        """
        Generate the mapping of the before atoms.

        :return: the mapping of the before atoms
        """
        before_mapping = []
        for key, value in self.before_dictionary.items():
            before_mapping.append(f"; {str(key)}: {str(value)}")

        return "\n".join(before_mapping)

    def get_problem_extension(self) -> Tuple[List[Formula], List, Formula]:
        """
        Get the problem extension.

        :return: the problem extension
        """
        goal = ppnf(self.phi)
        fresh_atoms = []
        conditional_effects = []

        for before_atom in self.before_dictionary:
            check_(isinstance(before_atom, BeforeAtom))
            fresh_atoms.append(before_atom)
            conditional_effects.append((ppnf(before_atom.formula), before_atom))

        return fresh_atoms, conditional_effects, goal
