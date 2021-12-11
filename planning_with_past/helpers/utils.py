# -*- coding: utf-8 -*-
#
# Copyright 2021 Francesco Fuggitti, Marco Favorito
#
# ------------------------------
#
# This file is part of planning-with-past.
#
# planning-with-past is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# planning-with-past is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with planning-with-past.  If not, see <https://www.gnu.org/licenses/>.
#

"""Miscellanea utilities."""
import contextlib
import os
from os import PathLike
from pathlib import Path
from typing import Dict, Generator

from pddl.logic import Predicate, constants
from pylogics.syntax.base import Formula
from pylogics.syntax.pltl import Atomic as PLTLAtomic

from planning_with_past.utils.atoms_visitor import find_atoms


@contextlib.contextmanager
def cd(path: PathLike) -> Generator:  # pylint: disable=invalid-name
    """Change working directory temporarily."""
    old_path = Path.cwd()
    os.chdir(path)
    try:
        yield
    finally:
        os.chdir(str(old_path))


def add_val_prefix(name: str):
    """Add the 'prime' prefix."""
    return "val_" + name.replace('"', "")


def remove_val_prefix(name: str):
    """Remove the 'prime' prefix."""
    return name.replace("val_", "")


def replace_symbols(name: str):
    return (
        name.replace('"', "")
        .replace("(", "")
        .replace(")", "")
        .replace("&", "and")
        .replace("|", "or")
        .replace("~", "not-")
        .replace(" ", "-")
    )


def default_mapping(f: Formula) -> Dict[PLTLAtomic, Predicate]:
    """Compute mapping from atoms to fluents using underscores."""
    symbols = find_atoms(f)
    from_atoms_to_fluents = dict()
    for symbol in symbols:
        name, *cons = symbol.name.split("_")
        if cons:
            from_atoms_to_fluents[symbol] = Predicate(name, *constants(" ".join(cons)))
        else:
            from_atoms_to_fluents[symbol] = Predicate(name)
    return from_atoms_to_fluents
