from plan4past.utility.pltl_manager import *
from plan4past.utility.shortcuts import lor, land, lnot

NNF_ERROR_MSG = "The input formula is not in Negation Normal Form"
YESTERDAY_ATOM = "Y"

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

        if not isinstance(psi, Atom):
            assert isinstance(psi, Expression)

            if psi.operator in [BEFORE, WEAKBEFORE, SINCE, TRIGGERS, ONCE, HISTORICALLY]:
                self._insert_before(get_before_atom(psi))

            self._gen_before_dictionary(psi.arg1)
            if isBinaryOp(psi.operator):
                self._gen_before_dictionary(psi.arg2)

    def _insert_before(self, before_atom: YesterdayAtom):
        if self.before_dictionary.get(before_atom) is None:
            self.before_dictionary[before_atom] = Atom(
                f'{YESTERDAY_ATOM}_{self.before_id}')
            self.before_id += 1

    def pex(self, phi):
        if isinstance(phi, Atom):
            return phi
        else:
            assert isinstance(phi, Expression)

            if phi.operator == NOT:
                if isinstance(phi.arg1, Atom):
                    return phi
                else:
                    return lnot(self.pex(phi.arg1))
                    #raise NNFexception(NNF_ERROR_MSG)

            elif phi.operator == BEFORE:
                return get_before_atom(phi)

            elif phi.operator == WEAKBEFORE:
                #return lor(start(), get_before_atom(phi))
                raise NotImplementedError('The weakbefore should be rewritten as !Y(true) before the compilation')

            elif phi.operator == AND:
                return land(self.pex(phi.arg1), self.pex(phi.arg2))

            elif phi.operator == OR:
                return lor(self.pex(phi.arg1), self.pex(phi.arg2))

            elif phi.operator == ONCE:
                return lor(self.pex(phi.arg1),
                           get_before_atom(phi))

            elif phi.operator == HISTORICALLY:
                # return land(self.pex(phi.arg1),
                #             lor(start(),
                #                 get_before_atom(phi)))
                raise NotImplementedError('The historicaly should be rewritten as !O(!phi) before the compilation')

            elif phi.operator == SINCE:
                return lor(self.pex(phi.arg2),
                           land(self.pex(phi.arg1),
                                get_before_atom(phi)))

            elif phi.operator == TRIGGERS:
                # return land(self.pex(phi.arg2),
                #             lor(self.pex(phi.arg1),
                #                 lor(start(), get_before_atom(phi))))
                raise NotImplementedError('The triggers should be rewritten as !(!phi1 S !phi2) before the compilation')
