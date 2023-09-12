from FDgrounder.pddl_parser.lisp_parser import parse_nested_list
from plan4past.utility.shortcuts import *

PDDL_NOT = 'not'
PDDL_AND = 'and'
PDDL_OR = 'or'

PDDL_SINCE = 'since'
PDDL_TRIGGERS = 'triggers'
PDDL_HISTORICALLY = 'historically'
PDDL_ONCE = 'once'
PDDL_BEFORE = 'before'
PDDL_WEAKBEFORE = 'weak-before'

MALFORMED_EXPRESSION_MSG = 'The expression {expr} is malformed'

class MalformedPLTLExpression(Exception):
    pass


def pddl2pltl(pddl_formula):
    tokens = parse_nested_list(pddl_formula.splitlines())
    return tokens2pltl(tokens)


def parse_pddl_conjunction_disjunction(tokens, fun):
    '(and (a) (b) (c) (d)) -> AND(a, AND(b, AND(c, d)))'
    '(or (a) (b) (c) (d))  -> OR(a, OR(b, OR(c, d)))'
    parts = [tokens2pltl(tokens[i]) for i in range(1, len(tokens))]
    current_logic_expr = fun(parts[len(parts)-2], parts[len(parts)-1])
    for i in reversed(range(len(parts) - 2)):
        current_logic_expr = fun(parts[i], current_logic_expr)
    return current_logic_expr


def tokens2pltl(tokens):

    nested_lists = [tk for tk in tokens if isinstance(tk, list)]

    if tokens[0] == PDDL_AND:
        if len(tokens) <= 1:
            raise MalformedPLTLExpression()
        elif len(tokens) == 2:
            return tokens2pltl(tokens[1])
        else:
            return parse_pddl_conjunction_disjunction(tokens, land)
    
    elif tokens[0] == PDDL_OR:
        if len(tokens) <= 1:
            raise MalformedPLTLExpression(MALFORMED_EXPRESSION_MSG.format(expr=str(tokens)))
        elif len(tokens) == 2:
            return tokens2pltl(tokens[1])
        else:
            return parse_pddl_conjunction_disjunction(tokens, lor)
    
    elif tokens[0] == PDDL_NOT:
        if len(tokens) != 2:
            raise MalformedPLTLExpression(MALFORMED_EXPRESSION_MSG.format(expr=str(tokens)))

        return lnot(tokens2pltl(tokens[1]))
    
    elif tokens[0] == PDDL_SINCE:
        if len(tokens) != 3:
            raise MalformedPLTLExpression(MALFORMED_EXPRESSION_MSG.format(expr=str(tokens)))

        return S(tokens2pltl(tokens[1]), tokens2pltl(tokens[2]))

    elif tokens[0] == PDDL_TRIGGERS:
        if len(tokens) != 3:
            raise MalformedPLTLExpression(MALFORMED_EXPRESSION_MSG.format(expr=str(tokens)))

        return T(tokens2pltl(tokens[1]), tokens2pltl(tokens[2]))

    elif tokens[0] == PDDL_HISTORICALLY:
        if len(tokens) != 2:
            raise MalformedPLTLExpression(MALFORMED_EXPRESSION_MSG.format(expr=str(tokens)))
        return H(tokens2pltl(tokens[1]))

    elif tokens[0] == PDDL_ONCE:
        if len(tokens) != 2:
            raise MalformedPLTLExpression(MALFORMED_EXPRESSION_MSG.format(expr=str(tokens)))
        return O(tokens2pltl(tokens[1]))

    elif tokens[0] == PDDL_BEFORE:
        if len(tokens) != 2:
            raise MalformedPLTLExpression(MALFORMED_EXPRESSION_MSG.format(expr=str(tokens)))
        return Y(tokens2pltl(tokens[1]))

    elif tokens[0] == PDDL_WEAKBEFORE:
        if len(tokens) != 2:
            raise MalformedPLTLExpression(MALFORMED_EXPRESSION_MSG.format(expr=str(tokens)))
        return Z(tokens2pltl(tokens[1]))
    
    else:
        # This is an atom
        assert len(nested_lists) == 0
        return atom(' '.join(tokens))


# Just for debugging
if __name__ == "__main__":
    formula = '''
        (and 

                    (eventually (and (on b2 b1) (next 
                        (eventually (and (on b3 b2) (next
                            (eventually (and (on b4 b3)
                                (next (eventually (on b6 b5))) (next (eventually (on b8 b7))) (next (eventually (on b10 b9)))
                            ))))))))
                    
        (eventually (and (on b9 b10) (next (eventually (and (on b8 b9) (next (eventually (and (on b7 b8) (next (eventually (and (on b6 b7) (next (eventually (and (on b5 b6) (next (eventually (and (on b4 b5) (next (eventually (and (on b3 b4) (next (eventually (and (on b2 b3) (next (eventually (on b1 b2)))))))))))))))))))))))))))

        '''

    tmp = pddl2pltl(formula.replace('eventually', 'once').replace('next', 'before'))
    print(tmp)