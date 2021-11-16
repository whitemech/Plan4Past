# -*- coding: utf-8 -*-
#
# Copyright 2021 Francesco Fuggitti, Marco Favorito
#
# ------------------------------
#
# This file is part of planning-with-past.
#
# planning-with-past is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# planning-with-past is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with planning-with-past.  If not, see <https://www.gnu.org/licenses/>.
#

"""Compiler from PDDL Domain and PLTLf into a new PDDL domain."""
from functools import singledispatch
from typing import Optional, Set

from pylogics.syntax.base import Formula, Logic, And as PLTLAnd, Or as PLTLOr, Not as PLTLNot
from pylogics.syntax.pltl import Atomic as PLTLAtomic, TrueFormula as PLTLtt, FalseFormula as PLTLff, Before, Since, \
    Once, Historically
from pylogics.utils.to_string import to_string

from pddl.core import Domain, Action
from pddl.logic.base import And, FalseFormula
from pddl.logic.effects import When
from pddl.logic.predicates import DerivedPredicate, Predicate



@singledispatch
def whens(formula: Formula) -> Set[When]:
    raise NotImplementedError("handler not implemented for formula %s" % type(formula))


@whens.register
def whens_atomic(formula: PLTLAtomic) -> Set[When]:
    """Compute the "when" clause for an atomic formula."""
    prime = Predicate(_add_prime_prefix(formula.name))
    non_prime = Predicate(formula.name)
    return {When(prime, non_prime)}


@whens.register
def whens_tt(_formula: PLTLtt) -> Set[When]:
    """Compute the "when" clause for a true formula."""
    prime = Predicate(_add_prime_prefix("tt"))
    non_prime = Predicate("tt")
    return {When(prime, non_prime)}


@whens.register
def whens_ff(_formula: PLTLff) -> Set[When]:
    """Compute the "when" clause for a false formula."""
    prime = Predicate(_add_prime_prefix("ff"))
    non_prime = Predicate("ff")
    return {When(prime, non_prime)}


@whens.register
def whens_once(_formula: Once) -> Set[When]:
    """Compute the "when" clause for the Once formula."""
    formula_name = replace_symbols(to_string(_formula))
    prime = Predicate(_add_prime_prefix(formula_name))
    non_prime = Predicate(formula_name)
    subwhen = whens(_formula.argument)
    return subwhen.union({When(prime, non_prime)})


@whens.register
def whens_and(_formula: PLTLAnd) -> Set[When]:
    """Compute the "when" clause for the Once formula."""
    formula_name = to_string(_formula)
    prime = Predicate(_add_prime_prefix(formula_name))
    non_prime = Predicate(replace_symbols(formula_name))
    subwhens = [whens(f_whens) for f_whens in _formula.operands]
    return set.union({When(prime, non_prime)}, *subwhens)


@singledispatch
def derived_predicates(formula: Formula) -> Set[DerivedPredicate]:
    raise NotImplementedError()


@derived_predicates.register
def derived_predicates(formula: PLTLAtomic):
    pass



class Compiler:
    """Compiler of PLTLf goals into PDDL."""

    def __init__(self, domain: Domain, formula: Formula) -> None:
        """
        Initialize the compiler.

        :param domain: the domain
        :param formula: the formula
        """
        self.domain = domain
        self.formula = formula

        assert self.formula.logic == Logic.PLTL, "only PLTL is supported!"

        self._executed: bool = False
        self._result: Optional = None

        self._derived_predicates: Set[DerivedPredicate] = set()

    @property
    def result(self) -> Domain:
        """Get the result."""
        if self._result is None:
            raise ValueError("not executed yet")
        return self._result

    def compile(self):
        """Compute the new domain."""
        if self._executed:
            return self.result
        self._executed = True

        # TODO: add precondition "(not (act))" to each action
        actions = self.domain.actions

        # TODO: action prog
        whens = self._compute_whens(self.formula)
        prog_action = Action(
            name="prog",
            parameters=[],
            effect=And(*whens)
        )

        derived_predicates = self._compute_derived_predicates(self.formula)

        # TODO return domain with new actions and predicates
        # return Domain(..., derived_predicates=derived_predicates, ...)

    @classmethod
    def _add_prime_prefix(cls, name: str):
        """Add the 'prime' prefix."""
        return "p_" + name

    @singledispatchmethod
    def _compute_whens(self, formula: Formula) -> Set[When]:
        raise NotImplementedError("handler not implemented for formula %s" % type(formula))

    @_compute_whens.register
    def _compute_whens(self, formula: PLTLAtomic) -> Set[When]:
        """Compute the "when" clause for an atomic formula."""
        prime = Predicate(self._add_prime_prefix(formula.name))
        non_prime = Predicate(formula.name)
        return {When(prime, non_prime)}

    @_compute_whens.register
    def _compute_whens(self, _formula: TrueFormula) -> Set[When]:
        """Compute the "when" clause for an atomic formula."""
        prime = Predicate(self._add_prime_prefix("tt"))
        non_prime = Predicate("tt")
        return {When(prime, non_prime)}

    @_compute_whens.register
    def _compute_whens(self, _formula: FalseFormula) -> Set[When]:
        """Compute the "when" clause for an atomic formula."""
        prime = Predicate(self._add_prime_prefix("ff"))
        non_prime = Predicate("ff")
        return {When(prime, non_prime)}

    @_compute_whens.register
    def _compute_whens(self, _formula: Once) -> Set[When]:
        """Compute the "when" clause for an atomic formula."""
        formula_name = to_string(_formula)
        prime = Predicate(self._add_prime_prefix(formula_name))
        non_prime = Predicate(formula_name)
        subwhens = self._compute_whens(_formula.argument)
        return subwhens.union({When(prime, non_prime)})

    @singledispatchmethod
    def _compute_derived_predicates(self, formula: Formula) -> Set[DerivedPredicate]:
        raise NotImplementedError("handler not implemented for formula %s" % type(formula))

    @_compute_derived_predicates.register
    def _compute_derived_predicates(self, formula: PLTLAtomic) -> Set[DerivedPredicate]:
        """"""
        # TODO