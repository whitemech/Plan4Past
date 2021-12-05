#!/usr/bin/env python3
import json
import logging
from operator import attrgetter
from pathlib import Path

import click
from click import FloatRange

from benchmark.utils import tool_registry
from benchmark.utils.tools import ToolID, Result

DEFAULT_TIMEOUT: float = 60.0 * 1000.0


def _print_row(row: Result):
    """Print a row."""
    print(str(row))


@click.command()
@click.option("--name", type=str, default=None)
@click.option("--domain", required=True, type=click.Path(exists=True, dir_okay=False, readable=True))
@click.option("--problem", required=True, type=click.Path(exists=True, dir_okay=False, readable=True))
@click.option("--formula", required=False, default=None, type=click.Path(exists=True, dir_okay=False, readable=True))
@click.option("--mapping", required=False, default=None, type=click.Path(exists=True, dir_okay=False, readable=True))
@click.option("--timeout", type=FloatRange(min=0.0), default=DEFAULT_TIMEOUT)
@click.option(
    "--tool-id",
    required=True,
    type=click.Choice(list(map(attrgetter("value"), ToolID)), case_sensitive=False),
)
@click.option("--config", default="{}", type=str)
def main(name, domain, problem, formula, mapping, timeout, tool_id, config):
    """Compute times."""
    domain = Path(domain)
    problem = Path(problem)
    formula = Path(formula) if formula else None
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
        print(Result.headers())
        result = tool.plan(domain, problem, formula, mapping)
        print(str(result))
        return 0
    except KeyboardInterrupt:
        logging.info("Interrupted!")
        return 1
    except Exception as e:
        logging.exception(e)
        return 1


if __name__ == "__main__":
    main()
