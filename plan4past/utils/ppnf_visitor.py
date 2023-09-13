from plan4past.helpers.quoted_atom_helper import get_before_atom
from functools import singledispatch
from pylogics.syntax.pltl import *
from pylogics.syntax.base import *

@singledispatch
def ppnf(obj: object) -> Formula:
    """Computes the ppnf of a formula"""
    raise ValueError(f"object of type {type(obj)} is not supported by this function")

@ppnf.register
def _(phi: Atomic) -> Formula:
    """Computes the ppnf of an atom"""
    return phi

@ppnf.register
def _(phi: PropositionalTrue) -> Formula:
    """Computes the ppnf of the formula true"""
    return phi

@ppnf.register
def _(phi: PropositionalFalse) -> Formula:
    """Computes the ppnf of the formula false"""
    return phi

@ppnf.register
def _(phi: Not) -> Formula:
    """Computes the ppnf of a negation"""
    return Not(ppnf(phi.argument))

@ppnf.register
def _(phi: Before) -> Formula:
    """Computes the ppnf of a Before"""
    return get_before_atom(phi)

@ppnf.register
def _(phi: And) -> Formula:
    """Computes the ppnf of a conjunction"""
    return And(*[ppnf(operand) for operand in phi.operands])

@ppnf.register
def _(phi: Or) -> Formula:
    """Computes the ppnf of a disjunction"""
    return Or(*[ppnf(operand) for operand in phi.operands])

@ppnf.register
def _(phi: Once) -> Formula:
    """Computes the ppnf of a Once"""
    return Or(ppnf(phi.argument), get_before_atom(phi))

@ppnf.register
def _(phi: Since) -> Formula:
    """Computes the ppnf of a Since"""
    return Or(ppnf(phi.operands[1]), And(ppnf(phi.operands[0]), get_before_atom(phi)))