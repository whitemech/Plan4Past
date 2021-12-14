from itertools import zip_longest


def _locs_goal_order(nb_locs: int):
    locs_order = []
    for x in range(1, nb_locs + 1):
        locs_order.append(f"l{x}x1")
    for x in range(1, nb_locs):
        locs_order.append(f"l{nb_locs - x}x{x + 1}")
    return locs_order


def _locs_goal_order_zigzag_old(nb_locs: int):
    assert nb_locs >= 2
    nb_twins = (nb_locs + 1) // 2
    nb_siblings = nb_locs // 2
    twins = [f"l{i}x{i}" for i in range(1, nb_twins + 1)]
    siblings = [f"l{i + 1}x{i}" for i in range(1, nb_siblings + 1)]
    result = []
    for twin, sibling in zip_longest(twins, siblings, fillvalue=None):
        if twin is not None:
            result.append(twin)
        if sibling is not None:
            result.append(sibling)
    return result


def _locs_goal_order_zigzag(nb_locs: int):
    assert nb_locs >= 2
    result = []
    i = 1
    j = 1
    while i + j <= nb_locs + 1:
        result.append(f"l{i}x{j}")
        if i == j:
            i += 1
        elif i - j == 1:
            j += 1
    return result


def generate_problem_triangletireworld(nb_locs: int) -> str:
    """Generate PDDL problem from number of locations of a triangle side."""
    objects = [
        f"l{i - j + 1}x{j}" for i in range(1, nb_locs + 1) for j in range(1, i + 1)
    ]
    init_roads = []
    for obj in objects:
        obj_split = obj.split("x")
        i, j = int(obj_split[0][1:]), int(obj_split[1])
        is_margin_left = j == 1
        is_margin_right = i == 1
        is_margin_bottom = i + j == (nb_locs + 1)
        is_margin_top = i + j == 2

        # right-above
        if not is_margin_right and not is_margin_top:
            next_obj = f"l{i-1}x{j}"
            init_roads.append(f"(road {obj} {next_obj})")
        # left-above
        if not is_margin_left and not is_margin_top:
            next_obj = f"l{i}x{j-1}"
            init_roads.append(f"(road {obj} {next_obj})")
        # right
        if not is_margin_right:
            next_obj = f"l{i - 1}x{j + 1}"
            init_roads.append(f"(road {obj} {next_obj})")
        # left
        if not is_margin_left:
            next_obj = f"l{i + 1}x{j - 1}"
            init_roads.append(f"(road {obj} {next_obj})")
        # right-below
        if not is_margin_bottom:
            next_obj = f"l{i}x{j + 1}"
            init_roads.append(f"(road {obj} {next_obj})")
        # left-below
        if not is_margin_bottom:
            next_obj = f"l{i+1}x{j}"
            init_roads.append(f"(road {obj} {next_obj})")

    # spares everywhere!
    init_sparein = [f"(sparein {x})" for x in objects]
    problem = f"""(define (problem t-tw_{nb_locs})
  (:domain triangle-tire)
  (:objects {' '.join(objects)} - location)
  (:init (vehicleat l1x1) (notflattire) {' '.join(init_roads)} {' '.join(init_sparein)})
  (:goal (and (vehicleat l1x{nb_locs})))
)
"""
    return problem


def generate_formula_triangletireworld(nb_locs: int):
    """Generate formula from number of locations of a triangle side."""
    assert nb_locs >= 2
    order = list(_locs_goal_order_zigzag(nb_locs))
    formula = f"vehicleat_{order[0]}"
    for i in range(1, len(order)):
        formula = f"vehicleat_{order[i]} & Y(O({formula}))"
    formula = f"O({formula})"
    return formula


def generate_future_formula_triangletireworld(nb_locs: int):
    """Generate formula from number of locations of a triangle side."""
    assert nb_locs >= 2
    order = list(reversed(_locs_goal_order_zigzag(nb_locs)))
    formula = f'"vehicleat {order[0]}"'
    for i in range(1, len(order)):
        formula = f'"vehicleat {order[i]}"&X(F({formula}))'
    formula = f"F({formula})"
    return formula
