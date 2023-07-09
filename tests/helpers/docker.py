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


"""This module contains testing utilities for using Docker images."""
import logging
import re
import shutil
import subprocess  # nosec
from abc import ABC
from pathlib import Path
from typing import Any, Mapping, Optional, Sequence

import docker
import pytest
from docker import DockerClient

logger = logging.getLogger(__name__)


class DockerImage(ABC):
    """A class to wrap interatction with a Docker image."""

    MINIMUM_DOCKER_VERSION = (19, 0, 0)

    def __init__(
        self,
        client: DockerClient,
        tag: str,
        dockerfile: Optional[Path] = None,
        context: Optional[Path] = None,
    ) -> None:
        """Initialize."""
        self._client = client

        self._tag = tag
        self._dockerfile = dockerfile
        self._context = context

    @property
    def tag(self) -> str:
        """Return the tag of the image."""
        return self._tag

    @property
    def dockerfile(self) -> Path:
        """Return the path to the Dockerfile."""
        assert self._dockerfile is not None
        return self._dockerfile

    @property
    def context(self) -> Path:
        """Return the path to the context."""
        assert self._context is not None
        return self._context

    def check_skip(self):
        """
        Check whether the test should be skipped.

        By default, nothing happens.
        """
        self._check_docker_binary_available()

    def _check_docker_binary_available(self):
        """Check the 'Docker' CLI tool is in the OS PATH."""
        result = shutil.which("docker")
        if result is None:
            pytest.skip("Docker not in the OS Path; skipping the test")

        result = subprocess.run(  # nosec
            ["docker", "--version"],
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            check=False,
        )
        if result.returncode != 0:
            pytest.skip(f"'docker --version' failed with exit code {result.returncode}")

        match = re.search(
            r"Docker version ([0-9]+)\.([0-9]+)\.([0-9]+)",
            result.stdout.decode("utf-8"),
        )
        if match is None:
            pytest.skip("cannot read version from the output of 'docker --version'")
        version = (int(match.group(1)), int(match.group(2)), int(match.group(3)))
        if version < self.MINIMUM_DOCKER_VERSION:
            pytest.skip(
                f"expected Docker version to be at least {'.'.join(map(str, self.MINIMUM_DOCKER_VERSION))}, "
                f"found {'.'.join(map(str,version))}"
            )

    def build(self, retries=3) -> None:
        """Build the image."""
        assert self._dockerfile is not None, "Dockerfile not set"
        for _ in range(retries):
            try:
                _image, build_logs = self._client.images.build(
                    path=str(self.context),
                    dockerfile=str(self.dockerfile),
                    tag=self.tag,
                    **self._get_build_kwargs(),
                )
                for log_line in build_logs:
                    if "stream" in log_line:
                        line = log_line["stream"].strip()
                        if line:
                            logger.debug(line)
            except Exception as e:  # pylint: disable=broad-except
                pytest.fail(f"failed to build image: {type(e)}: {e}")

    def _get_build_kwargs(self) -> Mapping[str, Any]:
        """Return the keyword arguments to pass to the build command."""
        return {}

    def pull_image(self, retries=3) -> None:
        """Pull image from remote repo."""
        for _ in range(retries):
            try:
                self._client.images.pull(self.tag)
                return
            except Exception as e:  # pylint: disable=broad-except
                pytest.fail(f"failed to pull image: {e}")

    def stop_if_already_running(self):
        """Stop the running images with the same tag, if any."""
        client = docker.from_env()
        for container in client.containers.list():
            if self.tag in container.image.tags:
                logger.info("Stopping image %s ...", self.tag)
                container.stop()
                container.wait()
                logger.info("Image %s stopped", self.tag)

    def run(self, cmd: Sequence[str], **kwargs) -> str:
        """Create the container."""
        assert "command" not in kwargs
        assert "remove" not in kwargs
        assert "privileged" not in kwargs
        stdout = self._client.containers.run(
            self.tag, command=cmd, remove=True, privileged=True, **kwargs
        )
        return stdout.decode("utf-8")
