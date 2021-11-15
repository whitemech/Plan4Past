"""Utils for notebooks."""
import os
import tempfile
from pathlib import Path
from typing import Callable, Any, Dict, Set

from IPython.core.display import SVG, display, Image
from graphviz import Digraph
from pylogics.syntax.base import Formula
from pylogics.utils.to_string import to_string

_image_classes = {
    "png": Image,
    "svg": SVG
}
_default_format = "png"


def display_svgs(*filenames, format: str = "png"):
    assert format in _image_classes, f"format '{format}' not supported"
    image_class = _image_classes[format]
    images = [image_class(f) for f in filenames]
    for image in images:
        display(image)


def render_dot(obj: object):
    with tempfile.TemporaryDirectory() as tmpdir:
        filename = Path(tmpdir) / "obj.txt"
        filename.write_text(obj.dot())
        svg_filename = str(filename) + ".png"
        os.system(f"dot -Tpng {str(filename)} -o {svg_filename}")
        display_svgs(svg_filename)


def render_automaton(transition_function: Dict[Formula, Dict[Formula, Formula]], initial_state: Formula, final_states: Set[Formula]):
    digraph = to_graphviz(transition_function, initial_state, final_states)
    render_digraph(digraph)


def to_graphviz(transition_function: Dict[Formula, Dict[Formula, Formula]], initial_state: Formula, final_states: Set[Formula],
                state2str: Callable[[Any], str] = lambda x: state_formula_to_string_graphviz(x),
                action2str: Callable[[Any], str] = lambda x: to_string(x),
                ):
    graph = Digraph(format="svg")
    graph.node("fake", style="invisible")
    graph.attr(rankdir="LR")

    states = set()
    for start, next_tr in transition_function.items():
        states.add(start)
        for end, _guard in next_tr.items():
            states.add(end)

    for state in states:
        shape = "doublecircle" if state in final_states else "circle"
        if state == initial_state:
            graph.node(state2str(state), root="true", shape=shape)
        else:
            graph.node(state2str(state), shape=shape)
    graph.edge("fake", state2str(initial_state), style="bold")

    for start, outgoing in transition_function.items():
        for end, action in outgoing.items():
            label = f"{action2str(action)}"
            graph.edge(
                state2str(start),
                state2str(end),
                label=label,
            )

    return graph


def state_formula_to_string_graphviz(formula: Formula) -> str:
    """Compute a string of a formula for rendering purposes."""
    s = to_string(formula)
    if "|" not in s:
        return s
    clauses = s.split("|")
    rows = [clauses[0]]

    for clause in clauses[1:]:
        if len(rows[-1] + clause) > 40:
            rows.append(clause)
        else:
            rows[-1] = rows[-1] + " | " + clause

    return " |\n".join(rows)


def render_digraph(digraph: Digraph):
    tmp_dir = tempfile.mkdtemp()
    tmp_filepath = str(Path(tmp_dir, "output"))
    digraph.render(tmp_filepath, format="png")
    display_svgs(tmp_filepath + f".png")
