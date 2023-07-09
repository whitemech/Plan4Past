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

from pddl.logic import Predicate, constants

_PDDL_NAME_REGEX = "[A-Za-z][-_A-Za-z0-9]*"
_GROUND_FLUENT_REGEX = re.compile(
    rf"(\"({_PDDL_NAME_REGEX})( {_PDDL_NAME_REGEX})*\")|({_PDDL_NAME_REGEX})"
)


def add_val_prefix(name: str):
    """Add the 'prime' prefix."""
    return "val-" + name.replace('"', "")


def remove_before_prefix(name: str):
    """Remove the 'Y' prefix."""
    return (
        name.replace("Y-", "")
        if name.startswith("Y-")
        else name.replace("Y", "", 1)
        if name.startswith("Y")
        else name
    )


def remove_val_prefix(name: str):
    """Remove the 'prime' prefix."""
    return name.replace("val-", "") if name.startswith("val-") else name


def replace_symbols(name: str):
    """Stringify symbols."""
    return (
        name.replace('"', "")
        .replace("(", "")
        .replace(")", "")
        .replace("&", "and")
        .replace("|", "or")
        .replace("~", "not-")
        .replace("!", "not-")
        .replace(" ", "-")
    )


def check_(condition: bool, message: str = "") -> None:
    """
    User-defined assert.

    This function is useful to avoid the use of the built-in assert statement, which is removed
        when the code is compiled in optimized mode. For more information, see
        https://bandit.readthedocs.io/en/1.7.5/plugins/b101_assert_used.html
    """
    if not condition:
        raise AssertionError(message)


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


def validate(symbol: str) -> None:
    """
    Validate a symbol.

    :param symbol: the symbol
    """
    # check if the symbol is a valid PDDL ground fluent
    parse_ground_fluent(symbol)
