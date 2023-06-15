import datetime
import logging
import operator
import re
import inspect
from enum import Enum
from pathlib import Path
from typing import List, Optional

from pddl.logic.base import And, Atomic
from pddl.parser.problem import ProblemParser

BENCHMARK_ROOT = Path(inspect.getframeinfo(inspect.currentframe()).filename).parent.parent  # type: ignore
REPO_ROOT = BENCHMARK_ROOT.parent


DATASET_DIR_DET = "deterministic"
DATASET_DIR_NONDET = "non-deterministic"

TSV_FILENAME = "output.tsv"


nan = float("nan")
CTRL_C_EXIT_CODE = -15


class ExperimentType(Enum):
    A = "a"
    B = "b"


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
        return " & ".join(
            [str(atom)[1:-1].replace(" ", "_") for atom in goal_formula.operands]
        )
    elif isinstance(goal_formula, Atomic):
        return str(goal_formula)[1:-1].replace(" ", "_")
    raise ValueError("expected an 'and' goal")


def get_tools(benchmark_dir: Path, order: Optional[List[str]] = None):
    tool_to_tsv = {}
    tool_dirs = list(filter(operator.methodcaller("is_dir"), benchmark_dir.iterdir()))
    if order:
        tool_dirs = sorted(tool_dirs, key=lambda x: -1 if x.name not in order else order.index(x.name))
    for tool_dir in tool_dirs:
        tsv_files = list(tool_dir.glob("*.tsv"))
        assert len(tsv_files) == 1
        tsv_file = tsv_files[0]
        tool_to_tsv[tool_dir.name] = tsv_file
    return tool_to_tsv


def configure_logging(filename):
    console = logging.StreamHandler()
    file = logging.FileHandler(filename)
    logging.basicConfig(
        format="[%(asctime)s][%(levelname)s]: %(message)s",
        level=logging.DEBUG,
        handlers=[console, file],
    )


def default_output_dir(file_name):
    return Path("results") / (
        Path(file_name).stem + "-" + datetime.datetime.now().isoformat()
    )


def get_dataset_dir(tool_id: str, dataset_dir_root: Path, dataset_name: str) -> Path:
    if "fd" in tool_id or tool_id == "gg-ff" or "gg-planner" in tool_id:
        prefix = DATASET_DIR_DET
    else:
        prefix = DATASET_DIR_NONDET
    return dataset_dir_root / prefix / dataset_name


def generate_problems(
    min_param: int,
    max_param: int,
    step: int,
    output_dir: Path,
    generate_problem_callable,
) -> List[Path]:
    """Generate problems"""
    result = []
    for i in range(min_param, max_param + 1, step):
        problem_i = generate_problem_callable(i)
        problem_path = output_dir / f"p{i:02d}.pddl"
        problem_path.write_text(problem_i)
        result.append(problem_path)
    return result


def is_deterministic(domain_path: Path):
    content = domain_path.read_text()
    match = re.search("\W:non-deterministic\W", content)
    return match is None
