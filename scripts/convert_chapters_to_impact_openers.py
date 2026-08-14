#!/usr/bin/env python3
"""Replace standard H1 openings by the approved black impact opener pattern."""
from pathlib import Path
import re
import unicodedata

root = Path("books/book-01-beyond-the-firewall/manuscript")


def slugify(text: str) -> str:
    text = unicodedata.normalize("NFKD", text).encode("ascii", "ignore").decode()
    text = text.lower().replace("'", "")
    return re.sub(r"[^a-z0-9]+", "-", text).strip("-")

for path in sorted(root.glob("[0-9][0-9]-*.md")):
    if path.name.startswith("01-"):
        continue
    text = path.read_text(encoding="utf-8")
    number_match = re.search(r'^chapter_number:\s*(\d+)\s*$', text, re.M)
    heading_match = re.search(r'^#\s+(.+?)\s*$', text, re.M)
    if not number_match or not heading_match:
        continue
    number = int(number_match.group(1))
    title = heading_match.group(1)
    opener = f'::: {{.impact-opener #{slugify(title)} number="{number:02d}" title="{title}"}}\n:::'
    updated = text[:heading_match.start()] + opener + text[heading_match.end():]
    path.write_text(updated, encoding="utf-8")
    print(path)
