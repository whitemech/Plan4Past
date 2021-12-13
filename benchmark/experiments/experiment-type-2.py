import datetime
import logging
from pathlib import Path

import click

from benchmark.run_planner import run_planner
from benchmark.tools.core import save_data, ToolID
from benchmark.utils.base import (
    get_reachability_goal,
    TSV_FILENAME,
    configure_logging,
    default_output_dir,
    is_deterministic,
)


def run_tool(tool_id, output_dir, problem_files, domain_file, timeout):
    data = []
    tool_dir = output_dir / tool_id
    tool_dir.mkdir()
    print(f"Run experiments with {tool_id}")
    try:
        for index, problem_path in list(enumerate(problem_files)):
            problem_working_dir = tool_dir / problem_path.stem
            formula = get_reachability_goal(problem_path) if "p4p" in tool_id else None
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
                tool_id,
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
    is_domain_deterministic = is_deterministic(domain_file)
    problem_files = sorted(set(dataset_dir.glob("*.pddl")) - {domain_file})

    if is_domain_deterministic:
        baseline_tool = ToolID.FAST_DOWNWARD_FF
        new_tool = ToolID.PLAN4PAST_FD_FF
    else:
        baseline_tool = ToolID.MYND_STRONG_CYCLIC_FF
        new_tool = ToolID.PLAN4PAST_MYND_STORNG_CYCLIC_FF

    run_tool(baseline_tool.value, output_dir, problem_files, domain_file, timeout)
    run_tool(new_tool.value, output_dir, problem_files, domain_file, timeout)


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
