# The Operator's Library

> A five-book series on the technical, human, and organizational realities of operating modern IT systems.

---

## What this is

A structured writing project for a 5-book series in English, written in Markdown, versioned with Git, and compiled to PDF / EPUB / DOCX via Pandoc.

| # | Title | Status |
|---|-------|--------|
| 1 | **Beyond the Firewall** — *The Reality of Modern IT Operations* | Blueprint locked · drafting |
| 2 | The Human Single Point of Failure | Pending (start after book 1 published) |
| 3 | The Complexity Trap | Pending |
| 4 | The Age of Operational AI | Pending |
| 5 | The Operator's Last Job | Pending |

---

## Project structure

```
operator-library/
├── series-bible.md              # The Series Bible (validated, 17 terms)
├── glossary.md                  # DailyOps taxonomy — 17 terms
├── case-library.md              # Anonymized incidents, shared across books
├── editorial-line.md            # The voice I use when writing
├── writing-pitfalls.md          # Anti-patterns to avoid during drafting
├── README.md                    # This file
│
├── templates/
│   ├── book-blueprint-template.md
│   ├── chapter-template.md
│   └── phrase-memorable-template.md
│
├── references/
│   ├── references.bib           # BibTeX bibliography
│   └── apa.csl                  # Citation style (APA)
│
├── scripts/
│   ├── build-book.sh            # Compile to PDF / EPUB / DOCX
│   └── new-chapter.sh           # Create a new chapter from template
│
└── books/
    ├── book-01-beyond-the-firewall/
    │   ├── book-blueprint.md
    │   ├── manuscript/          # One .md file per chapter
    │   ├── images/
    │   ├── notes/
    │   ├── exports/             # Generated PDF / EPUB / DOCX (gitignored)
    │   └── config/
    │       └── pandoc.yaml
    ├── book-02-the-human-spof/
    ├── book-03-the-complexity-trap/
    ├── book-04-the-age-of-operational-ai/
    └── book-05-the-operators-last-job/
```

---

## How to write

1. **Open the Series Bible** (`series-bible.md`) for the locked rules: thesis, promise, public, taxonomy, style rules, non-objectives, method.
2. **Open the Editorial Line** (`editorial-line.md`) for voice and per-chapter priorities.
3. **Open the chapter template** (`templates/chapter-template.md`) — copy it, rename it, fill the 8 fixed sections.
4. **Before drafting a chapter**, open the book blueprint (`books/book-NN-.../book-blueprint.md`) and confirm the idea, the memorable phrase, the incidents to use.
5. **Cross-check**:
   - Every concept introduced exists in `glossary.md`.
   - Every incident referenced exists in `case-library.md` (or add it).
6. **Before submission**, run through `writing-pitfalls.md` and the editorial line check-list.

> **One chapter = one incident + one idea.** If you can summarize a chapter in three comma-separated keywords, it's three missed chapters.

---

## How to compile

> Compilation is **local and reproducible**. Re-run as often as needed.

### Prerequisites

- **Pandoc** ≥ 3.0 — [pandoc.org](https://pandoc.org/)
- **LaTeX** (for PDF) — MiKTeX on Windows, TeX Live on Linux/macOS
- **Bash** (Git Bash on Windows, native on Linux/macOS)
- **Premium fonts** (recommended) — Sora, Source Serif Pro, IBM Plex Mono.
  Without them the build still works but uses wider fallback fonts and the
  page count inflates. Install in one command:

  ```bash
  ./scripts/install-fonts.sh
  ```

### Quick compile (current book, all formats)

From the project root:

```bash
./scripts/build-book.sh
```

This compiles `books/book-01-beyond-the-firewall/` to PDF, EPUB, and DOCX in `books/book-01-beyond-the-firewall/exports/`.

### Targeted compile

```bash
./scripts/build-book.sh book-01-beyond-the-firewall pdf
./scripts/build-book.sh book-01-beyond-the-firewall epub
./scripts/build-book.sh book-01-beyond-the-firewall docx
```

Accepted formats: `pdf`, `epub`, `docx`, `all` (default).

### Add a new chapter

```bash
./scripts/new-chapter.sh book-01-beyond-the-firewall 15 "Chapter title in slug form"
```

This creates `books/book-01-beyond-the-firewall/manuscript/15-chapter-title.md` from the template.

---

## Book 1 details

- **Title** : Beyond the Firewall
- **Subtitle** : The Reality of Modern IT Operations
- **Thesis** : A secure infrastructure is not necessarily reliable, and a reliable system is not necessarily resilient. Real operational performance is decided behind the firewall.
- **Structure** : 4 parts, 18 chapters (+ foreword, introduction, conclusion).
- **Concepts introduced** : Monitoring Illusion, Permanent Temporary, Human SPOF, Runbook Rot, Institutional Capability, Shadow Operations, Operational Drift.

See `books/book-01-beyond-the-firewall/book-blueprint.md` for the full plan.

---

## Conventions

- **Markdown source** : one file per chapter, named `NN-slug.md`.
- **YAML frontmatter** : mandatory in every chapter (metadata for Pandoc).
- **Commits** : small, atomic, with messages in English.
- **Status field** in frontmatter : `draft` → `review` → `final`.

---

## Roadmap

1. ✅ Series Bible locked (17 terms).
2. ✅ Editorial line defined.
3. ✅ Writing pitfalls documented.
4. ✅ Templates and Pandoc toolchain in place.
5. ⏳ Populate `case-library.md` with real anonymized incidents.
6. ⏳ Draft book 1 (chapter by chapter).
7. ⏳ First compile + visual review.
8. ⏳ Lock book 1, publish, move to book 2.
