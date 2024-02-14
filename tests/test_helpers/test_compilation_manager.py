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
"""Tests for the compilation manager."""
import pytest
from pylogics.parsers import parse_pltl
from pylogics.syntax.base import And, Not, Or
from pylogics.syntax.pltl import (
    Atomic,
    Before,
    Historically,
    Once,
    PropositionalTrue,
    Since,
)

from plan4past.helpers.compilation_helper import CompilationManager
from plan4past.helpers.formula_helper import YAtom, ppnf
from plan4past.utils.rewrite_formula_visitor import rewrite
from plan4past.utils.predicates_visitor import predicates

a = Atomic("a")
b = Atomic("b")
c = Atomic("c")
d = Atomic("d")
e = Atomic("e")
f = Atomic("f")


def test_yesterday_generation1() -> None:
    """Test the generation of the yesterday dictionary."""
    phi = Or(Not(Once(Not(a))), Since(b, Not(Once(Not(c)))))

    compilation_manager = CompilationManager(phi)

    yesterday_dictionary = compilation_manager.quoted_map
    assert len(yesterday_dictionary) == 3
    assert YAtom(Once(Not(a))) in yesterday_dictionary
    assert YAtom(Since(b, Not(Once(Not(c))))) in yesterday_dictionary
    assert YAtom(Once(Not(c))) in yesterday_dictionary


def test_yesterday_generation2() -> None:
    """Test the generation of the yesterday dictionary."""
    phi = Or(Not(Once(Not(a))), Since(b, Not(Once(Not(a)))))

    compilation_manager = CompilationManager(phi)

    yesterday_dictionary = compilation_manager.quoted_map
    assert len(yesterday_dictionary) == 2
    assert YAtom(Once(Not(a))) in yesterday_dictionary
    assert YAtom(Since(b, Not(Once(Not(a))))) in yesterday_dictionary


def test_yesterday_generation3() -> None:
    """Test the generation of the yesterday dictionary."""
    phi = Or(Not(Once(Not(And(a, b)))), Since(b, Not(Once(Not(And(b, a))))))

    compilation_manager = CompilationManager(phi)

    yesterday_dictionary = compilation_manager.quoted_map
    assert len(yesterday_dictionary) == 2
    assert YAtom(Once(Not(And(a, b)))) in yesterday_dictionary
    assert YAtom(Since(b, Not(Once(Not(And(b, a)))))) in yesterday_dictionary


def test_yesterday_generation4() -> None:
    """Test the generation of the yesterday dictionary."""
    phi = Or(Not(Once(Not(And(a, b)))), Before(Or(b, Since(c, d))))

    compilation_manager = CompilationManager(phi)

    yesterday_dictionary = compilation_manager.quoted_map
    assert len(yesterday_dictionary) == 3
    assert YAtom(Once(Not(And(a, b)))) in yesterday_dictionary
    assert YAtom(Before(Or(b, Since(c, d)))) not in yesterday_dictionary
    assert YAtom(Or(b, Since(c, d))) in yesterday_dictionary
    assert YAtom(Since(c, d)) in yesterday_dictionary


def test_yesterday_generation5() -> None:
    """Test the generation of the yesterday dictionary."""
    phi = Or(Once(And(a, b)), Before(Or(b, Not(Since(Not(c), Not(d))))))

    compilation_manager = CompilationManager(phi)

    yesterday_dictionary = compilation_manager.quoted_map
    assert len(yesterday_dictionary) == 3
    assert YAtom(Once(And(a, b))) in yesterday_dictionary
    assert YAtom(Before(Or(b, Not(Since(Not(c), Not(d)))))) not in yesterday_dictionary
    assert YAtom(Or(b, Not(Since(Not(c), Not(d))))) in yesterday_dictionary
    assert YAtom(Since(Not(c), Not(d))) in yesterday_dictionary


def test_yesterday_generation6() -> None:
    """Test the generation of the yesterday dictionary."""
    phi = Once(And(a, Before(Once(And(b, Before(Once(c)))))))

    compilation_manager = CompilationManager(phi)

    yesterday_dictionary = compilation_manager.quoted_map
    assert len(yesterday_dictionary) == 3
    assert (
        YAtom(Once(And(a, Before(Once(And(b, Before(Once(c))))))))
        in yesterday_dictionary
    )
    assert YAtom(Once(And(b, Before(Once(c))))) in yesterday_dictionary
    assert YAtom(Once(c)) in yesterday_dictionary

    assert YAtom(Before(Once(And(b, Before(Once(c)))))) not in yesterday_dictionary
    assert YAtom(Before(Once(c))) not in yesterday_dictionary


def test_yesterday_generation7() -> None:
    """Test the generation of the yesterday dictionary."""
    phi = Or(
        And(
            Before(a),
            And(Before(b), Before(Or(Not(Once(Not(c))), Not(Before(Atomic("true")))))),
        ),
        Not(Once(Not(c))),
    )

    compilation_manager = CompilationManager(phi)

    yesterday_dictionary = compilation_manager.quoted_map
    assert len(yesterday_dictionary) == 5
    assert YAtom(a) in yesterday_dictionary
    assert YAtom(b) in yesterday_dictionary
    assert (
        YAtom(Or(Not(Once(Not(c))), Not(Before(Atomic("true")))))
        in yesterday_dictionary
    )
    assert YAtom(Once(Not(c))) in yesterday_dictionary
    assert YAtom(Atomic("true")) in yesterday_dictionary

    assert YAtom(Before(b)) not in yesterday_dictionary
    assert YAtom(Before(a)) not in yesterday_dictionary


def test_pex1() -> None:
    """Test the PPNF translation for an atomic formula."""
    phi = a
    result = ppnf(phi)
    assert result == a


def test_pex2() -> None:
    """Test the PPNF translation for a yesterday formula."""
    phi = Before(a)
    result = ppnf(phi)
    assert result == YAtom(a)


def test_pex3() -> None:
    """Test the PPNF translation for a disjunction formula."""
    phi = Or(Before(a), Not(Before(Atomic("true"))))
    result = ppnf(phi)
    assert result == Or(YAtom(a), Not(YAtom(Atomic("true"))))


def test_pex4() -> None:
    """Test the PPNF translation for a once formula."""
    phi = Once(a)
    result = ppnf(phi)
    assert result == Or(a, YAtom(Once(a)))


def test_pex5() -> None:
    """Test the PPNF translation for a once formula inside a negation."""
    phi = Not(Once(Not(a)))
    result = ppnf(phi)
    assert result == Not(Or(Not(a), YAtom(Once(Not(a)))))


def test_pex6() -> None:
    """Test the PPNF translation for a disjunction formula."""
    phi = And(a, b)
    result = ppnf(phi)
    assert result == And(a, b)


def test_pex7() -> None:
    """Test the PPNF translation for a since formula."""
    phi = Since(a, b)
    result = ppnf(phi)
    assert result == Or(b, And(a, YAtom(Since(a, b))))


def test_pex8() -> None:
    """Test the PPNF translation for a since formula inside a negation."""
    phi = Not(Since(Not(a), Not(b)))
    result = ppnf(phi)
    assert result == Not(Or(Not(b), And(Not(a), YAtom(Since(Not(a), Not(b))))))


def test_pex_complex_formula1() -> None:
    """Test the PPNF translation for a complex formula."""
    phi = rewrite(And(Once(a), Since(b, Before(Historically(c)))))
    cm = CompilationManager(phi)
    result = ppnf(phi)

    yesterday_once_a = YAtom(Once(a))
    yesterday_since = YAtom(Since(b, Before(Not(Once(Not(c))))))
    yesterday_once_not_c = YAtom(Once(Not(c)))
    yesterday_not_once_not_c = YAtom(Not(Once(Not(c))))

    assert len(cm.quoted_map) == 4
    assert cm.quoted_map.get(yesterday_once_not_c) is not None

    pex_phi = And(
        Or(a, yesterday_once_a), Or(yesterday_not_once_not_c, And(b, yesterday_since))
    )
    assert result == pex_phi


def test_pex_complex_formula2() -> None:
    """Test the PPNF translation for a complex formula."""
    phi = Once(And(a, Before(Once(b))))
    cm = CompilationManager(phi)
    result = ppnf(phi)

    assert len(cm.quoted_map) == 2

    yesterday_once = YAtom(Once(And(a, Before(Once(b)))))
    yesterday_once_b = YAtom(Once(b))

    pex_phi = Or(And(a, yesterday_once_b), yesterday_once)
    assert result == pex_phi


# ("H(H(H(a) | H(b))) | (a | b)", expected3)  # noqa
pnf_ha_hb = Or(
    Not(Or(Not(a), YAtom(Once(Not(a))))), Not(Or(Not(b), YAtom(Once(Not(b)))))
)
pnf_h_ha_hb = Not(
    Or(Not(pnf_ha_hb), YAtom(Once(Not(Or(Not(Once(Not(a))), Not(Once(Not(b))))))))
)
pnf_h_h_ha_hb = Not(
    Or(
        Or(Not(pnf_ha_hb), YAtom(Once(Not(Or(Not(Once(Not(a))), Not(Once(Not(b)))))))),
        YAtom(Once(Once(Not(Or(Not(Once(Not(a))), Not(Once(Not(b)))))))),
    )
)
combinations = [
    (
        "O(a) & O(b) & O(c)",
        And(Or(a, YAtom(Once(a))), Or(b, YAtom(Once(b))), Or(c, YAtom(Once(c)))),
    ),
    (
        "O(O(a) & O(b) & O(c))",
        Or(
            And(Or(a, YAtom(Once(a))), Or(b, YAtom(Once(b))), Or(c, YAtom(Once(c)))),
            YAtom(Once(And(Once(a), Once(b), Once(c)))),
        ),
    ),
    (
        "O(O(a) | O(b) | O(c))",
        Or(
            Or(Or(a, YAtom(Once(a))), Or(b, YAtom(Once(b))), Or(c, YAtom(Once(c)))),
            YAtom(Once(Or(Once(a), Once(b), Once(c)))),
        ),
    ),
    ("H(a) | H(b)", pnf_ha_hb),
    (
        "H(H(a) | H(b))",
        Not(
            Or(
                Not(pnf_ha_hb),
                YAtom(Once(Not(Or(Not(Once(Not(a))), Not(Once(Not(b))))))),
            )
        ),
    ),
    (
        "H(H(H(a) | H(b)))",
        Not(
            Or(
                Or(
                    Not(pnf_ha_hb),
                    YAtom(Once(Not(Or(Not(Once(Not(a))), Not(Once(Not(b))))))),
                ),
                YAtom(Once(Once(Not(Or(Not(Once(Not(a))), Not(Once(Not(b)))))))),
            )
        ),
    ),
    ("H(H(H(a) | H(b))) | (a | b)", Or(pnf_h_h_ha_hb, a, b)),
]


@pytest.mark.parametrize("formula,expected", combinations)
def test_pex_formula(formula, expected) -> None:
    """Test the PPNF translation for a complex formula."""
    formula_ = rewrite(parse_pltl(formula))
    pex = ppnf(formula_)
    assert pex == expected


def test_problem_extension_HH_Ha_Hb() -> None:
    """Test the problem extensions for a complex PPLTL formula with nested historically operators."""
    formula_ = rewrite(parse_pltl("H(H(H(a) | H(b))) | (a | b)"))
    assert formula_ == Or(
        Not(Once(Once(Not(Or(Not(Once(Not(a))), Not(Once(Not(b)))))))), a, b
    )
    compilation_manager = CompilationManager(formula_)

    # pylint: disable=R0801
    temporalsubformulas = [
        YAtom(Once(Not(a))),
        YAtom(Once(Not(b))),
        YAtom(Once(Not(Or(Not(Once(Not(a))), Not(Once(Not(b))))))),
        YAtom(Once(Once(Not(Or(Not(Once(Not(a))), Not(Once(Not(b)))))))),
    ]

    quoted_atoms, conditional_effects, goal = compilation_manager.get_adl_compilation()
    assert len(compilation_manager.quoted_map) == 4

    for y in temporalsubformulas:
        assert y in compilation_manager.quoted_map
        assert y in quoted_atoms

    y = temporalsubformulas
    pnf = [Or(Not(a), y[0]), Or(Not(b), y[1])]
    pnf.append(Or(Not(Or(Not(pnf[0]), Not(pnf[1]))), y[2]))
    pnf.append(Or(pnf[2], y[3]))
    for i, sub_pnf in enumerate(pnf):
        assert (sub_pnf, y[i]) in conditional_effects
    assert goal == Or(Not(pnf[3]), a, b)


def test_problem_extension_since():
    """Test the problem extensions for the formula (O(d)) S (O(a) & O(b) & O(c))."""
    formula_ = rewrite(parse_pltl("(O(d)) S (O(a) & O(b) & O(c))"))
    assert formula_ == parse_pltl("(O(d)) S (O(a) & O(b) & O(c))")
    compilation_manager = CompilationManager(formula_)

    temporalsubformulas = [
        YAtom(Once(d)),
        YAtom(Once(a)),
        YAtom(Once(b)),
        YAtom(Once(c)),
        YAtom(Since(Once(d), And(Once(a), Once(b), Once(c)))),
    ]

    quoted_atoms, conditional_effects, goal = compilation_manager.get_adl_compilation()
    assert len(compilation_manager.quoted_map) == 5

    for y in temporalsubformulas:
        assert y in compilation_manager.quoted_map
        assert y in quoted_atoms

    y = temporalsubformulas
    pnf = [Or(d, y[0]), Or(a, y[1]), Or(b, y[2]), Or(c, y[3])]
    pnf.append(Or(And(pnf[1], pnf[2], pnf[3]), And(pnf[0], y[4])))
    for i, sub_pnf in enumerate(pnf):
        assert (sub_pnf, y[i]) in conditional_effects
    assert goal == pnf[4]


def test_problem_extension_since2() -> None:
    """Test the problem extensions for the formula ((O(a)|O(b)|O(c))S(O(d)))."""
    formula_ = rewrite(parse_pltl("((O(a)|O(b)|O(c))S(O(d)))"))
    assert formula_ == parse_pltl("((O(a)|O(b)|O(c))S(O(d)))")
    compilation_manager = CompilationManager(formula_)

    temporalsubformulas = [
        YAtom(Once(d)),
        YAtom(Once(a)),
        YAtom(Once(b)),
        YAtom(Once(c)),
        YAtom(Since(Or(Once(a), Once(b), Once(c)), Once(d))),
    ]

    quoted_atoms, conditional_effects, goal = compilation_manager.get_adl_compilation()
    assert len(compilation_manager.quoted_map) == 5

    for y in temporalsubformulas:
        assert y in compilation_manager.quoted_map
        assert y in quoted_atoms

    y = temporalsubformulas
    pnf = [Or(d, y[0]), Or(a, y[1]), Or(b, y[2]), Or(c, y[3])]
    pnf.append(Or(pnf[0], And(Or(pnf[1], pnf[2], pnf[3]), y[4])))
    for i, sub_pnf in enumerate(pnf):
        assert (sub_pnf, y[i]) in conditional_effects
    assert goal == pnf[4]


def test_problem_extension_once_blocks() -> None:
    """Test the problem extensions for the formula O(a & O(d)) & O(b & O(d))."""
    formula_ = rewrite(parse_pltl("O(a & O(d)) & O(b & O(d))"))
    assert formula_ == parse_pltl("O(a & O(d)) & O(b & O(d))")
    compilation_manager = CompilationManager(formula_)

    temporalsubformulas = [
        YAtom(Once(d)),
        YAtom(Once(And(a, Once(d)))),
        YAtom(Once(And(b, Once(d)))),
    ]

    quoted_atoms, conditional_effects, goal = compilation_manager.get_adl_compilation()
    assert len(compilation_manager.quoted_map) == 3

    for y in temporalsubformulas:
        assert y in compilation_manager.quoted_map
        assert y in quoted_atoms

    y = temporalsubformulas
    pnf = [Or(d, y[0]), Or(And(a, Or(d, y[0])), y[1]), Or(And(b, Or(d, y[0])), y[2])]
    for i, sub_pnf in enumerate(pnf):
        assert (sub_pnf, y[i]) in conditional_effects
    assert goal == And(pnf[1], pnf[2])


def test_problem_extension_since3() -> None:
    """Test the problem extensions for the formula ((c) S (O(a))) & ((c) S (O(b)))."""
    formula_ = rewrite(parse_pltl("((c) S (O(a))) & ((c) S (O(b)))"))
    assert formula_ == parse_pltl("((c) S (O(a))) & ((c) S (O(b)))")
    compilation_manager = CompilationManager(formula_)

    temporalsubformulas = [
        YAtom(Once(a)),
        YAtom(Once(b)),
        YAtom(Since(c, Once(a))),
        YAtom(Since(c, Once(b))),
    ]

    quoted_atoms, conditional_effects, goal = compilation_manager.get_adl_compilation()
    assert len(compilation_manager.quoted_map) == 4

    for y in temporalsubformulas:
        assert y in compilation_manager.quoted_map
        assert y in quoted_atoms

    y = temporalsubformulas
    pnf = [
        Or(a, y[0]),
        Or(b, y[1]),
        Or(Or(a, y[0]), And(c, y[2])),
        Or(Or(b, y[1]), And(c, y[3])),
    ]
    for i, sub_pnf in enumerate(pnf):
        assert (sub_pnf, y[i]) in conditional_effects
    assert goal == And(pnf[2], pnf[3])


def test_problem_extension_seq() -> None:
    """Test the problem extensions for the formula O(a & Y(O(b & Y(O(c)))))."""
    formula_ = rewrite(parse_pltl("O(a & Y(O(b & Y(O(c)))))"))
    assert formula_ == parse_pltl("O(a & Y(O(b & Y(O(c)))))")
    compilation_manager = CompilationManager(formula_)

    temporalsubformulas = [
        YAtom(Once(c)),
        YAtom(Once(And(b, Before(Once(c))))),
        YAtom(Once(And(a, Before(Once(And(b, Before(Once(c)))))))),
    ]

    quoted_atoms, conditional_effects, goal = compilation_manager.get_adl_compilation()
    assert len(compilation_manager.quoted_map) == 3


    for y in temporalsubformulas:
        assert y in compilation_manager.quoted_map
        assert y in quoted_atoms

    y = temporalsubformulas
    pnf = [Or(c, y[0]), Or(And(b, y[0]), y[1]), Or(And(a, y[1]), y[2])]
    for i, sub_pnf in enumerate(pnf):
        assert (sub_pnf, y[i]) in conditional_effects
    assert goal == pnf[2]


def test_problem_extension_robot1() -> None:
    """Test the problem extensions for the formula O(c & Y(Y(Y(!Y(true)))))."""
    formula_ = rewrite(parse_pltl("O(c & Y(Y(Y(!Y(true)))))"))
    assert formula_ == parse_pltl("O(c & Y(Y(Y(!Y(true)))))")
    compilation_manager = CompilationManager(formula_)

    temporalsubformulas = [
        YAtom(PropositionalTrue()),
        YAtom(Not(Before(PropositionalTrue()))),
        YAtom(Before(Not(Before(PropositionalTrue())))),
        YAtom(Before(Before(Not(Before(PropositionalTrue()))))),
        YAtom(Once(And(c, Before(Before(Before(Not(Before(PropositionalTrue())))))))),
    ]

    quoted_atoms, conditional_effects, goal = compilation_manager.get_adl_compilation()
    assert len(compilation_manager.quoted_map) == 5

    for y in temporalsubformulas:
        assert y in compilation_manager.quoted_map
        assert y in quoted_atoms

    y = temporalsubformulas
    pnf = [PropositionalTrue(), Not(y[0]), y[1], y[2], Or(And(c, y[3]), y[4])]
    for i, sub_pnf in enumerate(pnf):
        assert (sub_pnf, y[i]) in conditional_effects
    assert goal == pnf[4]


def test_problem_extension_robot2() -> None:
    """Test the problem extensions for the formula (H((!Y(a) | !(b))) & !(a))."""
    formula_ = rewrite(parse_pltl("(H((!Y(a) | !(b))) & !(a))"))
    assert formula_ == And(Not(Once(Not(Or(Not(Before(a)), Not(b))))), Not(a))
    compilation_manager = CompilationManager(formula_)

    temporalsubformulas = [
        YAtom(a),
        YAtom(Once(Not(Or(Not(Before(a)), Not(b))))),
    ]

    quoted_atoms, conditional_effects, goal = compilation_manager.get_adl_compilation()
    assert len(compilation_manager.quoted_map) == 2

    for y in temporalsubformulas:
        assert y in compilation_manager.quoted_map
        assert y in quoted_atoms

    y = temporalsubformulas
    pnf = [a, Or(Not(Or(Not(y[0]), Not(b))), y[1])]
    for i, sub_pnf in enumerate(pnf):
        assert (sub_pnf, y[i]) in conditional_effects
    assert goal == And(Not(pnf[1]), Not(a))
