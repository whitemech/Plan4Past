import pytest
from pddl.logic.base import *
from pddl.logic.predicates import Predicate
from plan4past.utils.negate_visitor import negate
from plan4past.utils.nnf_visitor import nnf


a = Predicate("a")
b = Predicate("b")
c = Predicate("c")
d = Predicate("d")

test_formulas_negation = [
    (a, Not(a)),
    (And(a, b), Or(Not(a), Not(b))),
    (Or(a, b), And(Not(a), Not(b))),
    (Not(And(a, b)), And(a, b)),
    (Not(Not(a)), Not(a)),
]


@pytest.mark.parametrize("input, expected", test_formulas_negation)
def test_negation(input, expected):
    assert negate(input) == expected


test_formulas_nnf = [
    (a, a),
    (And(a, b), And(a, b)),
    (Or(a, b), Or(a, b)),
    (Not(And(a, b)), Or(Not(a), Not(b))),
    (Not(Or(a, b)), And(Not(a), Not(b))),
    (Not(Not(a)), a),
    (
        And(
            Not(And(a, Or(b, c))), Not(Or(And(d, c), Not(Not(a)))), Or(Not(Or(a, b)), c)
        ),
        And(
            Or(Not(a), And(Not(b), Not(c))),
            And(Or(Not(d), Not(c)), Not(a)),
            Or(And(Not(a), Not(b)), c),
        ),
    ),
]


@pytest.mark.parametrize("input, expected", test_formulas_nnf)
def test_nnf(input, expected):
    assert nnf(input) == expected


if __name__ == "__main__":
    test_nnf(Not(Or(a, b)), And(Not(a), Not(b)))
