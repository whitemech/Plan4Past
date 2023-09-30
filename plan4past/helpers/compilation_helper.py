from pylogics.syntax.base import *
from pylogics.syntax.pltl import *

from plan4past.helpers.before_atom_helper import *
from plan4past.utils.before_generator_visitor import get_quoted_dictionary
from plan4past.utils.ppnf_visitor import ppnf


def is_temporal_operator(formula: Formula) -> bool:
    return (
        isinstance(formula, Once)
        or isinstance(formula, Before)
        or isinstance(formula, Since)
    )


def is_unary_op(formula: Formula) -> bool:
    return (
        isinstance(formula, Once)
        or isinstance(formula, Before)
        or isinstance(formula, Not)
    )


def is_atomic_formula(formula: Formula) -> bool:
    return (
        isinstance(formula, Atomic)
        or isinstance(formula, PropositionalTrue)
        or isinstance(formula, PropositionalFalse)
    )


class CompilationManager:
    def __init__(self, phi: Formula) -> None:
        self.phi = phi
        self.before_dictionary = get_quoted_dictionary(phi)

    def _gen_before_mapping(self):
        before_mapping = []
        for key, value in self.before_dictionary.items():
            before_mapping.append(f"; {str(key)}: {str(value)}")

        return "\n".join(before_mapping)

    def get_problem_extension(self):
        goal = ppnf(self.phi)
        fresh_atoms = []
        conditional_effects = []

        for before_atom in self.before_dictionary.keys():
            assert isinstance(before_atom, BeforeAtom)
            fresh_atoms.append(before_atom)
            conditional_effects.append((ppnf(before_atom.formula), before_atom))

        return fresh_atoms, conditional_effects, goal
