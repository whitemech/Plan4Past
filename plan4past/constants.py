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

"""Constants for Plan4Past."""

from pddl.logic import Predicate
from pylogics.syntax.pltl import Atomic as PLTLAtomic

PNF = "pnf"
TRUE_ATOM = PLTLAtomic("true")
GOAL_PREDICATE = Predicate("goal", *[])
CHECK_PREDICATE = Predicate("evaluate-pnf", *[])
TRUE_PREDICATE = Predicate("true", *[])
EVALUATE_PNF_ACTION = "evaluate-pnf-action"
ACHIEVE_GOAL_ACTION = "achieve-goal"
