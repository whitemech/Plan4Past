from pylogics.syntax.pltl import (
    Atomic,
    Before,
    Historically,
    Once,
    TrueFormula,
    PropositionalFalse,
    PropositionalTrue,
    Since,
    Start,
)

from pylogics.syntax.base import (
    And,
    Equivalence,
    Formula,
    Implies,
    Logic,
    Not,
    Or,
    make_boolean,
)

from plan4past.utility.shortcuts import *
import functools
from functools import singledispatch

def parse_conjunction_disjunction_list(operands, fun):
    '(and (a) (b) (c) (d)) -> AND(a, AND(b, AND(c, d)))'
    '(or (a) (b) (c) (d))  -> OR(a, OR(b, OR(c, d)))'
    parts = [conversion(operands[i]) for i in range(len(operands))]
    current_logic_expr = fun(parts[len(parts)-2], parts[len(parts)-1])
    for i in reversed(range(len(parts) - 2)):
        current_logic_expr = fun(parts[i], current_logic_expr)
    return current_logic_expr


@singledispatch
def conversion(formula: Formula):
    raise NotImplementedError("handler not implemented for formula %s" % type(formula))

@conversion.register
def conversion_atomic(_formula: Atomic):
    return atom(_formula.name)

@conversion.register
def conversion_and(_formula: And):
    return parse_conjunction_disjunction_list(_formula.operands, land)

@conversion.register
def conversion_or(_formula: Or):
    return parse_conjunction_disjunction_list(_formula.operands, lor)

@conversion.register
def conversion_true_formula(_formula: PropositionalTrue):
    return atom('true')

@conversion.register
def conversion_not(_formula: Not):
    return lnot(conversion(_formula.argument))

@conversion.register
def conversion_before(_formula: Before):
    return Y(conversion(_formula.argument))

@conversion.register
def conversion_once(_formula: Once):
    return O(conversion(_formula.argument))

@conversion.register
def conversion_historically(_formula: Historically):
    return H(conversion(_formula.argument))

@conversion.register
def conversion_since(_formula: Since):
    assert len(_formula.operands) == 2
    return S(conversion(_formula.operands[0]), conversion(_formula.operands[1]))