from pylogics.syntax.base import *
from pylogics.syntax.pltl import *

QUOTED_ATOM = "quoted"


class BeforeAtom(Atomic):

    """
    Data strucure that represents a "before atom"
    Example1: for H(a) we will have "Y_H(a)"
    Example2: for Y(O(a)) we will have "Y_O(a)"
    """

    def __init__(self, formula: Formula) -> None:
        """
        "formula" is the PPLTL formula in the scoper of the before (quoted) atom.
        For example, with formula = (a S b) we have a before atom representing "Y(a S b)"
        """
        self.formula = formula
        self.hash = hash((self.__class__, self.formula))
        super().__init__(f"{QUOTED_ATOM}_{self.hash}")

    def __hash__(self) -> int:
        return self.hash

    def __eq__(self, __o: object) -> bool:
        return isinstance(__o, BeforeAtom) and hash(__o) == self.hash

    def __str__(self) -> str:
        return f'"Y_{str(self.formula)}"'

    def __repr__(self) -> str:
        return f'"Y{self.formula}"'


def Yatom_(formula):
    return BeforeAtom(formula)


def get_before_atom(formula: Formula):
    if isinstance(formula, Before):
        return Yatom_(formula.argument)
    else:
        assert isinstance(formula, Once) or isinstance(formula, Since)
        return Yatom_(formula)
