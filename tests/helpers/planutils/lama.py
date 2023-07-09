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


"""This module contains the LAMA wrapper for the planutils docker image."""
import logging
from pathlib import Path
from typing import Sequence

from tests.helpers.planutils.base import BasePlannerWrapper, PlannerResult

logger = logging.getLogger(__name__)


class LAMAWrapper(BasePlannerWrapper):
    """A wrapper for the LAMA planner."""

    def get_planner_cmd(
        self, bind_path: Path, domain: Path, problem: Path
    ) -> Sequence[str]:
        """Return the command to run the planner."""
        return ["lama", str(bind_path / domain.name), str(bind_path / problem.name)]

    def process_output(self, working_directory: Path, stdout: str) -> PlannerResult:
        """Process the output of the planner."""
        logger.debug("Processing output of LAMA")

        # the sas_plan file is in the /root directory
        sas_file = working_directory / "sas_plan.1"

        sas_file_lines = sas_file.read_text().splitlines(keepends=False)
        # remove last line
        last_line = sas_file_lines[-1]
        sas_file_lines = sas_file_lines[:-1]

        # check removed lines were not relevant
        assert last_line.startswith("; cost = ")

        return PlannerResult(plan=sas_file_lines)
