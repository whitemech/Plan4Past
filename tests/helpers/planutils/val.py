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


"""This module contains the VAL wrapper for the planutils docker image."""
import re
from dataclasses import dataclass
from pathlib import Path
from typing import Optional, Sequence

from tests.helpers.docker import DockerImage


@dataclass(frozen=True)
class VALResult:
    """The result of the validation."""

    errors: Sequence[str]
    warnings: Sequence[str]

    @property
    def nb_errors(self) -> int:
        """Return the number of errors."""
        return len(self.errors)

    @property
    def nb_warnings(self) -> int:
        """Return the number of warnings."""
        return len(self.warnings)

    def is_valid(self, strict: bool = False) -> bool:
        """Return whether the result is valid."""
        return self.nb_errors == 0 and (not strict or self.nb_warnings == 0)


class VALWrapper:
    """A wrapper for the PDDL validator."""

    def __init__(self, planutils_docker: DockerImage) -> None:
        """Initialize the wrapper."""
        self._planutils_docker = planutils_docker

    def validate_domain(self, domain: Path) -> VALResult:
        """Validate the domain."""
        return self._validate(domain, None)

    def validate_problem(self, domain: Path, problem: Path) -> VALResult:
        """Validate the problem."""
        return self._validate(domain, problem)

    def _validate(self, domain: Path, problem: Optional[Path]) -> VALResult:
        """Validate the domain and the problem."""
        assert domain.exists(), f"domain {domain} does not exist"
        assert domain.is_file(), f"domain {domain} is not a file"

        if problem is not None:
            assert problem.exists(), f"problem {problem} does not exist"
            assert problem.is_file(), f"problem {problem} is not a file"

        cmd = ["planutils", "run", "val", "Parser", str(domain)]
        if problem is not None:
            cmd.append(str(problem))

        stdout = self._planutils_docker.run(cmd)
        result = self._process_output(stdout)
        return result

    def _process_output(self, output: str) -> VALResult:
        """Process the output of the validator."""
        match = re.search("Errors: ([0-9]+), warnings: ([0-9]+)\n", output)
        assert match is not None, f"output {output} does not match the expected format"

        start = match.endpos
        errors_and_warnings = output[start:]
        errors_and_warnings_lines = errors_and_warnings.splitlines(keepends=False)

        errors = []
        warnings = []
        for line in errors_and_warnings_lines:
            if "Error:" in line:
                errors.append(line)
            elif "Warning:" in line:
                warnings.append(line)
            else:
                raise ValueError(f"line {line} does not match the expected format")

        return VALResult(errors=errors, warnings=warnings)
