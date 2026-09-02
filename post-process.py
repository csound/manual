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


def on_pre_build(config: dict, **kwargs):
    """MkDocs hook: run the generator scripts before building the site."""
    for name in SCRIPTS:
        script_path = ROOT / name
        if script_path.exists():
            print(f"post-process: running {name}")
            subprocess.run(
                [sys.executable, str(script_path)],
                check=True,
                cwd=ROOT,
            )


if __name__ == '__main__':
    on_pre_build({})
    
