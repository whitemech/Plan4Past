# Benchmark

This folder contains scripts and modules to run planning benchmark.

## Tools

- `run_planner.py`: executes a planning task and prints some statistics. This is a building block for other tasks.

## Examples

You may need `export PYTHONPATH=.` before running the commands.

- Run `fast-downward` planner  

```
./benchmark/run_planner.py --tool-id fast-downward --domain examples/pddl/domain.pddl --problem examples/pddl/p-0.pddl
```

- Run `mynd` planner  

```
./benchmark/run_planner.py --tool-id mynd --domain examples/pddl/domain.pddl --problem examples/pddl/p-0.pddl
```

- Run `fond4ltlfpltlf` + `mynd` planner  

```
./benchmark/run_planner.py --tool-id f4lp-mynd --domain examples/pddl/domain.pddl --problem examples/pddl/p-0.pddl --formula-str "on_c_b & O(on_b_a)"
```

- Run `plan4past` + `mynd` planner  

```
./benchmark/run_planner.py --tool-id p4p-mynd --domain examples/pddl/domain.pddl --problem examples/pddl/p-0.pddl --formula-str "on_c_b & O(on_b_a)"
```

## Blocksworld 1a

To run the experiments:

Nondeterministic
```
python benchmark/experiments/experiment-1.py --timeout 60.0 --min-param 3 --max-param 20 --dataset-name blocksworld --experiment-type a -t 'f4lp-mynd-sc-ff' -t 'p4p-mynd-sc-ff' -t 'lf2f-mynd-sc-ff' --output-dir output 
```

Deterministic:
```
python benchmark/experiments/experiment-1.py --timeout 60.0 --min-param 3 --max-param 20 --dataset-name blocksworld --experiment-type a -t 'f4lp-fd-ff' -t 'p4p-fd-ff' -t 'lf2f-fd-ff' --output-dir output
```

Produce the plot:

```
python benchmark/plotting/plot.py output --output output.pdf --xlabel "Parameter: Number of blocks" --ylabel "Time (seconds)"
```

Print data as table:

```
python benchmark/plotting/table.py --directory output --timeout 60.0
```

## Blocksworld 1b

To run the experiments:

```
python benchmark/experiments/experiment-1.py --timeout 60.0 --min-param 2 --max-param 20 --dataset-name blocksworld --experiment-type b -t 'f4lp-fd-ff' -t 'p4p-fd-ff' -t 'lf2f-fd-ff' --output-dir output
```

## Experiment type 2

### Blocksworld 

Deterministic:
```
python benchmark/experiments/experiment-2.py --timeout 60.0 --dataset-dir data/deterministic/blocksworld
```

Non-deterministic:
```
python benchmark/experiments/experiment-2.py --timeout 60.0 --dataset-dir data/non-deterministic/blocksworld
```
