def generate_problem_elevator(n: int) -> str:
    passengers = [f"p{i}" for i in range(0, n)]
    floors = [f"f{i}" for i in range(0, 2*n)]
    init_aboves = []
    for i in range(0, len(floors)):
        for j in range(1 + i, len(floors)):
            init_aboves.append(f"(above f{i} f{j})")
    init_origin = [f"(origin p{i} f0)" for i in range(0, n)]
    init_dest = []
    nb_dst = list(range(1, len(floors), 2))
    for i in range(0, n):
        init_dest.append(f"(destin p{i} f{nb_dst[i]})")
    problem = f"""(define (problem el_{n})
  (:domain elevator)
  (:objects {' '.join(passengers)} - passenger {' '.join(floors)} - floor)
  (:init (lift-at f0) {' '.join(init_aboves)} {' '.join(init_origin)} {' '.join(init_dest)})
  (:goal (and (served p0)))
)
"""
    return problem


def generate_formula_elevator(n: int):
    """Generate formula from a given number."""
    subs = []
    for i in range(0, n + 1):
        subs.append(f"O(served_p{i})")
    return ' & '.join(subs)


def generate_future_formula_elevator(n: int):
    """Generate future from a given number."""
    subs = []
    for i in range(0, n + 1):
        subs.append(f'F("served p{i}")')
    return '&'.join(subs)
