#!/usr/bin/env python3
"""Insert local, linked chapter guides after the chapter opening in Book 01."""
from pathlib import Path
import re
import unicodedata

ROOT = Path("books/book-01-beyond-the-firewall/manuscript")
EXCLUDED = {
    "field note", "memorable phrase", "pull quote", "transition",
    "key takeaways", "in brief", "hook", "analysis", "principle",
    "application", "evidence / incident",
}


def slugify(text: str) -> str:
    text = unicodedata.normalize("NFKD", text).encode("ascii", "ignore").decode()
    text = text.lower().replace("'", "")
    text = re.sub(r"[^a-z0-9]+", "-", text).strip("-")
    return text


def frontmatter_value(text: str, key: str) -> str:
    match = re.search(rf"^{re.escape(key)}:\s*\"?(.+?)\"?\s*$", text, re.M)
    if not match:
        raise ValueError(f"Missing {key}")
    return match.group(1).strip('"')


def guide_for(text: str, number: int) -> str:
    sections = re.findall(r"^##\s+(.+?)(?:\s+\{[^}]+\})?\s*$", text, re.M)
    entries = []
    for section in sections:
        visible = re.sub(r"\s+\{[^}]+\}\s*$", "", section).strip()
        if visible.lower() in EXCLUDED:
            continue
        entries.append(visible)
    if not entries:
        entries = ["The argument", "The operational consequence", "The decision"]
    links = "  \n".join(
        f"[{idx:02d}. {entry}](#{slugify(entry)})"
        for idx, entry in enumerate(entries, 1)
    )
    return f"\n::: {{.chapter-guide}}\n**Inside Chapter {number:02d}**\n\n{links}\n:::\n"


for path in sorted(ROOT.glob("*.md")):
    if not re.match(r"^(?:01|0[2-9]|1[0-8])-", path.name):
        continue
    text = path.read_text(encoding="utf-8")
    if "{.chapter-guide}" in text:
        continue
    number = int(frontmatter_value(text, "chapter_number"))
    guide = guide_for(text, number)
    if number == 1:
        opening = re.search(r"(:::\s*\{\.impact-opener[^\n]*\}\s*\n:::\s*)", text)
        if not opening:
            raise ValueError(f"Impact opener not found: {path}")
        # The standalone impact quote no longer follows the dark chapter opener.
        remainder = text[opening.end():]
        remainder = re.sub(r"\n*:::\s*\{\.impact-quote\}\s*\n.*?\n:::\s*\n", "\n", remainder, count=1, flags=re.S)
        text = text[:opening.end()] + guide + remainder
    else:
        heading = re.search(r"^#\s+.+$", text, re.M)
        if not heading:
            raise ValueError(f"Chapter H1 not found: {path}")
        text = text[:heading.end()] + guide + text[heading.end():]
    path.write_text(text, encoding="utf-8")
    print(path)
