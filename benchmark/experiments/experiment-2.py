import datetime
import logging
from operator import attrgetter
from pathlib import Path
from typing import List

import click

from benchmark.run_planner import run_planner
from benchmark.tools.core import save_data, ToolID, Status
from benchmark.utils.base import (
    get_reachability_goal,
    TSV_FILENAME,
    configure_logging,
    default_output_dir,
)


def run_tool(tool_id, output_dir, problem_files, domain_file, timeout, stop_on_timeout: bool):
    data = []
    tool_dir = output_dir / tool_id
    tool_dir.mkdir()
    print(f"Run experiments with {tool_id}")
    try:
        for index, problem_path in list(enumerate(problem_files)):
            problem_working_dir = tool_dir / problem_path.stem
            formula = get_reachability_goal(problem_path) if "p4p" in tool_id or "gg" in tool_id else None
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
            if stop_on_timeout and result.status in {Status.ERROR, Status.TIMEOUT}:
                logging.info(f"Stop on timeout, status={result.status}")
                break
    finally:
        save_data(data, tool_dir / TSV_FILENAME)


def run_experiments(dataset_dir, timeout, output_dir, tools: List[str], stop_on_timeout: bool):
    dataset_dir = Path(dataset_dir)
    output_dir = Path(output_dir)
    output_dir.mkdir(parents=True, exist_ok=False)
    configure_logging(str(output_dir / "output.log"))
    logging.info(f"Using timeout {timeout}, writing to {output_dir}")

    domain_file = dataset_dir / "domain.pddl"
    problem_files = sorted(set(dataset_dir.glob("*.pddl")) - {domain_file})

    for tool in tools:
        run_tool(tool, output_dir, problem_files, domain_file, timeout, stop_on_timeout)


@click.command()
@click.option("--dataset-dir", type=click.Path(exists=True, file_okay=False))
@click.option("--timeout", type=float, default=60.0)
@click.option(
    "--output-dir", type=click.Path(exists=False), default=default_output_dir(__file__)
)
@click.option(
    "--tool",
    "-t",
    multiple=True,
    type=click.Choice(list(map(attrgetter("value"), ToolID))),
    required=True
)
@click.option("--stop-on-timeout", type=bool, is_flag=True, default=False)
def main(dataset_dir: str, output_dir: str, timeout: float, tool: List[str], stop_on_timeout: bool):
    run_experiments(dataset_dir, timeout, output_dir, tool, stop_on_timeout)


if __name__ == "__main__":
    main()
