# The Operator's Last Job

This directory holds book 5 of *The Operator's Library*.

## Editorial status

The global structure exists. Only `00b-introduction.md` is intentionally marked as a draft; chapter files begin as `scaffold` and are excluded from normal builds until their argument, incident, and framing are ready.

## Build prerequisites

The common build script needs **Bash**, **Pandoc**, and **XeLaTeX** for PDF output. Ubuntu WSL2 on this workstation already provides Pandoc 3.7.0.2, XeTeX from TeX Live 2025, `rsvg-convert`, Fontconfig, and Python 3.

## Commands

From the library root in Ubuntu WSL2, run:

```bash
bash scripts/build-book.sh book-05-the-operators-last-job pdf
bash scripts/build-book.sh book-05-the-operators-last-job epub
bash scripts/build-book.sh book-05-the-operators-last-job docx
bash scripts/build-book.sh book-05-the-operators-last-job all
```

The normal build includes drafts and excludes files marked `scaffold`. Use `--include-drafts` only when a complete review copy with all placeholders is specifically required. Output files are written to `exports/`.

## WSL2 rendering note

The shared template expects Noto Sans, which is not installed in the current Ubuntu WSL2 environment. This book therefore uses the local file `config/template.latex`, which substitutes **TeX Gyre Heros**, already available with TeX Live. This preserves the shared template while keeping the PDF build reproducible without administrator access.
