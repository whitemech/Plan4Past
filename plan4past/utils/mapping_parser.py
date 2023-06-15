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

from typing import Dict

from pddl.logic import Predicate, constants
from pylogics.syntax.base import Formula
from pylogics.syntax.pltl import Atomic as PLTLAtomic

from plan4past.utils.atoms_visitor import find_atoms


def mapping_parser(text: str, formula: Formula) -> Dict[PLTLAtomic, Predicate]:
    """Parse symbols to ground predicates mapping."""
    symbols = find_atoms(formula)
    maps = text.split("\n")
    from_atoms_to_fluents = {}
    for symbol in symbols:
        for vmap in maps:
            s, p = vmap.split(",")
            if symbol.name == s:
                if " " in p:
                    name, cons = p.split(" ", maxsplit=1)
                    from_atoms_to_fluents[symbol] = Predicate(name, *constants(cons))
                else:
                    from_atoms_to_fluents[symbol] = Predicate(p)
            else:
                continue
    return from_atoms_to_fluents
