import datetime
import logging
import operator
import re
import inspect
from pathlib import Path
from typing import List

from pddl.logic.base import And
from pddl.parser.problem import ProblemParser

BENCHMARK_ROOT = Path(inspect.getframeinfo(inspect.currentframe()).filename).parent.parent  # type: ignore
REPO_ROOT = BENCHMARK_ROOT.parent


DATASET_DIR_DET = "deterministic"
DATASET_DIR_NONDET = "non-deterministic"

TSV_FILENAME = "output.tsv"


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
        return " & ".join(
            [str(atom)[1:-1].replace(" ", "_") for atom in goal_formula.operands]
        )
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
    prefix = DATASET_DIR_DET if "fd" in tool_id else DATASET_DIR_NONDET
    return dataset_dir_root / prefix / dataset_name


def generate_problem_blocksworld(nb_blocks: int) -> str:
    objects = [f"b{i}" for i in range(1, nb_blocks + 1)]
    init_on_table = [f"(ontable b{i})" for i in range(1, nb_blocks + 1)]
    init_clear = [f"(clear b{i})" for i in range(1, nb_blocks + 1)]
    problem = f"""(define (problem bw_{nb_blocks})
  (:domain blocks-domain)
  (:objects {' '.join(objects)} - block)
  (:init (emptyhand) {' '.join(init_on_table)} {' '.join(init_clear)})
  (:goal (and (emptyhand)))
)
"""
    return problem


def generate_problems(
    max_nb_blocks: int, output_dir: Path, generate_problem_callable
) -> List[Path]:
    """Generate problems"""
    result = []
    assert max_nb_blocks >= 3
    for i in range(3, max_nb_blocks + 1):
        problem_i = generate_problem_callable(i)
        problem_path = output_dir / f"p{i:02d}.pddl"
        problem_path.write_text(problem_i)
        result.append(problem_path)
    return result
