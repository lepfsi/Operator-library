#!/usr/bin/env bash
# -----------------------------------------------------------------------------
# new-chapter.sh — Create a new chapter file from the chapter template.
#
# Usage:
#   ./scripts/new-chapter.sh <book-slug> <chapter-number> <chapter-slug>
#
# Example:
#   ./scripts/new-chapter.sh book-01-beyond-the-firewall 15 the-cost-of-silence
#
# Notes:
#   - The chapter number is zero-padded to 2 digits.
#   - The slug is used in lowercase, hyphen-separated form.
#   - The template is copied as-is; edit the YAML frontmatter and the 8 sections.
# -----------------------------------------------------------------------------
set -euo pipefail

if [[ $# -lt 3 ]]; then
    echo "Usage: $0 <book-slug> <chapter-number> <chapter-slug>"
    echo "Example: $0 book-01-beyond-the-firewall 15 the-cost-of-silence"
    exit 1
fi

BOOK="$1"
NUMBER="$2"
SLUG="$3"

# Normalize slug: lowercase, spaces to dashes
SLUG="$(echo "$SLUG" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')"

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
TEMPLATE="$ROOT_DIR/templates/chapter-template.md"
TARGET_DIR="$ROOT_DIR/books/$BOOK/manuscript"

if [[ ! -f "$TEMPLATE" ]]; then
    echo "Error: chapter template not found: $TEMPLATE"
    exit 1
fi

if [[ ! -d "$TARGET_DIR" ]]; then
    echo "Error: book manuscript directory not found: $TARGET_DIR"
    echo "       Available books:"
    ls -1 "$ROOT_DIR/books" 2>/dev/null | sed 's/^/         - /'
    exit 1
fi

# Zero-pad number to 2 digits
PADDED=$(printf "%02d" "$NUMBER")
TARGET="$TARGET_DIR/${PADDED}-${SLUG}.md"

if [[ -f "$TARGET" ]]; then
    echo "Error: file already exists: $TARGET"
    exit 1
fi

cp "$TEMPLATE" "$TARGET"

echo "OK Created: $TARGET"
echo "   Next: edit the YAML frontmatter and fill the 8 sections."
