import argparse
import datetime
from pathlib import Path

import click

from benchmark.run_planner import run_planner
from benchmark.tools.core import save_data
from planning_with_past import REPO_ROOT

DATASET_DIR = REPO_ROOT / "data" / "blocksworld-ipc08"
DOMAIN_FILE = DATASET_DIR / "domain.pddl"
PROBLEM_FILES = sorted(DATASET_DIR.glob("p*.pddl"), key=lambda p: p.name)


def generate_formula(nb_blocks: int):
    """Generate formula from number of blocks."""
    assert nb_blocks >= 2
    formula = "on_b1_b2"
    for i in range(2, nb_blocks):
        formula = f"on_b{i}_b{i+1} & O({formula})"
    return formula


@click.command()
@click.option("--timeout", type=float, default=60.0)
@click.option("--output", type=click.Path(exists=False), default="output.tsv")
def main(output: str, timeout: float):
    print(f"Using timeout {timeout}, writing to {output}")
    data = []
    try:
        for index, problem_path in list(enumerate(PROBLEM_FILES)):
            # p01-p10 5 blocks, p11-p20 10 blocks
            nb_blocks = (index // 10 + 1) * 5
            formula = generate_formula(nb_blocks)
            print("=" * 100)
            print(f"Time: {datetime.datetime.now()}")
            print(f"Processing problem {problem_path}")
            print(f"Using formula: {formula}")
            result = run_planner(
                problem_path.name,
                DOMAIN_FILE,
                problem_path,
                formula,
                None,
                timeout,
                "f4lp-mynd",
                {"search": "laostar"},
            )
            print(result.to_rows())
            data.append(result)
    finally:
        save_data(data, Path(output))


if __name__ == "__main__":
    main()
