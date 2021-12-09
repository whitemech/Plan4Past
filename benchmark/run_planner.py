#!/usr/bin/env python3
import json
import logging
from operator import attrgetter
from pathlib import Path
from typing import Optional

import click
from click import FloatRange

from benchmark.tools import tool_registry
from benchmark.tools.core import Result, ToolID

DEFAULT_TIMEOUT: float = 60.0 * 1000.0


def _print_row(row: Result):
    """Print a row."""
    print(str(row))


def parse_formula_args(formula_path: Optional[str], formula_str: Optional[str]) -> Optional[str]:
    """Parse the formula from the CLI args."""
    assert not (formula_path and formula_str), "only one of --formula and --formula-str must be specified"
    if formula_path:
        return Path(formula_path).read_text().strip()
    return formula_str


@click.command()
@click.option("--name", type=str, default=None)
@click.option(
    "--domain",
    required=True,
    type=click.Path(exists=True, dir_okay=False, readable=True),
)
@click.option(
    "--problem",
    required=True,
    type=click.Path(exists=True, dir_okay=False, readable=True),
)
@click.option(
    "--formula",
    required=False,
    default=None,
    type=click.Path(exists=True, dir_okay=False, readable=True),

)
@click.option(
    "--formula-str",
    required=False,
    default=None,
    type=str,
)
@click.option(
    "--mapping",
    required=False,
    default=None,
    type=click.Path(exists=True, dir_okay=False, readable=True),
)
@click.option("--timeout", type=FloatRange(min=0.0), default=DEFAULT_TIMEOUT)
@click.option(
    "--tool-id",
    required=True,
    type=click.Choice(list(map(attrgetter("value"), ToolID)), case_sensitive=False),
)
@click.option("--config", default="{}", type=str)
def main(name, domain, problem, formula, formula_str, mapping, timeout, tool_id, config):
    """Compute times."""
    domain = Path(domain)
    problem = Path(problem)
    formula = parse_formula_args(formula, formula_str)
    mapping = Path(mapping) if mapping else None
    json_config = json.loads(config)

    tool = tool_registry.make(tool_id, **json_config)
    logging.debug(f"name={name}")
    logging.debug(f"domain={domain}")
    logging.debug(f"problem={problem}")
    logging.debug(f"formula={formula}")
    logging.debug(f"mapping={mapping}")
    logging.debug(f"timeout={timeout}")
    logging.debug(f"tool={tool_id}")

    try:
        result = tool.plan(domain, problem, formula, mapping)
        print(result.to_rows())
        return 0
    except KeyboardInterrupt:
        logging.info("Interrupted!")
        return 1
    except Exception as e:
        logging.exception(e)
        return 1


if __name__ == "__main__":
    main()
