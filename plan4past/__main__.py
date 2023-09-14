# -*- coding: utf-8 -*-
#
# Copyright 2021 -- 2023 WhiteMech
#
# ------------------------------
#
# This file is part of Plan4Past.
#
# Plan4Past is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# Plan4Past is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with Plan4Past.  If not, see <https://www.gnu.org/licenses/>.
#


"""Main entrypoint for Plan4Past."""
from pathlib import Path
from typing import Tuple

import click
from pddl.core import Domain, Problem
from pddl.formatter import domain_to_string, problem_to_string
from pddl.parser.domain import DomainParser
from pddl.parser.problem import ProblemParser
from pylogics.parsers import parse_pltl
from pylogics.syntax.base import Formula

from plan4past.compiler import Compiler
from plan4past.utils.mapping_parser import mapping_parser
from plan4past.adl_compiler import ADLCompiler


DEFAULT_NEW_DOMAIN_FILENAME: str = "new-domain.pddl"
DEFAULT_NEW_PROBLEM_FILENAME: str = "new-problem.pddl"


@click.command()
@click.option(
    "-d",
    "--domain",
    required=True,
    help="Path to PDDL domain file.",
    type=click.Path(exists=True, readable=True),
)
@click.option(
    "-p",
    "--problem",
    required=True,
    help="Path to PDDL problem file.",
    type=click.Path(exists=True, readable=True),
)
@click.option("-g", "--goal-inline", help="The PPLTL goal formula.", type=str)
@click.option(
    "-gf",
    "--goal-file",
    help="The path to the PPLTL goal formula.",
    type=click.Path(exists=True, readable=True),
)
@click.option(
    "-m",
    "--mapping",
    help="The mapping file.",
    type=click.Path(exists=True, readable=True),
    default=None,
)
@click.option(
    "-od",
    "--out-domain",
    default=f"./{DEFAULT_NEW_DOMAIN_FILENAME}",
    help="Path to PDDL file to store the new domain.",
    type=click.Path(dir_okay=False),
)
@click.option(
    "-op",
    "--out-problem",
    default=f"./{DEFAULT_NEW_PROBLEM_FILENAME}",
    help="Path to PDDL file to store the new problem.",
    type=click.Path(dir_okay=False),
)

@click.option(
    "-adl",
    "--adl-encoding",
    default=False,
    is_flag=True,
    help="Switch to the ADL encoding of the PPLTL goal (i.e., without derived predicates).",
    type=bool,
)

def cli(domain, problem, goal_inline, goal_file, mapping, out_domain, out_problem, adl_encoding):
    """Plan4Past: Planning for Pure-Past Temporally Extended Goals."""
    goal = _get_goal(goal_inline, goal_file)

    in_domain, in_problem, formula = _parse_instance(domain, problem, goal)

    var_map = (
        mapping_parser(Path(mapping).read_text(encoding="utf-8"), formula)
        if mapping
        else None
    )

    if adl_encoding:
        compiled_domain, compiled_problem, before_mapping = _adl_compilation_entrypoint(
            in_domain, in_problem, formula, var_map
        )
    else:
        compiled_domain, compiled_problem = _compile_instance(
            in_domain, in_problem, formula, var_map
        )

    try:
        with open(out_domain, "w+", encoding="utf-8") as d:
            d.write(domain_to_string(compiled_domain))
        with open(out_problem, "w+", encoding="utf-8") as p:
            p.write(problem_to_string(compiled_problem))
    except Exception as e:
        raise IOError(
            "[ERROR]: Something wrong occurred while writing the compiled domain and problem."
        ) from e
    
    if adl_encoding:
        with open(out_domain, "a", encoding="utf-8") as d:
            d.write(before_mapping)
        _delete_disjunction_in_goal(out_domain, out_problem)


def _get_goal(goal_inline, goal_file) -> str:
    """Get the goal formula."""
    if goal_inline and goal_file:
        raise ValueError(
            "[ERROR]: You cannot specify both the goal formula and the goal file."
        )
    if goal_file:
        return Path(goal_file).read_text(encoding="utf-8")
    if goal_inline:
        return goal_inline
    raise ValueError(
        "[ERROR]: You must specify either the goal formula or the goal file."
    )


def _parse_instance(in_domain, in_problem, goal) -> Tuple[Domain, Problem, Formula]:
    """Parse the PDDL domain and problem files and the PPLTL goal formula."""
    domain_parser = DomainParser()
    problem_parser = ProblemParser()

    domain = domain_parser(Path(in_domain).read_text(encoding="utf-8"))
    problem = problem_parser(Path(in_problem).read_text(encoding="utf-8"))
    formula = parse_pltl(goal)

    return domain, problem, formula


def _compile_instance(domain, problem, formula, mapping) -> Tuple[Domain, Problem]:
    """Compile the PDDL domain and problem files and the PPLTL goal formula."""
    compiler = Compiler(domain, problem, formula, mapping)
    compiler.compile()
    compiled_domain, compiled_problem = compiler.result

    return compiled_domain, compiled_problem


def _adl_compilation_entrypoint(domain, problem, formula, mapping):

    compiler = ADLCompiler(domain, problem, formula, mapping)
    compiler.compile()
    compiled_domain, compiled_problem, before_mapping = compiler.result
    return compiled_domain, compiled_problem, before_mapping


def _delete_disjunction_in_goal(out_domain, out_problem):
    from FDgrounder import pddl_parser
    from FDgrounder import normalize
    from plan4past.utils.to_pddl import to_pddl
    import os

    splitted_domain = open(out_domain).read().split('(:action')
    achieve_goal_action =  [lin for lin in splitted_domain if lin.strip().startswith('achieve-goal')]
    other_actions = [f'(:action {lin}' for lin in splitted_domain[1:] if not lin.strip().startswith('achieve-goal')]
    assert len(achieve_goal_action) == 1
    achieve_goal_action = achieve_goal_action[0]
    original_domain = splitted_domain[0]
    domain_tmp = original_domain + f'(:action {achieve_goal_action} )'

    open('./tmp_domain.pddl', 'w').write(domain_tmp.replace(':non-deterministic', ''))

    task = pddl_parser.open('./tmp_domain.pddl', out_problem)

    os.system('rm ./tmp_domain.pddl')

    normalize.normalize(task)
    i = 0
    for i in range(len(task.actions)):
        assert task.actions[i].name == 'achieve-goal'
        task.actions[i].name = f'achieve-goal-{i}'

    str_actions = []
    for action in task.actions:
        str_actions.append(to_pddl(action))

    fixed_domain = original_domain + '\n' + '\n\n'.join(str_actions) + '\n\n' + '\n'.join(other_actions)
    with open(out_domain, 'w') as out_dom:
        out_dom.write(fixed_domain)


if __name__ == "__main__":
    cli()  # pragma: no cover
