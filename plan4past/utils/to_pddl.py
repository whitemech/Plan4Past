import functools
from functools import singledispatch

from FDgrounder.pddl import (
    Action,
    Atom,
    Conjunction,
    Disjunction,
    Effect,
    ExistentialCondition,
    NegatedAtom,
    Predicate,
    PropositionalAction,
    Truth,
    TypedObject,
    UniversalCondition,
)
from FDgrounder.pddl.axioms import Axiom, PropositionalAxiom


def get_effects(action: PropositionalAction):
    effects = []
    for cond, eff in action.add_effects:
        effects.append(Effect(parameters=[], condition=cond, literal=eff))

    for cond, eff in action.del_effects:
        effects.append(Effect(parameters=[], condition=cond, literal=eff.negate()))

    return effects


@singledispatch
def to_pddl(obj: object) -> str():
    return ""


@to_pddl.register(Action)
def _(action: Action) -> str():
    action_str = (
        "(:action {name}\n"
        "\t :parameters ({parameters})\n"
        "\t :precondition {preconditions}\n"
        "\t :effect (and{effects}))"
    )
    eff_str = "\n"
    for eff in action.effects:
        eff_str += "\t\t" + to_pddl(eff) + "\n"

    precondition_str = ""
    if isinstance(action.precondition, Truth):
        precondition_str = "(and )"
    else:
        precondition_str = to_pddl(action.precondition)

    return action_str.format(
        name=action.name,
        parameters=" ".join(to_pddl(param) for param in action.parameters),
        preconditions=precondition_str,
        effects=eff_str,
    )


@to_pddl.register(Effect)
def _(effect: Effect):
    if isinstance(effect.condition, Truth):
        eff = to_pddl(effect.literal)
    else:
        eff = f"(when {to_pddl(effect.condition)} {to_pddl(effect.literal)})"
    if effect.parameters:
        return f'(forall ({" ".join(to_pddl(param) for param in effect.parameters)}) {eff})'
    else:
        return eff


@to_pddl.register(TypedObject)
def _(typed_obj: TypedObject) -> str():
    if isinstance(typed_obj.type_name, list):
        # EITHER CASE
        type_name = "({})".format(" ".join(typed_obj.type_name))
    else:
        type_name = typed_obj.type_name
    return f"{typed_obj.name} - {type_name}"


@to_pddl.register(Conjunction)
def _(conj: Conjunction) -> str():
    return f'(and {" ".join([to_pddl(part) for part in conj.parts])})'


@to_pddl.register(Disjunction)
def _(disj: Disjunction) -> str():
    return f'(or {" ".join([to_pddl(part) for part in disj.parts])})'


@to_pddl.register(UniversalCondition)
def _(forall: UniversalCondition) -> str():
    return f"(forall ({' '.join(to_pddl(param) for param in forall.parameters)}) {' '.join(to_pddl(part) for part in forall.parts)})"


@to_pddl.register(ExistentialCondition)
def _(exists: ExistentialCondition) -> str():
    return f"(exists ({' '.join(to_pddl(param) for param in exists.parameters)}) {' '.join(to_pddl(part) for part in exists.parts)})"


@to_pddl.register(Atom)
def _(atom: Atom) -> str():
    atom_string = "(%s %s)" % (atom.predicate, " ".join(map(str, atom.args)))
    return atom_string.replace(" )", ")")


@to_pddl.register(NegatedAtom)
def _(atom: Atom) -> str():
    return "(not (%s %s))" % (atom.predicate, " ".join(map(str, atom.args)))


@to_pddl.register(Predicate)
def _(predicate: Predicate) -> str():
    predicate_string = (
        f'({predicate.name} {" ".join([to_pddl(p) for p in predicate.arguments])})'
    )
    return predicate_string.replace(" )", ")")
