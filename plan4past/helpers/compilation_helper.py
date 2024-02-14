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

from pylogics.syntax.base import Formula, Not, And, Or
from pylogics.syntax.pltl import (
    Atomic,
    Before,
    Once,
    PropositionalFalse,
    PropositionalTrue,
    Since,
)

from plan4past.helpers.utils import check_
from plan4past.helpers.formula_helper import *
from plan4past.utils.yesterday_generator_visitor import get_quoted_dictionary
from typing import Set


class CompilationManager:
    """Class that manages the compilation of a PPLTL formula."""

    def __init__(self, phi: Formula) -> None:
        """
        Initialize the compilation manager.

        :param phi: the PPLTL formula to be compiled
        """
        self.phi = phi
        self.quoted_atoms = quoted_set(self.phi)
        self.val_atoms = val_set(self.phi)

        # Assign a unique label to each subformula of \phi
        sub_phi = get_subformulas(self.phi)
        self.formula_to_id_map = {sub: f'p{index}' for sub, index in zip(sub_phi, range(len(sub_phi)))}
        self.formula_to_label_map = {sub: self.formula_to_label(sub) for sub in sub_phi}

        self.quoted_map = {
            quoted_atom: Atomic(f"{QUOTED_ATOM}_{self.formula_to_label_map[quoted_atom.formula]}")
            for quoted_atom in self.quoted_atoms
        }

        self.val_map = {
            val_atom: Atomic(f"{VAL_ATOM}_{self.formula_to_label_map[val_atom.formula]}")
            for val_atom in self.val_atoms
        }

    
    def formula_to_label(self, formula: Formula) -> str:
        """Get the label of a formula."""
        return {
            Atomic: lambda phi: f"{self.formula_to_id_map[phi]}_{str(phi)}",
            PropositionalTrue: lambda phi: f"{self.formula_to_id_map[phi]}_true",
            PropositionalFalse: lambda phi: f"{self.formula_to_id_map[phi]}_false",
            Not: lambda phi: f"{self.formula_to_id_map[phi]}-Not_{self.formula_to_id_map[phi.argument]}",
            Before: lambda phi: f"{self.formula_to_id_map[phi]}-Before_{self.formula_to_id_map[phi.argument]}",
            And: lambda phi: f"{self.formula_to_id_map[phi]}-And_" + "_".join([self.formula_to_id_map[arg] for arg in phi.operands]),
            Or: lambda phi: f"{self.formula_to_id_map[phi]}-Or_" + "_".join([self.formula_to_id_map[arg] for arg in phi.operands]),
            Once: lambda phi: f"{self.formula_to_id_map[phi]}-Once_{self.formula_to_id_map[phi.argument]}",
            Since: lambda phi: f"{self.formula_to_id_map[phi]}-Since_{self.formula_to_id_map[phi.operands[0]]}_{self.formula_to_id_map[phi.operands[1]]}",
        }[type(formula)](formula)

    def get_yesterday_mapping(self) -> str:
        """
        Generate the mapping of the yesterday atoms.

        :return: the mapping of the yesterday atoms
        """
        yesterday_mapping = []
        for key, value in self.quoted_map.items():
            yesterday_mapping.append(f"; {str(key)}: {str(value)}")

        return "\n".join(yesterday_mapping)

    def get_adl_compilation(self) -> Tuple[List[Formula], List, Formula]:
        """
        Get the problem extension.

        :return: the problem extension
        """
        goal = ppnf(self.phi)
        quoted_atoms = []
        conditional_effects = []

        for yesterday_atom in self.quoted_map:
            check_(isinstance(yesterday_atom, YAtom))
            quoted_atoms.append(yesterday_atom)
            conditional_effects.append((ppnf(yesterday_atom.formula), yesterday_atom))

        return quoted_atoms, conditional_effects, goal
