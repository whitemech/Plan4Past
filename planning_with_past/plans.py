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

"""Core classes useful for programmatic usage of planners."""
from abc import ABC, abstractmethod
from typing import Hashable

import networkx as nx


class BasePlan(ABC):
    """Base class to build and represent a plan."""

    @abstractmethod
    def add_edge(self, start: Hashable, end: Hashable, **attr):
        """Add an edge."""
        raise NotImplementedError

    @abstractmethod
    def add_node(self, node: Hashable, **attr):
        """Add a node."""
        raise NotImplementedError


class Plan(BasePlan):
    """
    Class to represent a plan.

    In fact, it is a delegator to a networkX.DiGraph.
    """

    def __init__(self):
        """Initialize the plan."""
        self._g = nx.DiGraph()
        self._g.add_node(0)

    @property
    def nodes(self):
        """Return the set of nodes."""
        return self._g.nodes

    def add_edge(self, start: Hashable, end: Hashable, **attr):
        """Add an edge."""
        self._g.add_edge(start, end, **attr)

    def add_node(self, node: Hashable, **attr):
        """Add a node."""
        self._g.add_node(node, **attr)
