import operator
import re
from pathlib import Path
<<<<<<< HEAD

from pddl.logic.base import And
from pddl.parser.problem import ProblemParser
=======
>>>>>>> benchmark

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


def get_reachability_goal(problem_path: Path) -> str:
    """Get reachability goal from problem."""
    problem_obj = ProblemParser()(problem_path.read_text())
    goal_formula = problem_obj.goal
    if isinstance(goal_formula, And):
        # [1:-1] to remove brackets
        return " & ".join([str(atom)[1:-1].replace(" ", "_") for atom in goal_formula.operands])
    raise ValueError("expected an 'and' goal")


def get_tools(benchmark_dir: Path):
    tool_to_tsv = {}
    tool_dirs = list(filter(operator.methodcaller("is_dir"), benchmark_dir.iterdir()))
    for tool_dir in tool_dirs:
        tsv_files = list(tool_dir.glob("*.tsv"))
        assert len(tsv_files) == 1
        tsv_file = tsv_files[0]
        tool_to_tsv[tool_dir.name] = tsv_file
    return tool_to_tsv
