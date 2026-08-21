# Export Protocol — *The Age of Operational AI*

## Purpose

Every completed chapter must leave the writing process as both a reviewed manuscript file and an editorial PDF proof. The PDF is not a raw document conversion. It is a chapter-sized reading object that preserves the visual language of *The Operator’s Library* while using the distinct identity of Book 4.

> **Completion rule:** a chapter is not complete until its editorial proof has been visually checked and deposited in `exports/`.

## Canonical file naming

| Asset | Required path and name |
|---|---|
| Working manuscript | `manuscript/chapter-XX-slug.md` |
| Evidence pack | `notes/chapter-XX-brief-and-evidence.md` |
| Compilation review | `notes/chapter-XX-compilation-review.md` |
| Editorial PDF proof | `exports/chapter-XX-slug-editorial-proof.pdf` |

The chapter number uses two digits. The file name must not use dates unless the export is an archival snapshot. The current proof for Chapter 1 is `exports/chapter-01-the-age-of-operational-ai-editorial-proof.pdf`.

## Required architecture of every chapter proof

| Order | Required element | Editorial role |
|---:|---|---|
| 1 | Full-page Book 4 front cover | Establish the book as an object, not an isolated file. |
| 2 | Editorial proof page | Identify the part, chapter, reading status and the scope of the proof. |
| 3 | Reading map | Situate the chapter within the book and show the next narrative move. |
| 4 | Chapter opener | Create a visual threshold before the prose begins. |
| 5 | Chapter body | Present the revised prose with Book 4 typography, tinted paper field and navigation. |
| 6 | Editorial callouts | Create breathing space and expose tools the reader can use. |
| 7 | Source notes | Keep the evidence available without turning the prose into an academic article. |
| 8 | What to Retain | Finish with chapter-specific takeaways, not a generic summary. |
| 9 | Memorable Phrase | Preserve one precise sentence worth carrying forward. |
| 10 | Next Chapter | State the question that the next chapter must answer. |

## Book 4 visual rules

Book 4 does **not** use the white paper field, turquoise accent, saffron accent, firewall metaphor, circular loop or human silhouettes associated with other volumes. Its export system uses the approved **Instruction Fold** identity.

| Element | Book 4 rule |
|---|---|
| Background | Orchid Paper `#DED5E5` |
| Main ink | Black Plum `#2A1D2E` |
| Accent | Burnished Copper `#A86643` |
| Light contrast | Milk `#FAF7F2` |
| Visual sign | A folded form that signals an instruction becoming an action. No circuitry, robot, diagrammatic network or closed loop. |
| Cover | Approved Book 4 cover, with `STEVE BA-NDOUWE` only. |
| Chapter thresholds | Black Plum full page, restrained Copper line and chapter number. |
| Interior | Tinted paper field, high-contrast reading text, open vertical rhythm and understated navigation. |

## Callout system for proofs

The proof contains no more than three callouts in a normal chapter. Each must expose a different kind of reader value.

| Callout | Use |
|---|---|
| **At a Glance** | Fix a distinction that the next argument depends on. |
| **A Necessary Distinction** | Separate two ideas readers are likely to confuse. |
| **Control Point** | State what must be true before an agent is allowed to act. |
| **Delegation Test** | Ask whether the action should be delegated, approved or retained by a human. |
| **Evidence Required** | Identify the record needed to reconstruct and defend an action. |
| **The Human Remainder** | Name the judgment that cannot be outsourced. |
| **What to Retain** | Present four concise end-of-chapter takeaways. |
| **Memorable Phrase** | Keep one claim the reader can accurately quote outside the chapter. |

## Visual preflight checklist

Before deposit, verify all of the following:

1. The Book 4 cover is present and uses the approved version.
2. No raw YAML, Markdown syntax, file path, placeholder or template variable appears in the PDF.
3. Footer and header text do not overlap, repeat or enter the trim area.
4. The reading map and chapter opener are present and their hierarchy is legible.
5. Callouts are visually distinct, do not split awkwardly and do not become decorative clutter.
6. The final retention page contains chapter-specific takeaways, a memorable phrase and a real bridge to the next chapter.
7. Claims with a factual or time-sensitive basis have source notes and a current entry in the Evidence Ledger.
8. The PDF has been opened and checked at page level before it is copied to `exports/`.

## Revision policy

A proof may be replaced only when the manuscript changes, the evidence changes, the visual system improves or a compilation defect is found. The replacement uses the same canonical file name. If historical preservation is required, make an archival copy in `exports/archive/` with a date suffix; do not confuse the current proof with an archive.

## Book-level assembly

The individual chapter proof is a review artefact. The full book export will be assembled only after the Introduction, all twenty chapters, end matter and final source notes have passed their chapter-level reviews. At that stage, the book-level PDF will add the final front matter, complete table of contents, part openers, glossary, acknowledgements, about-the-author page and back cover.


## WSL 2 local compilation protocol

The canonical production environment for Book 4 is **Ubuntu under WSL 2**, operating directly inside the local repository. The sandbox is used for research, drafting and preparation only. It must not be used to transfer a final PDF into `exports/`, because a transfer can corrupt an otherwise valid file.

| Step | Autonomous action |
|---:|---|
| 1 | Save the revised chapter Markdown in `manuscript/chapter-XX-slug.md`. |
| 2 | Ensure the approved cover asset is available under `assets/`. |
| 3 | Generate the chapter body with Pandoc, then compile it with `xelatex` from Ubuntu WSL. |
| 4 | Produce the canonical proof at `exports/chapter-XX-slug-editorial-proof.pdf`. |
| 5 | Check the XeLaTeX exit status, verify the file exists and inspect the rendered PDF before it is announced as complete. |
| 6 | Record the review in the relevant compilation-review note. |

The WSL template is `config/chapter-proof.tex`. It uses a **separate interior palette**, not the cover palette: Cloud Slate `#F2F4F7` for reading pages, Ink Blue `#17212B` for text, Signal Indigo `#5360DE` for navigation and callout borders, Steel Mist `#E7EBF3` for callout fields, and Deep Navy `#17212B` for chapter thresholds. The Orchid Paper and Burnished Copper cover palette remain limited to the approved cover image.

> **Reliability rule:** never announce an export only because a command was launched. Announce it only after the PDF produced by WSL has been rendered and inspected from the same local repository.

The first validated WSL output is `exports/chapter-01-the-age-of-operational-ai-editorial-proof.pdf`.
