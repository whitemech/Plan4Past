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
    "mynd"
}

BIN_DIR = Path(inspect.getframeinfo(inspect.currentframe()).filename).parent
REPO_ROOT = BIN_DIR.parent
MYND_WRAPPER_PATH = BIN_DIR / "mynd_wrapper"

PACKAGE_ROOT = Path(inspect.getframeinfo(inspect.currentframe()).filename).parent  # type: ignore

MYND_JAR = (REPO_ROOT / "third_party" / "mynd.jar").resolve()
MYND_DIR = (REPO_ROOT / "third_party" / "myND").resolve()  # type: ignore
MYND_SRC_DIR = MYND_DIR / "src"
OUTPUT_DIR = REPO_ROOT

PLTLF_WRAPPER_PATH = BIN_DIR / "pltlf-planner"

LTLFOND2FOND_DIR = (REPO_ROOT / "third_party" / "ltlfond2fond").resolve()  # type: ignore


ALGORITHMS = {
    "aostar",
    "laostar"
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
