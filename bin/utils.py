import argparse
import datetime
import inspect
import os
import signal
import tempfile
from pathlib import Path
from subprocess import Popen
from tempfile import TemporaryDirectory

SUPPORTED_PLANNERS = {
    "fd",
    "mynd",
    "paladinus"
}

BIN_DIR = Path(inspect.getframeinfo(inspect.currentframe()).filename).parent
REPO_ROOT = BIN_DIR.parent
FD_WRAPPER_PATH = BIN_DIR / "fd_wrapper"
MYND_WRAPPER_PATH = BIN_DIR / "mynd_wrapper"

PACKAGE_ROOT = Path(inspect.getframeinfo(inspect.currentframe()).filename).parent  # type: ignore

FD_DIR = REPO_ROOT / "third_party" / "downward"
FD_DRIVER = (FD_DIR / "fast-downward.py").resolve()

MYND_JAR = (REPO_ROOT / "third_party" / "mynd.jar").resolve()
MYND_DIR = (REPO_ROOT / "third_party" / "myND").resolve()  # type: ignore
MYND_SRC_DIR = MYND_DIR / "src"

PALADINUS_JAR = (REPO_ROOT / "third_party" / "paladinus0.1.jar").resolve()
PALADINUS_DIR = (REPO_ROOT / "third_party" / "paladinus").resolve()  # type: ignore

OUTPUT_DIR = REPO_ROOT

PLTLF_WRAPPER_PATH = BIN_DIR / "pltlf-planner"

LTLFOND2FOND_DIR = (REPO_ROOT / "third_party" / "ltlfond2fond").resolve()  # type: ignore


ALGORITHMS = {
    "astar",
    "aostar",
    "laostar",
    "iterative_dfs"
}
HEURISTICS = {
    "ff",
    "hmax"
}


def launch(cmd, cwd=None):
    """Launch a command."""
    print("Running command: ", " ".join(map(str, cmd)))
    process = Popen(
        args=cmd,
        encoding="utf-8",
        cwd=cwd,
    )
    try:
        process.wait()
    except KeyboardInterrupt:
        print("Interrupted")
    finally:
        if process.poll() is None:
            try:
                print("do killpg")
                os.killpg(os.getpgid(process.pid), signal.SIGTERM)
            except:
                print("killpg failed")
        if process.returncode != 0:
            print(f"return code {process.returncode}")
            exit(1)


def is_valid_file(arg):
    """Argparse validator for files to check for their existence."""
    if not os.path.exists(arg):
        raise FileNotFoundError("The file %s does not exist!" % arg)
    return Path(arg)


def does_not_exists(arg):
    """Argparse validator for files to check they do not exist."""
    if os.path.exists(arg):
        raise FileExistsError("The file %s already exists!" % arg)
    return Path(arg)
