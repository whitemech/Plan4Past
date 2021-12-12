from benchmark.tools.core import ToolRegistry, ToolID, SearchAlg, Heuristic
from benchmark.tools.fast_downward import FastDownwardTool
from benchmark.tools.fond4ltlfpltlf import Fond4LtlfPltlfMyND, DEFAULT_BIN_F4LP_PATH
from benchmark.tools.ltlfond2fond import DEFAULT_BIN_LF2F_PATH, LTLFond2FondTool, LTLFond2FondMyNDTool
from benchmark.tools.mynd import MyNDTool, DEFAULT_BIN_MYND_PATH
from benchmark.tools.plan4past import Plan4PastToolMyND, DEFAULT_BIN_P4P_PATH
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

# FOND4LTLfPLTLf + search alg + heuristics
tool_registry.register(
    ToolID.FOND4LTLfPLTLf_MYND_STRONG_FF,
    tool_cls=Fond4LtlfPltlfMyND,
    binary_path=DEFAULT_BIN_F4LP_PATH,
    search=SearchAlg.AOSTAR,
    heuristic=Heuristic.FF
)
tool_registry.register(
    ToolID.FOND4LTLfPLTLf_MYND_STRONG_HMAX,
    tool_cls=Fond4LtlfPltlfMyND,
    binary_path=DEFAULT_BIN_F4LP_PATH,
    search=SearchAlg.AOSTAR,
    heuristic=Heuristic.HMAX
)
tool_registry.register(
    ToolID.FOND4LTLfPLTLf_MYND_STORNG_CYCLIC_FF,
    tool_cls=Fond4LtlfPltlfMyND,
    binary_path=DEFAULT_BIN_F4LP_PATH,
    search=SearchAlg.LAOSTAR,
    heuristic=Heuristic.FF
)
tool_registry.register(
    ToolID.FOND4LTLfPLTLf_MYND_STORNG_CYCLIC_HMAX,
    tool_cls=Fond4LtlfPltlfMyND,
    binary_path=DEFAULT_BIN_F4LP_PATH,
    search=SearchAlg.LAOSTAR,
    heuristic=Heuristic.HMAX
)

# Plan4Past + search alg + heuristics
tool_registry.register(
    ToolID.PLAN4PAST_MYND_STRONG_FF,
    tool_cls=Plan4PastToolMyND,
    binary_path=DEFAULT_BIN_P4P_PATH,
    search=SearchAlg.AOSTAR,
    heuristic=Heuristic.FF
)
tool_registry.register(
    ToolID.PLAN4PAST_MYND_STRONG_HMAX,
    tool_cls=Plan4PastToolMyND,
    binary_path=DEFAULT_BIN_P4P_PATH,
    search=SearchAlg.AOSTAR,
    heuristic=Heuristic.HMAX
)
tool_registry.register(
    ToolID.PLAN4PAST_MYND_STORNG_CYCLIC_FF,
    tool_cls=Plan4PastToolMyND,
    binary_path=DEFAULT_BIN_P4P_PATH,
    search=SearchAlg.LAOSTAR,
    heuristic=Heuristic.FF
)
tool_registry.register(
    ToolID.PLAN4PAST_MYND_STORNG_CYCLIC_HMAX,
    tool_cls=Plan4PastToolMyND,
    binary_path=DEFAULT_BIN_P4P_PATH,
    search=SearchAlg.LAOSTAR,
    heuristic=Heuristic.HMAX
)

# LTLFond2Fond + search alg + heuristics
tool_registry.register(
    ToolID.LTLFOND2FOND_MYND_STRONG_FF,
    tool_cls=LTLFond2FondMyNDTool,
    binary_path=DEFAULT_BIN_LF2F_PATH,
    search=SearchAlg.AOSTAR,
    heuristic=Heuristic.FF
)
tool_registry.register(
    ToolID.LTLFOND2FOND_MYND_STRONG_HMAX,
    tool_cls=LTLFond2FondMyNDTool,
    binary_path=DEFAULT_BIN_LF2F_PATH,
    search=SearchAlg.AOSTAR,
    heuristic=Heuristic.HMAX
)
tool_registry.register(
    ToolID.LTLFOND2FOND_MYND_STORNG_CYCLIC_FF,
    tool_cls=LTLFond2FondMyNDTool,
    binary_path=DEFAULT_BIN_LF2F_PATH,
    search=SearchAlg.LAOSTAR,
    heuristic=Heuristic.FF
)
tool_registry.register(
    ToolID.LTLFOND2FOND_MYND_STORNG_CYCLIC_HMAX,
    tool_cls=LTLFond2FondMyNDTool,
    binary_path=DEFAULT_BIN_LF2F_PATH,
    search=SearchAlg.LAOSTAR,
    heuristic=Heuristic.HMAX
)
