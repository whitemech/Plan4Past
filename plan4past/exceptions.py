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

"""Exceptions for Plan4Past."""
from typing import Optional


class BasePlan4PastError(Exception):
    """Base exception for the library."""


class ProblemUnsolvableException(BasePlan4PastError):
    """Exception raised when the problem is unsolvable."""


class MalformedExpression(BasePlan4PastError):
    """Malformed expression exception."""


class MappingParserError(BasePlan4PastError):
    """Mapping parser error."""

    def __init__(self, message: str, *args, row_id: Optional[int] = None) -> None:
        """
        Initialize a mapping parser error.

        :param message: the error message
        :param args: the error message arguments
        :param row_id: the row id
        """
        self.row_id = row_id

        super().__init__(self._make_message_prefix() + message, *args)

    def _make_message_prefix(self) -> str:
        """Make the message prefix."""
        if self.row_id is None:
            return "invalid mapping: "
        return f"invalid mapping at row {self.row_id}: "
