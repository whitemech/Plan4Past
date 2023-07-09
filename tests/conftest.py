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

"""This module contains fixtures for the tests."""

import pytest
from docker import DockerClient

from tests.helpers.planutils.base import BasePlannerWrapper, PlanutilsDockerImage
from tests.helpers.planutils.downward import FastDownwardWrapper
from tests.helpers.planutils.lama import LAMAWrapper
from tests.helpers.planutils.val import VALWrapper

# pylint: disable=redefined-outer-name


@pytest.fixture(scope="session")
def docker_client() -> DockerClient:
    """Return the docker client."""
    return DockerClient()


@pytest.fixture(scope="session")
def planutils_docker_image(
    docker_client,
) -> PlanutilsDockerImage:
    """Return the planutils docker image."""
    image = PlanutilsDockerImage(docker_client)
    image.build()
    return image


@pytest.fixture(scope="session")
def val(planutils_docker_image) -> VALWrapper:
    """Return the val wrapper."""
    return VALWrapper(planutils_docker_image)


@pytest.fixture(scope="session")
def lama(
    planutils_docker_image,
) -> BasePlannerWrapper:
    """Return the LAMA wrapper."""
    return LAMAWrapper(planutils_docker_image)


@pytest.fixture(scope="session")
def fast_downward(
    planutils_docker_image,
) -> BasePlannerWrapper:
    """Return the Fast-Downward wrapper."""
    return FastDownwardWrapper(planutils_docker_image)


@pytest.fixture(scope="session")
def default_planner(fast_downward) -> BasePlannerWrapper:
    """Return the default planner."""
    return fast_downward
