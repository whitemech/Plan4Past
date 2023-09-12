from FDgrounder.pddl_parser.lisp_parser import parse_nested_list

class MalformedExpression(Exception):
    def __init__(self, *args: object) -> None:
        super().__init__(*args)

PDDL_NOT = 'not'
PDDL_AND = 'and'
PDDL_OR = 'or'

PDDL_SINCE = 'since'
PDDL_TRIGGERS = 'triggers'
PDDL_HISTORICALLY = 'historically'
PDDL_ONCE = 'once'
PDDL_BEFORE = 'before'
PDDL_WEAKBEFORE = 'weak-before'

PDDL_UNTIL = 'until'
PDDL_RELEASE = 'release'
PDDL_ALWAYS = 'always'
PDDL_EVENTUALLY = 'eventually'
PDDL_NEXT = 'next'
PDDL_WEAKNEXT = 'weak-next'

LTL_UNTIL = 'U'
LTL_RELEASE = 'R'
LTL_ALWAYS = 'G'
LTL_EVENTUALLY = 'F'
LTL_NEXT = 'X'
LTL_WEAKNEXT = 'WX'

MALFORMED_EXPRESSION_MSG = 'The expression {expr} is malformed'


def land(args):
    return f"({'&'.join(args)})"

def lor(args):
    return f"({'|'.join(args)})"

def unaryop(op, arg):
    return f'({op}({arg}))'

def binaryop(op, arg1, arg2):
    return f'(({arg1}){op}({arg2}))'


def pddl2tl(pddl_formula):
    tokens = parse_nested_list(pddl_formula.splitlines())
    return tokens2ltl(tokens)


def parse_pddl_conjunction_disjunction(tokens, fun):
    '(and (a) (b) (c) (d)) -> AND(a, AND(b, AND(c, d)))'
    '(or (a) (b) (c) (d))  -> OR(a, OR(b, OR(c, d)))'
    parts = [tokens2ltl(tokens[i]) for i in range(1, len(tokens))]
    current_logic_expr = fun(parts[len(parts)-2], parts[len(parts)-1])
    for i in reversed(range(len(parts) - 2)):
        current_logic_expr = fun(parts[i], current_logic_expr)
    return current_logic_expr


def tokens2ltl(tokens):

    nested_lists = [tk for tk in tokens if isinstance(tk, list)]

    if tokens[0] == PDDL_AND:
        if len(tokens) <= 1:
            raise MalformedExpression()
        elif len(tokens) == 2:
            return tokens2ltl(tokens[1])
        else:
            parts = [tokens2ltl(tokens[i]) for i in range(1, len(tokens))]
            return land(parts)
    
    elif tokens[0] == PDDL_OR:
        if len(tokens) <= 1:
            raise MalformedExpression(MALFORMED_EXPRESSION_MSG.format(expr=str(tokens)))
        elif len(tokens) == 2:
            return tokens2ltl(tokens[1])
        else:
            parts = [tokens2ltl(tokens[i]) for i in range(1, len(tokens))]
            return lor(parts)
    
    elif tokens[0] == PDDL_NOT:
        if len(tokens) != 2:
            raise MalformedExpression(MALFORMED_EXPRESSION_MSG.format(expr=str(tokens)))

        return unaryop('!', tokens2ltl(tokens[1]))
    
    elif tokens[0] == PDDL_UNTIL:
        if len(tokens) != 3:
            raise MalformedExpression(MALFORMED_EXPRESSION_MSG.format(expr=str(tokens)))

        return binaryop('U', tokens2ltl(tokens[1]), tokens2ltl(tokens[2]))

    elif tokens[0] == PDDL_RELEASE:
        if len(tokens) != 3:
            raise MalformedExpression(MALFORMED_EXPRESSION_MSG.format(expr=str(tokens)))

        return binaryop('R', tokens2ltl(tokens[1]), tokens2ltl(tokens[2]))

    elif tokens[0] == PDDL_ALWAYS:
        if len(tokens) != 2:
            raise MalformedExpression(MALFORMED_EXPRESSION_MSG.format(expr=str(tokens)))
        return unaryop('G', tokens2ltl(tokens[1]))

    elif tokens[0] == PDDL_EVENTUALLY:
        if len(tokens) != 2:
            raise MalformedExpression(MALFORMED_EXPRESSION_MSG.format(expr=str(tokens)))
        return unaryop('F', tokens2ltl(tokens[1]))

    elif tokens[0] == PDDL_NEXT:
        if len(tokens) != 2:
            raise MalformedExpression(MALFORMED_EXPRESSION_MSG.format(expr=str(tokens)))
        return unaryop('X', tokens2ltl(tokens[1]))

    elif tokens[0] == PDDL_WEAKNEXT:
        if len(tokens) != 2:
            raise MalformedExpression(MALFORMED_EXPRESSION_MSG.format(expr=str(tokens)))
        return unaryop('WX', tokens2ltl(tokens[1]))
    
    elif tokens[0] == PDDL_SINCE:
        if len(tokens) != 3:
            raise MalformedExpression(MALFORMED_EXPRESSION_MSG.format(expr=str(tokens)))

        return binaryop('S', tokens2ltl(tokens[1]), tokens2ltl(tokens[2]))

    elif tokens[0] == PDDL_TRIGGERS:
        if len(tokens) != 3:
            raise MalformedExpression(MALFORMED_EXPRESSION_MSG.format(expr=str(tokens)))

        return binaryop('T', tokens2ltl(tokens[1]), tokens2ltl(tokens[2]))

    elif tokens[0] == PDDL_HISTORICALLY:
        if len(tokens) != 2:
            raise MalformedExpression(MALFORMED_EXPRESSION_MSG.format(expr=str(tokens)))
        return unaryop('H', tokens2ltl(tokens[1]))

    elif tokens[0] == PDDL_ONCE:
        if len(tokens) != 2:
            raise MalformedExpression(MALFORMED_EXPRESSION_MSG.format(expr=str(tokens)))
        return unaryop('O', tokens2ltl(tokens[1]))

    elif tokens[0] == PDDL_BEFORE:
        if len(tokens) != 2:
            raise MalformedExpression(MALFORMED_EXPRESSION_MSG.format(expr=str(tokens)))
        return unaryop('Y', tokens2ltl(tokens[1]))

    elif tokens[0] == PDDL_WEAKBEFORE:
        if len(tokens) != 2:
            raise MalformedExpression(MALFORMED_EXPRESSION_MSG.format(expr=str(tokens)))
        return unaryop(tokens2ltl(tokens[1]), 'WY')
    
    else:
        # This is an atom
        assert len(nested_lists) == 0
        return ' '.join(tokens)

if __name__ == "__main__":
    formulap = '(and (or (hello) (once (rain))) (before (city1)) (since (city3) (city2)))'
    formulal = '(and (or (hello) (eventually (rain))) (next (city1)) (always (city2)))'
 
    print(pddl2tl(formulal))
    print(pddl2tl(formulap))