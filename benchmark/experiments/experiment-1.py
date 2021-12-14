import datetime
import logging
import shutil
from pathlib import Path
from typing import List

import click

from benchmark.run_planner import run_planner
from benchmark.tools.core import save_data, ToolID, Status
from benchmark.utils.base import (
    configure_logging,
    get_dataset_dir,
    TSV_FILENAME,
    default_output_dir,
    generate_problems,
    REPO_ROOT,
    ExperimentType,
)
from benchmark.utils.generate import get_generator


def run_experiments(
    dataset_name: str,
    dataset_dir: str,
    timeout,
    output_dir,
    tools: List[str],
    experiment_type: ExperimentType,
    min_param: int,
    max_param: int,
    step: int,
    stop_on_timeout: bool,
):
    output_dir = Path(output_dir)
    output_dir.mkdir(parents=True, exist_ok=False)
    dataset_dir_root = Path(dataset_dir)
    configure_logging(str(output_dir / "output.log"))
    logging.info(f"Using timeout {timeout}, writing to {output_dir}")
    logging.info(f"Tools: {tools}")

    domain_path = output_dir / "domain.pddl"
    generator = get_generator(experiment_type, dataset_name)
    problem_paths = generate_problems(
        min_param, max_param, step, output_dir, generator.generate_problem
    )
    parameters = list(range(min_param, max_param + 1, step))

    for tool in tools:
        # det or nondet
        actual_dataset_dir = get_dataset_dir(tool, dataset_dir_root, dataset_name)
        original_domain_path = actual_dataset_dir / "domain.pddl"
        logging.info(f"Copying {original_domain_path} to {domain_path}")
        shutil.copy(original_domain_path, domain_path)
        # create tool working directory
        data = []
        tool_dir = output_dir / tool
        tool_dir.mkdir()
        try:
            for parameter, problem_path in zip(parameters, problem_paths):
                formula = generator.generate_formula(tool, parameter)
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
                    str(tool_dir / problem_path.stem),
                )
                logging.info(result.to_rows())
                data.append(result)
                if stop_on_timeout and result.status in {Status.ERROR, Status.TIMEOUT}:
                    logging.info(f"Stop on timeout, status={result.status}")
                    break
        finally:
            save_data(data, tool_dir / TSV_FILENAME)


@click.command()
@click.option("--dataset-name", type=str)
@click.option(
    "--dataset-dir",
    type=click.Path(exists=True, file_okay=False),
    default=str(REPO_ROOT / "data"),
)
@click.option("--timeout", type=float, default=60.0)
@click.option(
    "--output-dir", type=click.Path(exists=False), default=default_output_dir(__file__)
)
@click.option(
    "--tool",
    "-t",
    multiple=True,
    default=[
        ToolID.FOND4LTLfPLTLf_MYND_STORNG_CYCLIC_FF.value,
        ToolID.PLAN4PAST_MYND_STORNG_CYCLIC_FF.value,
        ToolID.LTLFOND2FOND_MYND_STORNG_CYCLIC_FF.value,
    ],
)
@click.option("--experiment-type", type=click.Choice(["a", "b"], case_sensitive=False))
@click.option("--min-param", type=int)
@click.option("--max-param", type=int)
@click.option("--step", type=int, default=1)
@click.option("--stop-on-timeout", type=bool, is_flag=True, default=False)
def main(
    dataset_name: str,
    dataset_dir: str,
    output_dir: str,
    timeout: float,
    tool: List[str],
    experiment_type: str,
    min_param: int,
    max_param: int,
    step: int,
    stop_on_timeout: bool
):
    run_experiments(
        dataset_name,
        dataset_dir,
        timeout,
        output_dir,
        tool,
        ExperimentType(experiment_type),
        min_param,
        max_param,
        step,
        stop_on_timeout
    )


if __name__ == "__main__":
    main()
