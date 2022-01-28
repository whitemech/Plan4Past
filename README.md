<h1 align="center">
  <b>P4P - Classical and FOND Planning for Past Temporal Goals</b>
</h1>

## Foreword

- We updated the benchmawrk results for the `l2lf` tool. TODO

## Repository structure

- `planning_with_past/`: code of the PDDL compiler
- `benchmark/`: code of the experiment framework
- `bin/`: executables that wrap several planners.
  - `bin/pltlf-planner`: the main entrypoint of the PDDL compiler
  - `bin/plan4past` is the main entrypoint of our planner (uses `pltlf-planner`)
- `data/`: datasets for the experiments
- `examples/`: some examples
- `scripts/`: auxiliary scripts
- `supplementary-material/`: the supplementary material of the submission


## Reproduce experiments Docker image (RECOMMENDED)

We prepared a Docker image in order to make it easier to reproduce the experiments.
We highly recommend using this approach instead of building the dependencies locally.

### Option 1: pull from Docker Hub

```
docker pull icaps2022submission259/icaps-2022
```

### Option 2: build from scratch

```
docker build --cpuset-cpus 0-7 -t icaps2022submission259/icaps-2022 .
```

### Run the experiments

- Run the experiments inside the container:
```
docker run -v $(pwd):/home/default/experimental-results --rm -it icaps2022submission259/icaps-2022 ./benchmark/experiments/run-experiments.sh /home/default/experimental-results/output
```

You will find the output in the folder `./output`.

- Then, to start a shell with all the dependencies in the container, but mounting
  the directory in the host filesystem inside the container, run:
```
docker run -v $(pwd):/home/default/working-dir -w /home/default/working-dir --rm -it icaps2022submission259/icaps-2022 /bin/bash
```
Now you need to replace the local `third_party/` folder with the one inside the container:
```
rm -rf third_party/
cp -r ../work/third_party/ ./
```
This will allow you to run all the commands listed in `benchmark/README.md`.

## Reproduce experiments on host machine

### Python code

First, clone the repository:
```
git clone https://github.com/icaps2022-submission-259/submission-259-code/ --recursive
git submodule update --init --recursive
```

Then, use Pipenv to set up the development environment:

```
pipenv shell --python=python3.7 && pipenv install --dev
```

Install the package:
```
pip install .
```

For development: install `pddl` in development mode:
```
pip install -e third_party/pddl
```

Also install other local dependencies:
```
./scripts/update-local-dependencies.sh
```

### Build the dependencies and the planners

The tool depends on the following third party dependencies
(you can find all of them in `third_party/`):

- downward
- ltlfond2fond
- myND
- spot

To build all of them, run:
```
./scripts/build.sh
```

The script might not work due to missing build tools or sub-dependencies.

### Run experiments

Finally, to run the experiments:

```
./benchmark/experiments/run-experiments.sh ./output
```

## Use our planner

The main entrypoint for our planner is `./bin/plan4past`. Usage: 

```
./bin/plan4past
    --domain PDDL_DOMAIN_FILEPATH
    --problem PDDL_PROBLEM_FILEPATH
    --map MAP_FILEPATH
    --formula PLTL_FORMULA
    [--output-dir OUTPUT_DIR]
```

E.g.:

```
./bin/plan4past \
    --domain examples/pddl/fond-domain.pddl \
    --problem examples/pddl/fond-p-0.pddl \
    -t mynd
    --map examples/pddl/fond-p-0.map \
    --formula "vehicleat_l22 & O(vehicleat_l31)" \
    --output-dir output
```
