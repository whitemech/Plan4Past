#!/usr/bin/env bash

python3 ./benchmark/experiments/experiment-1.py --timeout 300.0 --min-param 3 --max-param 20 --dataset-name blocksworld --experiment-type a -t 'f4lp-fd-ff' -t 'p4p-fd-ff' -t 'lf2f-fd-ff' --stop-on-timeout --output-dir experiment-1a-blocksworld-det &
python3 ./benchmark/experiments/experiment-1.py --timeout 300.0 --min-param 2 --max-param 20 --dataset-name blocksworld --experiment-type b -t 'f4lp-fd-ff' -t 'p4p-fd-ff' -t 'lf2f-fd-ff' --stop-on-timeout --output-dir experiment-1b-blocksworld-det &
python3 ./benchmark/experiments/experiment-2.py --timeout 300.0 --dataset-dir data/deterministic/blocksworld -t fd-ff -t p4p-fd-ff --output-dir experiment-2-blocksworld-det &
wait

