import itertools
from typing import List


def generate_problem_triangletireworld(nb_locs: int) -> str:
    """Generate PDDL problem from number of locations of a triangle side."""
    objects = [f"l{i}{j}" for i in range(1, nb_locs + 1) for j in range(1, nb_locs + 2 - i)]
    init_roads = [f"(road {i} {j}) (road {j} {i})" for i, j in list(itertools.combinations(objects, 2))]
    init_sparein = [f"(spare-in {i})" for i in objects if i[1] != "1"]
    problem = f"""(define (problem t-tw_{nb_locs})
  (:domain triangle-tire)
  (:objects {' '.join(objects)} - location)
  (:init (vehicleat l11) (not-flattire) {' '.join(init_roads)} {' '.join(init_sparein)})
  (:goal (and (vehicleat l1{nb_locs})))
)
"""
    return problem


def generate_formula(nb_locs: int):
    """Generate formula from number of locations of a triangle side."""
    assert nb_locs >= 2
    order = reversed(_locs_goal_order(nb_locs))
    formula = f"vehicleat_{order[len(order)-1]}"
    for i in range(len(order) - 1, 1, -1):
        formula = f"vehicleat_{order[i]} & Y(O({formula}))"
    formula = f"O({formula})"
    return formula
    # return _compute_formula(order)






def generate_future_formula(nb_blocks: int):
    """Generate future formula."""
    assert nb_blocks >= 2
    formula = f'"on b1 b2"'
    for i in range(2, nb_blocks):
        formula = f'"on b{i} b{i + 1}"&X(F({formula}))'
    formula = f"F({formula})"
    return formula


def _locs_goal_order(nb_locs: int):
    locs_order = []
    for x in range(1, nb_locs + 1):
        locs_order.append(f"l{x}1")
    for x in range(1, nb_locs):
        locs_order.append(f"l{nb_locs - x}{x + 1}")
    return locs_order
