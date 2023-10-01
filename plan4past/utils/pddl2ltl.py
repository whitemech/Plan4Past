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

"""Transform a PDDL formula into a LTL formula."""

from FDgrounder.pddl_parser.lisp_parser import parse_nested_list

from plan4past.exceptions import MalformedExpression
from plan4past.helpers.utils import check_

PDDL_NOT = "not"
PDDL_AND = "and"
PDDL_OR = "or"

PDDL_SINCE = "since"
PDDL_TRIGGERS = "triggers"
PDDL_HISTORICALLY = "historically"
PDDL_ONCE = "once"
PDDL_YESTERDAY = "yesterday"
PDDL_WEAKYESTERDAY = "weak-yesterday"

PDDL_UNTIL = "until"
PDDL_RELEASE = "release"
PDDL_ALWAYS = "always"
PDDL_EVENTUALLY = "eventually"
PDDL_NEXT = "next"
PDDL_WEAKNEXT = "weak-next"

LTL_UNTIL = "U"
LTL_RELEASE = "R"
LTL_ALWAYS = "G"
LTL_EVENTUALLY = "F"
LTL_NEXT = "X"
LTL_WEAKNEXT = "WX"

MALFORMED_EXPRESSION_MSG = "The expression {expr} is malformed"


def land(args) -> str:
    """Return a string representing the conjunction of the arguments in LTL."""
    return f"({'&'.join(args)})"


def lor(args) -> str:
    """Return a string representing the disjunction of the arguments in LTL."""
    return f"({'|'.join(args)})"


def unaryop(op, arg) -> str:
    """Return a string representing the unary operator op(arg) in LTL."""
    return f"({op}({arg}))"


def binaryop(op, arg1, arg2) -> str:
    """Return a string representing the binary operator op(arg1, arg2) in LTL."""
    return f"(({arg1}){op}({arg2}))"


def pddl2tl(pddl_formula) -> str:
    """Return a string representing the LTL formula corresponding to the PDDL formula."""
    tokens = parse_nested_list(pddl_formula.splitlines())
    return tokens2ltl(tokens)


def tokens2ltl(  # noqa: C901  # pylint: disable=too-many-return-statements,too-many-branches,too-many-statements
    tokens,
) -> str:
    """Return a string representing the LTL formula corresponding to the PDDL formula."""
    nested_lists = [tk for tk in tokens if isinstance(tk, list)]

    if tokens[0] == PDDL_AND:
        if len(tokens) <= 1:
            raise MalformedExpression()
        if len(tokens) == 2:
            return tokens2ltl(tokens[1])
        parts = [tokens2ltl(tokens[i]) for i in range(1, len(tokens))]
        return land(parts)

    if tokens[0] == PDDL_OR:
        if len(tokens) <= 1:
            raise MalformedExpression(MALFORMED_EXPRESSION_MSG.format(expr=str(tokens)))
        if len(tokens) == 2:
            return tokens2ltl(tokens[1])
        parts = [tokens2ltl(tokens[i]) for i in range(1, len(tokens))]
        return lor(parts)

    if tokens[0] == PDDL_NOT:
        if len(tokens) != 2:
            raise MalformedExpression(MALFORMED_EXPRESSION_MSG.format(expr=str(tokens)))

        return unaryop("!", tokens2ltl(tokens[1]))

    if tokens[0] == PDDL_UNTIL:
        if len(tokens) != 3:
            raise MalformedExpression(MALFORMED_EXPRESSION_MSG.format(expr=str(tokens)))

        return binaryop("U", tokens2ltl(tokens[1]), tokens2ltl(tokens[2]))

    if tokens[0] == PDDL_RELEASE:
        if len(tokens) != 3:
            raise MalformedExpression(MALFORMED_EXPRESSION_MSG.format(expr=str(tokens)))

        return binaryop("R", tokens2ltl(tokens[1]), tokens2ltl(tokens[2]))

    if tokens[0] == PDDL_ALWAYS:
        if len(tokens) != 2:
            raise MalformedExpression(MALFORMED_EXPRESSION_MSG.format(expr=str(tokens)))
        return unaryop("G", tokens2ltl(tokens[1]))

    if tokens[0] == PDDL_EVENTUALLY:
        if len(tokens) != 2:
            raise MalformedExpression(MALFORMED_EXPRESSION_MSG.format(expr=str(tokens)))
        return unaryop("F", tokens2ltl(tokens[1]))

    if tokens[0] == PDDL_NEXT:
        if len(tokens) != 2:
            raise MalformedExpression(MALFORMED_EXPRESSION_MSG.format(expr=str(tokens)))
        return unaryop("X", tokens2ltl(tokens[1]))

    if tokens[0] == PDDL_WEAKNEXT:
        if len(tokens) != 2:
            raise MalformedExpression(MALFORMED_EXPRESSION_MSG.format(expr=str(tokens)))
        return unaryop("WX", tokens2ltl(tokens[1]))

    if tokens[0] == PDDL_SINCE:
        if len(tokens) != 3:
            raise MalformedExpression(MALFORMED_EXPRESSION_MSG.format(expr=str(tokens)))

        return binaryop("S", tokens2ltl(tokens[1]), tokens2ltl(tokens[2]))

    if tokens[0] == PDDL_TRIGGERS:
        if len(tokens) != 3:
            raise MalformedExpression(MALFORMED_EXPRESSION_MSG.format(expr=str(tokens)))

        return binaryop("T", tokens2ltl(tokens[1]), tokens2ltl(tokens[2]))

    if tokens[0] == PDDL_HISTORICALLY:
        if len(tokens) != 2:
            raise MalformedExpression(MALFORMED_EXPRESSION_MSG.format(expr=str(tokens)))
        return unaryop("H", tokens2ltl(tokens[1]))

    if tokens[0] == PDDL_ONCE:
        if len(tokens) != 2:
            raise MalformedExpression(MALFORMED_EXPRESSION_MSG.format(expr=str(tokens)))
        return unaryop("O", tokens2ltl(tokens[1]))

    if tokens[0] == PDDL_YESTERDAY:
        if len(tokens) != 2:
            raise MalformedExpression(MALFORMED_EXPRESSION_MSG.format(expr=str(tokens)))
        return unaryop("Y", tokens2ltl(tokens[1]))

    if tokens[0] == PDDL_WEAKYESTERDAY:
        if len(tokens) != 2:
            raise MalformedExpression(MALFORMED_EXPRESSION_MSG.format(expr=str(tokens)))
        return unaryop(tokens2ltl(tokens[1]), "WY")

    # This is an atom
    check_(len(nested_lists) == 0)
    return " ".join(tokens)


if __name__ == "__main__":
    formulap = (
        "(and (or (hello) (once (rain))) (yesterday (city1)) (since (city3) (city2)))"
    )
    formulal = "(and (or (hello) (eventually (rain))) (next (city1)) (always (city2)))"

    print(pddl2tl(formulal))
    print(pddl2tl(formulap))
