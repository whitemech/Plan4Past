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

from pylogics.syntax.base import (
    Formula,
    Logic,
    And as PLTLAnd,
    Or as PLTLOr,
    Not as PLTLNot,
)
from pylogics.syntax.pltl import (
    Atomic as PLTLAtomic,
    TrueFormula as PLTLTrue,
    FalseFormula as PLTLFalse,
    Before,
    Since,
    Once,
    Historically,
)
from pylogics.utils.to_string import to_string

from pddl.core import Domain, Action
from pddl.logic.base import And, Or, Not
from pddl.logic.effects import When
from pddl.logic.predicates import DerivedPredicate, Predicate


def _add_prime_prefix(name: str):
    """Add the 'prime' prefix."""
    return "p_" + name


def replace_symbols(name: str):
    return (
        name.replace("(", "")
        .replace(")", "")
        .replace("&", "and")
        .replace("|", "or")
        .replace("~", "not-")
        .replace(" ", "-")
    )


@singledispatch
def predicates(formula: Formula) -> Set[Predicate]:
    raise NotImplementedError("handler not implemented for formula %s" % type(formula))


@predicates.register
def predicates_tt(_formula: PLTLTrue) -> Set[Predicate]:
    """Compute the predicates for a true formula."""
    prime = Predicate(_add_prime_prefix("tt"))
    non_prime = Predicate("tt")
    return {prime, non_prime}


@predicates.register
def predicates_ff(_formula: PLTLFalse) -> Set[Predicate]:
    """Compute the predicates for a true formula."""
    prime = Predicate(_add_prime_prefix("ff"))
    non_prime = Predicate("ff")
    return {prime, non_prime}


@predicates.register
def predicates_atomic(formula: PLTLAtomic) -> Set[Predicate]:
    """Compute predicate for an atomic formula."""
    prime = Predicate(_add_prime_prefix(formula.name))
    non_prime = Predicate(formula.name)
    return {prime, non_prime}


@predicates.register
def predicates_and(_formula: PLTLAnd) -> Set[Predicate]:
    """Compute predicate for an And formula."""
    formula_name = replace_symbols(to_string(_formula))
    prime = Predicate(_add_prime_prefix(formula_name))
    non_prime = Predicate(formula_name)
    subands = [predicates(f_predicates) for f_predicates in _formula.operands]
    return set.union({prime, non_prime}, *subands)


@predicates.register
def predicates_or(_formula: PLTLOr) -> Set[Predicate]:
    """Compute predicate for an Or formula."""
    formula_name = replace_symbols(to_string(_formula))
    prime = Predicate(_add_prime_prefix(formula_name))
    non_prime = Predicate(formula_name)
    subors = [predicates(f_predicates) for f_predicates in _formula.operands]
    return set.union({prime, non_prime}, *subors)


@predicates.register
def predicates_not(_formula: PLTLNot) -> Set[Predicate]:
    """Compute predicate for a Not formula."""
    formula_name = replace_symbols(to_string(_formula))
    prime = Predicate(_add_prime_prefix(formula_name))
    non_prime = Predicate(formula_name)
    sub = predicates(_formula.argument)
    return sub.union({prime, non_prime})


@predicates.register
def predicates_before(_formula: Before) -> Set[Predicate]:
    """Compute predicate for a Before (Yesterday) formula."""
    formula_name = replace_symbols(to_string(_formula))
    prime = Predicate(_add_prime_prefix(formula_name))
    non_prime = Predicate(formula_name)
    sub = predicates(_formula.argument)
    return sub.union({prime, non_prime})


@predicates.register
def predicates_since(_formula: Since) -> Set[Predicate]:
    """Compute predicate for a Since formula."""
    formula_name = replace_symbols(to_string(_formula))
    prime = Predicate(_add_prime_prefix(formula_name))
    non_prime = Predicate(formula_name)
    subsinces = [predicates(f_predicates) for f_predicates in _formula.operands]
    # sub = predicates(_formula.operands)
    return set.union({prime, non_prime}, *subsinces)


@predicates.register
def predicates_once(_formula: Once) -> Set[Predicate]:
    """Compute predicate for a Once formula."""
    formula_name = replace_symbols(to_string(_formula))
    prime = Predicate(_add_prime_prefix(formula_name))
    non_prime = Predicate(formula_name)
    sub = predicates(_formula.argument)
    return sub.union({prime, non_prime})


@predicates.register
def predicates_historically(_formula: Historically) -> Set[Predicate]:
    """Compute predicate for a Historically formula."""
    formula_name = replace_symbols(to_string(_formula))
    prime = Predicate(_add_prime_prefix(formula_name))
    non_prime = Predicate(formula_name)
    sub = predicates(_formula.argument)
    return sub.union({prime, non_prime})


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
def whens_tt(_formula: PLTLTrue) -> Set[When]:
    """Compute the "when" clause for a true formula."""
    prime = Predicate(_add_prime_prefix("tt"))
    non_prime = Predicate("tt")
    return {When(prime, non_prime)}


@whens.register
def whens_ff(_formula: PLTLFalse) -> Set[When]:
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
    raise NotImplementedError("handler not implemented for formula %s" % type(formula))


@derived_predicates.register
def derived_predicates_tt(formula: PLTLTrue) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a true formula."""
    prime = Predicate(_add_prime_prefix("tt"))
    condition = Predicate("top")
    return {DerivedPredicate(prime, condition)}


@derived_predicates.register
def derived_predicates_atomic(formula: PLTLAtomic) -> Set[DerivedPredicate]:
    """Compute the derived predicate for an atomic formula."""
    prime = Predicate(_add_prime_prefix(formula.name))
    condition = Predicate(formula.name)
    return {DerivedPredicate(prime, condition)}


@derived_predicates.register
def derived_predicates_and(formula: PLTLAnd) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a PLTL And formula."""
    formula_name = to_string(formula)
    prime = Predicate(_add_prime_prefix(replace_symbols(formula_name)))
    prime_ops = [Predicate(_add_prime_prefix(to_string(op))) for op in formula.operands]
    condition = And(*prime_ops)
    return {DerivedPredicate(prime, condition)}


@derived_predicates.register
def derived_predicates_or(formula: PLTLOr) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a PLTL Or formula."""
    formula_name = to_string(formula)
    prime = Predicate(_add_prime_prefix(replace_symbols(formula_name)))
    prime_ops = [Predicate(_add_prime_prefix(to_string(op))) for op in formula.operands]
    condition = Or(*prime_ops)
    return {DerivedPredicate(prime, condition)}


@derived_predicates.register
def derived_predicates_not(formula: PLTLNot) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a PLTL Not formula."""
    formula_name = to_string(formula)
    prime = Predicate(_add_prime_prefix(replace_symbols(formula_name)))
    condition = Not(
        Predicate(_add_prime_prefix(replace_symbols(to_string(formula.argument))))
    )
    return {DerivedPredicate(prime, condition)}


@derived_predicates.register
def derived_predicates_before(formula: Before) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a Before formula."""
    formula_name = to_string(formula)
    prime = Predicate(_add_prime_prefix(replace_symbols(formula_name)))
    condition = And(
        Predicate(replace_symbols(to_string(formula.argument))), Predicate("Ott")
    )
    return {DerivedPredicate(prime, condition)}


@derived_predicates.register
def derived_predicates_since(formula: Since) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a Since formula."""
    formula_name = to_string(formula)
    prime = Predicate(_add_prime_prefix(replace_symbols(formula_name)))
    op_or_1 = Predicate(
        _add_prime_prefix(replace_symbols(to_string(formula.operands[1])))
    )
    op_or_2 = And(
        Predicate(_add_prime_prefix(replace_symbols(to_string(formula.operands[0])))),
        Predicate(replace_symbols(to_string(formula))),
        Predicate("Ott"),
    )
    condition = Or(op_or_1, op_or_2)
    return {DerivedPredicate(prime, condition)}


@derived_predicates.register
def derived_predicates_once(formula: Once) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a Once formula."""
    formula_name = to_string(formula)
    prime = Predicate(_add_prime_prefix(replace_symbols(formula_name)))
    condition = Or(
        Predicate(replace_symbols(to_string(formula.argument))),
        And(
            Predicate(f"O{replace_symbols(to_string(formula.argument))}"),
            Predicate("Ott"),
        ),
    )
    return {DerivedPredicate(prime, condition)}


@derived_predicates.register
def derived_predicates_historically(formula: Historically) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a Historically formula."""
    formula_name = to_string(formula)
    prime = Predicate(_add_prime_prefix(replace_symbols(formula_name)))
    condition = And(
        Predicate(replace_symbols(to_string(formula.argument))),
        Or(
            Not(Predicate(f"Onot-{replace_symbols(to_string(formula.argument))}")),
            Not(Predicate("Ott")),
        ),
    )
    return {DerivedPredicate(prime, condition)}


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

        # new predicates
        top = Predicate("top")
        act = Predicate("act")
        goal = Predicate("goal")
        new_predicates = predicates(self.formula).union({top, act, goal})

        new_derived_predicates = derived_predicates(self.formula)

        # TODO: add precondition "(act)" to each action, "(not (act))"
        actions = self.domain.actions

        new_whens = whens(self.formula)
        prog_action = Action(
            name="prog", parameters=[], precondition=And(), effect=And(*new_whens)
        )

        check_action = Action(
            name="check",
            parameters=[],
            precondition=~act & Predicate(replace_symbols(to_string(self.formula))),
            effect=goal,
        )

        # TODO return domain with new actions and predicates
        # return Domain(..., derived_predicates=derived_predicates, ...)
