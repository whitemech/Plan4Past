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

"""This module contains constants for the tests."""

import inspect
from pathlib import Path

ROOT_DIR = Path(inspect.getfile(inspect.currentframe())).resolve().parent.parent.parent  # type: ignore
TEST_DIR = ROOT_DIR / "tests"
EXAMPLES_DIR = ROOT_DIR / "examples"
EXAMPLE_MAP_FILE = EXAMPLES_DIR / "pddl/p-0.map"


BENCHMARKS_DIR = TEST_DIR / "benchmarks"
BLOCKSWORLD_DIR = BENCHMARKS_DIR / "deterministic" / "BF" / "blocksworld_ppltl"


DOCKER_DIR = TEST_DIR / "docker"
PLANUTILS_DOCKERFILE = DOCKER_DIR / "Dockerfile-planutils"
