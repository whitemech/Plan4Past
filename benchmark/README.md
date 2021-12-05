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