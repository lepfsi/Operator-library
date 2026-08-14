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

# Google Fonts download endpoints (static TTFs, stable URLs).
declare -A FONTS=(
  ["Sora"]="https://github.com/google/fonts/raw/main/ofl/sora/Sora%5Bwght%5D.ttf"
  ["SourceSerif4"]="https://github.com/google/fonts/raw/main/ofl/source-serif-4/SourceSerif4%5Bopsz%2Cwght%5D.ttf"
  ["IBMPlexMono"]="https://github.com/google/fonts/raw/main/ofl/ibmplexmono/IBMPlexMono%5Bwght%5D.ttf"
)

echo "Installing premium fonts to: $FONT_DIR"
for name in "${!FONTS[@]}"; do
  url="${FONTS[$name]}"
  out="$FONT_DIR/${name}.ttf"
  echo "  -> $name"
  if command -v curl >/dev/null 2>&1; then
    curl -fsSL "$url" -o "$out"
  elif command -v wget >/dev/null 2>&1; then
    wget -q "$url" -O "$out"
  else
    echo "Error: need curl or wget to download fonts."
    exit 1
  fi
done

echo "Refreshing font cache..."
fc-cache -fv "$FONT_DIR" >/dev/null 2>&1 || fc-cache -fv >/dev/null 2>&1

echo
echo "Done. Verify with:"
echo "  fc-list | grep -iE 'sora|source serif|ibm plex mono'"
echo
echo "Then rebuild the book:"
echo "  ./scripts/build-book.sh"
