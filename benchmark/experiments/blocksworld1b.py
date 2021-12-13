import datetime
import shutil
from pathlib import Path
from typing import List

import click

from benchmark.run_planner import run_planner
from benchmark.tools.core import save_data, ToolID
from planning_with_past import REPO_ROOT

import logging

DATASET_DIR = REPO_ROOT / "data" / "blocksworld-ipc08"
DOMAIN_FILE = DATASET_DIR / "domain.pddl"
PROBLEM_FILES = sorted(DATASET_DIR.glob("p*.pddl"), key=lambda p: p.name)

TSV_FILENAME = "output.tsv"


OFFSET = 1


def configure_logging(filename):
    console = logging.StreamHandler()
    file = logging.FileHandler(filename)
    logging.basicConfig(
        format="[%(asctime)s][%(levelname)s]: %(message)s",
        level=logging.DEBUG,
        handlers=[console, file]
    )


def filename() -> str:
    return Path(__file__).stem


def default_output_dir():
    return Path("results") / (filename() + "-" + datetime.datetime.now().isoformat())


def generate_formula(nb_blocks: int):
    """Generate formula from number of blocks."""
    assert nb_blocks >= 2
    formula = f"on_b{nb_blocks - 1}_b{nb_blocks}"
    for i in range(nb_blocks - 1, 1, -1):
        formula = f"on_b{i - 1}_b{i} & Y(O({formula}))"
    formula = f"O({formula})"
    return formula


def generate_future_formula(nb_blocks: int):
    """Generate future formula."""
    assert nb_blocks >= 2
    formula = f'"on b1 b2"'
    for i in range(2, nb_blocks):
        formula = f'"on b{i} b{i + 1}"&X(F({formula}))'
    formula = f"F({formula})"
    return formula


def generate_problem(nb_blocks: int) -> str:
    objects = [f"b{i}" for i in range (1, nb_blocks + 1)]
    init_on_table = [f"(on-table b{i})" for i in range(1, nb_blocks + 1)]
    init_clear = [f"(clear b{i})" for i in range(1, nb_blocks + 1)]
    problem = f"""(define (problem bw_{nb_blocks})
  (:domain blocks-domain)
  (:objects {' '.join(objects)} - block)
  (:init (emptyhand) {' '.join(init_on_table)} {' '.join(init_clear)})
  (:goal (and (emptyhand)))
)
"""
    return problem


def generate_problems(max_nb_blocks: int, output_dir: Path) -> List[Path]:
    """Generate problems"""
    result = []
    assert max_nb_blocks >= 2
    for i in range(2, max_nb_blocks + 1):
        problem_i = generate_problem(i)
        problem_path = output_dir / f"p{i:02d}.pddl"
        problem_path.write_text(problem_i)
        result.append(problem_path)
    return result


def run_experiments(timeout, output_dir, tools: List[str], max_nb_blocks: int):
    output_dir = Path(output_dir)
    output_dir.mkdir(parents=True, exist_ok=False)
    configure_logging(str(output_dir / "output.log"))
    logging.info(f"Using timeout {timeout}, writing to {output_dir}")
    logging.info(f"Tools: {tools}")

    domain_path = output_dir / "domain.pddl"
    shutil.copy(DOMAIN_FILE, domain_path)

    problem_paths = generate_problems(max_nb_blocks, output_dir)

    for tool in tools:
        # create tool working directory
        data = []
        tool_dir = output_dir / tool
        tool_dir.mkdir()
        try:
            for index, problem_path in list(enumerate(problem_paths)):
                problem_working_dir = tool_dir / problem_path.stem
                nb_blocks = index + 1 + OFFSET
                if "lf2f" in tool:
                    formula = generate_future_formula(nb_blocks)
                else:
                    formula = generate_formula(nb_blocks)
                logging.info("=" * 100)
                logging.info(f"Time: {datetime.datetime.now()}")
                logging.info(f"Processing problem {problem_path}")
                logging.info(f"Using formula: {formula}")
                result = run_planner(
                    problem_path.stem,
                    domain_path,
                    problem_path,
                    formula,
                    None,
                    timeout,
                    tool,
                    {},
                    problem_working_dir
                )
                logging.info(result.to_rows())
                data.append(result)
        finally:
            save_data(data, tool_dir / TSV_FILENAME)


@click.command()
@click.option("--timeout", type=float, default=60.0)
@click.option("--output-dir", type=click.Path(exists=False), default=default_output_dir())
@click.option("--tool", "-t", multiple=True, default=[
    ToolID.FOND4LTLfPLTLf_MYND_STORNG_CYCLIC_FF.value,
    ToolID.PLAN4PAST_MYND_STORNG_CYCLIC_FF.value,
    ToolID.LTLFOND2FOND_MYND_STORNG_CYCLIC_FF.value
])
@click.option("--max-nb-blocks", type=int, default=10)
def main(output_dir: str, timeout: float, tool: List[str], max_nb_blocks: int):
    run_experiments(timeout, output_dir, tool, max_nb_blocks)


if __name__ == "__main__":
    main()
