"""Produce a LaTeX table."""
import operator
from pathlib import Path
from typing import List

import click
import numpy as np
import pandas as pd

from benchmark.tools import tool_registry, ToolID

ORDER = list(map(lambda t: t.value, ToolID))


def get_tools(benchmark_dir: str):
    benchmark_dir = Path(benchmark_dir)
    tool_dirs = list(filter(operator.methodcaller("is_dir"), benchmark_dir.iterdir()))
    tools = []
    for tool_dir in tool_dirs:
        tsv_files = list(tool_dir.glob("*.tsv"))
        assert len(tsv_files) == 1
        tools.append(tool_dir.name)
    return tools


@click.command("table")
@click.option(
    "--directory", multiple=True, type=click.Path(exists=True, file_okay=False, dir_okay=True),
    help="List of benchmark directories."
)
@click.option(
    "--output", default="output.svg"
)
@click.option(
    "--title", default=None
)
@click.option(
    "--timeout", type=int, default=300
)
@click.option(
    "--field", type=click.Choice(["time_end2end", "nb_node_expanded"])
)
def main(directory: List[str], output: str, title: str, timeout: int, field: str):
    """Plot results from benchmark directory."""
    results = [do_job(d, timeout, field) for d in directory]
    tool_names = [tool_registry.make(tool_id).NAME for tool_id in ORDER]
    header = " & ".join(["Benchmark name"] + tool_names)
    print(header)
    print("\\\\ \hline")
    for r in results:
        print(r, end="")


def do_job(benchmark_dir: str, timeout: int, field: str):
    benchmark_dir = Path(benchmark_dir)
    tool_dirs = list(filter(operator.methodcaller("is_dir"), benchmark_dir.iterdir()))

    tool_to_tsv = {}
    tools = []
    for tool_dir in tool_dirs:
        tsv_files = list(tool_dir.glob("*.tsv"))
        assert len(tsv_files) == 1
        tsv_file = tsv_files[0]
        tool_to_tsv[tool_dir.name] = tsv_file
        tools.append(tool_dir.name)

    dataframes = {tool: pd.read_csv(str(tsv_file), sep="\t") for tool, tsv_file in tool_to_tsv.items()}

    max_nb_rows = max(df.shape[0] for _, df in dataframes.items())
    table = np.zeros((max_nb_rows, len(dataframes)))
    names = []

    for idx, (tool, df) in enumerate(dataframes.items()):
        nb_rows = df.shape[0]
        names = list(df["name"].values) if nb_rows > len(names) else names
        times = np.append(df[field].values, [float('nan')] * (max_nb_rows - nb_rows))
        times[times == "None"] = float('nan')
        times = times.astype(float)
        table[:, idx] = times

    new_indices = [tools.index(tool_id) for tool_id in tools]
    table = table[:, new_indices]

    # start printing the table
    names_latex = ["\\texttt{" + n.replace('_', '\\_') + "}" for n in names]
    content = ""
    for row_idx, item_name in enumerate(names_latex):
        row = table[row_idx].astype(float)
        times_no_nan = list(map(lambda x: x if not np.isnan(x) else np.inf, row))
        argmin = int(np.argmin(times_no_nan))
        strings = list(map(lambda s: f"{s:5.2f}", row))
        if not np.isinf(times_no_nan[argmin]):
            strings[argmin] = f"\\textbf{{{strings[argmin]}}}"
        row_str = " & ".join(strings)
        content += item_name + " & " + row_str
        content += " \\\\ \n"
    content = content.replace(" nan ", " --- ")
    return content


if __name__ == "__main__":
    main()
