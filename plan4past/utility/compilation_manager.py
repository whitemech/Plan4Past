from plan4past.utility.ppltl_manager import *
from plan4past.utility.shortcuts import Or, And, Not

NNF_ERROR_MSG = "The input formula is not in Negation Normal Form"
QUOTED_ATOM = "quoted"

class NNFexception(Exception):
    pass


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

        goal = self.pex(self.phi)
        fresh_atoms = []
        conditional_effects = []

        for before_atom in self.before_dictionary.keys():
            assert isinstance(before_atom, YesterdayAtom)
            fresh_atoms.append(before_atom)
            conditional_effects.append(
                (self.pex(before_atom.formula), before_atom))

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

    def _gen_before_dictionary(self, psi):

        if not isinstance(psi, Atomic) and not isinstance(psi, PropositionalTrue) and not isinstance(psi, PropositionalFalse):
            assert isinstance(psi, Formula)

            if isinstance(psi, Before) or \
                isinstance(psi, Once) or \
                isinstance(psi, Historically) or \
                isinstance(psi, Since):
                self._insert_before(get_before_atom(psi))

            if isinstance(psi, And) or isinstance(psi, Or):
                for operand in psi.operands:
                    self._gen_before_dictionary(operand)
                
            elif isinstance(psi, Not) or \
                isinstance(psi, Once) or \
                isinstance(psi, Before) or \
                isinstance(psi, Historically):
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

    def pex(self, phi):
        if isinstance(phi, Atomic) or isinstance(phi, PropositionalTrue) or isinstance(phi, PropositionalFalse):
            return phi
        else:
            assert isinstance(phi, Formula)

            if isinstance(phi, Not):
                if isinstance(phi.argument, Atomic):
                    return phi
                else:
                    return Not(self.pex(phi.argument))
                    #raise NNFexception(NNF_ERROR_MSG)

            elif isinstance(phi, Before):
                return get_before_atom(phi)

            elif isinstance(phi, And):
                return And(*[self.pex(operand) for operand in phi.operands])

            elif isinstance(phi, Or):
                return Or(*[self.pex(operand) for operand in phi.operands])

            elif isinstance(phi, Once):
                return Or(self.pex(phi.argument),
                           get_before_atom(phi))

            elif isinstance(phi, Historically):
                raise NotImplementedError('The historicaly should be rewritten as !O(!phi) before the compilation')

            elif isinstance(phi, Since):
                return Or(self.pex(phi.operands[1]),
                           And(self.pex(phi.operands[0]),
                                get_before_atom(phi)))

            else:
                assert False