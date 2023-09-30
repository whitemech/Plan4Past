"""Test the negation normal form (NNF) visitor."""
import pytest
from pddl.logic.base import And, Not, Or
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


@pytest.mark.parametrize("input_formula, expected", test_formulas_negation)
def test_negation(input_formula, expected):
    """Test the negation of a formula."""
    assert negate(input_formula) == expected


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


@pytest.mark.parametrize("input_formula, expected", test_formulas_nnf)
def test_nnf(input_formula, expected) -> None:
    """Test the negation normal form (NNF) conversion."""
    assert nnf(input_formula) == expected
