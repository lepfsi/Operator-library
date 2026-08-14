#!/usr/bin/env bash
# -------------------------------------------------------------------
# install-fonts.sh — Install premium fonts for The Operator's Library
#
# Installs Sora, Source Serif Pro, and IBM Plex Mono (Google Fonts)
# so XeLaTeX renders the book as designed. Without these fonts, the
# build still succeeds but falls back to TeX Gyre fonts, which are
# wider and inflate the page count (e.g. 24 -> 120+ pages) and lose
# the premium typographic feel.
#
# Usage:
#   ./scripts/install-fonts.sh          # install for current user
#   ./scripts/install-fonts.sh --system # install system-wide (needs sudo)
# -------------------------------------------------------------------
set -euo pipefail

SCOPE="${1:-user}"
FONT_DIR="${HOME}/.local/share/fonts"

if [[ "$SCOPE" == "--system" ]]; then
  FONT_DIR="/usr/local/share/fonts"
  if [[ "$EUID" -ne 0 ]]; then
    echo "System install needs sudo. Re-run with: sudo $0 --system"
    exit 1
  fi
fi

mkdir -p "$FONT_DIR"
TMP="$(mktemp -d)"
trap 'rm -rf "$TMP"' EXIT

# Google Fonts download endpoints (raw GitHub, stable URLs).
# Source Serif 4 ships as a variable font with [opsz,wght] in the name;
# IBM Plex Mono ships as separate static files (Regular + Bold are enough
# for the book). Sora ships as a single variable file.
BASE="https://github.com/google/fonts/raw/main/ofl"

echo "Installing premium fonts to: $FONT_DIR"

download() {
  local name="$1" url="$2" out="$3"
  echo "  -> $name"
  if command -v curl >/dev/null 2>&1; then
    curl -fsSL "$url" -o "$out" || { echo "     failed: $url"; return 1; }
  elif command -v wget >/dev/null 2>&1; then
    wget -q "$url" -O "$out" || { echo "     failed: $url"; return 1; }
  else
    echo "Error: need curl or wget to download fonts."
    exit 1
  fi
}

# Sora (variable font) — single file
download "Sora" "$BASE/sora/Sora%5Bwght%5D.ttf" "$FONT_DIR/Sora.ttf"

# Source Serif 4 (variable font) — single file
download "Source Serif Pro" "$BASE/sourceserif4/SourceSerif4%5Bopsz%2Cwght%5D.ttf" "$FONT_DIR/SourceSerif4.ttf"

# IBM Plex Mono — static files (variable not available, use Regular + Bold)
download "IBM Plex Mono Regular" "$BASE/ibmplexmono/IBMPlexMono-Regular.ttf" "$FONT_DIR/IBMPlexMono-Regular.ttf"
download "IBM Plex Mono Bold"    "$BASE/ibmplexmono/IBMPlexMono-Bold.ttf"    "$FONT_DIR/IBMPlexMono-Bold.ttf"

echo "Refreshing font cache..."
fc-cache -fv "$FONT_DIR" >/dev/null 2>&1 || fc-cache -fv >/dev/null 2>&1

echo
echo "Done. Verify with:"
echo "  fc-list | grep -iE 'sora|sourceserif|ibm plex mono'"
echo
echo "Then rebuild the book:"
echo "  ./scripts/build-book.sh"
