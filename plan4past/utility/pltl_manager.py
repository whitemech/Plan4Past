NOT = 'not'
AND = 'and'
OR = 'or'


SINCE = 'S'
TRIGGERS = 'T'
HISTORICALLY = 'H'
ONCE = 'O'
BEFORE = 'Y'
WEAKBEFORE = 'Z'

OPERATORS = [SINCE, TRIGGERS, HISTORICALLY, ONCE, BEFORE, WEAKBEFORE, AND, NOT, OR]


UNKNOWN_OP = "Unknown operator {operator}!"

BINARY_OP_ERROR = "Operator {operator} requires two arguments!"
UNARY_OP_ERROR = "Operator {operator} must have one argument!"

def isBinaryOp(operator):
    if operator in [SINCE, TRIGGERS, AND, OR]:
        return True
    elif operator in [HISTORICALLY, ONCE, BEFORE, WEAKBEFORE, NOT]:
        return False
    else:
        raise Exception(UNKNOWN_OP.format(operator))

class Formula:

    def __init__(self) -> None:
        pass

    def __hash__(self) -> int:
        return self.hash

    def __eq__(self, __o: object) -> bool:
        return self.hash == __o.hash

class Expression(Formula):

    def __init__(self, arg1, operator, arg2=None) -> None:

        if operator not in OPERATORS:
            raise(Exception(UNKNOWN_OP.format(operator=operator)))

        if isBinaryOp(operator) and arg2 is None:
            raise(Exception(BINARY_OP_ERROR.format(operator=operator)))
        
        if not isBinaryOp(operator) and arg2 is not None:
           raise(Exception(UNARY_OP_ERROR.format(operator=operator)))
        
        self.arg1 = arg1
        self.arg2 = arg2
        self.operator = operator
        self.hash = hash((self.operator, self.arg1, self.arg2))

    def __str__(self) -> str:
        if not isBinaryOp(self.operator):
            return f'({self.operator} {str(self.arg1)})'
        else:
            return f'({self.operator} {str(self.arg1)} {str(self.arg2)})'
    
    def __repr__(self) -> str:
        if not isBinaryOp(self.operator):
            return f"{self.operator}({self.arg1})"
        else:
            return f"{self.operator}({self.arg1}, {self.arg2})"

# class TrueFormula(Formula):

#     def __init__(self) -> None:
#         super().__init__()
#         self.hash = hash((self.__class__))
    
# class FalseFormula(Formula):

#     def __init__(self) -> None:
#         super().__init__()
#         self.hash = hash((self.__class__))


class Atom(Formula):

    def __init__(self, atom) -> None:
        self.atom = atom
        self.hash = hash((self.__class__, self.atom))

    def __str__(self) -> str:
        return f'({self.atom})'
    
    def __repr__(self) -> str:
        return f'Atom({self.atom})'
        

def isTemporal(phi):
    if isinstance(phi, Atom):
        return False
    else:
        assert isinstance(phi, Expression)
        if phi.operator in [SINCE, TRIGGERS, HISTORICALLY, ONCE, BEFORE, WEAKBEFORE]:
            return True
        else:
            if phi.operator in [AND, OR]:
                return isTemporal(phi.arg1) or isTemporal(phi.arg2)
            else:
                assert phi.operator == NOT
                return isTemporal(phi.arg1)


def get_before_atom(formula: Expression):

    assert isinstance(formula, Expression)
    
    if formula.operator in [BEFORE, WEAKBEFORE]:
        return YesterdayAtom(formula.arg1)
    
    else:
        assert formula.operator in [HISTORICALLY, ONCE, SINCE, TRIGGERS]
        return YesterdayAtom(formula)

class YesterdayAtom(Atom):

    '''
    Data strucure that represents a "yesterday atom"
    Example1: for H(a) we will have "Y_H(a)"
    Example2: for Y(O(a)) we will have "Y_O(a)"
    '''        

    def __init__(self, formula) -> None:
        atom = f'Y{str(formula)}'
        super().__init__(atom)
        self.formula = formula
        self.id = id
        self.hash = hash((self.__class__, self.formula))

    def __hash__(self) -> int:
        return self.hash

    def __eq__(self, __o: object) -> bool:
        return isinstance(__o, YesterdayAtom) and hash(__o) == self.hash

    def __str__(self) -> str:
        return f'"Y_{str(self.formula)}"'

    def __repr__(self) -> str:
        return f'"Y{self.formula}"'