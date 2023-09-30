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


"""This module contains the Fast-Downward wrapper for the planutils docker image."""
import logging
from enum import Enum
from pathlib import Path
from typing import Sequence

from tests.helpers.planutils.base import (
    BasePlannerWrapper,
    PlannerResult,
    PlanutilsDockerImage,
)

logger = logging.getLogger(__name__)


class Heuristics(Enum):
    """The heuristics available for Fast-Downward."""

    FF = "ff"
    HMAX = "hmax"


class FastDownwardWrapper(BasePlannerWrapper):
    """A wrapper for the Fast-Downward planner."""

    def __init__(
        self, image: PlanutilsDockerImage, heuristic: Heuristics = Heuristics.FF
    ):
        """Initialize the wrapper."""
        super().__init__(image)

        self._heuristic = heuristic

    def get_planner_cmd(
        self, bind_path: Path, domain: Path, problem: Path
    ) -> Sequence[str]:
        """Return the command to run the planner."""
        return [
            "downward",
            str(bind_path / domain.name),
            str(bind_path / problem.name),
            # we need escaping due to nuances in using planutils with docker
            f'--search "astar\\({self._heuristic.value}\\(\\)\\)"',
        ]

    def process_output(self, working_directory: Path, stdout: str) -> PlannerResult:
        """Process the output of the planner."""
        logger.debug("Processing output of LAMA")

        # the sas_plan file is in the /root directory
        sas_file = working_directory / "sas_plan"

        sas_file_lines = self._process_sas_plan_file(sas_file)

        return PlannerResult(plan=tuple(sas_file_lines))
