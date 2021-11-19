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
from typing import Optional, Set, AbstractSet, Tuple, Dict

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

from pddl.core import Domain, Action, Problem
from pddl.logic import Constant
from pddl.logic.base import And, Or, Not
from pddl.logic.effects import When
from pddl.logic.predicates import DerivedPredicate, Predicate


def _add_prime_prefix(name: str):
    """Add the 'prime' prefix."""
    return "p_" + name


def _remove_prime_prefix(name: str):
    """Remove the 'prime' prefix."""
    return name.replace("p_", "")


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
def predicates_since(formula: Since) -> Set[Predicate]:
    """Compute predicate for a Since formula."""
    if len(formula.operands) != 2:
        head = formula.operands[0]
        tail = Since(*formula.operands[1:])
        return predicates(Since(head, tail))
    formula_name = replace_symbols(to_string(formula))
    prime = Predicate(_add_prime_prefix(formula_name))
    non_prime = Predicate(formula_name)
    subsinces = [predicates(f_predicates) for f_predicates in formula.operands]
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
def derived_predicates(formula: Formula) -> Set[DerivedPredicate]:
    raise NotImplementedError("handler not implemented for formula %s" % type(formula))


@derived_predicates.register
def derived_predicates_tt(_formula: PLTLTrue) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a true formula."""
    prime = Predicate(_add_prime_prefix("tt"))
    condition = Predicate("top")
    return {DerivedPredicate(prime, condition)}


@derived_predicates.register
def derived_predicates_ff(_formula: PLTLFalse) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a false formula."""
    prime = Predicate(_add_prime_prefix("ff"))
    condition = Not(Predicate("top"))
    return {DerivedPredicate(prime, condition)}


@derived_predicates.register
def derived_predicates_atomic(formula: PLTLAtomic) -> Set[DerivedPredicate]:
    """Compute the derived predicate for an atomic formula."""
    prime = Predicate(_add_prime_prefix(formula.name))
    condition = Predicate(formula.name)
    # TODO
    return {DerivedPredicate(prime, condition)}


@derived_predicates.register
def derived_predicates_and(formula: PLTLAnd) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a PLTL And formula."""
    formula_name = to_string(formula)
    prime = Predicate(_add_prime_prefix(replace_symbols(formula_name)))
    prime_ops = [Predicate(_add_prime_prefix(to_string(op))) for op in formula.operands]
    condition = And(*prime_ops)
    der_pred_ops = [derived_predicates(op) for op in formula.operands]
    return {DerivedPredicate(prime, condition)}.union(*der_pred_ops)


@derived_predicates.register
def derived_predicates_or(formula: PLTLOr) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a PLTL Or formula."""
    formula_name = to_string(formula)
    prime = Predicate(_add_prime_prefix(replace_symbols(formula_name)))
    prime_ops = [Predicate(_add_prime_prefix(to_string(op))) for op in formula.operands]
    condition = Or(*prime_ops)
    der_pred_ops = [derived_predicates(op) for op in formula.operands]
    return {DerivedPredicate(prime, condition)}.union(*der_pred_ops)


@derived_predicates.register
def derived_predicates_not(formula: PLTLNot) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a PLTL Not formula."""
    formula_name = to_string(formula)
    prime = Predicate(_add_prime_prefix(replace_symbols(formula_name)))
    condition = Not(
        Predicate(_add_prime_prefix(replace_symbols(to_string(formula.argument))))
    )
    der_pred_arg = derived_predicates(formula.argument)
    return {DerivedPredicate(prime, condition)}.union(der_pred_arg)


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
    if len(formula.operands) != 2:
        head = formula.operands[0]
        tail = Since(*formula.operands[1:])
        return derived_predicates(Since(head, tail))
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
    der_pred_ops = [derived_predicates(op) for op in formula.operands]
    return {DerivedPredicate(prime, condition)}.union(*der_pred_ops)


@derived_predicates.register
def derived_predicates_once(formula: Once) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a Once formula."""
    formula_name = to_string(formula)
    prime = Predicate(_add_prime_prefix(replace_symbols(formula_name)))
    condition = Or(
        Predicate(_add_prime_prefix(replace_symbols(to_string(formula.argument)))),
        And(
            Predicate(f"O{replace_symbols(to_string(formula.argument))}"),
            Predicate("Ott"),
        ),
    )
    der_pred_arg = derived_predicates(formula.argument)
    return {DerivedPredicate(prime, condition)}.union(der_pred_arg)


@derived_predicates.register
def derived_predicates_historically(formula: Historically) -> Set[DerivedPredicate]:
    """Compute the derived predicate for a Historically formula."""
    formula_name = to_string(formula)
    prime = Predicate(_add_prime_prefix(replace_symbols(formula_name)))
    condition = And(
        Predicate(_add_prime_prefix(replace_symbols(to_string(formula.argument)))),
        Or(
            Not(Predicate(f"Onot-{replace_symbols(to_string(formula.argument))}")),
            Not(Predicate("Ott")),
        ),
    )
    der_pred_arg = derived_predicates(formula.argument)
    return {DerivedPredicate(prime, condition)}.union(der_pred_arg)


class Compiler:
    """Compiler of PLTLf goals into PDDL."""

    def __init__(
        self,
        domain: Domain,
        problem: Problem,
        formula: Formula,
        from_atoms_to_fluent: Dict[PLTLAtomic, Predicate],
    ) -> None:
        """
        Initialize the compiler.

        :param domain: the domain
        :param problem: the problem
        :param formula: the formula
        """
        self.domain = domain
        self.problem = problem
        self.formula = formula
        self.from_atoms_to_fluent = from_atoms_to_fluent
        self.validate_mapping(domain, formula, from_atoms_to_fluent)

        assert self.formula.logic == Logic.PLTL, "only PLTL is supported!"

        self._executed: bool = False
        self._result_domain: Optional = None
        self._result_problem: Optional = None

        self._derived_predicates: Set[DerivedPredicate] = set()

    @classmethod
    def validate_mapping(
        cls,
        domain: Domain,
        formula: Formula,
        from_atoms_to_fluent: Dict[PLTLAtomic, Predicate],
    ):
        """
        Check that the mapping is valid wrt the problem instance.

        In particular:
        - check that all the formula atoms are covered (TODO)
        - check that all the atoms are legal wrt the formula
        - check that the fluents are legal wrt the domain

        :param domain:
        :param formula:
        :param from_atoms_to_fluent:
        :return:
        """
        for atom, fluent in from_atoms_to_fluent.items():
            assert all(isinstance(t, Constant) for t in fluent.terms)

    @property
    def result(self) -> Tuple[Domain, Problem]:
        """Get the result."""
        if self._result_domain and self._result_problem is None:
            raise ValueError("compilation not executed yet")
        return self._result_domain, self._result_problem

    def compile(self):
        """Compute the new domain and the new problem."""
        if self._executed:
            return self.result
        self._executed = True

        self._compile_domain()
        self._compile_problem()

    def _compile_domain(self):
        """Compute the new domain."""
        top = Predicate("top")
        act = Predicate("act")
        goal = Predicate("goal")
        new_predicates = predicates(self.formula).union({top, act, goal})

        new_derived_predicates = derived_predicates(self.formula)

        domain_actions = _update_domain_actions(self.domain.actions, act)

        new_whens = _compute_whens(self.formula)
        prog_action = Action(
            name="prog",
            parameters=[],
            precondition=~act & ~goal,
            effect=And(*new_whens, act),
        )
        check_action = Action(
            name="check",
            parameters=[],
            precondition=~act & Predicate(replace_symbols(to_string(self.formula))),
            effect=goal,
        )

        domain_actions = domain_actions.union({prog_action, check_action})

        self._result_domain = Domain(
            name=self.domain.name,
            requirements=self.domain.requirements,
            types=self.domain.types,
            constants=self.domain.constants,
            predicates=[self.domain.predicates, *new_predicates],
            derived_predicates=[
                self.domain.derived_predicates,
                *new_derived_predicates,
            ],
            actions=domain_actions,
        )

    def _compile_problem(self):
        """Compute the new problem."""
        top = Predicate("top")
        act = Predicate("act")
        goal = Predicate("goal")

        new_init = set(self.problem.init)
        new_init = new_init.union({act, top})

        self._result_problem = Problem(
            name=self.problem.name,
            domain=self._result_domain,
            requirements=self.problem.requirements,
            objects=self.problem.objects,
            init=new_init,
            goal=goal,
        )


def _compute_whens(formula: Formula) -> Set[When]:
    """Compute conditional effects for formula progression."""
    return {
        When(p, Predicate(_remove_prime_prefix(p.name)))
        for p in predicates(formula)
        if p.name.startswith("p_")
    }


def _update_domain_actions(actions: AbstractSet[Action], act: Predicate) -> Set[Action]:
    """Update domain actions."""
    new_actions = set()
    for action in actions:
        new_actions.add(
            Action(
                name=action.name,
                parameters=action.parameters,
                precondition=And(action.precondition, act),
                effect=And(action.effect, Not(act)),
            )
        )
    return new_actions
