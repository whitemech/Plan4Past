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

"""Compiler from PDDL Domain and PPLTL into a new PDDL domain."""
from typing import AbstractSet, Dict, List, Optional, Set, Tuple

from pddl.core import Action, Domain, Problem, Requirements
from pddl.logic import Constant
from pddl.logic.base import And
from pddl.logic.base import Formula as PddlFormula
from pddl.logic.base import Not, Or
from pddl.logic.effects import AndEffect, When
from pddl.logic.predicates import DerivedPredicate, Predicate
from pylogics.syntax.base import And as ppltlAnd
from pylogics.syntax.base import Formula, Logic
from pylogics.syntax.base import Not as ppltlNot
from pylogics.syntax.base import Or as ppltlOr
from pylogics.syntax.pltl import Atomic
from pylogics.syntax.pltl import Atomic as PLTLAtomic
from pylogics.syntax.pltl import FalseFormula, PropositionalTrue
from pylogics.utils.to_string import to_string

from plan4past.helpers.before_atom_helper import QUOTED_ATOM
from plan4past.helpers.compilation_helper import BeforeAtom, CompilationManager
from plan4past.helpers.utils import (
    add_val_prefix,
    check_,
    default_mapping,
    remove_before_prefix,
    replace_symbols,
)
from plan4past.utils.atoms_visitor import find_atoms
from plan4past.utils.derived_visitor import derived_predicates
from plan4past.utils.dnf_visitor import dnf
from plan4past.utils.nnf_visitor import nnf
from plan4past.utils.predicates_visitor import predicates
from plan4past.utils.rewrite_formula_visitor import rewrite
from plan4past.utils.val_predicates_visitor import val_predicates


class Compiler:
    """Compiler of PPLTL goals into PDDL."""

    def __init__(
        self,
        domain: Domain,
        problem: Problem,
        formula: Formula,
        from_atoms_to_fluent: Optional[Dict[PLTLAtomic, Predicate]] = None,
    ) -> None:
        """
        Initialize the compiler.

        :param domain: the domain
        :param problem: the problem
        :param formula: the formula
        :param from_atoms_to_fluent: optional mapping from atoms to fluent
        """
        self.domain = domain
        self.problem = problem
        self.formula = rewrite(formula)
        if from_atoms_to_fluent:
            self.from_atoms_to_fluent = from_atoms_to_fluent
            self.validate_mapping(domain, formula, from_atoms_to_fluent)
        else:
            self.from_atoms_to_fluent = default_mapping(self.formula)

        check_(self.formula.logic == Logic.PLTL, "only PPLTL is supported!")

        self._executed: bool = False
        self._result_domain: Optional[Domain] = None
        self._result_problem: Optional[Problem] = None

        self._derived_predicates: Set[DerivedPredicate] = set()

    @classmethod
    def validate_mapping(
        cls,
        _domain: Domain,
        _formula: Formula,
        from_atoms_to_fluent: Dict[PLTLAtomic, Predicate],
    ) -> None:
        """
        Check that the mapping is valid wrt the problem instance.

        In particular:
        - check that all the formula atoms are covered (TODO)
        - check that all the atoms are legal wrt the formula
        - check that the fluents are legal wrt the domain

        :param _domain: the domain
        :param _formula: the formula
        :param from_atoms_to_fluent: the mapping
        """
        for _atom, fluent in from_atoms_to_fluent.items():
            check_(all(isinstance(t, Constant) for t in fluent.terms))

    @property
    def result(self) -> Tuple[Domain, Problem]:
        """
        Get the result.

        :return: a triple (domain, problem, mapping); the mapping might be None
        """
        if self._result_domain is None or self._result_problem is None:
            raise ValueError("compilation not executed yet")
        return self._result_domain, self._result_problem

    def compile(self):
        """Compute the new domain and the new problem."""
        if not self._executed:
            self._compile_domain()
            self._compile_problem()
            self._executed = True

    def _compile_domain(self):
        """Compute the new domain."""
        new_predicates = predicates(self.formula).union(val_predicates(self.formula))
        new_derived_predicates = derived_predicates(
            self.formula, self.from_atoms_to_fluent
        )
        new_whens = _compute_whens(self.formula)
        domain_actions = _update_domain_actions_det(self.domain.actions, new_whens)

        self._result_domain = Domain(
            name=self.domain.name,
            requirements=[
                *self.domain.requirements,
                Requirements.DERIVED_PREDICATES,
                Requirements.CONDITIONAL_EFFECTS,
                Requirements.NEG_PRECONDITION,
            ],
            types=self.domain.types,
            constants=self.domain.constants,
            predicates=[*self.domain.predicates, *new_predicates],
            derived_predicates=[
                *self.domain.derived_predicates,
                *new_derived_predicates,
            ],
            actions=domain_actions,
        )

    def _compile_problem(self):
        """Compute the new problem."""
        new_init = (
            {*self.problem.init, Predicate("true")}
            if PLTLAtomic("true") in find_atoms(self.formula)
            else set(self.problem.init)
        )

        self._result_problem = Problem(
            name=self.problem.name,
            domain_name=self.domain.name,
            requirements=self.problem.requirements,
            objects=[*self.problem.objects],
            init=new_init,
            goal=And(
                Predicate(add_val_prefix(replace_symbols(to_string(self.formula))))
            ),
        )


def _compute_whens(formula: Formula) -> Set[When]:
    """Compute conditional effects for formula progression."""
    return {
        When(Predicate(add_val_prefix(remove_before_prefix(p.name))), p)
        for p in predicates(formula)
    }.union(
        When(Not(Predicate(add_val_prefix(remove_before_prefix(p.name)))), Not(p))
        for p in predicates(formula)
    )


def _update_domain_actions_det(
    actions: AbstractSet[Action], progression: Set[When]
) -> Set[Action]:
    """Update domain actions."""
    new_actions = set()
    for action in actions:
        if isinstance(action.effect, AndEffect):
            previous_effects = action.effect.operands
            new_actions.add(
                Action(
                    name=action.name,
                    parameters=[*action.parameters],
                    precondition=And(action.precondition),
                    effect=AndEffect(*previous_effects, *progression),
                )
            )
        else:
            new_actions.add(
                Action(
                    name=action.name,
                    parameters=[*action.parameters],
                    precondition=And(action.precondition),
                    effect=AndEffect(action.effect, *progression),
                )
            )
    return new_actions


class ProblemUnsolvableException(Exception):
    """Exception raised when the problem is unsolvable."""

    def __init__(self, *args: object) -> None:
        """Initialize the exception."""
        super().__init__(*args)


PNF = "pnf"

TRUE_ATOM = PLTLAtomic("true")

GOAL_PREDICATE = Predicate("goal", *[])
CHECK_PREDICATE = Predicate("evaluate-pnf", *[])
TRUE_PREDICATE = Predicate("true", *[])

EVALUATE_PNF_ACTION = "evaluate-pnf-action"
ACHIEVE_GOAL_ACTION = "achieve-goal"


class ADLCompiler(Compiler):
    """Compiler of PLTLf goals into PDDL with only ADL constructs."""

    def __init__(
        self,
        domain: Domain,
        problem: Problem,
        formula: Formula,
        from_atoms_to_fluent: Optional[Dict[PLTLAtomic, Predicate]] = None,
        evaluate_pnf: bool = True,
        simplify_disj_goal: bool = False,
    ) -> None:
        """

        Initialize the compiler.

        :param domain: the domain
        :param problem: the problem
        :param formula: the formula
        :param from_atoms_to_fluent: optional mapping from atoms to fluent
        :param evaluate_pnf: if True, update domain action using the "check" optimization
        :param simplify_disj_goal: if True, delete disjunction in goal
        """
        super().__init__(domain, problem, formula, from_atoms_to_fluent)

        if isinstance(self.formula, FalseFormula):
            raise ProblemUnsolvableException(
                "The goal formula can be simplified to FALSE. The problem admits no solution."
            )

        self._fresh_atoms = None
        self._before_mapping = None
        self.evaluate_pnf = evaluate_pnf
        self._before_dictionary: Optional[Dict[BeforeAtom, Atomic]] = None
        self.goal_predicate = GOAL_PREDICATE
        self.check_predicate = CHECK_PREDICATE
        self.simplify_disj_goal = simplify_disj_goal

    @property
    def result(self) -> Tuple[Domain, Problem]:
        """Get the result."""
        if self._result_domain is None or self._result_problem is None:
            raise ValueError("compilation not executed yet")
        return self._result_domain, self._result_problem

    def compile(self):
        """Compute the new domain and the new problem."""
        if self._executed:
            return
        self._executed = True

        cm = CompilationManager(self.formula)
        new_fluents, new_effs, new_goal = cm.get_problem_extension()
        new_fluents.append(TRUE_ATOM)
        self._fresh_atoms = set(new_fluents)
        self._before_mapping = cm._gen_before_mapping()
        self._before_dictionary = cm.before_dictionary

        self._compile_domain(new_fluents, new_effs, new_goal)
        self._compile_problem()
        return self.result

    def _compile_domain(self, new_fluents, new_effs, new_goal):
        """Compute the new domain."""
        new_predicates = [self.pylogics2pddl(fluent) for fluent in new_fluents]
        new_whens_pos = [self.effect_conversion(eff, positive=True) for eff in new_effs]
        new_whens_neg = [
            self.effect_conversion(eff, positive=False) for eff in new_effs
        ]
        new_whens = new_whens_pos + new_whens_neg
        if self.evaluate_pnf:
            domain_actions = _update_domain_actions_with_check(
                self, new_whens, new_predicates
            )
            precond = And(self.pylogics2pddl(new_goal), self.check_predicate)
            new_predicates = [
                *self.domain.predicates,
                *new_predicates,
                self.goal_predicate,
                self.check_predicate,
            ]
        else:
            domain_actions = _update_domain_actions(
                self, self.domain.actions, new_whens
            )
            precond = self.pylogics2pddl(new_goal)
            new_predicates = [
                *self.domain.predicates,
                *new_predicates,
                self.goal_predicate,
            ]

        if self.simplify_disj_goal:
            achieve_goaL_actions = delete_disjunction_in_goal(
                self.goal_predicate,
                _get_achieve_goal_action(self.goal_predicate, precond),
            )
            for a in achieve_goaL_actions:
                domain_actions.add(a)
        else:
            domain_actions.add(_get_achieve_goal_action(self.goal_predicate, precond))

        self._result_domain = Domain(
            name=self.domain.name,
            requirements=[
                *self.domain.requirements,
                Requirements.CONDITIONAL_EFFECTS,
                Requirements.NEG_PRECONDITION,
            ],
            types=self.domain.types,
            constants=self.domain.constants,
            predicates=new_predicates,
            derived_predicates=[*self.domain.derived_predicates],
            actions=domain_actions,
        )

    def _compile_problem(self):
        """Compute the new problem."""
        new_init = set(self.problem.init) | set([TRUE_PREDICATE])
        if self.evaluate_pnf:
            new_init = new_init | set([self.check_predicate])

        self._result_problem = Problem(
            name=self.problem.name,
            domain=self._result_domain,
            domain_name=self.domain.name,
            requirements=self.problem.requirements,
            objects=[*self.problem.objects],
            init=new_init,
            goal=And(self.goal_predicate),
        )

    def effect_conversion(self, effect: Tuple, positive) -> When:
        """Convert effect."""
        condition = self.pylogics2pddl(effect[0])
        effect = self.pylogics2pddl(effect[1])
        if positive:
            return When(condition, effect)
        else:
            return When(Not(condition), Not(effect))

    def pylogics2pddl(self, formula: Formula) -> PddlFormula:
        """Convert pylogics formula into PDDL formula."""
        if isinstance(formula, PropositionalTrue):
            return self.pylogics2pddl(TRUE_ATOM)
        if isinstance(formula, PLTLAtomic):
            if self._fresh_atoms is not None and formula in self._fresh_atoms:
                return (
                    Predicate(self._before_dictionary[formula].name, *[])
                    if isinstance(formula, BeforeAtom)
                    else Predicate(formula.name, *[])
                )
            else:
                predicate = self.from_atoms_to_fluent.get(
                    PLTLAtomic(formula.name), None
                )
                assert predicate is not None
                return predicate

        else:
            assert (
                isinstance(formula, ppltlNot)
                or isinstance(formula, ppltlAnd)
                or isinstance(formula, ppltlOr)
            )

            if isinstance(formula, ppltlNot):
                return Not(self.pylogics2pddl(formula.argument))
            else:
                operands = [self.pylogics2pddl(operand) for operand in formula.operands]
                return (
                    And(*operands) if isinstance(formula, ppltlAnd) else Or(*operands)
                )


def _update_domain_actions_with_check(
    compiler: ADLCompiler, new_effects: Set[When], new_predicates: list
) -> Set[Action]:
    """
    Update domain action using the "check" optimization.

    This optmization works as follows.

        Consider the formula O(a). The standard compilation would yield a compiled action of the form

        (:action ACTION
            Pre: ...
            Eff: ...
                a or "YO(a)" -> "YO(a)"
                not (a or "YO(a)") -> not "YO(a)"
                ...

        The optmized compilation introduced a set of "pnf_i" variables to encapsulate the complex formulas
        deriving from the pnf of a PPLTL formula. Hence, the optimized encodind of the above action becomes:

        (:action ACTION
            Pre: ...
                not evaluate-pnf
            Eff: ...
                1. pnf_0 -> "YO(a)", not pnf_0 -> not "YO(a)"
                2. not pnf_0
                3. evaluate-pnf
                ...

        Effects 1. capture the update the the quoted variable
        Effect 2. deletes all the pnf variables (in this example just pnf_0). This is necessary as each pnf must be
        re-evaluated after the occurence of any action
        Effect 3. forces the planner to execute a special action that evaluates all pnfs. The new precondition
        guarantees that the pnfs get updated after every action.

        The special action that computes the pnf is defined as follows:

        (:action evaluate-pnf-action
            Pre: evaluate-pnf
            Eff:
                a or "YO(a)" -> pnf_0
                not evaluate-pnf

        Notice that "evaluate-pnf" is true in the initial state. Hence, due to the structure of the actions,
        Every trace induced by the domain has the following pattern:

        evaluate-pnf-action, domain-action, evaluate-pnf-action, domain-action, ..., domain-action, achieve-goal

    :param compiler: the ADL compiler
    :param new_effects: the new set of effects
    :param new_predicates: the new set predicates
    :return: the set of actions
    """
    positive_effects = [eff for eff in new_effects if not isinstance(eff.effect, Not)]

    qouted_update_effects = []
    pnf_evaluation_effects = []
    pnf_delete_effects = []

    for eff in positive_effects:
        before_effect = eff.effect
        assert isinstance(before_effect, Predicate)
        pnf_predicate = Predicate(before_effect.name.replace(QUOTED_ATOM, PNF), *[])
        pnf_evaluation_effects.append(When(eff.condition, pnf_predicate))
        pnf_delete_effects.append(Not(pnf_predicate))
        qouted_update_effects.append(When(pnf_predicate, before_effect))
        qouted_update_effects.append(When(Not(pnf_predicate), Not(before_effect)))
        new_predicates.append(pnf_predicate)

    goal_fluent = compiler.goal_predicate
    new_actions = set()
    for action in compiler.domain.actions:
        new_actions.add(
            Action(
                name=action.name,
                parameters=[*action.parameters],
                precondition=And(
                    action.precondition, Not(goal_fluent), Not(compiler.check_predicate)
                ),
                effect=AndEffect(
                    action.effect,
                    *pnf_delete_effects,
                    *qouted_update_effects,
                    compiler.check_predicate,
                ),
            )
        )
    new_actions.add(
        Action(
            name=EVALUATE_PNF_ACTION,
            parameters=[],
            precondition=And(Not(goal_fluent), compiler.check_predicate),
            effect=AndEffect(*pnf_evaluation_effects, Not(compiler.check_predicate)),
        )
    )

    return new_actions


def _update_domain_actions(
    compiler: ADLCompiler, actions: AbstractSet[Action], progression: List[When]
) -> Set[Action]:
    """Update domain actions."""
    new_actions = set()
    for action in actions:
        if isinstance(action.effect, AndEffect):
            eff_list = list(action.effect.operands) + progression
            new_effect = AndEffect(*eff_list)
        else:
            new_effect = AndEffect(action.effect, *progression)
        new_actions.add(
            Action(
                name=action.name,
                parameters=[*action.parameters],
                precondition=And(action.precondition, Not(compiler.goal_predicate)),
                effect=new_effect,
            )
        )
    return new_actions


def delete_disjunction_in_goal(
    goal_predicate: Predicate, achieve_goal_action: Action
) -> List[Action]:
    """
    Delete disjunction in goal.

    :param goal_predicate: the goal predicate
    :param achieve_goal_action: the achieve goal action
    :return: the set of actions
    """
    pre = achieve_goal_action.precondition
    nnf_pre = nnf(pre)
    dnf_pre = dnf(nnf_pre)
    new_achieve_goal_actions = []
    i = 0
    for conj in dnf_pre.operands:
        new_achieve_goal_action = _get_achieve_goal_action(
            goal_predicate, conj, name=ACHIEVE_GOAL_ACTION + f"_{i}"
        )
        new_achieve_goal_actions.append(new_achieve_goal_action)
        i += 1

    return new_achieve_goal_actions


def _get_achieve_goal_action(
    goal_predicate: Predicate, precond: PddlFormula, name=ACHIEVE_GOAL_ACTION
) -> Action:
    """Get achieve goal action."""
    return Action(
        name=name,
        parameters=[],
        precondition=precond,
        effect=AndEffect(goal_predicate),
    )
