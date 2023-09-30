from functools import singledispatch

from pylogics.syntax.base import *
from pylogics.syntax.pltl import (
    Before,
    Once,
    PropositionalFalse,
    PropositionalTrue,
    Since,
)

from plan4past.helpers.before_atom_helper import *
from plan4past.utils.ppnf_visitor import ppnf

"""
    Generation of the before atoms needed for the compilation. 
    Example 1: for "H(a) or (b S H(c))" we need to create before_H(a), before_H(c) and before_(b S H(c))
    Example 2: for "H(a) or (b S H(a))" we need to create before_H(a) and before_(b S H(a))
    Before atoms are kept in a dictionary <key, value> where:
        - key is a pltl formula
        - value is the before associated with such formula
    To make the resulting compiled problems more readable, before atoms feautre unique numbers instead of the temporal formula.
    Therefore, in exaple 2 we generate before_1 and before_2
    """


class BeforeGenerator:
    def __init__(self) -> None:
        self.before_dictionary = {}
        self.before_id = 0

    def add_qouted_atom(self, before_atom: BeforeAtom):
        if self.before_dictionary.get(before_atom) is None:
            self.before_dictionary[before_atom] = Atomic(
                f"{QUOTED_ATOM}_{self.before_id}"
            )
            self.before_id += 1


def get_quoted_dictionary(phi: Formula) -> Dict[BeforeAtom, Atomic]:
    before_gen = BeforeGenerator()
    populate_dictionary(phi, before_gen)
    return before_gen.before_dictionary


@singledispatch
def populate_dictionary(formula: object, before_gen: BeforeGenerator) -> None:
    """Compute the derived predicate for a formula."""
    raise NotImplementedError(f"handler not implemented for object {type(formula)}")


@populate_dictionary.register
def _(_formula: Atomic, _before_gen: BeforeGenerator) -> None:
    """Populate dictionary for an atomic formula."""
    pass


@populate_dictionary.register
def _(_formula: PropositionalTrue, _before_gen: BeforeGenerator) -> None:
    """Populate dictionary for an atomic formula."""
    pass


@populate_dictionary.register
def _(_formula: PropositionalFalse, _before_gen: BeforeGenerator) -> None:
    """Populate dictionary for an atomic formula."""
    pass


@populate_dictionary.register
def _(formula: Not, before_gen: BeforeGenerator) -> None:
    """Populate dictionary for a Not formula."""
    populate_dictionary(formula.argument, before_gen)


@populate_dictionary.register
def _(formula: Once, before_gen: BeforeGenerator) -> None:
    """Populate dictionary for a Once formula."""
    before_gen.add_qouted_atom(get_before_atom(formula))
    populate_dictionary(formula.argument, before_gen)


@populate_dictionary.register
def _(formula: Before, before_gen: BeforeGenerator) -> None:
    """Populate dictionary for a Before formula."""
    before_gen.add_qouted_atom(get_before_atom(formula))
    populate_dictionary(formula.argument, before_gen)


@populate_dictionary.register
def _(formula: Since, before_gen: BeforeGenerator) -> None:
    """Populate dictionary for a Before formula."""
    before_gen.add_qouted_atom(get_before_atom(formula))
    populate_dictionary(formula.operands[0], before_gen)
    populate_dictionary(formula.operands[1], before_gen)


@populate_dictionary.register
def _(formula: And, before_gen: BeforeGenerator) -> None:
    """Populate dictionary for an And formula."""
    for operand in formula.operands:
        populate_dictionary(operand, before_gen)


@populate_dictionary.register
def _(formula: Or, before_gen: BeforeGenerator) -> None:
    """Populate dictionary for an Or formula."""
    for operand in formula.operands:
        populate_dictionary(operand, before_gen)
