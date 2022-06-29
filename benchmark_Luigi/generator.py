from benchmark.utils.generate import ExperimentGenerator
from benchmark_Luigi import blocksworld_model
from benchmark_Luigi.utils import LTL_EXP_POLY, PLTL, get_problem_name, create_ltl_problem_from_string
import os
import pkg_resources

PROPOSITIONAL_PATH = pkg_resources.resource_filename(__name__, 'blocksworld_propositional')

class BlocksworldGeneratorExtended(ExperimentGenerator):
    @classmethod
    def generate_problem(cls, i: int):
        return blocksworld_model.generate_problem_blocksworld(i)

    @classmethod
    def generate_formula(cls, tool_id: str, nb_blocks: int):
        future = "lf2f" in tool_id
        if future:
            return blocksworld_model.generate_future_formula_blocksworld(nb_blocks)
        return blocksworld_model.generate_formula_blocksworld(nb_blocks)

    @classmethod
    def generate_formula_blowup(cls, tool_id: str, nb_blocks: int):
        if tool_id == 'p4p':
            return blocksworld_model.generate_blowup_formula_blocksworld(nb_blocks, PLTL)
        else:
            return blocksworld_model.generate_blowup_formula_blocksworld(nb_blocks, LTL_EXP_POLY)



def generate_propositional_problmes():
    generator = BlocksworldGeneratorExtended()
    if not os.path.exists(PROPOSITIONAL_PATH):
        os.makedirs(PROPOSITIONAL_PATH)
        for i in range(40):
            problem = generator.generate_problem(i + 1)
            name = get_problem_name(i)
            open(os.path.join(PROPOSITIONAL_PATH, name), 'w').write(problem)


def generate_ltl_poly_exp_problems():
    ltl_poly_exp_path = pkg_resources.resource_filename(__name__, 'LTL_blowup')
    for i in range(10, 31):
        name = get_problem_name(i-1)
        blocksGen = BlocksworldGeneratorExtended()
        print(i)
        problem = blocksGen.generate_problem(i)
        formula = blocksGen.generate_formula_blowup(LTL_EXP_POLY, i)

        out_paht = os.path.join(ltl_poly_exp_path, name)
        create_ltl_problem_from_string(problem, [formula], [], out_paht, poly=False)


if __name__ == '__main__':
    #generate_propositional_problmes()
    generate_ltl_poly_exp_problems()