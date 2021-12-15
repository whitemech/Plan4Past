#!/usr/bin/env bash

python3 ./benchmark/experiments/experiment-1.py --timeout 300.0 --min-param 3 --max-param 20 --dataset-name elevator --experiment-type a -t 'f4lp-fd-ff' -t 'p4p-fd-ff' -t 'lf2f-fd-ff' --stop-on-timeout --output-dir experiment-1a-elevator &
python3 ./benchmark/experiments/experiment-1.py --timeout 300.0 --min-param 2 --max-param 20 --dataset-name elevator --experiment-type b -t 'f4lp-fd-ff' -t 'p4p-fd-ff' -t 'lf2f-fd-ff' --stop-on-timeout --output-dir experiment-1b-elevator &
python3 ./benchmark/experiments/experiment-2.py --timeout 300.0 --dataset-dir data/deterministic/elevator -t fd-ff -t p4p-fd-ff &
wait

