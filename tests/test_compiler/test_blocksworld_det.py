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

"""This module contain tests for the compiler module, using the blocksworld domain."""
from pathlib import Path
from typing import Tuple

import pytest

from tests.helpers.constants import BLOCKSWORLD_DIR
from tests.test_compiler.base import BaseCompilerTest


class TestBlocksworldDetSimpleSequence(BaseCompilerTest):
    """Test class for deterministic Blocksworld experiments, simple sequence."""

    PATH_TO_DOMAINS_DIR = BLOCKSWORLD_DIR
    PATH_TO_INSTANCES_DIR = BLOCKSWORLD_DIR
    MIN_INSTANCE_ID = 10
    MAX_INSTANCE_ID = 10

    def make_formula(self, instance_id: int, domain: Path, problem: Path) -> str:
        """
        Make the formula for the given instance.

        Builds a chain of the form:

            O(on_b1_b2 & Y(O(on_b2_b3 & Y(O(... on_bn_bn+1 ...)))

        :param instance_id: the id of the problem instance
        :param domain: path to the domain file
        :param problem: path to the problem file
        :return: the formula
        """
        formula = ""
        trailing_brackets = ""
        for i in range(1, instance_id):
            last = i == instance_id - 1
            formula += f"O(on_b{i}_b{i + 1}" + (" & Y(" if not last else "")
            trailing_brackets += "))" if not last else ")"
        return formula + trailing_brackets

    def get_expected_plan(self, instance_id: int) -> Tuple[str, ...]:
        """Get the expected plan for the given instance."""
        result = []
        for i in range(instance_id - 1, 0, -1):
            result.append(f"(pick-up b{i})")
            result.append(f"(stack b{i} b{i + 1})")
        return tuple(result)

    @pytest.mark.parametrize(
        "instance_id", list(range(MIN_INSTANCE_ID, MAX_INSTANCE_ID + 1))
    )
    @BaseCompilerTest.parametrize_compiler()
    def test_run(self, instance_id, compiler_builder, val, default_planner):
        """Test the instance with the given id."""
        self._test_instance(
            instance_id, compiler_builder, val=val, planner=default_planner
        )
