"""Plot the result for counter benchmarks."""
from pathlib import Path
from typing import Optional

import click
import matplotlib
import matplotlib.pyplot as plt
import numpy as np
import pandas as pd

from benchmark.tools import tool_registry, ToolID
from benchmark.utils.base import get_tools
from benchmark.utils.plot_utils import try_unzip

matplotlib.rcParams["ps.useafm"] = True
matplotlib.rcParams["pdf.use14corefonts"] = True
matplotlib.rcParams["text.usetex"] = True
font_config = {"size": 10}

TOOL_TO_MARKER = {
    ToolID.FAST_DOWNWARD_FF.value: "s",
    ToolID.MYND_STRONG_CYCLIC_FF.value: "D",
    ToolID.FOND4LTLfPLTLf_MYND_STORNG_CYCLIC_FF: "o",
    ToolID.PLAN4PAST_MYND_STORNG_CYCLIC_FF: "v",
    ToolID.LTLFOND2FOND_MYND_STORNG_CYCLIC_FF: "X",
}
TOOL_TO_COLOR = {
    ToolID.FAST_DOWNWARD_FF.value: "orange",
    ToolID.MYND_STRONG_CYCLIC_FF.value: "deepskyblue",
    ToolID.FOND4LTLfPLTLf_MYND_STORNG_CYCLIC_FF: "green",
    ToolID.PLAN4PAST_MYND_STORNG_CYCLIC_FF: "red",
    ToolID.LTLFOND2FOND_MYND_STORNG_CYCLIC_FF: "blue",
}


def get_marker(tool_id):
    if "p4p" in tool_id:
        return "v"
    if "f4lp" in tool_id:
        return "o"
    if "lf2f" in tool_id:
        return "X"
    return TOOL_TO_MARKER.get(tool_id, None)


def get_color(tool_id):
    if "p4p" in tool_id:
        return "red"
    if "f4lp" in tool_id:
        return "green"
    if "lf2f" in tool_id:
        return "blue"
    return TOOL_TO_COLOR.get(tool_id, None)


MARKER_CONFIGS = dict(
    markersize=5.0, markeredgewidth=0.5, markeredgecolor=(0.0, 0.0, 0.0, 1)
)


def line_width(tool_id):
    if any(x in tool_id for x in {"p4p"}):
        return "1"
    return "1"


def trunc(values, decimals=0):
    return np.trunc(values * 10 ** decimals) / (10 ** decimals)


@click.command("plot")
@click.argument(
    "benchmark_dir", type=click.Path(exists=True)
)
@click.option("--output", default="output.svg")
@click.option("--title", default=None)
@click.option("--timeout", type=int, default=600)
@click.option("--xlabel", type=str, required=True)
@click.option("--ylabel", type=str, required=True)
@click.option("--xtick-start", type=int, default=0)
@click.option("--max-xtick", type=int, default=None)
@click.option("--stop-on-timeout", type=bool, is_flag=True, default=False)
@click.option("--font", type=int, default=14)
@click.option("--stepsize", type=int, default=1)
def main(
    benchmark_dir: str, output: str, title: str, timeout: int, xlabel: str, ylabel: str, xtick_start: int, max_xtick: Optional[int], stop_on_timeout: bool, font: int, stepsize: int
):
    """Plot results from benchmark directory."""
    assert max_xtick is None or xtick_start < max_xtick
    matplotlib.rc("font", **dict(size=font))
    benchmark_dir = try_unzip(benchmark_dir)
    dataset_name = benchmark_dir.name
    tool_to_tsv = get_tools(benchmark_dir)
    labels = list(tool_to_tsv.keys())
    dataframes = [
        pd.read_csv(str(tsv_file), sep="\t") for tsv_file in tool_to_tsv.values()
    ]

    max_nb_rows = max(df.shape[0] for df in dataframes)
    total_nb_rows = max_nb_rows if max_xtick is None else max(max_nb_rows, max_xtick)
    if max_xtick is None:
        max_xtick = max_nb_rows
    cactus = np.zeros((total_nb_rows, len(dataframes)))

    for idx, df in enumerate(dataframes):
        total_times = []
        total_time = 0.0
        max_reached = False
        nb_rows = df.shape[0]
        times = np.append(df["time_end2end"].values, [np.inf] * (total_nb_rows - nb_rows))
        # nb_node_expanded allows us to determine if a run failed
        nb_node_expanded = np.append(
            df["nb_node_expanded"].values, [None] * (total_nb_rows - nb_rows)
        )
        for i, t in enumerate(times):
            t = t if t != "None" and nb_node_expanded[i] != "None" else timeout
            current_time = float(t)
            max_reached = (max_reached or current_time >= timeout) and stop_on_timeout
            total_time = timeout if max_reached else min([current_time, timeout])
            total_times.append(total_time)
        cactus[:, idx] = np.asarray(total_times)

    x_axis = np.arange(0, total_nb_rows) + xtick_start
    for idx, label in enumerate(labels):
        print(f"Processing {label}")
        tool = tool_registry.make(label)
        tool_name = tool.NAME
        tool_color = get_color(label)
        tool_marker = get_marker(label)
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
    plt.plot(x_axis, [timeout] * total_nb_rows, linestyle=":", color="black")
    plt.xlim((xtick_start, max_xtick))
    # ticks = np.arange(xtick_start, max_xtick + 2, step=stepsize) - 1
    # ticks[0] += 1
    # plt.xticks(ticks)
    # plt.xticks(np.arange(xtick_start, max_xtick + 1, step=stepsize))
    plt.xticks(np.arange(xtick_start, max_xtick + 1, step=stepsize))
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
