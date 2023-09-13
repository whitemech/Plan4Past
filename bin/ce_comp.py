from pddl.parser.domain import DomainParser
from pddl.parser.problem import ProblemParser
from pylogics.parsers import parse_pltl
from pddl.formatter import domain_to_string, problem_to_string
from plan4past.utils.mapping_parser import mapping_parser
from plan4past.utils.to_pddl import to_pddl
import click
import os
from plan4past.compiler_ce import compile_with_pddl_library as compile
import FDgrounder
from FDgrounder import normalize
from FDgrounder import pddl_parser

@click.command()
@click.argument('domain')
@click.argument('problem')
@click.argument('formula')
@click.argument('output')
@click.option('--map-path', default=None)
@click.option('--no-evaluate-pex', default=False, is_flag=True)
@click.option('--no-normalize-goal', default=False, is_flag=True)
def main(domain, problem, formula, output, map_path, no_evaluate_pex, no_normalize_goal):
    normalize_goal = not no_normalize_goal
    domain_str = open(domain).read()
    problem_str = open(problem).read()
    domain_parser = DomainParser()
    problem_parser = ProblemParser()
    domain = domain_parser(domain_str)
    problem = problem_parser(problem_str)

    formula = parse_pltl(formula)

    if map_path:
        map_str = open(map_path, 'r').read()
        mapping = mapping_parser(map_str, formula)
    else:
        mapping = None

    compiled_domain, compiled_problem, before_mapping = compile(domain, problem, formula, no_evaluate_pex, from_atoms_to_fluent=mapping)

    output_filename = 'compiled'
    if not os.path.isdir(output):
        os.system('mkdir {}'.format(output))

    output_dom_path = os.path.join(output, output_filename + "_dom.pddl")
    output_prob_path = os.path.join(output, output_filename + "_prob.pddl")

    with open(output_dom_path, 'w') as out_dom:
        out_dom.write(domain_to_string(compiled_domain).replace('Symbols.EQUAL', '=') + '\n' + before_mapping)
    with open(output_prob_path, 'w') as out_prob:
        out_prob.write(problem_to_string(compiled_problem))

    if normalize_goal:

        splitted_domain = open(output_dom_path).read().split('(:action')
        achieve_goal_action =  [lin for lin in splitted_domain if lin.strip().startswith('achieve-goal')]
        other_actions = [f'(:action {lin}' for lin in splitted_domain[1:] if not lin.strip().startswith('achieve-goal')]
        assert len(achieve_goal_action) == 1
        achieve_goal_action = achieve_goal_action[0]
        original_domain = splitted_domain[0]
        domain_tmp = original_domain + f'(:action {achieve_goal_action} )'

        open('./tmp_domain.pddl', 'w').write(domain_tmp.replace(':non-deterministic', ''))

        task = pddl_parser.open('./tmp_domain.pddl', output_prob_path)

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
        with open(output_dom_path, 'w') as out_dom:
            out_dom.write(fixed_domain)

if __name__ == "__main__":
    main()