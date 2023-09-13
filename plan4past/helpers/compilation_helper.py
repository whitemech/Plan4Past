from pylogics.syntax.pltl import *
from pylogics.syntax.base import *
from plan4past.utils.ppnf_visitor import ppnf
from plan4past.helpers.quoted_atom_helper import *

def is_temporal_operator(formula: Formula) -> bool:
    return isinstance(formula, Once) or isinstance(formula, Before) or isinstance(formula, Since)

def is_unary_op(formula: Formula) -> bool:
    return isinstance(formula, Once) or isinstance(formula, Before) or isinstance(formula, Not)

def is_atomic_formula(formula: Formula) -> bool:
    return isinstance(formula, Atomic) or isinstance(formula, PropositionalTrue) or isinstance(formula, PropositionalFalse)


class CompilationManager:

    def __init__(self, phi: Formula) -> None:
        self.phi = phi
        self.before_id = 0
        self.before_dictionary = {}
        self._gen_before_dictionary(self.phi)

    def _gen_before_mapping(self):

        before_mapping = []
        for key, value in self.before_dictionary.items():
            before_mapping.append(f'; {str(key)}: {str(value)}')

        return '\n'.join(before_mapping)

    def get_problem_extension(self):

        goal = ppnf(self.phi)
        fresh_atoms = []
        conditional_effects = []

        for before_atom in self.before_dictionary.keys():
            assert isinstance(before_atom, YesterdayAtom)
            fresh_atoms.append(before_atom)
            conditional_effects.append(
                (ppnf(before_atom.formula), before_atom))

        return fresh_atoms, conditional_effects, goal


    '''
    Generation of the before atoms needed for the compilation. 
    Example 1: for "H(a) or (b S H(c))" we need to create before_H(a), before_H(c) and before_(b S H(c))
    Example 2: for "H(a) or (b S H(a))" we need to create before_H(a) and before_(b S H(a))
    Before atoms are kept in a dictionary <key, value> where:
        - key is a pltl formula
        - value is the before associated with such formula
    To make the resulting compiled problems more readable, before atoms feautre unique numbers instead of the temporal formula.
    Therefore, in exaple 2 we generate before_1 and before_2
    '''

    def _gen_before_dictionary(self, psi: Formula):

        if not is_atomic_formula(psi):

            if is_temporal_operator(psi):
                self._insert_before(get_before_atom(psi))

            if isinstance(psi, And) or isinstance(psi, Or):
                for operand in psi.operands:
                    self._gen_before_dictionary(operand)
                
            elif is_unary_op(psi):
                self._gen_before_dictionary(psi.argument)
            else:
                assert isinstance(psi, Since)
                self._gen_before_dictionary(psi.operands[0])
                self._gen_before_dictionary(psi.operands[1])

    def _insert_before(self, before_atom: YesterdayAtom):
        if self.before_dictionary.get(before_atom) is None:
            self.before_dictionary[before_atom] = Atomic(
                f'{QUOTED_ATOM}_{self.before_id}')
            self.before_id += 1