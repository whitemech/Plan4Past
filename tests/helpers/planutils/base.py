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


from pathlib import Path

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
