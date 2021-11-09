<h1 align="center">
  <b>Classical and FOND Planning for Past Temporal Goals</b>
</h1>

<p align="center">
  <a href="https://pypi.org/project/planning-with-past">
    <img alt="PyPI" src="https://img.shields.io/pypi/v/planning-with-past">
  </a>
  <a href="https://pypi.org/project/planning-with-past">
    <img alt="PyPI - Python Version" src="https://img.shields.io/pypi/pyversions/planning-with-past" />
  </a>
  <a href="">
    <img alt="PyPI - Status" src="https://img.shields.io/pypi/status/planning-with-past" />
  </a>
  <a href="">
    <img alt="PyPI - Implementation" src="https://img.shields.io/pypi/implementation/planning-with-past">
  </a>
  <a href="">
    <img alt="PyPI - Wheel" src="https://img.shields.io/pypi/wheel/planning-with-past">
  </a>
  <a href="https://github.com/whitemech/planning-with-past/blob/master/LICENSE">
    <img alt="GitHub" src="https://img.shields.io/github/license/whitemech/planning-with-past">
  </a>
</p>
<p align="center">
  <a href="">
    <img alt="test" src="https://github.com/whitemech/planning-with-past/workflows/test/badge.svg">
  </a>
  <a href="">
    <img alt="lint" src="https://github.com/whitemech/planning-with-past/workflows/lint/badge.svg">
  </a>
  <a href="">
    <img alt="docs" src="https://github.com/whitemech/planning-with-past/workflows/docs/badge.svg">
  </a>
  <a href="https://codecov.io/gh/whitemech/planning-with-past">
    <img alt="codecov" src="https://codecov.io/gh/whitemech/planning-with-past/branch/master/graph/badge.svg?token=FG3ATGP5P5">
  </a>
</p>


# Classical and FOND Planning for Past Temporal Goals

Planning for temporal goals in past temporal logic. 

## Install

### Python code

First, clone the repository:
```
git clone git@github.com:whitemech/planning-with-past
```

Then, use Poetry to set up the development environment:

```
pipenv shell --python=python3.7 && pipnev install --dev
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

planning-with-past is released under the GNU Lesser General Public License v3.0 or later (LGPLv3+).

Copyright 2021-2021 WhiteMech

## Authors

- [Francesco Fuggitti](https://francescofuggitti.github.io)
- [Marco Favorito](https://marcofavorito.me/)
