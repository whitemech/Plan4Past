from benchmark.tools.core import ToolRegistry, ToolID, SearchAlg, Heuristic
from benchmark.tools.fast_downward import FastDownwardTool, DEFAULT_BIN_FD_PATH
from benchmark.tools.fond4ltlfpltlf import (
    Fond4LtlfPltlfMyNDTool,
    DEFAULT_BIN_F4LP_PATH,
    Fond4LtlfPltlfFDTool, Fond4LtlfPltlfPaladinusTool,
)
from benchmark.tools.ltlfond2fond import (
    DEFAULT_BIN_LF2F_PATH,
    LTLFond2FondTool,
    LTLFond2FondMyNDTool,
    LTLFond2FondFDTool, LTLFond2FondPaladinusTool,
)
from benchmark.tools.mynd import MyNDTool, DEFAULT_BIN_MYND_PATH
from benchmark.tools.paladinus import PaladinusTool, DEFAULT_BIN_PALADINUS_PATH
from benchmark.tools.plan4past import (
    Plan4PastMyNDTool,
    DEFAULT_BIN_P4P_PATH,
    Plan4PastFDTool, Plan4PastPaladinusTool,
)

from benchmark.tools.ggpltl import (
    GGpltlFDTool,
    DEFAULT_BIN_GG_PATH,
    GGpltlPaladinusTool, GGpltlMyNDTool, GGpltlFFTool, GGpltlPlannerTool
)

tool_registry = ToolRegistry()

# FastDownward + search alg + heuristics
tool_registry.register(
    ToolID.FAST_DOWNWARD_FF,
    tool_cls=FastDownwardTool,
    binary_path=DEFAULT_BIN_FD_PATH,
    search=SearchAlg.ASTAR,
    heuristic=Heuristic.FF,
)
tool_registry.register(
    ToolID.FAST_DOWNWARD_HMAX,
    tool_cls=FastDownwardTool,
    binary_path=DEFAULT_BIN_FD_PATH,
    search=SearchAlg.ASTAR,
    heuristic=Heuristic.HMAX,
)

# MyND + search alg + heuristics
tool_registry.register(
    ToolID.MYND_STRONG_FF,
    tool_cls=MyNDTool,
    binary_path=DEFAULT_BIN_MYND_PATH,
    search=SearchAlg.AOSTAR,
    heuristic=Heuristic.FF,
)
tool_registry.register(
    ToolID.MYND_STRONG_CYCLIC_FF,
    tool_cls=MyNDTool,
    binary_path=DEFAULT_BIN_MYND_PATH,
    search=SearchAlg.LAOSTAR,
    heuristic=Heuristic.FF,
)
# Paladinus + search alg + heuristics
tool_registry.register(
    ToolID.PALADINUS_STRONG_CYCLIC_FF,
    tool_cls=PaladinusTool,
    binary_path=DEFAULT_BIN_PALADINUS_PATH,
    search=SearchAlg.ITERATIVE_DFS,
    heuristic=Heuristic.FF,
)

# FOND4LTLfPLTLf + search alg + heuristics
tool_registry.register(
    ToolID.FOND4LTLfPLTLf_FD_FF,
    tool_cls=Fond4LtlfPltlfFDTool,
    binary_path=DEFAULT_BIN_F4LP_PATH,
    search=SearchAlg.ASTAR,
    heuristic=Heuristic.FF,
)
tool_registry.register(
    ToolID.FOND4LTLfPLTLf_FD_HMAX,
    tool_cls=Fond4LtlfPltlfFDTool,
    binary_path=DEFAULT_BIN_F4LP_PATH,
    search=SearchAlg.ASTAR,
    heuristic=Heuristic.HMAX,
)
tool_registry.register(
    ToolID.FOND4LTLfPLTLf_MYND_STRONG_FF,
    tool_cls=Fond4LtlfPltlfMyNDTool,
    binary_path=DEFAULT_BIN_F4LP_PATH,
    search=SearchAlg.AOSTAR,
    heuristic=Heuristic.FF,
)
tool_registry.register(
    ToolID.FOND4LTLfPLTLf_MYND_STRONG_HMAX,
    tool_cls=Fond4LtlfPltlfMyNDTool,
    binary_path=DEFAULT_BIN_F4LP_PATH,
    search=SearchAlg.AOSTAR,
    heuristic=Heuristic.HMAX,
)
tool_registry.register(
    ToolID.FOND4LTLfPLTLf_MYND_STORNG_CYCLIC_FF,
    tool_cls=Fond4LtlfPltlfMyNDTool,
    binary_path=DEFAULT_BIN_F4LP_PATH,
    search=SearchAlg.LAOSTAR,
    heuristic=Heuristic.FF,
)
tool_registry.register(
    ToolID.FOND4LTLfPLTLf_MYND_STORNG_CYCLIC_HMAX,
    tool_cls=Fond4LtlfPltlfMyNDTool,
    binary_path=DEFAULT_BIN_F4LP_PATH,
    search=SearchAlg.LAOSTAR,
    heuristic=Heuristic.HMAX,
)
tool_registry.register(
    ToolID.FOND4LTLfPLTLf_PALADINUS_STORNG_CYCLIC_FF,
    tool_cls=Fond4LtlfPltlfPaladinusTool,
    binary_path=DEFAULT_BIN_F4LP_PATH,
    search=SearchAlg.ITERATIVE_DFS,
    heuristic=Heuristic.FF,
)
tool_registry.register(
    ToolID.FOND4LTLfPLTLf_PALADINUS_STORNG_CYCLIC_HMAX,
    tool_cls=Fond4LtlfPltlfPaladinusTool,
    binary_path=DEFAULT_BIN_F4LP_PATH,
    search=SearchAlg.ITERATIVE_DFS,
    heuristic=Heuristic.HMAX,
)

# Plan4Past + search alg + heuristics
tool_registry.register(
    ToolID.PLAN4PAST_FD_FF,
    tool_cls=Plan4PastFDTool,
    binary_path=DEFAULT_BIN_P4P_PATH,
    search=SearchAlg.ASTAR,
    heuristic=Heuristic.FF,
)
tool_registry.register(
    ToolID.PLAN4PAST_FD_HMAX,
    tool_cls=Plan4PastFDTool,
    binary_path=DEFAULT_BIN_P4P_PATH,
    search=SearchAlg.ASTAR,
    heuristic=Heuristic.HMAX,
)
tool_registry.register(
    ToolID.PLAN4PAST_MYND_STRONG_FF,
    tool_cls=Plan4PastMyNDTool,
    binary_path=DEFAULT_BIN_P4P_PATH,
    search=SearchAlg.AOSTAR,
    heuristic=Heuristic.FF,
)
tool_registry.register(
    ToolID.PLAN4PAST_MYND_STRONG_HMAX,
    tool_cls=Plan4PastMyNDTool,
    binary_path=DEFAULT_BIN_P4P_PATH,
    search=SearchAlg.AOSTAR,
    heuristic=Heuristic.HMAX,
)
tool_registry.register(
    ToolID.PLAN4PAST_MYND_STORNG_CYCLIC_FF,
    tool_cls=Plan4PastMyNDTool,
    binary_path=DEFAULT_BIN_P4P_PATH,
    search=SearchAlg.LAOSTAR,
    heuristic=Heuristic.FF,
)
tool_registry.register(
    ToolID.PLAN4PAST_MYND_STORNG_CYCLIC_HMAX,
    tool_cls=Plan4PastMyNDTool,
    binary_path=DEFAULT_BIN_P4P_PATH,
    search=SearchAlg.LAOSTAR,
    heuristic=Heuristic.HMAX,
)
tool_registry.register(
    ToolID.PLAN4PAST_PALADINUS_STORNG_CYCLIC_FF,
    tool_cls=Plan4PastPaladinusTool,
    binary_path=DEFAULT_BIN_P4P_PATH,
    search=SearchAlg.ITERATIVE_DFS,
    heuristic=Heuristic.FF,
)
tool_registry.register(
    ToolID.PLAN4PAST_PALADINUS_STORNG_CYCLIC_HMAX,
    tool_cls=Plan4PastPaladinusTool,
    binary_path=DEFAULT_BIN_P4P_PATH,
    search=SearchAlg.ITERATIVE_DFS,
    heuristic=Heuristic.HMAX,
)

# LTLFond2Fond + search alg + heuristics
tool_registry.register(
    ToolID.LTLFOND2FOND_FD_FF,
    tool_cls=LTLFond2FondFDTool,
    binary_path=DEFAULT_BIN_LF2F_PATH,
    search=SearchAlg.ASTAR,
    heuristic=Heuristic.FF,
)
tool_registry.register(
    ToolID.LTLFOND2FOND_FD_HMAX,
    tool_cls=LTLFond2FondFDTool,
    binary_path=DEFAULT_BIN_LF2F_PATH,
    search=SearchAlg.ASTAR,
    heuristic=Heuristic.HMAX,
)
tool_registry.register(
    ToolID.LTLFOND2FOND_MYND_STRONG_FF,
    tool_cls=LTLFond2FondMyNDTool,
    binary_path=DEFAULT_BIN_LF2F_PATH,
    search=SearchAlg.AOSTAR,
    heuristic=Heuristic.FF,
)
tool_registry.register(
    ToolID.LTLFOND2FOND_MYND_STRONG_HMAX,
    tool_cls=LTLFond2FondMyNDTool,
    binary_path=DEFAULT_BIN_LF2F_PATH,
    search=SearchAlg.AOSTAR,
    heuristic=Heuristic.HMAX,
)
tool_registry.register(
    ToolID.LTLFOND2FOND_MYND_STORNG_CYCLIC_FF,
    tool_cls=LTLFond2FondMyNDTool,
    binary_path=DEFAULT_BIN_LF2F_PATH,
    search=SearchAlg.LAOSTAR,
    heuristic=Heuristic.FF,
)
tool_registry.register(
    ToolID.LTLFOND2FOND_MYND_STORNG_CYCLIC_HMAX,
    tool_cls=LTLFond2FondMyNDTool,
    binary_path=DEFAULT_BIN_LF2F_PATH,
    search=SearchAlg.LAOSTAR,
    heuristic=Heuristic.HMAX,
)
tool_registry.register(
    ToolID.LTLFOND2FOND_PALADINUS_STORNG_CYCLIC_FF,
    tool_cls=LTLFond2FondPaladinusTool,
    binary_path=DEFAULT_BIN_LF2F_PATH,
    search=SearchAlg.ITERATIVE_DFS,
    heuristic=Heuristic.FF,
)
tool_registry.register(
    ToolID.LTLFOND2FOND_PALADINUS_STORNG_CYCLIC_HMAX,
    tool_cls=LTLFond2FondPaladinusTool,
    binary_path=DEFAULT_BIN_LF2F_PATH,
    search=SearchAlg.ITERATIVE_DFS,
    heuristic=Heuristic.HMAX,
)

# GGPLTL + search alg + heuristics
tool_registry.register(
    ToolID.GGPLTL_FF,
    tool_cls=GGpltlFFTool,
    binary_path=DEFAULT_BIN_GG_PATH,
)

tool_registry.register(
    ToolID.GGPLTL_PLANNER_DELFI,
    tool_cls=GGpltlPlannerTool,
    binary_path=DEFAULT_BIN_GG_PATH,
)

tool_registry.register(
    ToolID.GGPLTL_PLANNER_MPC,
    tool_cls=GGpltlPlannerTool,
    binary_path=DEFAULT_BIN_GG_PATH,
)

tool_registry.register(
    ToolID.GGPLTL_PLANNER_COMPLEMENTARY,
    tool_cls=GGpltlPlannerTool,
    binary_path=DEFAULT_BIN_GG_PATH,
)

tool_registry.register(
    ToolID.GGPLTL_PLANNER_FD_CELMCUT,
    tool_cls=GGpltlPlannerTool,
    binary_path=DEFAULT_BIN_GG_PATH,
)

tool_registry.register(
    ToolID.GGPLTL_FD_FF,
    tool_cls=GGpltlFDTool,
    binary_path=DEFAULT_BIN_GG_PATH,
    search=SearchAlg.ASTAR,
    heuristic=Heuristic.FF,
)
tool_registry.register(
    ToolID.GGPLTL_FD_HMAX,
    tool_cls=GGpltlFDTool,
    binary_path=DEFAULT_BIN_GG_PATH,
    search=SearchAlg.ASTAR,
    heuristic=Heuristic.HMAX,
)
tool_registry.register(
    ToolID.GGPLTL_MYND_STRONG_FF,
    tool_cls=GGpltlMyNDTool,
    binary_path=DEFAULT_BIN_GG_PATH,
    search=SearchAlg.AOSTAR,
    heuristic=Heuristic.FF,
)
tool_registry.register(
    ToolID.GGPLTL_MYND_STRONG_HMAX,
    tool_cls=GGpltlMyNDTool,
    binary_path=DEFAULT_BIN_GG_PATH,
    search=SearchAlg.AOSTAR,
    heuristic=Heuristic.HMAX,
)
tool_registry.register(
    ToolID.GGPLTL_MYND_STORNG_CYCLIC_FF,
    tool_cls=GGpltlMyNDTool,
    binary_path=DEFAULT_BIN_GG_PATH,
    search=SearchAlg.LAOSTAR,
    heuristic=Heuristic.FF,
)
tool_registry.register(
    ToolID.GGPLTL_MYND_STORNG_CYCLIC_HMAX,
    tool_cls=GGpltlMyNDTool,
    binary_path=DEFAULT_BIN_GG_PATH,
    search=SearchAlg.LAOSTAR,
    heuristic=Heuristic.HMAX,
)
tool_registry.register(
    ToolID.GGPLTL_PALADINUS_STORNG_CYCLIC_FF,
    tool_cls=GGpltlPaladinusTool,
    binary_path=DEFAULT_BIN_GG_PATH,
    search=SearchAlg.ITERATIVE_DFS,
    heuristic=Heuristic.FF,
)
tool_registry.register(
    ToolID.GGPLTL_PALADINUS_STORNG_CYCLIC_HMAX,
    tool_cls=GGpltlPaladinusTool,
    binary_path=DEFAULT_BIN_GG_PATH,
    search=SearchAlg.ITERATIVE_DFS,
    heuristic=Heuristic.HMAX,
)
