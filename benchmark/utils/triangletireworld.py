import itertools


def generate_problem_triangletireworld(nb_locs: int) -> str:
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


# def generate_formula(nb_blocks: int):
#     """Generate formula from number of blocks."""
#     assert nb_blocks >= 2
#     formula = f"on_b{nb_blocks - 1}_b{nb_blocks}"
#     for i in range(nb_blocks - 1, 1, -1):
#         formula = f"on_b{i - 1}_b{i} & Y(O({formula}))"
#     formula = f"O({formula})"
#     return formula
#
#
# def generate_future_formula(nb_blocks: int):
#     """Generate future formula."""
#     assert nb_blocks >= 2
#     formula = f'"on b1 b2"'
#     for i in range(2, nb_blocks):
#         formula = f'"on b{i} b{i + 1}"&X(F({formula}))'
#     formula = f"F({formula})"
#     return formula
