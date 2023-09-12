from pylogics.syntax.pltl import *
from pylogics.syntax.base import *
from plan4past.utils.predicates_visitor import replace_symbols
from pylogics.utils.to_string import to_string

def isTemporal(phi: Formula):
    if isinstance(phi, Atomic):
        return False
    else:
        if isinstance(phi, Historically) or \
            isinstance(phi, Since) or isinstance(phi, Once) or isinstance(phi, Before):
            return True
        else:
            if isinstance(phi, And) or isinstance(phi, Or):
                return isTemporal(phi.operands[0]) or isTemporal(phi.operands[1])
            else:
                assert isinstance(phi, Not)
                return isTemporal(phi.argument)


def get_before_atom(formula: Formula):

    assert isinstance(formula, Formula)
    
    if isinstance(formula, Before):
        return YesterdayAtom(formula.argument)
    
    else:
        assert isinstance(formula, Once) or \
                isinstance(formula, Historically) or \
                isinstance(formula, Since)
        return YesterdayAtom(formula)

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