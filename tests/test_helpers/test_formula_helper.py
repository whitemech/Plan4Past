# -*- coding: utf-8 -*-
#
# Copyright 2021 -- 2023 WhiteMech
#
# ------------------------------
#
# This file is part of Plan4Past.
#
# Plan4Past is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Plan4Past is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with Plan4Past.  If not, see <https://www.gnu.org/licenses/>.
#

"""This module contains tests for the plan4past.helpers.formula_helper module."""
from pylogics.syntax.base import *
from pylogics.syntax.pltl import *
from plan4past.helpers.formula_helper import *
import pytest

a = Atomic("a")
b = Atomic("b")


test_formulas_val_set = [
    (a, {ValAtom(a)}),
    (And(a, b), {ValAtom(a), ValAtom(b), ValAtom(And(a, b))}),
    (Or(a, b), {ValAtom(a), ValAtom(b), ValAtom(Or(a, b))}),
    (Not(And(a, b)), {ValAtom(a), ValAtom(b), ValAtom(And(a, b)), ValAtom(Not(And(a, b)))}),
    (Since(a, b), {ValAtom(a), ValAtom(b), ValAtom(Since(a, b))}),
    (Since(a, Once(b)), {ValAtom(a), ValAtom(b), ValAtom(Once(b)), ValAtom(Since(a, Once(b)))}),
]

@pytest.mark.parametrize("input_formula, expected", test_formulas_val_set)
def test_val_set(input_formula, expected):
    assert set(val_set(input_formula)) == expected


def test_equality_val_before_atoms():
    ValAtom(a) != YAtom(a)
    ValAtom(Since(a, Once(b))) != YAtom(Since(a, Once(b)))


test_formulas_quoted_set = [
    (a, set()),
    (And(a, b), set()),
    (Or(a, b), set()),
    (Not(And(a, b)), set()),
    (Since(a, b), {YAtom(Since(a, b))}),
    (Since(a, Once(b)), {YAtom(Once(b)), YAtom(Since(a, Once(b)))}),
    (Since(a, Before(Once(b))), {YAtom(Once(b)), YAtom(Since(a, Before(Once(b))))}),
    (And(Once(b), Since(a, Before(Once(b)))), {YAtom(Once(b)), YAtom(Since(a, Before(Once(b))))})
]

@pytest.mark.parametrize("input_formula, expected", test_formulas_quoted_set)
def test_val_set(input_formula, expected):
    assert quoted_set(input_formula) == expected


test_formulas_quoted_set = [
    (ValAtom(a), a),
    (ValAtom(PropositionalTrue()), PropositionalTrue()),
    (ValAtom(PropositionalFalse()), PropositionalFalse()),
    (ValAtom(And(a, b)), And(ValAtom(a), ValAtom(b))),
    (ValAtom(Or(a, b)), Or(ValAtom(a), ValAtom(b))),
    (ValAtom(Not(And(a, b))), Not(ValAtom(And(a, b)))),
    (ValAtom(Before(Since(a, b))), YAtom(Since(a, b))),
    (ValAtom(Since(a, b)), Or(ValAtom(b), And(ValAtom(a), YAtom(Since(a, b))))),
    (ValAtom(Since(a, Once(b))), Or(ValAtom(Once(b)), And(ValAtom(a), YAtom(Since(a, Once(b)))))),
    (ValAtom(Since(a, Before(Once(b)))), Or(ValAtom(Before(Once(b))), And(ValAtom(a), YAtom(Since(a, Before(Once(b))))))),
]

@pytest.mark.parametrize("input_formula, expected", test_formulas_quoted_set)
def test_val_condition(input_formula, expected):
    assert val_condition(input_formula) == expected

if __name__ == "__main__":
    pytest.main()
