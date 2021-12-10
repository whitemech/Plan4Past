nan = float("nan")
CTRL_C_EXIT_CODE = -15


def to_seconds(millis: float) -> float:
    """From milliseconds to seconds."""
    return millis / 1000.0
