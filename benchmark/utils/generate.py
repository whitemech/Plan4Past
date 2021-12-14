from abc import ABC, abstractmethod
from typing import Dict, Type

from benchmark.utils.base import ExperimentType
from benchmark.utils.blocksworld import (
    generate_problem_blocksworld,
    generate_formula_blocksworld,
    generate_future_formula_blocksworld,
)
from benchmark.utils.triangletireworld import (
    generate_problem_triangletireworld,
    generate_formula_triangletireworld,
    generate_future_formula_triangletireworld,
)


def get_generator(experiment_type: ExperimentType, dataset_name: str):
    if experiment_type == ExperimentType.A:
        return _GENERATORS_1A[dataset_name]
    elif experiment_type == ExperimentType.B:
        return _GENERATORS_1B[dataset_name]
    raise ValueError("unexpected")


class ExperimentGenerator(ABC):
    @classmethod
    @abstractmethod
    def generate_problem(cls, i: int):
        """Generate i-th problem."""

    @classmethod
    @abstractmethod
    def generate_formula(cls, tool_id: str, param: int):
        """Generate formula."""


class BlocksworldGenerator1A(ExperimentGenerator):
    @classmethod
    def generate_problem(cls, i: int):
        return generate_problem_blocksworld(i)

    @classmethod
    def generate_formula(cls, tool_id: str, param: int):
        future = "lf2f" in tool_id
        if future:
            return 'F("on b2 b3"&X(F("on b1 b2")))'
        return "O(on_b1_b2 & Y(O(on_b2_b3)))"


class BlocksworldGenerator1B(ExperimentGenerator):
    @classmethod
    def generate_problem(cls, i: int):
        return generate_problem_blocksworld(i)

    @classmethod
    def generate_formula(cls, tool_id: str, nb_blocks: int):
        future = "lf2f" in tool_id
        if future:
            return generate_future_formula_blocksworld(nb_blocks)
        return generate_formula_blocksworld(nb_blocks)


class TriangleTireworld1A(ExperimentGenerator):
    @classmethod
    def generate_problem(cls, i: int):
        return generate_problem_triangletireworld(i)

    @classmethod
    def generate_formula(cls, tool_id: str, param: int):
        future = "lf2f" in tool_id
        if future:
            return 'F("vehicleat l1x2"&X(F("vehicleat l2x1"&X(F("vehicleat l3x1")))))'
        return "O(vehicleat_l3x1 & Y(O(vehicleat_l2x1 & Y(O(vehicleat_l1x2)))))"

        # alternatives:

        # if future:
        #     return 'F("vehicleat l3x1")&F("vehicleat l2x2")&F("vehicleat l1x3")'
        # return "O(vehicleat_l3x1) & O(vehicleat_l2x2) & O(vehicleat_l1x3)"

        # if future:
        #     return 'F("vehicleat l2x1")&F("vehicleat l1x2")'
        # return "O(vehicleat_l2x1) & O(vehicleat_l1x2)"


class TriangleTireworld1B(ExperimentGenerator):
    @classmethod
    def generate_problem(cls, i: int):
        return generate_problem_triangletireworld(i)

    @classmethod
    def generate_formula(cls, tool_id: str, nb_locs: int):
        future = "lf2f" in tool_id
        if future:
            return generate_future_formula_triangletireworld(nb_locs)
        return generate_formula_triangletireworld(nb_locs)


_GENERATORS_1A: Dict[str, Type[ExperimentGenerator]] = {
    "blocksworld": BlocksworldGenerator1A,
    "triangle-tireworld": TriangleTireworld1A,
}

_GENERATORS_1B: Dict[str, Type[ExperimentGenerator]] = {
    "blocksworld": BlocksworldGenerator1B,
    "triangle-tireworld": TriangleTireworld1B,
}
