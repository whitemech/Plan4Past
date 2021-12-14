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

from typing import Dict

from pddl.logic import Predicate, constants
from pylogics.syntax.base import Formula
from pylogics.syntax.pltl import Atomic as PLTLAtomic

from planning_with_past.utils.atoms_visitor import find_atoms


def mapping_parser(text: str, formula: Formula) -> Dict[PLTLAtomic, Predicate]:
    """Parse symbols to ground predicates mapping."""
    symbols = find_atoms(formula)
    maps = text.split("\n")
    from_atoms_to_fluents = dict()
    for symbol in symbols:
        for map in maps:
            s, p = map.split(",")
            if symbol.name == s:
                if " " in p:
                    name, cons = p.split(" ", maxsplit=1)
                    from_atoms_to_fluents[symbol] = Predicate(name, *constants(cons))
                else:
                    from_atoms_to_fluents[symbol] = Predicate(p)
            else:
                continue
    return from_atoms_to_fluents
