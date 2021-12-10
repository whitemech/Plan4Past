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


@click.command()
@click.option("--timeout", type=float, default=60.0)
@click.option("--output", type=click.Path(exists=False), default="output.tsv")
def main(output: str, timeout: float):
    data = []
    try:
        for problem_path in PROBLEM_FILES:
            print("=" * 100)
            print(f"Processing problem {problem_path}")
            print(datetime.datetime.now())
            result = run_planner(
                problem_path.name,
                DOMAIN_FILE,
                problem_path,
                "on_b1_b2 & O(on_b2_b3)",
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
