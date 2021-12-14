from abc import ABC, abstractmethod
from typing import Dict, Type

from benchmark.utils.base import ExperimentType
from benchmark.utils.blocksworld import (
    generate_problem_blocksworld,
    generate_formula_blocksworld,
    generate_future_formula_blocksworld,
)
from benchmark.utils.elevator import (
    generate_problem_elevator,
    generate_future_formula_elevator,
    generate_formula_elevator,
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
            return 'F("vehicleat l1x1"&X(F("vehicleat l2x1"&X(F("vehicleat l1x2")))))'
        return "O(vehicleat_l1x2 & Y(O(vehicleat_l2x1 & Y(O(vehicleat_l1x1)))))"


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


class ElevatorGenerator1A(ExperimentGenerator):
    @classmethod
    def generate_problem(cls, i: int):
        return generate_problem_elevator(i)

    @classmethod
    def generate_formula(cls, tool_id: str, param: int):
        future = "lf2f" in tool_id
        if future:
            return 'F("served p0")&F("served p1")&F("served p2")'
        return "O(served_p0) & O(served_p1) & O(served_p2)"


class ElevatorGenerator1B(ExperimentGenerator):
    @classmethod
    def generate_problem(cls, i: int):
        return generate_problem_elevator(i)

    @classmethod
    def generate_formula(cls, tool_id: str, nb_blocks: int):
        future = "lf2f" in tool_id
        if future:
            return generate_future_formula_elevator(nb_blocks)
        return generate_formula_elevator(nb_blocks)


_GENERATORS_1A: Dict[str, Type[ExperimentGenerator]] = {
    "blocksworld": BlocksworldGenerator1A,
    "triangle-tireworld": TriangleTireworld1A,
    "elevator": ElevatorGenerator1A,
}

_GENERATORS_1B: Dict[str, Type[ExperimentGenerator]] = {
    "blocksworld": BlocksworldGenerator1B,
    "triangle-tireworld": TriangleTireworld1B,
    "elevator": ElevatorGenerator1B,
}
