#!/usr/bin/env python3
"""Label part-map links as chapters and chapter-guide links as numbered sections."""
from pathlib import Path
import re

root = Path("books/book-01-beyond-the-firewall/manuscript")
chapter_numbers: dict[str, int] = {}
for path in root.glob("[0-9][0-9]-*.md"):
    text = path.read_text(encoding="utf-8")
    match = re.search(r'\.impact-opener\s+#([^\s]+)\s+number="(\d+)"', text)
    if match:
        chapter_numbers[match.group(1)] = int(match.group(2))

block_start = re.compile(r"^::: \{\.(part-map|chapter-guide)\}\s*$")
link = re.compile(r"^- \[(.+?)\]\((#[^)]+)\)\s*$")

for path in root.glob("*.md"):
    lines = path.read_text(encoding="utf-8").splitlines()
    block_type = None
    section_number = 0
    changed = False
    output = []
    for line in lines:
        start = block_start.match(line)
        if start:
            block_type = start.group(1)
            section_number = 0
            output.append(line)
            continue
        if block_type and line == ":::":
            block_type = None
            output.append(line)
            continue
        match = link.match(line) if block_type else None
        if match:
            title, anchor = match.groups()
            slug = anchor[1:]
            if block_type == "part-map":
                if slug not in chapter_numbers:
                    raise ValueError(f"Unknown chapter target {anchor} in {path}")
                label = f"Chapter {chapter_numbers[slug]:02d} · {title}"
            else:
                section_number += 1
                label = f"{section_number:02d}. {title}"
            output.append(f"- [{label}]({anchor})")
            changed = True
            continue
        output.append(line)
    if changed:
        path.write_text("\n".join(output) + "\n", encoding="utf-8")
        print(path)
