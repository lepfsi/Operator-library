#!/usr/bin/env bash
# -----------------------------------------------------------------------------
# build-book.sh — Compile a book from Markdown to PDF / EPUB / DOCX via Pandoc.
#
# Usage:
#   ./scripts/build-book.sh
#   ./scripts/build-book.sh <book-slug> <format> [--include-drafts]
#
# Examples:
#   ./scripts/build-book.sh
#   ./scripts/build-book.sh book-01-beyond-the-firewall pdf
#   ./scripts/build-book.sh book-01-beyond-the-firewall epub
#   ./scripts/build-book.sh book-01-beyond-the-firewall docx
#   ./scripts/build-book.sh book-01-beyond-the-firewall all
#   ./scripts/build-book.sh book-01-beyond-the-firewall all --include-drafts
#
# Requirements: pandoc >= 3.0; xelatex (for PDF).
#
# Filtering:
#   By default, chapters with status "scaffold" are excluded (empty placeholders).
#   Use --include-drafts to compile everything (all chapters, regardless of status).
# -----------------------------------------------------------------------------
set -euo pipefail

# ---- Arguments --------------------------------------------------------------
BOOK="${1:-book-01-beyond-the-firewall}"
FORMAT="${2:-all}"
INCLUDE_DRAFTS="false"
if [[ "${3:-}" == "--include-drafts" || "${3:-}" == "--all" ]]; then
    INCLUDE_DRAFTS="true"
fi

# ---- Paths ------------------------------------------------------------------
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
ROOT_DIR="$(dirname "$SCRIPT_DIR")"
BOOK_DIR="$ROOT_DIR/books/$BOOK"
MANUSCRIPT_DIR="$BOOK_DIR/manuscript"
CONFIG_FILE="$BOOK_DIR/config/pandoc.yaml"
EXPORTS_DIR="$BOOK_DIR/exports"

# ---- Pre-flight checks ------------------------------------------------------
if ! command -v pandoc >/dev/null 2>&1; then
    echo "Error: pandoc is not installed or not in PATH."
    echo "       Install: https://pandoc.org/installing.html"
    exit 1
fi

if [[ ! -d "$BOOK_DIR" ]]; then
    echo "Error: book directory not found: $BOOK_DIR"
    echo "       Available books:"
    ls -1 "$ROOT_DIR/books" 2>/dev/null | sed 's/^/         - /'
    exit 1
fi

if [[ ! -f "$CONFIG_FILE" ]]; then
    echo "Error: pandoc configuration not found: $CONFIG_FILE"
    exit 1
fi

if [[ ! -d "$MANUSCRIPT_DIR" ]]; then
    echo "Error: manuscript directory not found: $MANUSCRIPT_DIR"
    exit 1
fi

mkdir -p "$EXPORTS_DIR"

# ---- Chapter filtering ------------------------------------------------------
# Reads the `status:` field from a chapter's YAML frontmatter.
# By default, excludes status="scaffold" (empty placeholders).
# Returns 0 (include) or 1 (exclude).
chapter_is_included() {
    local file="$1"
    if [[ "$INCLUDE_DRAFTS" == "true" ]]; then
        return 0
    fi
    local status
    status=$(sed -n '/^---$/,/^---$/p' "$file" 2>/dev/null \
             | grep -m1 '^status:' \
             | sed 's/status:[[:space:]]*//' \
             | tr -d '"' | tr -d "'" \
             | tr -d '[:space:]')
    if [[ "$status" == "scaffold" ]]; then
        return 1
    fi
    return 0
}

# ---- Collect chapters in numerical order (filtered) -------------------------
ALL_CHAPTERS=()
SKIPPED=0
while IFS= read -r f; do
    if chapter_is_included "$f"; then
        ALL_CHAPTERS+=("$f")
    else
        SKIPPED=$((SKIPPED + 1))
    fi
done < <(find "$MANUSCRIPT_DIR" -maxdepth 1 -type f -name '*.md' | sort)

if [[ ${#ALL_CHAPTERS[@]} -eq 0 ]]; then
    echo "Error: no chapter files included after filtering."
    echo "       All chapters found: $(find "$MANUSCRIPT_DIR" -maxdepth 1 -type f -name '*.md' | wc -l)"
    echo "       Skipped (scaffold): $SKIPPED"
    echo "       Tip: use --include-drafts to compile everything."
    exit 1
fi

# ---- Banner -----------------------------------------------------------------
echo "============================================================"
echo "  Building: $BOOK"
echo "  Format:   $FORMAT"
DRAFTED_CHAPTER_COUNT=0
for chapter_path in "${ALL_CHAPTERS[@]}"; do
    chapter_name="$(basename "$chapter_path")"
    if [[ "$chapter_name" =~ ^(0[1-9]|1[0-8])- ]]; then
        DRAFTED_CHAPTER_COUNT=$((DRAFTED_CHAPTER_COUNT + 1))
    fi
done
echo "  Draft chapters: $DRAFTED_CHAPTER_COUNT | Supporting pages: $((${#ALL_CHAPTERS[@]} - DRAFTED_CHAPTER_COUNT)) | Scaffold files: $SKIPPED"
echo "  Output:   $EXPORTS_DIR"
echo "============================================================"
echo

# ---- Premium font check -----------------------------------------------------
# Warn (not block) when the active prototype B fonts are missing.
# Without them, XeLaTeX may substitute unrelated font families and the page count
# or hierarchy may differ from the production design. Install or select fonts with:
#   ./scripts/install-fonts.sh
MISSING_FONTS=0
# Each entry: friendly name | grep pattern(s) separated by |
# Font names can vary slightly across fontconfig installations.
check_font() {
    local label="$1"; shift
    local pat
    for pat in "$@"; do
        if fc-list 2>/dev/null | grep -i "$pat" >/dev/null; then
            return 0
        fi
    done
    MISSING_FONTS=$((MISSING_FONTS + 1))
    echo "   (warn) premium font not found: $label"
    return 1
}
check_font "Noto Sans" "Noto Sans" || true
check_font "TeX Gyre Schola" "TeX Gyre Schola" || true
check_font "TeX Gyre Cursor" "TeX Gyre Cursor" || true
if [[ "$MISSING_FONTS" -gt 0 ]]; then
    echo "   (warn) $MISSING_FONTS premium font(s) missing — build will use wider fallbacks."
    echo "          Page count and typography will differ from design. Run:"
    echo "          ./scripts/install-fonts.sh"
    echo
fi

# ---- Common Pandoc args -----------------------------------------------------
LUA_FILTER="$ROOT_DIR/templates/render/callouts.lua"
BOOK_LUA_FILTER="$BOOK_DIR/config/callouts.lua"
if [[ -f "$BOOK_LUA_FILTER" ]]; then
    LUA_FILTER="$BOOK_LUA_FILTER"
fi
PANDOC_ARGS=(
    "${ALL_CHAPTERS[@]}"
    --metadata-file="$CONFIG_FILE"
    --from=markdown+yaml_metadata_block+pipe_tables+fenced_divs+strikeout
)
if [[ -f "$LUA_FILTER" ]]; then
    PANDOC_ARGS+=(--lua-filter="$LUA_FILTER")
fi

# Resolve per-format asset paths from pandoc.yaml (simple grep fallback).
# NOTE: pandoc.yaml is a standalone YAML file (starts with a single "---"),
# NOT a Markdown document with a closing "---" frontmatter delimiter. So we
# grep the whole file directly instead of relying on a sed "/^---$/,/^---$/p"
# range that would silently return nothing when no closing "---" exists.
get_yaml_value() {
    local key="$1"
    grep -m1 "^${key}:[[:space:]]*" "$CONFIG_FILE" \
      | sed "s/^${key}:[[:space:]]*//" \
      | tr -d '"' | tr -d "'"
}

# ---- Path resolution helper ----------------------------------------------
# YAML paths in pandoc.yaml are relative to the config file directory.
# Resolve them to absolute paths for pandoc / LaTeX.
resolve_path() {
    local raw="$1"
    if [[ -z "$raw" ]]; then
        echo ""
        return
    fi
    local dir base abs
    base="$(basename "$raw")"
    # Primary: change directory relatively to config/ (handles ../.. chains).
    dir=$(cd "$BOOK_DIR/config" 2>/dev/null && cd "$(dirname "$raw")" 2>/dev/null && pwd)
    if [[ -n "$dir" && -f "$dir/$base" ]]; then
        echo "$dir/$base"
        return
    fi
    # Fallback: resolve via realpath from the config directory (portable).
    abs=$(cd "$BOOK_DIR/config" 2>/dev/null && realpath -m "$raw" 2>/dev/null)
    if [[ -n "$abs" && -f "$abs" ]]; then
        echo "$abs"
        return
    fi
    echo ""
}

# ---- Asset paths from pandoc.yaml -----------------------------------------
PDF_TEMPLATE=$(resolve_path "$(get_yaml_value "template")")
EPUB_CSS=$(resolve_path "$(get_yaml_value "epub-css")")
EPUB_COVER=$(resolve_path "$(get_yaml_value "epub-cover-image")")
COVER_IMAGE=$(resolve_path "$(get_yaml_value "cover-image")")
BACK_COVER_IMAGE=$(resolve_path "$(get_yaml_value "back-cover-image")")
DOCX_REF=$(resolve_path "$(get_yaml_value "reference-doc")")

# ---- Cover conversion (SVG -> PDF/PNG) -------------------------------------
# XeLaTeX cannot include SVG directly. Convert once per build into exports/.
COVER_PDF=""
COVER_PNG=""
if [[ -n "$COVER_IMAGE" && -f "$COVER_IMAGE" ]]; then
    case "${COVER_IMAGE##*.}" in
        svg)
            if command -v rsvg-convert >/dev/null 2>&1; then
                COVER_PDF="$EXPORTS_DIR/cover.pdf"
                rsvg-convert -f pdf -o "$COVER_PDF" "$COVER_IMAGE" >/dev/null 2>&1 && echo "   cover: SVG -> PDF (rsvg-convert)" || COVER_PDF=""
                COVER_PNG="$EXPORTS_DIR/cover.png"
                rsvg-convert -f png -o "$COVER_PNG" "$COVER_IMAGE" >/dev/null 2>&1 || COVER_PNG=""
            elif command -v inkscape >/dev/null 2>&1; then
                COVER_PDF="$EXPORTS_DIR/cover.pdf"
                inkscape --export-type=pdf --export-filename="$COVER_PDF" "$COVER_IMAGE" >/dev/null 2>&1 && echo "   cover: SVG -> PDF (inkscape)" || COVER_PDF=""
                COVER_PNG="$EXPORTS_DIR/cover.png"
                inkscape --export-type=png --export-filename="$COVER_PNG" "$COVER_IMAGE" >/dev/null 2>&1 || COVER_PNG=""
            else
                echo "   cover: SVG found but rsvg-convert / inkscape missing — PDF cover will be skipped."
            fi
            ;;
        pdf)
            COVER_PDF="$COVER_IMAGE"
            ;;
        png|jpg|jpeg)
            COVER_PNG="$COVER_IMAGE"
            ;;
    esac
fi

# ---- Back-cover conversion (SVG -> PDF) ------------------------------------
# The back cover is intentionally PDF-only; EPUB uses the front cover as its cover image.
BACK_COVER_PDF=""
if [[ -n "$BACK_COVER_IMAGE" && -f "$BACK_COVER_IMAGE" ]]; then
    case "${BACK_COVER_IMAGE##*.}" in
        svg)
            if command -v rsvg-convert >/dev/null 2>&1; then
                BACK_COVER_PDF="$EXPORTS_DIR/back-cover.pdf"
                rsvg-convert -f pdf -o "$BACK_COVER_PDF" "$BACK_COVER_IMAGE" >/dev/null 2>&1 && echo "   back cover: SVG -> PDF (rsvg-convert)" || BACK_COVER_PDF=""
            elif command -v inkscape >/dev/null 2>&1; then
                BACK_COVER_PDF="$EXPORTS_DIR/back-cover.pdf"
                inkscape --export-type=pdf --export-filename="$BACK_COVER_PDF" "$BACK_COVER_IMAGE" >/dev/null 2>&1 && echo "   back cover: SVG -> PDF (inkscape)" || BACK_COVER_PDF=""
            else
                echo "   back cover: SVG found but rsvg-convert / inkscape missing — PDF back cover will be skipped."
            fi
            ;;
        pdf)
            BACK_COVER_PDF="$BACK_COVER_IMAGE"
            ;;
    esac
fi

# ---- Build functions --------------------------------------------------------
# The collection-level ToC is intentionally compact. Per-chapter guides carry
# the finer navigation inside each chapter.
TOC_DEPTH=1

build_pdf() {
    if ! command -v xelatex >/dev/null 2>&1 && ! command -v pdflatex >/dev/null 2>&1; then
        echo "Warning: no LaTeX engine detected (xelatex / pdflatex)."
        echo "         PDF build will likely fail. Install MiKTeX (Windows) or TeX Live (Linux/macOS)."
    fi
    echo "-> Generating PDF..."
    local pdf_args=("${PANDOC_ARGS[@]}")
    if [[ -n "$PDF_TEMPLATE" && -f "$PDF_TEMPLATE" ]]; then
        pdf_args+=(--template="$PDF_TEMPLATE")
    else
        echo "   (note: no template.latex found, using Pandoc default)"
    fi
    if [[ -n "$COVER_PDF" && -f "$COVER_PDF" ]]; then
        pdf_args+=(--variable="book-cover:$COVER_PDF")
        echo "   cover page: $COVER_PDF"
    fi
    if [[ -n "$BACK_COVER_PDF" && -f "$BACK_COVER_PDF" ]]; then
        pdf_args+=(--variable="book-back-cover:$BACK_COVER_PDF")
        echo "   back cover page: $BACK_COVER_PDF"
    fi
    pandoc "${pdf_args[@]}" \
        --to=pdf \
        --output="$EXPORTS_DIR/book.pdf" \
        --pdf-engine=xelatex \
        --toc \
        --toc-depth="$TOC_DEPTH"
    echo "   OK $EXPORTS_DIR/book.pdf"
}

build_epub() {
    echo "-> Generating EPUB..."
    local epub_args=("${PANDOC_ARGS[@]}")
    if [[ -n "$EPUB_CSS" && -f "$EPUB_CSS" ]]; then
        epub_args+=(--css="$EPUB_CSS")
    fi
    # Prefer converted PNG cover (widely supported), fall back to SVG/PDF source.
    local epub_cover="$COVER_PNG"
    if [[ -z "$epub_cover" && -n "$EPUB_COVER" && -f "$EPUB_COVER" ]]; then
        epub_cover="$EPUB_COVER"
    fi
    if [[ -n "$epub_cover" && -f "$epub_cover" ]]; then
        epub_args+=(--epub-cover-image="$epub_cover")
    fi
    pandoc "${epub_args[@]}" \
        --to=epub3 \
        --output="$EXPORTS_DIR/book.epub" \
        --toc \
        --toc-depth="$TOC_DEPTH"
    echo "   OK $EXPORTS_DIR/book.epub"
}

build_docx() {
    echo "-> Generating DOCX..."
    local docx_args=("${PANDOC_ARGS[@]}")
    if [[ -n "$DOCX_REF" && -f "$DOCX_REF" ]]; then
        docx_args+=(--reference-doc="$DOCX_REF")
    else
        echo "   (note: no reference.docx found, using Pandoc default; see templates/render/reference-docx-guide.md)"
    fi
    if ! pandoc "${docx_args[@]}" \
        --to=docx \
        --output="$EXPORTS_DIR/book.docx" \
        --toc \
        --toc-depth="$TOC_DEPTH" 2>/tmp/docx-err.$$; then
        echo "   ERROR writing book.docx:"
        cat /tmp/docx-err.$$
        rm -f /tmp/docx-err.$$
        echo "   (common cause on WSL/Windows: book.docx is open in Word or"
        echo "    locked by the OS/antivirus. Close it, then rerun this build.)"
        return 1
    fi
    rm -f /tmp/docx-err.$$
    echo "   OK $EXPORTS_DIR/book.docx"
}

# ---- Dispatch ---------------------------------------------------------------
case "$FORMAT" in
    pdf)  build_pdf ;;
    epub) build_epub ;;
    docx) build_docx ;;
    all)  build_pdf; build_epub; build_docx ;;
    *)
        echo "Error: unknown format '$FORMAT'."
        echo "       Valid formats: pdf | epub | docx | all"
        exit 1
        ;;
esac

echo
echo "Done. Outputs in: $EXPORTS_DIR"
