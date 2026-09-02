# -*- coding: utf-8 -*-
# MkDocs hook that runs the post-processing scripts (makeAppendices.py
# and make_indexall.py) before each build, so that the index, reference
# and appendix files are always up to date.
#
# Registered via the "hooks:" setting in mkdocs.yml (requires MkDocs >= 1.4).

import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent

SCRIPTS = (
    "makeAppendices.py",
    "make_indexall.py",
)


def on_pre_build(config, **kwargs):
    """MkDocs hook: run the generator scripts before building the site."""
    for name in SCRIPTS:
        print(f"post-process: running {name}")
        subprocess.run(
            [sys.executable, str(ROOT / name)],
            check=True,
            cwd=ROOT,
        )
