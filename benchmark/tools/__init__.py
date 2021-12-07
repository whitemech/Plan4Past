from benchmark.tools.core import ToolRegistry, ToolID
from benchmark.tools.fast_downward import FastDownwardTool
from benchmark.tools.fond4ltlfpltlf import Fond4LtlfPltlfMyND, DEFAULT_BIN_F4LP_PATH
from benchmark.tools.mynd import MyNDTool, DEFAULT_BIN_MYND_PATH
from planning_with_past.planners.downward import DEFAULT_BIN_FAST_DOWNWARD_PATH

tool_registry = ToolRegistry()

tool_registry.register(
    ToolID.FAST_DOWNWARD,
    tool_cls=FastDownwardTool,
    binary_path=DEFAULT_BIN_FAST_DOWNWARD_PATH,
)
tool_registry.register(
    ToolID.MYND, tool_cls=MyNDTool, binary_path=DEFAULT_BIN_MYND_PATH
)
tool_registry.register(
    ToolID.FOND4LTLfPLTLf_MYND, tool_cls=Fond4LtlfPltlfMyND, binary_path=DEFAULT_BIN_F4LP_PATH
)
