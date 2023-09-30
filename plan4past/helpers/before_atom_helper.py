"""This module contains the data structure that represents a "before atom"."""

from pylogics.syntax.base import Formula
from pylogics.syntax.pltl import Atomic, Before, Once, Since

QUOTED_ATOM = "quoted"


class BeforeAtom(Atomic):
    """
    Data strucure that represents a "before atom".

    Example 1: for H(a) we will have "Y_H(a)"
    Example 2: for Y(O(a)) we will have "Y_O(a)"
    """

    def __init__(self, formula: Formula) -> None:
        """
        Initialize a before atom.

        The "formula" is the PPLTL formula in the scope of the before (quoted) atom.

        For example, with formula = (a S b) we have a before atom representing "Y(a S b)"

        :param formula: the formula to be quoted
        """
        self.formula = formula
        self.hash = hash((self.__class__, self.formula))
        super().__init__(f"{QUOTED_ATOM}_{self.hash}")

    def __hash__(self) -> int:
        """Compute the hash."""
        return self.hash

    def __eq__(self, __o: object) -> bool:
        """Compare with another object."""
        return isinstance(__o, BeforeAtom) and hash(__o) == self.hash

    def __str__(self) -> str:
        """Get the string representation."""
        return f'"Y_{str(self.formula)}"'

    def __repr__(self) -> str:
        """Get an unambiguous string representation."""
        return f'"Y{self.formula}"'


def Yatom_(formula: Formula):
    """
    Construct the before atom.

    :param formula: the formula to be quoted
    :return: the "before" atom
    """
    return BeforeAtom(formula)


def get_before_atom(formula: Formula) -> BeforeAtom:
    """
    Get the before atom from a formula.

    This function distinguishes between the "before" atom and the other PPLTL operators.

    :param formula: the formula to be quoted
    :return: the "before" atom
    """
    if isinstance(formula, Before):
        return Yatom_(formula.argument)
    else:
        assert isinstance(formula, Once) or isinstance(formula, Since)
        return Yatom_(formula)
