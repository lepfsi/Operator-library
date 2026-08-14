#!/usr/bin/env python3
"""Remove em dashes from the active Book 01 manuscript and normalize part labels."""
from pathlib import Path
import re

root = Path("books/book-01-beyond-the-firewall/manuscript")
for path in root.glob("*.md"):
    text = path.read_text(encoding="utf-8")
    text = re.sub(r"\s*—\s*", ", ", text)
    text = re.sub(r"\b(Part\s+(?:I|II|III|IV)),\s+", r"\1: ", text)
    text = re.sub(r",\s+,", ",", text)
    path.write_text(text, encoding="utf-8")
    print(path)
