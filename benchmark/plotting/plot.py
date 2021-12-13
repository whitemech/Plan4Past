"""Plot the result for counter benchmarks."""
from pathlib import Path

import click
import matplotlib
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

from benchmark.tools import tool_registry, ToolID
from benchmark.utils.base import get_tools

matplotlib.rcParams["ps.useafm"] = True
matplotlib.rcParams["pdf.use14corefonts"] = True
matplotlib.rcParams["text.usetex"] = True
font = {"size": 14}
matplotlib.rc("font", **font)

TOOL_TO_MARKER = {
    ToolID.FOND4LTLfPLTLf_MYND_STORNG_CYCLIC_FF: "o",
    ToolID.PLAN4PAST_MYND_STORNG_CYCLIC_FF: "v",
    ToolID.LTLFOND2FOND_MYND_STORNG_CYCLIC_FF: "X",
}
TOOL_TO_COLOR = {
    ToolID.FOND4LTLfPLTLf_MYND_STORNG_CYCLIC_FF: "green",
    ToolID.PLAN4PAST_MYND_STORNG_CYCLIC_FF: "red",
    ToolID.LTLFOND2FOND_MYND_STORNG_CYCLIC_FF: "blue",
}
MARKER_CONFIGS = dict(
    markersize=5.0, markeredgewidth=0.5, markeredgecolor=(0.0, 0.0, 0.0, 1)
)


def line_width(tool_id):
    if any(x in tool_id for x in {"p4p"}):
        return "4"
    return "1"


def trunc(values, decimals=0):
    return np.trunc(values * 10 ** decimals) / (10 ** decimals)


@click.command("plot")
@click.argument(
    "benchmark_dir", type=click.Path(exists=True, file_okay=False, dir_okay=True)
)
@click.option("--output", default="output.svg")
@click.option("--title", default=None)
@click.option("--timeout", type=int, default=300)
@click.option("--xlabel", type=str, required=True)
@click.option("--ylabel", type=str, required=True)
def main(
    benchmark_dir: str, output: str, title: str, timeout: int, xlabel: str, ylabel: str
):
    """Plot results from benchmark directory."""
    benchmark_dir = Path(benchmark_dir)
    dataset_name = benchmark_dir.name
    tool_to_tsv = get_tools(benchmark_dir)
    labels = list(tool_to_tsv.keys())
    dataframes = [
        pd.read_csv(str(tsv_file), sep="\t") for tsv_file in tool_to_tsv.values()
    ]

    max_nb_rows = max(df.shape[0] for df in dataframes)
    cactus = np.zeros((max_nb_rows, len(dataframes)))

    for idx, df in enumerate(dataframes):
        total_times = []
        total_time = 0.0
        max_reached = False
        nb_rows = df.shape[0]
        times = np.append(df["time_end2end"].values, [np.inf] * (max_nb_rows - nb_rows))
        # nb_node_expanded allows us to determine if a run failed
        nb_node_expanded = np.append(
            df["nb_node_expanded"].values, [None] * (max_nb_rows - nb_rows)
        )
        for i, t in enumerate(times):
            t = t if t != "None" and nb_node_expanded[i] != "None" else timeout
            current_time = float(t)
            # max_reached = max_reached or current_time >= timeout
            max_reached = False
            total_time = timeout if max_reached else min([current_time, timeout])
            total_times.append(total_time)
        cactus[:, idx] = np.asarray(total_times)

    x_axis = np.arange(1, max_nb_rows + 1)
    for idx, label in enumerate(labels):
        tool = tool_registry.make(label)
        tool_name = tool.NAME
        tool_color = TOOL_TO_COLOR[ToolID(label)]
        tool_marker = TOOL_TO_MARKER[ToolID(label)]
        plt.plot(
            x_axis,
            cactus[:, idx],
            label=tool_name,
            color=tool_color,
            linestyle="-",
            linewidth=line_width(label),
            marker=tool_marker,
            **MARKER_CONFIGS,
        )
    plt.plot(x_axis, [timeout] * max_nb_rows, linestyle=":", color="black")
    plt.xlim((1, max_nb_rows))
    plt.xticks(np.arange(1, max_nb_rows + 1, step=1.0))
    plt.yscale("log")
    plt.legend()
    plt.xlabel(xlabel)
    plt.ylabel(ylabel)
    plt.title(dataset_name if dataset_name is None else title)
    plt.grid()
    plt.savefig(output)
    plt.show()

    print(f"Plot saved in file: {output}")


if __name__ == "__main__":
    main()
