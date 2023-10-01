<h1 align="center">
  <img src="https://user-images.githubusercontent.com/29372925/252561261-c383afa8-9138-43a7-8f7d-fd0ecd9220bd.png" width="40%" height="auto">
</h1>

<p align="center">

  <a href="https://pypi.org/project/plan4past">
    <img alt="Python Version" src="https://img.shields.io/pypi/pyversions/plan4past" />
  </a>
  <a href="https://pypi.org/project/plan4past">
    <img alt="PyPI" src="https://img.shields.io/pypi/v/plan4past">
  </a>
  <a href="https://github.com/whitemech/plan4past/workflows/test/badge.svg">
    <img alt="build" src="https://github.com/whitemech/plan4past/workflows/test/badge.svg">
  </a>
  <a href="https://codecov.io/gh/whitemech/plan4past">
    <img alt="codecov" src="https://codecov.io/gh/whitemech/plan4past/branch/main/graph/badge.svg">
  </a>
  <a href="https://github.com/whitemech/plan4past/blob/main/LICENSE">
    <img alt="GitHub" src="https://img.shields.io/badge/license-LGPLv3%2B-blue">
  </a>
</p>

---

Classical and FOND Planning for Pure-Past Linear Temporal Logic Goals.

## Installation

- from PyPI: 

```
pip install plan4past
```

- from source (`main` branch): 

```
pip install git+https://github.com/whitemech/Plan4Past.git
```

or, clone the repository and install:

```
git clone https://github.com/whitemech/Plan4Past.git
cd Plan4Past
pip install .
```

## Quickstart

You can use the `plan4past` package in two ways: as a library, and as a CLI tool.

### As a library
This is an example of how you can encode a PPLTL goal formula into a PDDL domain and problem programmatically.

```python
from pathlib import Path
from pddl.formatter import domain_to_string, problem_to_string
from pddl.parser.domain import DomainParser
from pddl.parser.problem import ProblemParser
from pylogics.parsers import parse_pltl
from plan4past.compiler import Compiler

formula = "on_b_a & O(ontable_c)"
domain_parser = DomainParser()
problem_parser = ProblemParser()

domain = domain_parser(Path("ignore/examples/pddl/domain.pddl").read_text(encoding="utf-8"))
problem = problem_parser(Path("ignore/examples/pddl/p-0.pddl").read_text(encoding="utf-8"))
goal = parse_pltl(formula)

compiler = Compiler(domain, problem, goal)
compiler.compile()
compiled_domain, compiled_problem = compiler.result

try:
    with open("./new-domain.pddl", "w+", encoding="utf-8") as d:
        d.write(domain_to_string(compiled_domain))
    with open("./new-problem.pddl", "w+", encoding="utf-8") as p:
        p.write(problem_to_string(compiled_problem))
except Exception as e:
    raise IOError(
        "[ERROR]: Something wrong occurred while writing the compiled domain and problem."
    ) from e
```

By executing the code above, you will obtain a `new-domain.pddl` as well as a `new-problem.pddl` in output.

### As a CLI tool

The package can also be used as a CLI tool. The supported command is:

```
plan4past -d DOMAIN_FILE -p PROBLEM_FILE -g "PPLTL_FORMULA" [-m MAPPING] 
```
where `DOMAIN_FILE` and `PROBLEM_FILE` are the PDDL domain and problem files, respectively, and `PPLTL_FORMULA` is the 
goal formula expressed in Pure-Past Linear Temporal Logic. 
The optional `MAPPING` file is a mapping between the PDDL objects and the PPLTL formula's atomic propositions.

For instance:
```
plan4past -d examples/pddl/domain.pddl -p examples/pddl/p-0.pddl -g "ontable_c & O(on_b_a)"
```

## Docker & Apptainer images

A Docker image as well as an Apptainer image are available for Plan4Past.

- To use Docker:
`docker build -t plan4past .` and `docker run --rm -it plan4past`

- To use Apptainer:
```
apptainer build plan4past.sif plan4past.def

# to launch the tool:
./plan4past.sif -d examples/pddl/domain.pddl -p examples/pddl/p-0.pddl -g "ontable_c & O(on_b_a)"
```


## Development

If you want to contribute, set up your development environment as follows:

- Intall [Poetry](https://python-poetry.org)
- Clone the repository: `git clone https://github.com/whitemech/Plan4Past.git && cd Plan4Past`
- Install the dependencies: `poetry shell && poetry install`

## Docs

To build the docs: `mkdocs build`

To view documentation in a browser: `mkdocs serve`
and then go to [http://localhost:8000](http://localhost:8000)

## License

Plan4Past is released under the GNU Lesser General Public License v3.0 or later (LGPLv3+).

Copyright 2021 -- 2023 WhiteMech

## Citing

If you use Plan4Past in your research, please consider citing the following paper:

```
@inproceedings{icaps2023bdffgs,
  author       = {Luigi Bonassi and 
                  Giuseppe {De Giacomo} and 
                  Marco Favorito and 
                  Francesco Fuggitti and 
                  {Alfonso Emilio} Gerevini and 
                  Enrico Scala},
  title        = {Planning for Temporally Extended Goals in Pure-Past Linear Temporal Logic},
  booktitle    = {{ICAPS}},
  volume       = {33},
  url          = {https://ojs.aaai.org/index.php/ICAPS/article/view/27179},
  doi          = {10.1609/icaps.v33i1.27179},
  number       = {1},
  month        = {Jul.},
  pages        = {61-69},
  year         = {2023},
}
```

## Acknowledgements

Plan4Past has been partially supported by the EU H2020 project AIPlan4EU (No. 101016442), the ERC-ADG WhiteMech 
(No. 834228), the EU ICT-48 2020 project TAILOR (No. 952215), the PRIN project RIPER (No. 20203FFYLK), and the PNRR MUR 
project FAIR (No. PE0000013).
