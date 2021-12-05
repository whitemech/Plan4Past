from benchmark.utils.tools import ToolRegistry, ToolID, FastDownwardTool
from planning_with_past.planners.downward import DEFAULT_BIN_DOWNWARD_PATH

tool_registry = ToolRegistry()

tool_registry.register(ToolID.FAST_DOWNWARD, tool_cls=FastDownwardTool, binary_path=DEFAULT_BIN_DOWNWARD_PATH)
# tool_registry.register(ToolID.MYND, TODO)
