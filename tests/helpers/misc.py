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

"""This module contains miscellaneous helper functions for tests."""
import contextlib
import os
from os import PathLike
from pathlib import Path
from tempfile import TemporaryDirectory
from typing import Generator, Tuple

from pddl.core import Domain, Problem
from pddl.formatter import domain_to_string, problem_to_string

from tests.helpers.planutils.base import BasePlannerWrapper
from tests.helpers.planutils.val import VALWrapper


@contextlib.contextmanager
def cd(path: PathLike) -> Generator:  # pylint: disable=invalid-name
    """Change working directory temporarily."""
    old_path = Path.cwd()
    os.chdir(path)
    try:
        yield
    finally:
        os.chdir(str(old_path))


@contextlib.contextmanager
def temporary_dir_with_pddl_files(
    domain: Domain, problem: Problem
) -> Generator[Tuple[Path, Path, Path], None, None]:
    """Create a temporary directory with the given domain and problem files."""
    with TemporaryDirectory() as tmpdir:
        tmpdir_path = Path(tmpdir)
        new_domain_path = tmpdir_path / "new-domain.pddl"
        new_problem_path = tmpdir_path / "new-problem.pddl"
        with open(new_domain_path, "w+", encoding="utf-8") as d:
            d.write(domain_to_string(domain))
        with open(new_problem_path, "w+", encoding="utf-8") as p:
            p.write(problem_to_string(problem))

        yield tmpdir_path, new_domain_path, new_problem_path


def check_compilation(
    domain: Domain,
    problem: Problem,
    val: VALWrapper,
    planner: BasePlannerWrapper,
    expected_plan: Tuple[str, ...],
) -> None:
    """Check that the compilation of the domain and problem is correct."""
    with temporary_dir_with_pddl_files(domain, problem) as (
        _tmpdir_path,
        new_domain_path,
        new_problem_path,
    ):
        result = val.validate_problem(new_domain_path, new_problem_path)
        assert result.is_valid(
            strict=True
        ), f"Compilation failed: \nerrors: {result.errors}\nwarnings: {result.warnings}"

        plan_result = planner.plan(new_domain_path, new_problem_path)
        assert (
            plan_result.plan == expected_plan
        ), f"Plan is not correct:\nexpected: {expected_plan}\nactual: {plan_result.plan}"
