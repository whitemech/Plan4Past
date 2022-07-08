# -*- coding: utf-8 -*-
#
# Copyright 2021 Francesco Fuggitti, Marco Favorito
#
# ------------------------------
#
# This file is part of planning-with-past.
#
# planning-with-past is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# planning-with-past is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with planning-with-past.  If not, see <https://www.gnu.org/licenses/>.
#

"""Rewrite the formula with basic operators visitor."""
from functools import singledispatch

from pylogics.syntax.base import And as PLTLAnd
from pylogics.syntax.base import Formula
from pylogics.syntax.base import Not as PLTLNot
from pylogics.syntax.base import Or as PLTLOr
from pylogics.syntax.base import _UnaryOp
from pylogics.syntax.pltl import Atomic as PLTLAtomic
from pylogics.syntax.pltl import Before, Historically, Once, Since


def rewrite_unaryop(f: _UnaryOp):
    return rewrite(f.argument)


@singledispatch
def rewrite(formula: Formula) -> Formula:
    raise NotImplementedError("handler not implemented for formula %s" % type(formula))


@rewrite.register
def rewrite_atomic(formula: PLTLAtomic) -> Formula:
    """Compute the basic formula for an atomic formula."""
    return formula


@rewrite.register
def rewrite_and(formula: PLTLAnd) -> Formula:
    """Compute the basic formula for an And formula."""
    sub = [rewrite(f) for f in formula.operands]
    return PLTLAnd(*sub)


@rewrite.register
def rewrite_or(formula: PLTLOr) -> Formula:
    """Compute the basic formula for an Or formula."""
    sub = [rewrite(f) for f in formula.operands]
    return PLTLOr(*sub)


@rewrite.register
def rewrite_not(formula: PLTLNot) -> Formula:
    """Compute the basic formula for a Not formula."""
    sub = rewrite_unaryop(formula)
    return PLTLNot(sub)


@rewrite.register
def rewrite_before(formula: Before) -> Formula:
    """Compute the basic formula for a Before (Yesterday) formula."""
    sub = rewrite_unaryop(formula)
    return Before(sub)


@rewrite.register
def rewrite_since(formula: Since) -> Formula:
    """Compute the basic formula for a Since formula."""
    if len(formula.operands) != 2:
        head = formula.operands[0]
        tail = Since(*formula.operands[1:])
        return rewrite(Since(head, tail))
    sub = [rewrite(f) for f in formula.operands]
    return Since(*sub)


@rewrite.register
def rewrite_once(formula: Once) -> Formula:
    """Compute the basic formula for a Once formula."""
    sub = rewrite_unaryop(formula)
    return Once(sub)


@rewrite.register
def rewrite_historically(formula: Historically) -> Formula:
    """Compute the basic formula for a Historically formula."""
    return PLTLNot(Once(PLTLNot(rewrite_unaryop(formula))))
