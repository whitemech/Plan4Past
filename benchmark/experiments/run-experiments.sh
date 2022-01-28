#!/usr/bin/env bash

OUTPUT_DIR=${1:-.}

echo "Output directory: ${OUTPUT_DIR}"

python3 ./benchmark/experiments/experiment-1.py --timeout 300.0 --min-param 3 --max-param 20 --dataset-name blocksworld --experiment-type a -t 'f4lp-fd-ff' -t 'p4p-fd-ff' -t 'lf2f-fd-ff' --stop-on-timeout --output-dir ${OUTPUT_DIR}/experiment-1a-blocksworld-det
python3 ./benchmark/experiments/experiment-1.py --timeout 300.0 --min-param 2 --max-param 20 --dataset-name blocksworld --experiment-type b -t 'f4lp-fd-ff' -t 'p4p-fd-ff' -t 'lf2f-fd-ff' --stop-on-timeout --output-dir ${OUTPUT_DIR}/experiment-1b-blocksworld-det
python3 ./benchmark/experiments/experiment-2.py --timeout 300.0 --dataset-dir data/deterministic/blocksworld -t fd-ff -t p4p-fd-ff --output-dir "${OUTPUT_DIR}"/experiment-2-blocksworld-det
python3 ./benchmark/experiments/experiment-1.py --timeout 300.0 --min-param 3 --max-param 20 --dataset-name blocksworld --experiment-type a -t 'f4lp-mynd-sc-ff' -t 'p4p-mynd-sc-ff' -t 'lf2f-mynd-sc-ff' --stop-on-timeout --output-dir ${OUTPUT_DIR}/experiment-1a-blocksworld-nondet
python3 ./benchmark/experiments/experiment-1.py --timeout 300.0 --min-param 2 --max-param 20 --dataset-name blocksworld --experiment-type b -t 'f4lp-mynd-sc-ff' -t 'p4p-mynd-sc-ff' -t 'lf2f-mynd-sc-ff' --stop-on-timeout --output-dir ${OUTPUT_DIR}/experiment-1b-blocksworld-nondet
python3 ./benchmark/experiments/experiment-2.py --timeout 300.0 --dataset-dir data/non-deterministic/blocksworld -t mynd-sc-ff -t p4p-mynd-sc-ff --output-dir ${OUTPUT_DIR}/experiment-2-blocksworld-nondet
python3 ./benchmark/experiments/experiment-1.py --timeout 300.0 --min-param 3 --max-param 20 --dataset-name elevator --experiment-type a -t 'f4lp-fd-ff' -t 'p4p-fd-ff' -t 'lf2f-fd-ff' --stop-on-timeout --output-dir ${OUTPUT_DIR}/experiment-1a-elevator
python3 ./benchmark/experiments/experiment-1.py --timeout 300.0 --min-param 2 --max-param 20 --dataset-name elevator --experiment-type b -t 'f4lp-fd-ff' -t 'p4p-fd-ff' -t 'lf2f-fd-ff' --stop-on-timeout --output-dir ${OUTPUT_DIR}/experiment-1b-elevator
python3 ./benchmark/experiments/experiment-2.py --timeout 300.0 --dataset-dir data/deterministic/elevator -t fd-ff -t p4p-fd-ff
python3 ./benchmark/experiments/experiment-1.py --timeout 300.0 --min-param 3 --max-param 10 --dataset-name triangle-tireworld --experiment-type a -t f4lp-mynd-sc-ff -t p4p-mynd-sc-ff -t lf2f-mynd-sc-ff --stop-on-timeout --output-dir ${OUTPUT_DIR}/experiment-1a-triangle-tireworld-nondet
python3 ./benchmark/experiments/experiment-1.py --timeout 300.0 --min-param 2 --max-param 10 --dataset-name triangle-tireworld --experiment-type b -t f4lp-mynd-sc-ff -t p4p-mynd-sc-ff -t lf2f-mynd-sc-ff --stop-on-timeout --output-dir ${OUTPUT_DIR}/experiment-1b-triangle-tireworld-nondet
python3 ./benchmark/experiments/experiment-2.py --timeout 300.0 --dataset-dir data/non-deterministic/triangle-tireworld -t mynd-sc-ff -t p4p-mynd-sc-ff --output-dir ${OUTPUT_DIR}/experiment-2-triangle-tireworld-nondet
