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

"""Mapping parser."""
import re
from typing import Dict, Optional, Sequence, Set, Tuple

from pddl.custom_types import name
from pddl.logic import Constant, Predicate, constants
from pylogics.syntax.base import Formula
from pylogics.syntax.pltl import Atomic as PLTLAtomic

from plan4past.utils.atoms_visitor import find_atoms


class MappingParserError(Exception):
    """Mapping parser error."""

    def __init__(self, message: str, *args, row_id: Optional[int] = None) -> None:
        """
        Initialize a mapping parser error.

        :param message: the error message
        :param args: the error message arguments
        :param row_id: the row id
        """
        self.row_id = row_id

        super().__init__(self._make_message_prefix() + message, *args)

    def _make_message_prefix(self) -> str:
        """Make the message prefix."""
        if self.row_id is None:
            return "invalid mapping: "
        return f"invalid mapping at row {self.row_id}: "


SYMBOL_REGEX = re.compile("[a-z_]([a-zA-Z0-9_-]+[a-zA-Z0-9_])|[a-z_][a-zA-Z0-9_]*")
"""The following is a sub-regex of AtomName.REGEX in pylogics.syntax.base."""


def _check_pddl_name(row_id: int, pddl_name: str, what: str) -> None:
    """Check that a PDDL name is valid."""
    try:
        name(pddl_name)
    except ValueError as e:
        raise MappingParserError(
            f"got an invalid name for {what}: '{pddl_name}'. It must match the regex {name.REGEX}",
            row_id=row_id,
        ) from e


def _parse_constants(row_id: int, constants_str: str) -> Sequence[Constant]:
    """
    Parse a string of constants.

    :param row_id: the row id
    :param constants_str: the string of constants
    :return: the sequence of constants
    """
    try:
        return constants(constants_str)
    except ValueError as e:
        raise MappingParserError(f"got an invalid constant: {e}", row_id=row_id) from e


def _parse_predicate(row_id: int, predicate_str: str) -> Predicate:
    """
    Parse a predicate.

    :param row_id: the row id
    :param predicate_str: the predicate string
    :return: the predicate
    """
    predicate_name, cons = predicate_str.split(" ", maxsplit=1)

    _check_pddl_name(row_id, predicate_name, "a predicate")
    parsed_constants = _parse_constants(row_id, cons)
    return Predicate(predicate_name, *parsed_constants)


def _process_row(row_id: int, row_str: str) -> Tuple[str, Predicate]:
    """
    Process a row of the mapping file.

    :param row_id: the row id
    :param row_str: the row string
    :return: the pair (symbol_name, predicate_str)
    """
    # check the row is a valid mapping
    comma_separated_row_parts = row_str.split(",")
    if len(comma_separated_row_parts) != 2:
        raise MappingParserError(
            "expected a mapping of the form '<symbol>,<predicate>'", row_id=row_id
        )

    symbol_name, predicate = comma_separated_row_parts

    # strip leading and trailing whitespaces
    symbol_name = symbol_name.strip()
    predicate_str = predicate.strip()

    if symbol_name == "" or SYMBOL_REGEX.fullmatch(symbol_name) is None:
        raise MappingParserError(
            "symbol cannot be empty string and must match the regex {SYMBOL_REGEX}",
            row_id=row_id,
        )
    if predicate_str == "":
        raise MappingParserError("predicate cannot be empty string", row_id=row_id)

    predicate = _parse_predicate(row_id, predicate_str)
    return symbol_name, predicate


def _check_unmapped_symbols(
    all_symbol_names: Set[str], mapped_symbol_names: Set[str]
) -> None:
    """Check that all symbols are mapped."""
    # check if there are unmapped symbols (exclude 'true' and 'false')
    unmapped_symbols = all_symbol_names - {"true", "false"} - mapped_symbol_names
    # if some symbols are not mapped, raise an error
    if unmapped_symbols:
        raise MappingParserError(
            f"the following symbols of the formula are not mapped: {unmapped_symbols}"
        )


def should_skip_row(row_str: str) -> bool:
    """Check if a row should be skipped."""
    # skip empty lines
    if row_str.strip() == "":
        return True

    # skip comments
    if row_str.strip().startswith(";"):
        return True

    return False


def mapping_parser(text: str, formula: Formula) -> Dict[PLTLAtomic, Predicate]:
    """Parse symbols to ground predicates mapping."""
    symbols = find_atoms(formula)
    symbols_by_name = {symbol.name: symbol for symbol in symbols}
    maps = text.splitlines(keepends=False)
    from_atoms_to_fluents = {}
    mapped_symbol_names = set()

    for row_id, vmap in enumerate(maps):
        if should_skip_row(vmap):
            continue

        symbol_name, predicate = _process_row(row_id, vmap)

        if symbol_name not in symbols_by_name:
            # don't need to process this row, since the symbol does not occur in the formula
            continue

        if symbol_name in mapped_symbol_names:
            raise MappingParserError(
                f"symbol '{symbol_name}' is mapped multiple times", row_id=row_id
            )

        symbol = symbols_by_name[symbol_name]
        mapped_symbol_names.add(symbol_name)

        from_atoms_to_fluents[symbol] = predicate

    _check_unmapped_symbols(set(symbols_by_name.keys()), mapped_symbol_names)
    return from_atoms_to_fluents
