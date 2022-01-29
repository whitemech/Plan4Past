#!/usr/bin/env bash

set -e

# experiment-1a-blocksworld-det
python benchmark/plotting/plot.py new-final-results/experiment-1a-blocksworld-det.zip --output new-final-plots/experiment-1a-blocksworld-det.pdf --xlabel "Parameter: Number of blocks" --ylabel "Time (seconds)" --timeout 300 --xtick-start 3 --max-xtick 20 --font 14

# experiment-1b-blocksworld-det.zip
python benchmark/plotting/plot.py new-final-results/experiment-1b-blocksworld-det.zip --output new-final-plots/experiment-1b-blocksworld-det.pdf --xlabel "Parameter: Number of blocks" --ylabel "Time (seconds)" --timeout 300 --xtick-start 2 --max-xtick 20 --font 14

# experiment-2-blocksworld-det.zip
python benchmark/plotting/plot.py new-final-results/experiment-2-blocksworld-det.zip --output new-final-plots/experiment-2-blocksworld-det.pdf --xlabel "Parameter: Problem id" --ylabel "Time (seconds)" --timeout 300 --xtick-start 1 --max-xtick 35 --font 11 --stepsize 2

# experiment-1a-blocksworld-nondet.zip
python benchmark/plotting/plot.py new-final-results/experiment-1a-blocksworld-nondet.zip --output new-final-plots/experiment-1a-blocksworld-nondet.pdf --xlabel "Parameter: Number of blocks" --ylabel "Time (seconds)" --timeout 300 --xtick-start 3 --max-xtick 35 --font 11 --stepsize 2

# experiment-1b-blocksworld-nondet.zip
python benchmark/plotting/plot.py new-final-results/experiment-1b-blocksworld-nondet.zip --output new-final-plots/experiment-1b-blocksworld-nondet.pdf --xlabel "Parameter: Number of blocks" --ylabel "Time (seconds)" --timeout 300 --xtick-start 2 --max-xtick 20 --font 14

# experiment-2-blocksworld-nondet.zip
python benchmark/plotting/plot.py new-final-results/experiment-2-blocksworld-nondet.zip --output new-final-plots/experiment-2-blocksworld-nondet.pdf --xlabel "Parameter: Problem id" --ylabel "Time (seconds)" --timeout 300 --xtick-start 1 --font 14 --stepsize 2

# experiment-1a-elevator.zip
python benchmark/plotting/plot.py new-final-results/experiment-1a-elevator.zip --output new-final-plots/experiment-1a-elevator.pdf --xlabel "Parameter: Number of passengers" --ylabel "Time (seconds)" --timeout 300 --xtick-start 3 --max-xtick 20 --font 14

# experiment-1b-elevator.zip
python benchmark/plotting/plot.py new-final-results/experiment-1b-elevator.zip --output new-final-plots/experiment-1b-elevator.pdf --xlabel "Parameter: Number of passengers" --ylabel "Time (seconds)" --timeout 300 --xtick-start 2 --max-xtick 20 --font 14

# experiment-2-elevator.zip
python benchmark/plotting/plot.py new-final-results/experiment-2-elevator.zip --output new-final-plots/experiment-2-elevator.pdf --xlabel "Parameter: Problem id" --ylabel "Time (seconds)" --timeout 300 --xtick-start 1 --max-xtick 100 --font 10 --stepsize 5

# experiment-1a-triangle-tireworld-nondet.zip
python benchmark/plotting/plot.py new-final-results/experiment-1a-triangle-tireworld-nondet.zip --output new-final-plots/experiment-1a-triangle-tireworld.pdf --xlabel "Parameter: Size of triangle" --ylabel "Time (seconds)" --timeout 300 --xtick-start 3 --max-xtick 10 --font 14

# experiment-1b-triangle-tireworld-nondet.zip
python benchmark/plotting/plot.py new-final-results/experiment-1b-triangle-tireworld-nondet.zip --output new-final-plots/experiment-1b-triangle-tireworld.pdf --xlabel "Parameter: Length of path" --ylabel "Time (seconds)" --timeout 300 --xtick-start 2 --max-xtick 10 --font 14

# experiment-2-triangle-tireworld-nondet.zip
python benchmark/plotting/plot.py new-final-results/experiment-2-triangle-tireworld-nondet.zip --output new-final-plots/experiment-2-triangle-tireworld.pdf --xlabel "Parameter: Problem id" --ylabel "Time (seconds)" --timeout 300 --xtick-start 1 --max-xtick 40 --font 14 --stepsize 2
