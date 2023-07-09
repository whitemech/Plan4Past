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

"""This module contains base class for using planutils docker image."""
import shutil
from abc import abstractmethod
from dataclasses import dataclass
from pathlib import Path
from tempfile import TemporaryDirectory
from typing import Sequence, Tuple

from docker import DockerClient

from tests.helpers.constants import PLANUTILS_DOCKERFILE
from tests.helpers.docker import DockerImage


class PlanutilsDockerImage(DockerImage):
    """Wrapper to the Planutils Docker image."""

    TAG = "plan4past-dev/planutils:latest"

    def __init__(
        self,
        client: DockerClient,
        dockerfile: Path = PLANUTILS_DOCKERFILE,
    ):
        """
        Initialize the Planutils Docker image.

        :param client: the Docker client.
        """
        super().__init__(
            client, self.TAG, dockerfile=dockerfile, context=dockerfile.parent
        )


@dataclass(frozen=True)
class PlannerResult:
    """The result of the validation."""

    plan: Tuple[str, ...]

    @property
    def plan_length(self) -> int:
        """Return the number of steps."""
        return len(self.plan)


class BasePlannerWrapper:
    """Base class for the planner wrapper."""

    def __init__(self, image: PlanutilsDockerImage):
        """
        Initialize the planner wrapper.

        :param image: the Planutils Docker image.
        """
        self._planutils_docker = image

    def plan(self, domain: Path, problem: Path) -> PlannerResult:
        """
        Plan the problem.

        :param domain: the domain file.
        :param problem: the problem file.
        :return: the result of the planning.
        """
        # move files to a temporary directory
        with TemporaryDirectory() as tmp_dir:
            tmp_dir_path = Path(tmp_dir)

            domain_tmp = tmp_dir_path / domain.name
            problem_tmp = tmp_dir_path / problem.name
            # pylint: disable=duplicate-code
            shutil.copy(domain, domain_tmp)
            shutil.copy(problem, problem_tmp)

            bind_path = Path("/root/temp")
            volumes = {
                str(tmp_dir_path): {
                    "bind": str(bind_path),
                    "mode": "rw",
                },
            }

            cmd = [
                "planutils",
                "run",
                *self.get_planner_cmd(bind_path, domain, problem),
            ]

            stdout = self._planutils_docker.run(
                cmd, working_dir=str(bind_path), volumes=volumes
            )
            result = self.process_output(tmp_dir_path, stdout)
            return result

    @abstractmethod
    def get_planner_cmd(
        self, bind_path: Path, domain: Path, problem: Path
    ) -> Sequence[str]:
        """
        Return the command to run the planner.

        :param bind_path: the bind path in the Docker container. The domain and the problem files are copied there.
        :param domain: the domain file (in the host machine!).
        :param problem: the problem file (in the host machine!).
        :return:
        """
        raise NotImplementedError

    @abstractmethod
    def process_output(self, working_directory: Path, stdout: str) -> PlannerResult:
        """Process the output of the planner."""
        raise NotImplementedError

    def _process_sas_plan_file(self, sas_file: Path) -> Tuple[str, ...]:
        """
        Process the SAS plan file.

        :param sas_file: the plan file.
        :return: the plan.
        """
        sas_file_lines = sas_file.read_text().splitlines(keepends=False)
        # remove last line
        last_line = sas_file_lines[-1]
        sas_file_lines = sas_file_lines[:-1]

        # check removed lines were not relevant
        assert last_line.startswith("; cost = ")

        return tuple(sas_file_lines)
