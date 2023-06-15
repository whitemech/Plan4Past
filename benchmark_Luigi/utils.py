from os import path
import os
from typing import Iterable

LTL_CONSTRAINTS_TEMPLATE = '\n(and {})'
PLAN_CONSTRAINTS_TEMPLATE = '\n(:constraints (and {}))'

EVENTUALLY = "(eventually {})"
NEXT = "(next {})"
AND = "(and {})"

LTL = "LTL"
PLTL = "pltl"
LTL_EXP_POLY = "LTL_EXP_POLY"

MODE_ERROR_MSG = "Please select a mode!"

MODES = [PLTL, LTL]


def create_ltl_problem(problem_path: str, constraints: list, goals: list, out_path: str, poly=False):
    folder_path = '/'.join(out_path.split('/')[:-1])
    if not path.exists(folder_path):
        os.makedirs(folder_path)
    with open(problem_path, 'r') as inp:
        prob_str = inp.read()
    if poly:
        if len(goals) == 0:
            goal_str = '\n'
        else:
            goal_str = '\n(eventually (and {}))'.format('\n\t'.join(goals + ['(final)']))
    else:
        goal_str = '\n'.join(goals)

    constraints_str = '\n'.join(constraints)
    prob_str = prob_str.strip()
    assert prob_str[len(prob_str) - 1] == ')'

    start = prob_str.find('(:goal')
    new_prob_str = prob_str[:start] + '\n\n (:goal (and {})) \n\n)'.format(goal_str + '\n' + constraints_str)
    with open(path.join(out_path), 'w') as out:
        out.write(new_prob_str)


def create_ltl_problem_from_string(prob_str, constraints: list, goals: list, out_path: str, poly=False):
    folder_path = '/'.join(out_path.split('/')[:-1])
    if not path.exists(folder_path):
        os.makedirs(folder_path)
    if poly:
        if len(goals) == 0:
            goal_str = '\n'
        else:
            goal_str = '\n(eventually (and {}))'.format('\n\t'.join(goals + ['(final)']))
    else:
        goal_str = '\n'.join(goals)

    constraints_str = '\n'.join(constraints)
    prob_str = prob_str.strip()
    assert prob_str[len(prob_str) - 1] == ')'

    start = prob_str.find('(:goal')
    new_prob_str = prob_str[:start] + '\n\n (:goal (and {})) \n\n)'.format(goal_str + '\n' + constraints_str)
    with open(path.join(out_path), 'w') as out:
        out.write(new_prob_str)


def create_problem_new_goals(problem_path: str, goals: list, out_path: str):
    with open(problem_path, 'r') as inp:
        prob_str = inp.read()
    prob_str = prob_str.strip()
    assert prob_str[len(prob_str) - 1] == ')'
    start = prob_str.find('(:goal')
    new_prob_str = prob_str[:start] + '\n\n (:goal (and {})) \n\n)'.format(' '.join(goals))
    with open(path.join(out_path), 'w') as out:
        out.write(new_prob_str)


def get_problem_name(i):
    if i >= 9:
        name_p = "p" + str(i + 1) + ".pddl"
    else:
        name_p = "p0" + str(i + 1) + ".pddl"
    return name_p


def _and(conjuncts: Iterable, separator=' '):
    return AND.format(separator.join(conjuncts))

def _next(arg: str):
    return NEXT.format(arg)

def _eventually(arg: str):
    return EVENTUALLY.format(arg)
