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

"""This module contain tests for the compiler module, using the openstacks domain."""
import json
from pathlib import Path
from typing import Tuple

import pytest

from tests.helpers.constants import OPENSTACKS_DIR
from tests.test_compiler.base import BaseCompilerTest


class TestOpenStacksDet(BaseCompilerTest):
    """Test class for deterministic OpenStacks experiments."""

    PATH_TO_DOMAINS_DIR = OPENSTACKS_DIR
    PATH_TO_INSTANCES_DIR = OPENSTACKS_DIR
    TEGS = OPENSTACKS_DIR / "openstacks_teg.json"
    MIN_INSTANCE_ID = 1
    MAX_INSTANCE_ID = 5
    EXPECTED_PLANS = {
        "p01": (
            "(setup-machine-p1-n0 )",
            "(open-new-stack-n0-n1 )",
            "(start-order-o1-n1-n0 )",
            "(open-new-stack-n0-n1 )",
            "(start-order-o3-n1-n0 )",
            "(make-product-p1-n0 )",
            "(setup-machine-p2-n0 )",
            "(open-new-stack-n0-n1 )",
            "(start-order-o5-n1-n0 )",
            "(make-product-p2-n0 )",
            "(ship-order-o1-n0-n1 )",
            "(setup-machine-p3-n1 )",
            "(start-order-o4-n1-n0 )",
            "(open-new-stack-n0-n1 )",
            "(start-order-o2-n1-n0 )",
            "(make-product-p3-n0 )",
            "(setup-machine-p4-n0 )",
            "(make-product-p4-n0 )",
            "(ship-order-o5-n0-n1 )",
            "(setup-machine-p5-n1 )",
            "(make-product-p5-n1 )",
            "(ship-order-o3-n1-n2 )",
            "(ship-order-o4-n2-n3 )",
            "(ship-order-o2-n3-n4 )",
        ),
        "p02": (
            "(setup-machine-p1-n0 )",
            "(open-new-stack-n0-n1 )",
            "(start-order-o1-n1-n0 )",
            "(open-new-stack-n0-n1 )",
            "(start-order-o3-n1-n0 )",
            "(make-product-p1-n0 )",
            "(setup-machine-p2-n0 )",
            "(open-new-stack-n0-n1 )",
            "(start-order-o4-n1-n0 )",
            "(make-product-p2-n0 )",
            "(ship-order-o1-n0-n1 )",
            "(setup-machine-p3-n1 )",
            "(start-order-o2-n1-n0 )",
            "(open-new-stack-n0-n1 )",
            "(start-order-o5-n1-n0 )",
            "(make-product-p3-n0 )",
            "(setup-machine-p4-n0 )",
            "(make-product-p4-n0 )",
            "(setup-machine-p5-n0 )",
            "(make-product-p5-n0 )",
            "(ship-order-o3-n0-n1 )",
            "(ship-order-o4-n1-n2 )",
            "(ship-order-o2-n2-n3 )",
            "(ship-order-o5-n3-n4 )",
        ),
        "p03": (
            "(setup-machine-p1-n0 )",
            "(open-new-stack-n0-n1 )",
            "(start-order-o1-n1-n0 )",
            "(open-new-stack-n0-n1 )",
            "(start-order-o4-n1-n0 )",
            "(make-product-p1-n0 )",
            "(setup-machine-p2-n0 )",
            "(open-new-stack-n0-n1 )",
            "(start-order-o5-n1-n0 )",
            "(make-product-p2-n0 )",
            "(ship-order-o1-n0-n1 )",
            "(setup-machine-p3-n1 )",
            "(start-order-o2-n1-n0 )",
            "(open-new-stack-n0-n1 )",
            "(start-order-o3-n1-n0 )",
            "(make-product-p3-n0 )",
            "(setup-machine-p4-n0 )",
            "(make-product-p4-n0 )",
            "(ship-order-o4-n0-n1 )",
            "(ship-order-o2-n1-n2 )",
            "(setup-machine-p5-n2 )",
            "(make-product-p5-n2 )",
            "(ship-order-o5-n2-n3 )",
            "(ship-order-o3-n3-n4 )",
        ),
        "p04": (
            "(setup-machine-p1-n0 )",
            "(open-new-stack-n0-n1 )",
            "(start-order-o1-n1-n0 )",
            "(open-new-stack-n0-n1 )",
            "(start-order-o4-n1-n0 )",
            "(make-product-p1-n0 )",
            "(setup-machine-p2-n0 )",
            "(open-new-stack-n0-n1 )",
            "(start-order-o5-n1-n0 )",
            "(make-product-p2-n0 )",
            "(ship-order-o1-n0-n1 )",
            "(setup-machine-p3-n1 )",
            "(start-order-o3-n1-n0 )",
            "(open-new-stack-n0-n1 )",
            "(start-order-o2-n1-n0 )",
            "(make-product-p3-n0 )",
            "(setup-machine-p4-n0 )",
            "(make-product-p4-n0 )",
            "(ship-order-o5-n0-n1 )",
            "(setup-machine-p5-n1 )",
            "(make-product-p5-n1 )",
            "(ship-order-o4-n1-n2 )",
            "(ship-order-o3-n2-n3 )",
            "(ship-order-o2-n3-n4 )",
        ),
        "p05": (
            "(setup-machine-p1-n0 )",
            "(open-new-stack-n0-n1 )",
            "(start-order-o1-n1-n0 )",
            "(open-new-stack-n0-n1 )",
            "(start-order-o5-n1-n0 )",
            "(make-product-p1-n0 )",
            "(setup-machine-p2-n0 )",
            "(open-new-stack-n0-n1 )",
            "(start-order-o4-n1-n0 )",
            "(make-product-p2-n0 )",
            "(ship-order-o1-n0-n1 )",
            "(setup-machine-p3-n1 )",
            "(start-order-o2-n1-n0 )",
            "(open-new-stack-n0-n1 )",
            "(start-order-o3-n1-n0 )",
            "(make-product-p3-n0 )",
            "(setup-machine-p4-n0 )",
            "(make-product-p4-n0 )",
            "(ship-order-o5-n0-n1 )",
            "(ship-order-o2-n1-n2 )",
            "(setup-machine-p5-n2 )",
            "(make-product-p5-n2 )",
            "(ship-order-o4-n2-n3 )",
            "(ship-order-o3-n3-n4 )",
        ),
    }

    def make_formula(self, instance_id: int, domain: Path, problem: Path) -> str:
        """Make the formula for the given instance."""
        tegs = json.loads(self.TEGS.read_text())
        return tegs[f"p{instance_id:02d}"]

    def get_domain_file(self, instance_id: int) -> Path:
        """Get the domain file for the given instance."""
        return self.PATH_TO_DOMAINS_DIR / f"domain_p{instance_id:02d}.pddl"

    def get_instance_file(self, instance_id: int) -> Path:
        """Get the instance file for the given instance."""
        return self.PATH_TO_INSTANCES_DIR / f"p{instance_id:02d}.pddl"

    def get_expected_plan(self, instance_id: int) -> Tuple[str, ...]:
        """Get the expected plan for the given instance."""
        return self.EXPECTED_PLANS[f"p{instance_id:02d}"]

    @pytest.mark.parametrize(
        "instance_id", list(range(MIN_INSTANCE_ID, MAX_INSTANCE_ID + 1))
    )
    @BaseCompilerTest.parametrize_compiler()
    def test_run(self, instance_id, compiler_builder, val, default_planner):
        """Test the instance with the given id."""
        self._test_instance(
            instance_id, compiler_builder, val=val, planner=default_planner
        )
