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

"""Transform pylogics formulas into PDDL formulas."""
from functools import singledispatchmethod
from typing import Dict, Set

from pddl.logic.base import And as PddlAnd
from pddl.logic.base import Formula as PddlFormula
from pddl.logic.base import Not as PddlNot
from pddl.logic.base import Or as PddlOr
from pddl.logic.predicates import Predicate
from pylogics.syntax.base import And, Formula, Not, Or
from pylogics.syntax.pltl import Atomic as PLTLAtomic
from pylogics.syntax.pltl import PropositionalTrue

from plan4past.constants import TRUE_ATOM, TRUE_PREDICATE
from plan4past.helpers.utils import check_
from plan4past.helpers.formula_helper import MetaAtom, YAtom, ValAtom


class Pylogics2PddlTranslator:
    """Transform pylogics formulas into PDDL formulas."""

    def __init__(
        self,
        translation_dictionary: Dict[MetaAtom, PLTLAtomic],
        from_atoms_to_fluent: Dict[PLTLAtomic, Predicate],
    ) -> None:
        """Initialize the translator."""
        self._translation_dictionary = translation_dictionary
        self.from_atoms_to_fluent = from_atoms_to_fluent
        self.from_atoms_to_fluent.update({TRUE_ATOM: TRUE_PREDICATE})
    
    def translate(self, formula: Formula) -> PddlFormula:
        return {
            PLTLAtomic: lambda formula: self.from_atoms_to_fluent.get(formula, None),
            YAtom: lambda formula: Predicate(self._translation_dictionary[formula].name, *[]),
            ValAtom: lambda formula: Predicate(self._translation_dictionary[formula].name, *[]),
            PropositionalTrue: lambda formula: TRUE_PREDICATE,
            And: lambda formula: PddlAnd(*[self.translate(operand) for operand in formula.operands]),
            Or: lambda formula: PddlOr(*[self.translate(operand) for operand in formula.operands]),
            Not: lambda formula: PddlNot(self.translate(formula.argument)),
        }[type(formula)](formula)

