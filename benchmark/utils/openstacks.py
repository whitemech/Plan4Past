def generate_problem_openstacks(n: int) -> str:
    counts = [f"n{i}" for i in range(0, n + 1)]
    products = [f"p{i}" for i in range(1, n + 1)]
    if n % 2:
        orders = [f"o{i}" for i in range(1, n//2 + 2)]
    else:
        orders = [f"o{i}" for i in range(1, n // 2 + 1)]
    init_nextcounts = [f"(nextcount n{i-1} n{i})" for i in range(1, n + 1)]
    init_stacksavail = [f"(stacksavail n{i})" for i in range(1, n//3 + 1)]
    init_waitings = [f"(waiting o{i})" for i in range(1, n + 1)]
    init_includes = []
    idx = 0
    for ord in orders:
        idx += 1
        init_includes.append(f"(includes {ord} p{idx})")
        if not idx == len(products):
            init_includes.append(f"(includes {ord} p{idx+1})")
        idx += 1
    problem = f"""(define (problem os_{n})
  (:domain openstacks-sequencedstrips)
  (:objects {' '.join(counts)} - counts {' '.join(orders)} - order {' '.join(products)} - product)
  (:init (machineavailable) {' '.join(init_nextcounts)} {' '.join(init_stacksavail)} {' '.join(init_waitings)} 
  {' '.join(init_includes)})
  (:goal (and (shipped o1)))
)
"""
    return problem


def generate_formula_openstacks(n: int):
    """Generate formula from a given number."""
    subs = []
    for i in range(1, n + 1):
        subs.append(f"O(shipped o{i})")
    return ' & '.join(subs)


def generate_future_formula_openstacks(n: int):
    """Generate future from a given number."""
    subs = []
    for i in range(1, n + 1):
        subs.append(f'F("shipped o{i}")')
    return '&'.join(subs)
