#!/usr/bin/env bash

set -e

# experiment-1a-blocksworld-det
python benchmark/plotting/plot.py new-final-results/experiment-1a-blocksworld-det.zip --output new-final-plots/experiment-1a-blocksworld-det.pdf --xlabel "Parameter: Number of blocks" --ylabel "Time (seconds)" --xtick-start 3 --timeout 300

# experiment-1a-blocksworld-nondet.zip
python benchmark/plotting/plot.py new-final-results/experiment-1a-blocksworld-nondet.zip --output new-final-plots/experiment-1a-blocksworld-nondet.pdf --xlabel "Parameter: Number of blocks" --ylabel "Time (seconds)" --xtick-start 3 --timeout 300

# experiment-1a-elevator.zip
python benchmark/plotting/plot.py new-final-results/experiment-1a-elevator.zip --output new-final-plots/experiment-1a-elevator.pdf --xlabel "Parameter: Number of blocks" --ylabel "Time (seconds)" --xtick-start 3 --timeout 300

# experiment-1a-triangle-tireworld-nondet.zip
python benchmark/plotting/plot.py new-final-results/experiment-1a-triangle-tireworld-nondet.zip --output new-final-plots/experiment-1a-triangle-tireworld-nondet.pdf --xlabel "Parameter: Triangle size" --ylabel "Time (seconds)" --xtick-start 3 --stop-on-timeout --timeout 300

# experiment-1b-blocksworld-det.zip
python benchmark/plotting/plot.py new-final-results/experiment-1b-blocksworld-det.zip --output new-final-plots/experiment-1b-blocksworld-det.pdf --xlabel "Parameter: Number of blocks" --ylabel "Time (seconds)" --xtick-start 3 --stop-on-timeout --timeout 300

# experiment-1b-blocksworld-nondet.zip
python benchmark/plotting/plot.py new-final-results/experiment-1b-blocksworld-nondet.zip --output new-final-plots/experiment-1b-blocksworld-nondet.pdf --xlabel "Parameter: Number of blocks" --ylabel "Time (seconds)" --xtick-start 3 --stop-on-timeout --timeout 300

# experiment-1b-elevator.zip
python benchmark/plotting/plot.py new-final-results/experiment-1b-elevator.zip --output new-final-plots/experiment-1b-elevator.pdf --xlabel "Parameter: Number of blocks" --ylabel "Time (seconds)" --xtick-start 3 --stop-on-timeout --timeout 300

# experiment-1b-triangle-tireworld-nondet.zip
python benchmark/plotting/plot.py new-final-results/experiment-1b-triangle-tireworld-nondet.zip --output new-final-plots/experiment-1b-triangle-tireworld-nondet.pdf --xlabel "Parameter: Path lengh/Triangle size" --ylabel "Time (seconds)" --xtick-start 2 --stop-on-timeout --timeout 300

# experiment-2-blocksworld-det.zip
python benchmark/plotting/plot.py new-final-results/experiment-2-blocksworld-det.zip --output new-final-plots/experiment-2-blocksworld-det.pdf --xlabel "Parameter: Problem id" --ylabel "Time (seconds)" --xtick-start 1 --timeout 300

# experiment-2-blocksworld-nondet.zip
python benchmark/plotting/plot.py new-final-results/experiment-2-blocksworld-nondet.zip --output new-final-plots/experiment-2-blocksworld-nondet.pdf --xlabel "Parameter: Problem id" --ylabel "Time (seconds)" --xtick-start 1 --timeout 300

# experiment-2-elevator.zip
python benchmark/plotting/plot.py new-final-results/experiment-2-elevator.zip --output new-final-plots/experiment-2-elevator.pdf --xlabel "Parameter: Problem id" --ylabel "Time (seconds)" --xtick-start 1 --timeout 300

# experiment-2-triangle-tireworld-nondet.zip
python benchmark/plotting/plot.py new-final-results/experiment-2-triangle-tireworld-nondet.zip --output new-final-plots/experiment-2-triangle-tireworld-nondet.pdf --xlabel "Parameter: Problem id" --ylabel "Time (seconds)" --timeout 300 --xtick-start 1 --max-xtick 40 --font 14 --stepsize 2