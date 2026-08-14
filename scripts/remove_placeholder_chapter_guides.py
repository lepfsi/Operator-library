#!/usr/bin/env python3
"""Remove generated placeholder chapter guides from scaffold chapters."""
from pathlib import Path
import re

root = Path("books/book-01-beyond-the-firewall/manuscript")
pattern = re.compile(
    r"\n::: \{\.chapter-guide\}\n\*\*Inside Chapter \d{2}\*\*\n\n"
    r"\[01\. The argument\]\(#the-argument\)  \n"
    r"\[02\. The operational consequence\]\(#the-operational-consequence\)  \n"
    r"\[03\. The decision\]\(#the-decision\)\n:::\n",
    re.M,
)
for path in root.glob("*.md"):
    text = path.read_text(encoding="utf-8")
    if "status: \"scaffold\"" not in text:
        continue
    updated, count = pattern.subn("\n", text)
    if count:
        path.write_text(updated, encoding="utf-8")
        print(path)
