"""Tests for the DNF visitor."""
import pytest
from pddl.logic.base import And, Or
from pddl.logic.predicates import Predicate

from plan4past.utils.dnf_visitor import distribute_conj_over_disj, dnf

a = Predicate("a")
b = Predicate("b")
c = Predicate("c")
d = Predicate("d")
e = Predicate("e")
f = Predicate("f")


test_formulas_distribution = [
    (a, Or(b, c), Or(And(a, b), And(a, c))),
    (And(a, b), Or(c, d), Or(And(a, b, c), And(a, b, d))),
    (And(a, b), Or(And(c, d), And(e, f)), Or(And(a, b, c, d), And(a, b, e, f))),
    (
        And(a, b),
        Or(And(c, d), And(e, f), And(c, f)),
        Or(And(a, b, c, d), And(a, b, e, f), And(a, b, c, f)),
    ),
]


@pytest.mark.parametrize("conj, dnf_formula, expected", test_formulas_distribution)
def test_distribution(conj, dnf_formula, expected) -> None:
    """Test the distribution of conjunctions over disjunctions."""
    assert distribute_conj_over_disj(conj, dnf_formula) == expected


test_formulas_dnf = [
    (And(a, Or(b, c)), Or(And(a, b), And(a, c))),
    (Or(a, And(b, c)), Or(a, And(b, c))),
    (And(Or(a, b), Or(c, d)), Or(And(a, c), And(a, d), And(b, c), And(b, d))),
    (
        And(Or(a, b), Or(c, d), And(f, e)),
        Or(And(f, e, a, c), And(f, e, a, d), And(f, e, b, c), And(f, e, b, d)),
    ),
]


@pytest.mark.parametrize("formula, expected", test_formulas_dnf)
def test_dnf(formula, expected) -> None:
    """Test the DNF conversion."""
    assert dnf(formula) == expected
