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
from plan4past.utils.before_generator_visitor import get_quoted_dictionary
from plan4past.utils.ppnf_visitor import ppnf


def is_temporal_operator(formula: Formula) -> bool:
    """
    Check if the formula is a temporal operator.

    :param formula: the formula to be checked
    :return: True if the formula is a temporal operator, False otherwise
    """
    return (
        isinstance(formula, Once)
        or isinstance(formula, Before)
        or isinstance(formula, Since)
    )


def is_unary_op(formula: Formula) -> bool:
    """
    Check if the formula is a unary operator.

    :param formula: the formula to be checked
    :return: True if the formula is a unary operator, False otherwise
    """
    return (
        isinstance(formula, Once)
        or isinstance(formula, Before)
        or isinstance(formula, Not)
    )


def is_atomic_formula(formula: Formula) -> bool:
    """
    Check if the formula is an atomic formula.

    :param formula: the formula to be checked
    :return: True if the formula is an atomic formula, False otherwise
    """
    return (
        isinstance(formula, Atomic)
        or isinstance(formula, PropositionalTrue)
        or isinstance(formula, PropositionalFalse)
    )


class CompilationManager:
    """Class that manages the compilation of a PPLTL formula."""

    def __init__(self, phi: Formula) -> None:
        """
        Initialize the compilation manager.

        :param phi: the PPLTL formula to be compiled
        """
        self.phi = phi
        self.before_dictionary = get_quoted_dictionary(phi)

    def _gen_before_mapping(self) -> str:
        """
        Generate the mapping of the before atoms.

        :return: the mapping of the before atoms
        """
        before_mapping = []
        for key, value in self.before_dictionary.items():
            before_mapping.append(f"; {str(key)}: {str(value)}")

        return "\n".join(before_mapping)

    def get_problem_extension(self) -> Tuple[List[BeforeAtom], List, Formula]:
        """
        Get the problem extension.

        :return: the problem extension
        """
        goal = ppnf(self.phi)
        fresh_atoms = []
        conditional_effects = []

        for before_atom in self.before_dictionary.keys():
            assert isinstance(before_atom, BeforeAtom)
            fresh_atoms.append(before_atom)
            conditional_effects.append((ppnf(before_atom.formula), before_atom))

        return fresh_atoms, conditional_effects, goal
