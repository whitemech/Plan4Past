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
from typing import Generic, Set, TypeVar

import networkx as nx

NodeType = TypeVar("NodeType")


class BasePlan(ABC, Generic[NodeType]):
    """Base class to build and represent a plan."""

    @property
    def nodes(self) -> Set[NodeType]:
        """Get the set of nodes."""
        raise NotImplementedError

    @property
    def graph(self) -> nx.DiGraph:
        """Get the graph."""
        raise NotImplementedError

    @abstractmethod
    def add_edge(self, start: NodeType, end: NodeType, **attr):
        """Add an edge."""
        raise NotImplementedError

    @abstractmethod
    def add_node(self, node: NodeType, **attr):
        """Add a node."""
        raise NotImplementedError


class Plan(BasePlan[int]):
    """
    Class to represent a plan.

    Wrapper of a networkX.DiGraph.
    """

    def __init__(self):
        """Initialize the plan."""
        self._g = nx.DiGraph()
        self._g.add_node(0)

    @property
    def nodes(self) -> Set[int]:
        """Return the set of nodes."""
        return set(self._g.nodes)

    @property
    def graph(self) -> nx.DiGraph:
        """Get the graph."""
        return self._g

    def add_edge(self, start: NodeType, end: NodeType, **attr):
        """Add an edge."""
        self._g.add_edge(start, end, **attr)

    def add_node(self, node: NodeType, **attr):
        """Add a node."""
        self._g.add_node(node, **attr)
