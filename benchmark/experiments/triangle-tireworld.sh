#!/usr/bin/env bash

python3 ./benchmark/experiments/experiment-1.py --timeout 300.0 --min-param 3 --max-param 10 --dataset-name triangle-tireworld --experiment-type a -t f4lp-mynd-sc-ff -t p4p-mynd-sc-ff -t lf2f-mynd-sc-ff --stop-on-timeout --output-dir experiment-1a-triangle-tireworld-nondet &
python3 ./benchmark/experiments/experiment-1.py --timeout 300.0 --min-param 2 --max-param 10 --dataset-name triangle-tireworld --experiment-type b -t f4lp-mynd-sc-ff -t p4p-mynd-sc-ff -t lf2f-mynd-sc-ff --stop-on-timeout --output-dir experiment-1b-triangle-tireworld-nondet &
python3 ./benchmark/experiments/experiment-2.py --timeout 300.0 --dataset-dir data/non-deterministic/triangle-tireworld -t mynd-sc-ff -t p4p-mynd-sc-ff --output-dir experiment-2-triangle-tireworld-nondet &
wait

