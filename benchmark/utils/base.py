import operator
import re
from pathlib import Path

nan = float("nan")
CTRL_C_EXIT_CODE = -15


def to_seconds(millis: float) -> float:
    """From milliseconds to seconds."""
    return millis / 1000.0


def try_to_get_float(pattern: str, text: str, default=-1.0) -> float:
    """Try to extract a float number from text."""
    number_match = re.search(pattern, text)
    number = float(number_match.group(1)) if number_match else default
    return number


def get_tools(benchmark_dir: Path):
    tool_to_tsv = {}
    tool_dirs = list(filter(operator.methodcaller("is_dir"), benchmark_dir.iterdir()))
    for tool_dir in tool_dirs:
        tsv_files = list(tool_dir.glob("*.tsv"))
        assert len(tsv_files) == 1
        tsv_file = tsv_files[0]
        tool_to_tsv[tool_dir.name] = tsv_file
    return tool_to_tsv

