#!/usr/bin/env python3
"""Restore one Markdown H1 after YAML front matter in standard chapter files."""
from pathlib import Path

manuscript = Path("books/book-01-beyond-the-firewall/manuscript")
chapter_files = sorted(
    p for p in manuscript.glob("*.md")
    if len(p.name) > 3 and p.name[:2].isdigit() and p.name[2] == "-" and not p.name.startswith("01-")
)

for path in chapter_files:
    lines = path.read_text(encoding="utf-8").splitlines(keepends=True)
    delimiters = [i for i, line in enumerate(lines) if line.strip() == "---"]
    if len(delimiters) < 2:
        raise ValueError(f"Missing YAML front matter delimiters: {path}")
    start = delimiters[1] + 1
    for idx in range(start, len(lines)):
        if not lines[idx].strip():
            continue
        if lines[idx].startswith("# "):
            break
        if lines[idx].lstrip().startswith(("##", ":::", "<!--")):
            raise ValueError(f"Unexpected first content block in {path}: {lines[idx]!r}")
        lines[idx] = "# " + lines[idx]
        break
    else:
        raise ValueError(f"No chapter title found: {path}")
    path.write_text("".join(lines), encoding="utf-8")
    print(path)
