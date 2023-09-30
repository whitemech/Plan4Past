"""Converts a PDDL object to a PDDL string."""
from functools import singledispatch
from typing import List

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


def get_effects(action: PropositionalAction) -> List[Effect]:
    """Get the effects of a propositional action."""
    effects = []
    for cond, eff in action.add_effects:
        effects.append(Effect(parameters=[], condition=cond, literal=eff))

    for cond, eff in action.del_effects:
        effects.append(Effect(parameters=[], condition=cond, literal=eff.negate()))

    return effects


@singledispatch
def to_pddl(obj: object) -> str:
    """Convert a PDDL object to a PDDL string."""
    raise ValueError(f"object of type {type(obj)} is not supported by this function")


@to_pddl.register(Action)
def _(action: Action) -> str:
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
def _(effect: Effect) -> str:
    """Convert an effect to a PDDL string."""
    if isinstance(effect.condition, Truth):
        eff = to_pddl(effect.literal)
    else:
        eff = f"(when {to_pddl(effect.condition)} {to_pddl(effect.literal)})"
    if effect.parameters:
        return f'(forall ({" ".join(to_pddl(param) for param in effect.parameters)}) {eff})'
    return eff


@to_pddl.register(TypedObject)
def _(typed_obj: TypedObject) -> str:
    """Convert a typed object to a PDDL string."""
    if isinstance(typed_obj.type_name, list):
        # EITHER CASE
        type_name = f"({' '.join(typed_obj.type_name)})"
    else:
        type_name = typed_obj.type_name
    return f"{typed_obj.name} - {type_name}"


@to_pddl.register(Conjunction)
def _(conj: Conjunction) -> str:
    """Convert a conjunction to a PDDL string."""
    return f'(and {" ".join([to_pddl(part) for part in conj.parts])})'


@to_pddl.register(Disjunction)
def _(disj: Disjunction) -> str:
    """Convert a disjunction to a PDDL string."""
    return f'(or {" ".join([to_pddl(part) for part in disj.parts])})'


@to_pddl.register(UniversalCondition)
def _(forall: UniversalCondition) -> str:
    """Convert a universal condition to a PDDL string."""
    return (
        f"(forall ({' '.join(to_pddl(param) for param in forall.parameters)}) "
        f"{' '.join(to_pddl(part) for part in forall.parts)})"
    )


@to_pddl.register(ExistentialCondition)
def _(exists: ExistentialCondition) -> str:
    """Convert an existential condition to a PDDL string."""
    return (
        f"(exists ({' '.join(to_pddl(param) for param in exists.parameters)}) "
        f"{' '.join(to_pddl(part) for part in exists.parts)})"
    )


@to_pddl.register(Atom)
def _(atom: Atom) -> str:
    """Convert an atom to a PDDL string."""
    atom_string = f"({atom.predicate} {' '.join(map(str, atom.args))})"
    return atom_string.replace(" )", ")")


@to_pddl.register(NegatedAtom)
def _(atom: Atom) -> str:
    """Convert a negated atom to a PDDL string."""
    return f"(not ({atom.predicate} {' '.join(map(str, atom.args))}))"


@to_pddl.register(Predicate)
def _(predicate: Predicate) -> str:
    """Convert a predicate to a PDDL string."""
    predicate_string = (
        f'({predicate.name} {" ".join([to_pddl(p) for p in predicate.arguments])})'
    )
    return predicate_string.replace(" )", ")")
