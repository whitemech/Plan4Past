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

```
python benchmark/experiments/blocksworld1a.py --timeout 60.0 --max-nb-blocks 20 -t 'f4lp-mynd-sc-ff' -t 'p4p-mynd-sc-ff' -t 'lf2f-mynd-sc-ff' --output-dir output
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
python benchmark/experiments/blocksworld1b.py --timeout 60.0 --max-nb-blocks 10 -t 'f4lp-mynd-sc-ff' -t 'p4p-mynd-sc-ff' -t 'lf2f-mynd-sc-ff' --output-dir output
```

## Experiment type 2

### Blocksworld 

```
python benchmark/experiments/experiment-type-2.py --timeout 60.0 --dataset-dir data/blocksworld-ipc08
```
