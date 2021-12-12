import re

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

