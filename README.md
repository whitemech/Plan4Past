<h1 align="center">
  <b>Classical and FOND Planning for Past Temporal Goals</b>
</h1>


Planning for temporal goals in past temporal logic. 

## Install

### Python code

First, clone the repository:
```
git clone git@github.com:whitemech/planning-for-past-temporal-goals --recursive
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

### Planners

Run:
```
./scripts/build.sh
```

to build the required dependencies (in particular planners). 

## Quickstart

### Classical planning

```python
import networkx as nx
import matplotlib.pyplot as plt
from planning_with_past.planners.downward import DownwardPlanner
from pathlib import Path

planner = DownwardPlanner()
plan = planner.plan(Path("examples/compiled_pddl/domain.pddl"), Path("examples/compiled_pddl/p-0.pddl"))

# print the graph
pos = nx.spring_layout(plan.graph)
nx.draw_networkx(plan.graph, pos)
edge_labels = dict([((n1, n2), action)
                    for n1, n2, action in plan.graph.edges(data="action")])
nx.draw_networkx_edge_labels(plan.graph, pos, edge_labels=edge_labels)
plt.show()
```

## Use the planner

The main entrypoint for our planner is `./bin/pltlf-planner`. Usage: 

```
./bin/pltlf-planner
    --domain PDDL_DOMAIN_FILEPATH
    --problem PDDL_PROBLEM_FILEPATH
    --map MAP_FILEPATH
    --formula PLTL_FORMULA
    [--output-dir OUTPUT_DIR]
```

E.g.:

```
./bin/pltlf-planner \
    --domain examples/pddl/fond-domain.pddl \
    --problem examples/pddl/fond-p-0.pddl \
    --map examples/pddl/fond-p-0.map \
    --formula "vehicleat_l22 & O(vehicleat_l31)" \
    --output-dir output \
    --force
```


## Tests

To run tests: `tox`

To run only the code tests: `tox -e py3.7`

To run only the linters: 
- `tox -e flake8`
- `tox -e mypy`
- `tox -e black-check`
- `tox -e isort-check`

Please look at the `tox.ini` file for the full list of supported commands. 

## Docs

To build the docs: `mkdocs build`

To view documentation in a browser: `mkdocs serve`
and then go to [http://localhost:8000](http://localhost:8000)

## License

planning-for-past-temporal-goals is released under the GNU Lesser General Public License v3.0 or later (LGPLv3+).

Copyright 2021 WhiteMech

## Authors

- [Francesco Fuggitti](https://francescofuggitti.github.io)
- [Marco Favorito](https://marcofavorito.me/)
