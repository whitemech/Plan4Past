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

"""Interface for planner wrappers."""
from abc import ABC, abstractmethod
from pathlib import Path
from typing import Dict

from planning_with_past.plans import BasePlan


class Planner(ABC):  # pylint: disable=too-few-public-methods
    """Interface for planner wrappers."""

    @abstractmethod
    def plan(self, domain: Path, problem: Path, **options: Dict[str, str]) -> BasePlan:
        """
        Find a plan.

        :param domain: path to the domain file.
        :param problem: path to the problem file.
        :param options: a dictionary of options.
        :return: a plan.
        """
