#!/usr/bin/env python3
"""Convert part-map and chapter-guide links into Markdown bullet lists."""
from pathlib import Path
import re

root = Path("books/book-01-beyond-the-firewall/manuscript")
start_re = re.compile(r"^::: \{\.(?:part-map|chapter-guide)\}\s*$")
link_re = re.compile(r"^\[(?:\d{2}\.\s+)?(.+?)\]\((#[^)]+)\)\\\\\s*$")
link_last_re = re.compile(r"^\[(?:\d{2}\.\s+)?(.+?)\]\((#[^)]+)\)\s*$")

for path in root.glob("*.md"):
    lines = path.read_text(encoding="utf-8").splitlines()
    in_navigation = False
    changed = False
    output = []
    for line in lines:
        if start_re.match(line):
            in_navigation = True
            output.append(line)
            continue
        if in_navigation and line == ":::":
            in_navigation = False
            output.append(line)
            continue
        if in_navigation:
            match = link_re.match(line) or link_last_re.match(line)
            if match:
                output.append(f"- [{match.group(1)}]({match.group(2)})")
                changed = True
                continue
        output.append(line)
    if changed:
        path.write_text("\n".join(output) + "\n", encoding="utf-8")
        print(path)
