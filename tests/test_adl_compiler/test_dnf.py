import pytest
from pddl.logic.base import *
from pddl.logic.predicates import Predicate
from plan4past.utils.negate_visitor import negate
from plan4past.utils.dnf_visitor import dnf, distribute_conj_over_disj


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


@pytest.mark.parametrize("conj, dnf, expected", test_formulas_distribution)
def test_distrubution(conj, dnf, expected):
    assert distribute_conj_over_disj(conj, dnf) == expected


test_formulas_dnf = [
    (And(a, Or(b, c)), Or(And(a, b), And(a, c))),
    (Or(a, And(b, c)), Or(a, And(b, c))),
    (And(Or(a, b), Or(c, d)), Or(And(a, c), And(a, d), And(b, c), And(b, d))),
    (
        And(Or(a, b), Or(c, d), And(f, e)),
        Or(And(f, e, a, c), And(f, e, a, d), And(f, e, b, c), And(f, e, b, d)),
    ),
    # (
    #     And(
    #         Or(f, e),
    #         And(a, Or(b, c))
    #     ),
    #     # TODO
    # )
]


@pytest.mark.parametrize("formula, expected", test_formulas_dnf)
def test_dnf(formula, expected):
    assert dnf(formula) == expected


if __name__ == "__main__":
    test_dnf(
        And(Or(a, b), Or(c, d), And(d, e)),
        Or(And(d, e, a, c), And(d, e, a), And(d, e, b, c), And(d, e, b)),
    )
