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

from plan4past.constants import TRUE_ATOM
from plan4past.helpers.utils import check_
from plan4past.helpers.yesterday_atom_helper import YesterdayAtom


class Pylogics2PddlTranslator:
    """Transform pylogics formulas into PDDL formulas."""

    def __init__(
        self,
        yesterday_dictionary: Dict[YesterdayAtom, PLTLAtomic],
        from_atoms_to_fluent: Dict[PLTLAtomic, Predicate],
        fresh_atoms: Set[PLTLAtomic],
    ) -> None:
        """Initialize the translator."""
        self._fresh_atoms = fresh_atoms
        self._yesterday_dictionary = yesterday_dictionary
        self.from_atoms_to_fluent = from_atoms_to_fluent

    @singledispatchmethod
    def translate(self, obj: Formula) -> PddlFormula:
        """Transform pylogics formulas into PDDL formulas."""
        raise ValueError(
            f"object of type {type(obj)} is not supported by this function"
        )

    @translate.register
    def translate_true(self, _formula: PropositionalTrue) -> PddlFormula:
        """Compute the PDDL version of a true formula."""
        return TRUE_ATOM

    @translate.register
    def translate_atomic(self, formula: PLTLAtomic) -> PddlFormula:
        """Compute the PDDL version of an atomic formula."""
        if self._fresh_atoms is not None and formula in self._fresh_atoms:
            return (
                Predicate(self._yesterday_dictionary[formula].name, *[])
                if isinstance(formula, YesterdayAtom)
                else Predicate(formula.name, *[])
            )
        predicate = self.from_atoms_to_fluent.get(PLTLAtomic(formula.name), None)
        check_(
            predicate is not None,
            f"expected predicate with name {formula.name}; missing",
        )
        return predicate

    @translate.register
    def pylogics2pddl_and(self, formula: And) -> PddlFormula:
        """Compute the PDDL version of a conjunction."""
        operands = [self.translate(operand) for operand in formula.operands]
        return PddlAnd(*operands)

    @translate.register
    def pylogics2pddl_or(self, formula: Or) -> PddlFormula:
        """Compute the PDDL version of a disjunction."""
        operands = [self.translate(operand) for operand in formula.operands]
        return PddlOr(*operands)

    @translate.register
    def pylogics2pddl_not(self, formula: Not) -> PddlFormula:
        """Compute the PDDL version of a disjunction."""
        return PddlNot(self.translate(formula.argument))
