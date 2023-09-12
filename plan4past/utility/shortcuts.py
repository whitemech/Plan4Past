from plan4past.utility.ppltl_manager import *
from pylogics.syntax.base import And, Or
from pylogics.syntax.pltl import *

def nary2binary(operands, fun):
    '(and (a) (b) (c) (d)) -> AND(a, AND(b, AND(c, d)))'
    '(or (a) (b) (c) (d))  -> OR(a, OR(b, OR(c, d)))'
    parts = [operands[i] for i in range(len(operands))]
    current_logic_expr = fun(parts[len(parts)-2], parts[len(parts)-1])
    for i in reversed(range(len(parts) - 2)):
        current_logic_expr = fun(parts[i], current_logic_expr)
    return current_logic_expr

def Yatom_(formula):
    return YesterdayAtom(formula)

# def to_nnf(formula):

#     if isinstance(formula, Atom):
#         return formula
    
#     elif formula.operator == NOT and isinstance(formula.arg1, Atom):
#         return formula

#     elif formula.operator != NOT:
#         phi1 = to_nnf(formula.arg1)
#         if isBinaryOp(formula.operator):
#             phi2 = to_nnf(formula.arg2)
#             return Expression(operator=formula.operator, arg1=phi1, arg2=phi2)
#         else:
#             return Expression(operator=formula.operator, arg1=phi1)
#     else:

#         negated_formula = formula.arg1

#         if negated_formula.operator == AND:
#             phi1 = to_nnf(lnot(negated_formula.arg1))
#             phi2 = to_nnf(lnot(negated_formula.arg2))
#             return lor(phi1, phi2)

#         elif negated_formula.operator == OR:
#             phi1 = to_nnf(lnot(negated_formula.arg1))
#             phi2 = to_nnf(lnot(negated_formula.arg2))
#             return land(phi1, phi2)

#         elif negated_formula.operator == SINCE:
#             phi1 = to_nnf(lnot(negated_formula.arg1))
#             phi2 = to_nnf(lnot(negated_formula.arg2))
#             return T(phi1, phi2)

#         elif negated_formula.operator == TRIGGERS:
#             phi1 = to_nnf(lnot(negated_formula.arg1))
#             phi2 = to_nnf(lnot(negated_formula.arg2))
#             return S(phi1, phi2)

#         elif negated_formula.operator == ONCE:
#             phi1 = to_nnf(lnot(negated_formula.arg1))
#             return H(phi1)

#         elif negated_formula.operator == HISTORICALLY:
#             phi1 = to_nnf(lnot(negated_formula.arg1))
#             return O(phi1)

#         elif negated_formula.operator == BEFORE:
#             phi1 = to_nnf(lnot(negated_formula.arg1))
#             return Z(phi1)
        
#         elif negated_formula.operator == WEAKBEFORE:
#             phi1 = to_nnf(lnot(negated_formula.arg1))
#             return Y(phi1)

#         elif negated_formula.operator == NOT:
#             return to_nnf(negated_formula.arg1)

#         else:
#             raise UNKNOWN_OP.format(negated_formula.operator)