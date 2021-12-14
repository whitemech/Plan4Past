# -*- coding: utf-8 -*-
#
# Copyright 2021 Francesco Fuggitti, Marco Favorito
#
# ------------------------------
#
# This file is part of planning-with-past.
#
# planning-with-past is free software: you can redistribute it and/or modify
# it under the terms of the GNU Lesser General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.
#
# planning-with-past is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License
# along with planning-with-past.  If not, see <https://www.gnu.org/licenses/>.
#
from typing import Dict

import networkx as nx
from matplotlib import pyplot as plt
from pylogics.parsers import parse_pltl
from pylogics.syntax.base import Formula
from pylogics.syntax.pltl import (
    Atomic as PLTLAtomic,
)

from pddl.core import Requirements
from pddl.formatter import domain_to_string, problem_to_string
from pddl.logic import Predicate, constants
from pddl.parser.domain import DomainParser
from pddl.parser.problem import ProblemParser
from planning_with_past import PACKAGE_ROOT
from planning_with_past.compiler import Compiler

from planning_with_past.planners.downward import DownwardPlanner
from planning_with_past.planners.mynd.base import MyNDPlanner
from pathlib import Path

from planning_with_past.utils.atoms_visitor import find_atoms
from bin.utils import launch, REPO_ROOT

MYND_WRAPPER_PATH = (REPO_ROOT / "bin" / "mynd_wrapper").absolute()
EXAMPLES_DIR = PACKAGE_ROOT.parent / "examples"
OUTPUT_DIR = PACKAGE_ROOT.parent / "examples" / "compiled_pddl"


def mapping_parser(text: str, formula: Formula) -> Dict[PLTLAtomic, Predicate]:
    """Parse symbols to ground predicates mapping."""
    symbols = find_atoms(formula)
    maps = text.split("\n")
    from_atoms_to_fluents = dict()
    for symbol in symbols:
        for map in maps:
            s, p = map.split(",")
            if symbol.name == s:
                if " " in p:
                    name, cons = p.split(" ", maxsplit=1)
                    from_atoms_to_fluents[symbol] = Predicate(name, *constants(cons))
                else:
                    from_atoms_to_fluents[symbol] = Predicate(p)
            else:
                continue
    return from_atoms_to_fluents


if __name__ == "__main__":

    # formula = parse_pltl("on_b_a & O(ontable_c)")
    # formula = parse_pltl("O(on_b1_b2 & Y(O(on_b2_b3 & Y(O(on_b3_b4 & Y(O(on_b4_b5 & Y(O(on_b5_b6 & Y(O(on_b6_b7 & Y(O(on_b7_b8 & Y(O(on_b8_b9 & Y(O(on_b9_b10)))))))))))))))))")
    formula = parse_pltl("vehicleat_l22 & O(vehicleat_l31)")

    domain_parser = DomainParser()
    problem_parser = ProblemParser()
    # domain = domain_parser((EXAMPLES_DIR / "pddl" / "domain.pddl").read_text())
    # problem = problem_parser((EXAMPLES_DIR / "pddl" / "p-0.pddl").read_text())
    domain = domain_parser((EXAMPLES_DIR / "pddl" / "fond-domain.pddl").read_text())
    problem = problem_parser((EXAMPLES_DIR / "pddl" / "fond-p-0.pddl").read_text())
    mapping = mapping_parser((EXAMPLES_DIR / "pddl" / "p-0.map").read_text(), formula)

    compiler = Compiler(domain, problem, formula)
    compiler.compile()
    compiled_domain, compiled_problem = compiler.result

    try:
        with open(OUTPUT_DIR / "new_domain.pddl", "w+") as dom:
            dom.write(domain_to_string(compiled_domain))
        with open(OUTPUT_DIR / "new_problem.pddl", "w+") as prob:
            prob.write(problem_to_string(compiled_problem))
    except Exception:
        raise IOError(
            "[ERROR]: Something wrong occurred while writing the compiled domain and problem."
        )

    if Requirements.NON_DETERMINISTIC in domain.requirements:
        # planner = MyNDPlanner()
        # plan = planner.plan(Path("compiled_pddl/new_domain.pddl"), Path("compiled_pddl/new_problem.pddl"))
        command = [
            MYND_WRAPPER_PATH,
            "-d",
            str(Path("compiled_pddl/new_domain.pddl")),
            "-p",
            str(Path("compiled_pddl/new_problem.pddl"))
        ]
        launch(command)
    else:
        planner = DownwardPlanner()
        plan = planner.plan(Path("compiled_pddl/new_domain.pddl"), Path("compiled_pddl/new_problem.pddl"))

        # # print the graph
        # pos = nx.spring_layout(plan.graph)
        # nx.draw_networkx(plan.graph, pos)
        # edge_labels = dict([((n1, n2), action)
        #                     for n1, n2, action in plan.graph.edges(data="action")])
        # nx.draw_networkx_edge_labels(plan.graph, pos, edge_labels=edge_labels)
        # plt.show()