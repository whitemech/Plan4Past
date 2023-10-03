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

"""This module contain tests for the compiler module, using the elevators domain."""
import json
from pathlib import Path
from typing import Tuple

import pytest

from tests.helpers.constants import ELEVATORS_DIR
from tests.test_compiler.base import BaseCompilerTest


class TestElevatorsDet(BaseCompilerTest):
    """Test class for deterministic Elevators experiments."""

    PATH_TO_DOMAINS_DIR = ELEVATORS_DIR
    PATH_TO_INSTANCES_DIR = ELEVATORS_DIR
    TEGS = ELEVATORS_DIR / "elevators_teg.json"
    MIN_INSTANCE_ID = 2
    MAX_INSTANCE_ID = 9
    EXPECTED_PLANS = {
        "s2-0": (
            "(up f0 f1)",
            "(board f1 p1)",
            "(up f1 f3)",
            "(board f3 p0)",
            "(down f3 f2)",
            "(depart f2 p0)",
            "(up f2 f3)",
            "(depart f3 p1)",
        ),
        "s3-0": (
            "(up f0 f1)",
            "(board f1 p0)",
            "(up f1 f4)",
            "(depart f4 p0)",
            "(down f4 f3)",
            "(board f3 p1)",
            "(down f3 f1)",
            "(depart f1 p1)",
            "(up f1 f5)",
            "(board f5 p2)",
            "(down f5 f1)",
            "(depart f1 p2)",
        ),
        "s4-0": (
            "(up f0 f1)",
            "(board f1 p1)",
            "(up f1 f3)",
            "(depart f3 p1)",
            "(down f3 f1)",
            "(board f1 p2)",
            "(up f1 f7)",
            "(board f7 p0)",
            "(down f7 f6)",
            "(depart f6 p0)",
            "(up f6 f7)",
            "(depart f7 p2)",
            "(down f7 f2)",
            "(board f2 p3)",
            "(up f2 f4)",
            "(depart f4 p3)",
        ),
        "s5-0": (
            "(up f0 f7)",
            "(board f7 p1)",
            "(down f7 f5)",
            "(depart f5 p1)",
            "(down f5 f3)",
            "(board f3 p0)",
            "(board f3 p2)",
            "(up f3 f6)",
            "(depart f6 p0)",
            "(down f6 f5)",
            "(depart f5 p2)",
            "(up f5 f6)",
            "(board f6 p3)",
            "(down f6 f2)",
            "(depart f2 p3)",
            "(up f2 f9)",
            "(board f9 p4)",
            "(down f9 f1)",
            "(depart f1 p4)",
        ),
        "s6-0": (
            "(up f0 f5)",
            "(board f5 p2)",
            "(up f5 f7)",
            "(depart f7 p2)",
            "(board f7 p0)",
            "(up f7 f10)",
            "(depart f10 p0)",
            "(down f10 f9)",
            "(board f9 p1)",
            "(board f9 p4)",
            "(down f9 f7)",
            "(depart f7 p1)",
            "(down f7 f1)",
            "(depart f1 p4)",
            "(up f1 f10)",
            "(board f10 p3)",
            "(down f10 f0)",
            "(depart f0 p3)",
            "(up f0 f2)",
            "(board f2 p5)",
            "(up f2 f7)",
            "(depart f7 p5)",
        ),
        "s7-0": (
            "(up f0 f1)",
            "(board f1 p2)",
            "(up f1 f3)",
            "(depart f3 p2)",
            "(down f3 f1)",
            "(board f1 p0)",
            "(board f1 p4)",
            "(up f1 f4)",
            "(depart f4 p0)",
            "(up f4 f9)",
            "(board f9 p1)",
            "(down f9 f5)",
            "(depart f5 p1)",
            "(down f5 f3)",
            "(depart f3 p4)",
            "(up f3 f10)",
            "(board f10 p3)",
            "(down f10 f2)",
            "(depart f2 p3)",
            "(board f2 p5)",
            "(up f2 f5)",
            "(depart f5 p5)",
            "(up f5 f6)",
            "(board f6 p6)",
            "(up f6 f11)",
            "(depart f11 p6)",
        ),
        "s8-0": (
            "(up f0 f1)",
            "(board f1 p2)",
            "(up f1 f15)",
            "(depart f15 p2)",
            "(down f15 f7)",
            "(board f7 p0)",
            "(up f7 f10)",
            "(board f10 p3)",
            "(up f10 f12)",
            "(depart f12 p3)",
            "(down f12 f6)",
            "(depart f6 p0)",
            "(up f6 f9)",
            "(board f9 p1)",
            "(board f9 p4)",
            "(down f9 f3)",
            "(depart f3 p1)",
            "(board f3 p7)",
            "(up f3 f13)",
            "(depart f13 p4)",
            "(down f13 f6)",
            "(depart f6 p7)",
            "(down f6 f2)",
            "(board f2 p6)",
            "(up f2 f11)",
            "(depart f11 p6)",
            "(down f11 f10)",
            "(board f10 p5)",
            "(up f10 f11)",
            "(depart f11 p5)",
        ),
        "s9-0": (
            "(up f0 f10)",
            "(board f10 p3)",
            "(up f10 f12)",
            "(depart f12 p3)",
            "(down f12 f1)",
            "(board f1 p0)",
            "(up f1 f16)",
            "(depart f16 p0)",
            "(down f16 f9)",
            "(board f9 p1)",
            "(down f9 f7)",
            "(depart f7 p1)",
            "(down f7 f5)",
            "(board f5 p2)",
            "(board f5 p7)",
            "(up f5 f7)",
            "(depart f7 p2)",
            "(down f7 f4)",
            "(depart f4 p7)",
            "(up f4 f15)",
            "(board f15 p4)",
            "(down f15 f1)",
            "(depart f1 p4)",
            "(up f1 f6)",
            "(board f6 p8)",
            "(down f6 f0)",
            "(depart f0 p8)",
            "(up f0 f14)",
            "(board f14 p5)",
            "(down f14 f13)",
            "(depart f13 p5)",
            "(up f13 f14)",
            "(board f14 p6)",
            "(down f14 f7)",
            "(depart f7 p6)",
        ),
    }

    def make_formula(self, instance_id: int, domain: Path, problem: Path) -> str:
        """Make the formula for the given instance."""
        tegs = json.loads(self.TEGS.read_text())
        return tegs[f"s{instance_id}-0"]

    def get_instance_file(self, instance_id: int) -> Path:
        """Get the instance file for the given instance."""
        return self.PATH_TO_INSTANCES_DIR / f"s{instance_id}-0.pddl"

    def get_expected_plan(self, instance_id: int) -> Tuple[str, ...]:
        """Get the expected plan for the given instance."""
        return self.EXPECTED_PLANS[f"s{instance_id}-0"]

    @pytest.mark.parametrize(
        "instance_id", list(range(MIN_INSTANCE_ID, MAX_INSTANCE_ID + 1))
    )
    @BaseCompilerTest.parametrize_compiler()
    def test_run(self, instance_id, compiler_builder, val, default_planner):
        """Test the instance with the given id."""
        self._test_instance(
            instance_id, compiler_builder, val=val, planner=default_planner
        )
