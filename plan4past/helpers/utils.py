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

"""Miscellanea utilities."""
import re
from typing import Collection, Type

from pddl.logic import Predicate, constants

_PDDL_NAME_REGEX = "[A-Za-z][-_A-Za-z0-9]*"
_GROUND_FLUENT_REGEX = re.compile(
    rf"(\"({_PDDL_NAME_REGEX})( {_PDDL_NAME_REGEX})*\")|({_PDDL_NAME_REGEX})"
)
VAL_PREFIX = "VAL__"
_LEFT_PAR = "LPAR__"
_RIGHT_PAR = "__RPAR"
Y_PREFIX = "Y__"
_NOT = "NOT__"
_AND = "__AND__"
_OR = "__OR__"
_QUOTE = "__QUOTE__"


def add_val_prefix(name: str):
    """Add the 'prime' prefix."""
    return VAL_PREFIX + name.replace('"', _QUOTE)


def remove_before_prefix(name: str):
    """Remove the 'Y' prefix."""
    return (
        name.replace(Y_PREFIX, "")
        if name.startswith(Y_PREFIX)
        else re.sub(f"{_RIGHT_PAR}$", "", name.replace("Y" + _LEFT_PAR, "", 1))
        if name.startswith("Y" + _LEFT_PAR)
        else name
    )


def remove_val_prefix(name: str):
    """Remove the 'prime' prefix."""
    return name.replace(VAL_PREFIX, "") if name.startswith(VAL_PREFIX) else name


def replace_symbols(name: str):
    """Stringify symbols."""
    return (
        name.replace('"', _QUOTE)
        .replace("(", _LEFT_PAR)
        .replace(")", _RIGHT_PAR)
        .replace("&", _AND)
        .replace("|", _OR)
        .replace("~", _NOT)
        .replace("!", _NOT)
        .replace(" ", "-")
    )


def check_(
    condition: bool, message: str = "", exception_cls: Type[Exception] = AssertionError
) -> None:
    """
    User-defined assert.

    This function is useful to avoid the use of the built-in assert statement, which is removed
        when the code is compiled in optimized mode. For more information, see
        https://bandit.readthedocs.io/en/1.7.5/plugins/b101_assert_used.html
    """
    if not condition:
        raise exception_cls(message)


def parse_ground_fluent(symbol: str) -> Predicate:
    """
    Parse a ground fluent.

    :param symbol: the ground fluent
    :return: the predicate
    """
    match = _GROUND_FLUENT_REGEX.fullmatch(symbol)
    if match is None:
        raise ValueError(f"invalid PDDL symbol in formula: {symbol}")

    if '"' in symbol:
        tokens = symbol[1:-1].split(" ", 1)
        predicate_name, cons = (
            (tokens[0], tokens[1]) if len(tokens) > 1 else (tokens[0], "")
        )
        return Predicate(predicate_name, *constants(cons))
    return Predicate(symbol)


def _check_does_not_start_with(symbol: str, prefixes: Collection[str]) -> None:
    """
    Check if a symbol does not start with a given prefix.

    :param symbol: the symbol
    :param prefixes: the prefixes to check
    """
    for prefix in prefixes:
        check_(
            not symbol.startswith(prefix),
            f"invalid symbol: symbol '{symbol}' cannot start with {prefix}",
            exception_cls=ValueError,
        )


def _check_not_in(symbol: str, forbidden_substrings: Collection[str]) -> None:
    """
    Check if a string is not in a set of symbols.

    :param symbol: the symbol
    :param forbidden_substrings: the set of forbidden substrings
    """
    for s in forbidden_substrings:
        check_(
            s not in symbol,
            f"invalid symbol: symbol '{symbol}' contains {s}",
            exception_cls=ValueError,
        )


def validate(symbol: str) -> None:
    """
    Validate a symbol.

    :param symbol: the symbol
    """
    # remove the double quotes
    symbol_unquoted = symbol.replace('"', "")

    # check if the symbol does not start with the 'val__' or the 'Y__' prefix
    _check_does_not_start_with(symbol_unquoted, [VAL_PREFIX, Y_PREFIX])

    # check if the symbol does not contain forbidden substrings
    _check_not_in(symbol_unquoted, [_LEFT_PAR, _RIGHT_PAR, _AND, _OR, _NOT, _QUOTE])

    # check if the symbol is a valid PDDL ground fluent
    parse_ground_fluent(symbol)
