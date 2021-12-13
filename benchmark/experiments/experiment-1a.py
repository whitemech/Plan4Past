import datetime
import logging
import shutil
from pathlib import Path
from typing import List

import click

from benchmark.run_planner import run_planner
from benchmark.tools.core import save_data, ToolID
from benchmark.utils.base import (
    configure_logging,
    get_dataset_dir,
    TSV_FILENAME,
    default_output_dir,
    generate_problem_blocksworld,
    generate_problems,
    REPO_ROOT,
)


def generate_formula(future: bool = False):
    """Generate formula from number of blocks."""
    if future:
        return 'F("on b2 b3"&X(F("on b1 b2")))'
    return "O(on_b1_b2 & Y(O(on_b2_b3)))"


def run_experiments(
    dataset_name: str,
    dataset_dir: str,
    timeout,
    output_dir,
    tools: List[str],
    max_nb_blocks: int,
):
    output_dir = Path(output_dir)
    output_dir.mkdir(parents=True, exist_ok=False)
    dataset_dir_root = Path(dataset_dir)
    configure_logging(str(output_dir / "output.log"))
    logging.info(f"Using timeout {timeout}, writing to {output_dir}")
    logging.info(f"Tools: {tools}")

    domain_path = output_dir / "domain.pddl"
    problem_paths = generate_problems(
        max_nb_blocks, output_dir, generate_problem_blocksworld
    )

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
            for index, problem_path in list(enumerate(problem_paths)):
                formula = generate_formula(future="lf2f" in tool)
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
                    tool_dir / problem_path.stem,
                )
                logging.info(result.to_rows())
                data.append(result)
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
@click.option("--max-nb-blocks", type=int, default=20)
def main(
    dataset_name: str,
    dataset_dir: str,
    output_dir: str,
    timeout: float,
    tool: List[str],
    max_nb_blocks: int,
):
    run_experiments(dataset_name, dataset_dir, timeout, output_dir, tool, max_nb_blocks)


if __name__ == "__main__":
    main()
