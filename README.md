<h1 align="center">
  <b>Plan4Past</b>
</h1>

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

`TBA`

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
`TBA`

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

Copyright 2022-2023 WhiteMech

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
  year         = {2023},
}
```

## Acknowledgements

Plan4Past has been partially supported by the EU H2020 project AIPlan4EU (No. 101016442), the ERC-ADG WhiteMech 
(No. 834228), the EU ICT-48 2020 project TAILOR (No. 952215), the PRIN project RIPER (No. 20203FFYLK), and the PNRR MUR 
project FAIR (No. PE0000013).
