import datetime
import shutil
from pathlib import Path
from typing import List

import click

from benchmark.run_planner import run_planner
from benchmark.tools.core import save_data, ToolID
from benchmark.utils.base import (
    get_reachability_goal,
    TSV_FILENAME,
    configure_logging,
    default_output_dir,
)
from planning_with_past import REPO_ROOT

import logging

DATASET_DIR = REPO_ROOT / "data" / "blocksworld-ipc08"
DOMAIN_FILE = DATASET_DIR / "domain.pddl"
PROBLEM_FILES = sorted(DATASET_DIR.glob("p*.pddl"), key=lambda p: p.name)


def run_mynd(output_dir, problem_files, domain_file, timeout):
    # run MyND
    data = []
    tool_id = ToolID.MYND_STRONG_CYCLIC_FF
    tool_dir = output_dir / tool_id.value
    print(f"Run experiments with {tool_id.value}")
    tool_dir.mkdir()
    try:
        for index, problem_path in list(enumerate(problem_files)):
            problem_working_dir = tool_dir / problem_path.stem
            logging.info("=" * 100)
            logging.info(f"Time: {datetime.datetime.now()}")
            logging.info(f"Processing problem {problem_path}")
            result = run_planner(
                problem_path.stem,
                domain_file,
                problem_path,
                None,
                None,
                timeout,
                tool_id.value,
                {},
                problem_working_dir,
            )
            logging.info(result.to_rows())
            data.append(result)
    finally:
        save_data(data, tool_dir / TSV_FILENAME)


def run_p4p(output_dir, problem_files, domain_file, timeout):
    # run P4P
    data = []
    tool_id = ToolID.PLAN4PAST_MYND_STORNG_CYCLIC_FF
    tool_dir = output_dir / tool_id.value
    tool_dir.mkdir()
    print(f"Run experiments with {tool_id.value}")
    try:
        for index, problem_path in list(enumerate(problem_files)):
            problem_working_dir = tool_dir / problem_path.stem
            formula = get_reachability_goal(problem_path)
            logging.info("=" * 100)
            logging.info(f"Time: {datetime.datetime.now()}")
            logging.info(f"Processing problem {problem_path}")
            result = run_planner(
                problem_path.stem,
                domain_file,
                problem_path,
                formula,
                None,
                timeout,
                tool_id.value,
                {},
                problem_working_dir,
            )
            logging.info(result.to_rows())
            data.append(result)
    finally:
        save_data(data, tool_dir / TSV_FILENAME)


def run_experiments(dataset_dir, timeout, output_dir):
    dataset_dir = Path(dataset_dir)
    output_dir = Path(output_dir)
    output_dir.mkdir(parents=True, exist_ok=False)
    configure_logging(str(output_dir / "output.log"))
    logging.info(f"Using timeout {timeout}, writing to {output_dir}")

    domain_file = dataset_dir / "domain.pddl"
    problem_files = sorted(set(dataset_dir.glob("*.pddl")) - {domain_file})

    run_mynd(output_dir, problem_files, domain_file, timeout)
    run_p4p(output_dir, problem_files, domain_file, timeout)


@click.command()
@click.option("--dataset-dir", type=click.Path(exists=True, file_okay=False))
@click.option("--timeout", type=float, default=60.0)
@click.option(
    "--output-dir", type=click.Path(exists=False), default=default_output_dir(__file__)
)
def main(dataset_dir: str, output_dir: str, timeout: float):
    run_experiments(dataset_dir, timeout, output_dir)


if __name__ == "__main__":
    main()
