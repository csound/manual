#!/usr/bin/env python3
"""Check tracked manual articles for markup damaged during format conversion.

This checks document structure, not every opcode's semantics. Use --site after
mkdocs build to check the article HTML too. Install requirements-audit.txt first.
"""

import argparse
from collections import Counter
from html import unescape
import json
from pathlib import Path
import re
import subprocess

import html5lib
import markdown


FENCE = re.compile(r"^(\s*(?:>\s*)*)(`{3,}|~{3,})(.*)$")
ENTITY = re.compile(r"&(?:[A-Za-z][A-Za-z0-9]+|#\d+|#x[\da-fA-F]+);")
LEGACY = re.compile(r"</?(?:literal|quote|title|para|programlisting|citetitle|refsect\d|synopsis)\b[^>]*>")
EXTENSIONS = [
    "md_in_html", "pymdownx.highlight", "pymdownx.superfences",
    "pymdownx.tabbed", "attr_list", "tables", "pymdownx.arithmatex",
]


def check_source(source, docs):
    """Return source findings with one-based line numbers."""
    findings = []
    block = None
    section = tab = ""
    in_comment = False

    def add(line, rule, message):
        findings.append({"line": line, "rule": rule, "message": message})

    def check_block(item):
        code = "\n".join(item["lines"])
        for snippet in re.findall(r'--8<--\s+"([^"]+)"', code):
            path = docs / snippet
            if not path.is_file():
                add(item["line"], "missing-snippet", snippet)
            elif (path.suffix == ".csd" and "<CsoundSynthesizer>" in path.read_text()
                  and item["language"] != "csound-csd"):
                add(item["line"], "csd-language", "Use csound-csd for a full CSD document.")
        if item["language"].startswith("csound") and ENTITY.search(code):
            add(item["line"], "encoded-code", "Review HTML entities printed literally in code.")
        if item["section"] == "Syntax" and item["tab"] == "Modern":
            # Square brackets here denote optional arguments as well as arrays.
            text = re.sub(r'"(?:\\.|[^"\\])*"|;[^\n]*', "", code)
            for opening, closing in [("(", ")"), ("[", "]")]:
                depth = 0
                for char in text:
                    depth += (char == opening) - (char == closing)
                    if depth < 0:
                        break
                if depth:
                    add(item["line"], "syntax-delimiters", f"Unbalanced {opening}{closing} in modern synopsis.")

    for number, line in enumerate(source.splitlines(), 1):
        if block is None:
            if in_comment or "<!--" in line:
                in_comment = "-->" not in line
                continue
            heading = re.match(r"^#{1,6} (.+)", line)
            if heading:
                section, tab = heading[1].strip(), ""
            label = re.match(r'^\s*=== "([^"]+)"', line)
            if label:
                tab = label[1]
        fence = FENCE.match(line)
        if fence and block is None:
            prefix, marker, info = fence.groups()
            if marker in info:
                # A same-line backtick span is not an opening block fence.
                continue
            if ENTITY.search(info):
                add(number, "encoded-title", "Write literal characters in fenced-code titles.")
            block = {"line": number, "marker": marker, "lines": [],
                     "language": info.strip().split(" ")[0],
                     "section": section, "tab": tab}
        elif (fence and block and fence[2][0] == block["marker"][0]
              and len(fence[2]) >= len(block["marker"]) and not fence[3].strip()):
            check_block(block)
            block = None
        elif block is not None:
            block["lines"].append(re.sub(r"^\s*> ?", "", line))
        else:
            prose = re.sub(r"(`+).*?\1", "", line)
            for match in LEGACY.finditer(prose):
                add(number, "legacy-markup", f"Replace leftover DocBook markup: {match[0]}")
            for entity in ENTITY.finditer(prose):
                if unescape(entity[0]) == entity[0]:
                    add(number, "unknown-entity", entity[0])
            if "[See also](../opcodes/connect.md)e>" in prose:
                add(number, "broken-link-text", "Restore the connect link and See also heading.")
    if block is not None:
        add(block["line"], "unclosed-fence", "Code fence has no closing fence.")
    return findings


def check_html(content):
    """Use HTML5 parsing rules to catch browser repairs such as nested paragraphs."""
    parser = html5lib.HTMLParser(namespaceHTMLElements=False)
    parser.parseFragment(content)
    return [{"line": position[0], "rule": "html-" + rule,
             "message": str(data), "location": "rendered article"}
            for position, rule, data in parser.errors]


def audit(root, site=None):
    names = subprocess.check_output(
        ["git", "ls-files", "docs"], cwd=root, text=True
    ).splitlines()
    report = []
    for name in names:
        if not name.endswith(".md"):
            continue
        source = (root / name).read_text()
        findings = check_source(source, root / "docs")
        if site:
            relative = Path(name).relative_to("docs")
            relative = (relative.parent / "index.html" if relative.stem in {"index", "README"}
                        else relative.with_suffix("") / "index.html")
            page = site / relative
            if page.is_file():
                content = re.search(r"<article\b[^>]*>(.*?)</article>", page.read_text(), re.S)
                if content:
                    findings += check_html(content[1])
                else:
                    findings.append({"line": 1, "rule": "missing-article", "message": str(page)})
            else:
                findings.append({"line": 1, "rule": "missing-page", "message": str(page)})
        else:
            findings += check_html(markdown.markdown(source, extensions=EXTENSIONS))
        report.append({"article": name, "findings": findings})
    return report


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--root", type=Path, default=Path(__file__).resolve().parents[1])
    parser.add_argument("--site", type=Path, help="Directory produced by mkdocs build (online layout).")
    parser.add_argument("--json", type=Path, help="Write results for every checked article, including clean articles.")
    args = parser.parse_args()
    report = audit(args.root, args.site)
    counts = Counter(item["rule"] for entry in report for item in entry["findings"])
    for entry in report:
        for item in entry["findings"]:
            location = " (rendered HTML)" if item.get("location") else ""
            print(f'{entry["article"]}:{item["line"]}{location}: {item["rule"]}: {item["message"]}')
    print(f"Checked {len(report)} articles; {sum(counts.values())} findings.")
    if args.json:
        args.json.write_text(json.dumps({"articles": report, "counts": counts}, indent=2) + "\n")
    return bool(counts)


if __name__ == "__main__":
    raise SystemExit(main())
