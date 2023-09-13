from pylogics.syntax.pltl import *
from pylogics.syntax.base import *


class YesterdayAtom(Atomic):

    '''
    Data strucure that represents a "yesterday atom"
    Example1: for H(a) we will have "Y_H(a)"
    Example2: for Y(O(a)) we will have "Y_O(a)"
    '''        

    def __init__(self, formula) -> None:
        self.formula = formula
        self.hash = hash((self.__class__, self.formula))
        super().__init__(f'quoted_{self.hash}')

    def __hash__(self) -> int:
        return self.hash

    def __eq__(self, __o: object) -> bool:
        return isinstance(__o, YesterdayAtom) and hash(__o) == self.hash

    def __str__(self) -> str:
        return f'"Y_{str(self.formula)}"'

    def __repr__(self) -> str:
        return f'"Y{self.formula}"'
    

def Yatom_(formula):
    return YesterdayAtom(formula)

QUOTED_ATOM = "quoted"

def get_before_atom(formula: Formula):
    
    if isinstance(formula, Before):
        return Yatom_(formula.argument)
    else:
        assert isinstance(formula, Once) or isinstance(formula, Since)
        return Yatom_(formula)