from typing import AbstractSet, Dict, Optional, Set, Tuple

from pddl.core import Action, Domain, Problem, Requirements
from pddl.logic import Constant, constants
from pylogics.syntax.base import And, Or, Not

from pddl.logic.base import And as pddlAnd 
from pddl.logic.base import Or as pddlOr 
from pddl.logic.base import Not as pddlNot 

from pddl.logic.effects import AndEffect, When
from pddl.logic.predicates import Predicate
from pylogics.syntax.base import Formula, Logic
from pylogics.syntax.pltl import Atomic as PLTLAtomic, PropositionalFalse, PropositionalTrue, FalseFormula
from plan4past.helpers.compilation_helper import CompilationManager, QUOTED_ATOM, YesterdayAtom
from plan4past.utils.atoms_visitor import find_atoms
from plan4past.utils.rewrite_formula_visitor import rewrite
 
def default_mapping(f: Formula) -> Dict[PLTLAtomic, Predicate]:
    """Compute mapping from atoms to fluents using underscores."""
    symbols = find_atoms(f)
    from_atoms_to_fluents = dict()
    for symbol in symbols:
        name, *cons = symbol.name.split("_")
        if cons:
            from_atoms_to_fluents[symbol] = Predicate(name, *constants(" ".join(cons)))
        else:
            from_atoms_to_fluents[symbol] = Predicate(name)
    return from_atoms_to_fluents

    
def compile_with_pddl_library(domain: Domain, problem: Problem, formula: Formula, nopex = False, from_atoms_to_fluent: Optional[Dict[PLTLAtomic, Predicate]] = None):
    compiler = Compiler(domain, problem, formula, from_atoms_to_fluent=from_atoms_to_fluent)
    if nopex:
        compiler.evaluate_pnf = False
    compiler.compile()
    compiled_domain, compiled_problem, before_mapping = compiler.result
    return compiled_domain, compiled_problem, before_mapping

class ProblemUnsolvableException(Exception):

    def __init__(self, *args: object) -> None:
        super().__init__(*args)

class Compiler:
    """Compiler of PLTLf goals into PDDL."""

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

        assert self.formula.logic == Logic.PLTL, "only PLTL is supported!"

        if isinstance(self.formula, FalseFormula):
            raise ProblemUnsolvableException("The goal formula can be simplified to FALSE. The problem admits no solution.")

        self._nondeterministic: bool = self._is_deterministic(self.domain)
        self._executed: bool = False
        self._result_domain = None
        self._result_problem = None
        self._fresh_atoms = None
        self._before_mapping = None
        self.evaluate_pnf = True
        self._before_dictionary = None
        self.goal_fluent = Predicate("goal", *[])
        self.do_sync = Predicate('evaluate-pex')

    @staticmethod
    def _is_deterministic(domain: Domain):
        """Check if domain is non-deterministic."""
        return True if Requirements.NON_DETERMINISTIC in domain.requirements else False

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
        return self._result_domain, self._result_problem, self._before_mapping

    def compile(self):
        """Compute the new domain and the new problem."""
        if self._executed:
            return self.result
        self._executed = True

        cm = CompilationManager(self.formula)
        new_fluents, new_effs, new_goal = cm.get_problem_extension()
        new_fluents.append(PLTLAtomic('true'))
        self._fresh_atoms = set(new_fluents)
        self._before_mapping = cm._gen_before_mapping()
        self._before_dictionary = cm.before_dictionary

        self._compile_domain(new_fluents, new_effs, new_goal)
        self._compile_problem()

    def _compile_domain(self, new_fluents, new_effs, new_goal):
        """Compute the new domain."""
        new_predicates = [self.formula_conversion(fluent) for fluent in new_fluents]
        new_whens_pos = [self.effect_conversion(eff, positive=True) for eff in new_effs]
        new_whens_neg = [self.effect_conversion(eff, positive=False) for eff in new_effs]
        new_whens = new_whens_pos + new_whens_neg
        #new_whens = _compute_whens(self.formula)
        if self.evaluate_pnf:
            domain_actions = _update_domain_actions_det_evaluate_pnf(self, new_whens, new_predicates)
            precond = pddlAnd(self.formula_conversion(new_goal), self.do_sync)
            new_predicates = [*self.domain.predicates, *new_predicates, self.goal_fluent, self.do_sync]
        else:
            domain_actions = _update_domain_actions_det(self.domain.actions, new_whens)
            precond = self.formula_conversion(new_goal)
            new_predicates = [*self.domain.predicates, *new_predicates, self.goal_fluent]

        domain_actions.add(
        Action(
            name="achieve-goal",
            parameters=[],
            precondition=precond,
            effect=AndEffect(self.goal_fluent),
        )
        )

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
            derived_predicates=[
                *self.domain.derived_predicates
            ],
            actions=domain_actions,
        )

    def _compile_problem(self):
        """Compute the new problem."""
        new_init = set(self.problem.init) | set([Predicate('true', *[])])
        if self.evaluate_pnf:
            new_init = new_init | set([self.do_sync])

        self._result_problem = Problem(
            name=self.problem.name,
            domain=self._result_domain,
            domain_name=self.domain.name,
            requirements=self.problem.requirements,
            objects=[*self.problem.objects],
            init=new_init,
            goal=pddlAnd(self.goal_fluent)
            )


    def effect_conversion(self, effect: Tuple, positive):
        condition = self.formula_conversion(effect[0])
        effect = self.formula_conversion(effect[1])
        if positive:
            return When(condition, effect)
        else:
            return When(pddlNot(condition), pddlNot(effect))
    

    def formula_conversion(self, formula):
        if isinstance(formula, PropositionalTrue):
            return self.formula_conversion(PLTLAtomic('true'))
        if isinstance(formula, PLTLAtomic):
            if formula in self._fresh_atoms:
                if isinstance(formula, YesterdayAtom):
                    assert isinstance(self._before_dictionary[formula], PLTLAtomic)
                    return Predicate(self._before_dictionary[formula].name, *[])
                else:
                    return Predicate(formula.name, *[])
            else:
                predicate = self.from_atoms_to_fluent.get(PLTLAtomic(formula.name), None)
                assert predicate is not None
                return predicate
        
        else:
            assert isinstance(formula, Formula) 

            if isinstance(formula, And):
                return pddlAnd(*[self.formula_conversion(operand) for operand in formula.operands])

            elif isinstance(formula, Or):
                return pddlOr(*[self.formula_conversion(operand) for operand in formula.operands])
            
            elif isinstance(formula, Not):
                return pddlNot(self.formula_conversion(formula.argument))

            else:
                # Should raise an exception here
                assert False


def _update_domain_actions_det_evaluate_pnf(compiler: Compiler, new_effects: Set[When], new_predicates) -> Set[Action]:
    """Update domain action when domain is deterministic."""

    positive_effects = [eff for eff in new_effects if not isinstance(eff.effect, pddlNot)]

    before_effects = []
    pex_evaluation_effects = []
    pex_delete_effects = []
    pex_predicates = set([])
    
    for eff in positive_effects:
        before_effect = eff.effect
        assert isinstance(before_effect, Predicate)
        pex = Predicate(before_effect.name.replace(QUOTED_ATOM, 'pex'), *[])
        pex_evaluation_effects.append(When(eff.condition, pex))
        pex_delete_effects.append(pddlNot(pex))
        before_effects.append(When(pex, before_effect))
        before_effects.append(When(pddlNot(pex), pddlNot(before_effect)))
        new_predicates.append(pex)
        
    goal_fluent = Predicate("goal", *[])
    new_actions = set()
    for action in compiler.domain.actions:
        new_actions.add(
            Action(
                name=action.name,
                parameters=[*action.parameters],
                precondition=pddlAnd(action.precondition, pddlNot(goal_fluent), pddlNot(compiler.do_sync)),
                effect=AndEffect(action.effect, *pex_delete_effects, *before_effects, compiler.do_sync),
            )
        )
    new_actions.add(
            Action(
                name='evaluate-pex',
                parameters=[],
                precondition=pddlAnd(pddlNot(goal_fluent), compiler.do_sync),
                effect=AndEffect(*pex_evaluation_effects, pddlNot(compiler.do_sync)),
            )
        )
    
    return new_actions

def _update_domain_actions_det(
    actions: AbstractSet[Action], progression: Set[When]
) -> Set[Action]:
    """Update domain action when domain is deterministic."""
    goal_fluent = Predicate("goal", *[])
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
                precondition=pddlAnd(action.precondition, pddlNot(goal_fluent)),
                effect=new_effect,
            )
        )
    return new_actions
