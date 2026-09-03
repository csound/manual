#!/usr/bin/env python3
"""
Generate indexall.md - a complete index of the mkdocs site structure.

Reads the `nav` section of mkdocs.yml and produces a markdown file
containing a bullet tree of all pages, mirroring the site structure.
Pages for individual opcodes (docs/opcodes/) are excluded.
The bullet tree indent width can be set with --indent (default: 4).
"""

import sys
from pathlib import Path

try:
    import yaml
except ImportError:
    sys.exit("PyYAML is required. Install it with: pip install pyyaml")


ROOT = Path(__file__).resolve().parent
MKDOCS_YML = ROOT / "mkdocs.yml"
OUTPUT = ROOT / "docs/indexall.md"

# Pages for individual opcodes live here; exclude them from the index.
EXCLUDED_DIRS = ("opcodes/",)


class IgnoreTagsLoader(yaml.SafeLoader):
    """SafeLoader that ignores unknown/custom YAML tags (e.g. !!python/name:, !ENV)."""


def _ignore_unknown(loader, tag_suffix, node):
    if isinstance(node, yaml.MappingNode):
        return loader.construct_mapping(node)
    if isinstance(node, yaml.SequenceNode):
        return loader.construct_sequence(node)
    return loader.construct_scalar(node)


IgnoreTagsLoader.add_multi_constructor("tag:yaml.org,2002:python/name:", _ignore_unknown)
IgnoreTagsLoader.add_multi_constructor("!", _ignore_unknown)


def load_nav(path: Path):
    """Parse mkdocs.yml and return the `nav` list."""
    config = yaml.load(path.read_text(encoding="utf-8"), Loader=IgnoreTagsLoader)
    if not config or "nav" not in config:
        sys.exit("No 'nav' section found in mkdocs.yml")
    return config["nav"]


def walk_nav(items, depth, lines, indent_spaces):
    """Recursively convert nav items into markdown bullet lines."""
    indent = " " * indent_spaces * depth

    for item in items:
        if isinstance(item, str):
            # Bare page path without a title, e.g. "- 'overview/rt-audio.md'"
            path = item
            if not is_excluded(path):
                lines.append(f"{indent}- [{title_from_path(path)}]({path})")
        elif isinstance(item, dict):
            for title, value in item.items():
                if isinstance(value, str):
                    # "- Title: 'path/to/page.md'"
                    if not is_excluded(value):
                        lines.append(f"{indent}- [{title}]({value})")
                elif isinstance(value, list):
                    # "- Section:" followed by nested items
                    lines.append(f"{indent}- {title}")
                    walk_nav(value, depth + 1, lines, indent_spaces)
    return lines


def is_excluded(path: str) -> bool:
    """Check whether a page path belongs to an excluded directory."""
    return any(path.startswith(d) for d in EXCLUDED_DIRS)


def title_from_path(path: str) -> str:
    """Derive a display title from a file path when none is given."""
    name = Path(path).stem
    return name.replace("-", " ").replace("_", " ").title()


def main():
    import argparse

    parser = argparse.ArgumentParser(
        description="Generate docs/indexall.md from the mkdocs.yml nav section."
    )
    parser.add_argument(
        "--indent",
        type=int,
        default=4,
        help="number of spaces used to indent each nesting level of the bullet tree (default: 4)",
    )
    args = parser.parse_args()

    nav = load_nav(MKDOCS_YML)

    lines = [
        "# Site Index",
        "",
        "",
    ]
    lines.extend(walk_nav(nav, 0, [], args.indent))
    lines.append("")

    OUTPUT.write_text("\n".join(lines), encoding="utf-8")
    print(f"Wrote {OUTPUT} ({len(lines) - 5} entries)")


if __name__ == "__main__":
    main()
