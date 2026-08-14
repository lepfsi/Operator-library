# Chapter Template — The Operator’s Library

> **Usage** : copy this file, rename it `NN-title-in-slug-form.md`, then replace every placeholder.
> **Language** : final manuscript content is written in English.
> **Editorial standard** : [`design/referentiel-editorial-v1.md`](../design/referentiel-editorial-v1.md), complété par [`design/chapter-rhythm-10-page.md`](../design/chapter-rhythm-10-page.md).

This template does not imitate a conventional essay. It alternates a visual thesis, an incident, a named mechanism, an operational warning, a practical rule, a field note, and a transition. A long chapter may add further scene-and-analysis pairs, but it keeps one opening, one impact quote, one Operator’s Rule, and one Field Note.

---

## YAML front matter

```yaml
---
title: "Chapter title"
part: "Part I — The System We See"
book: "Beyond the Firewall"
book_number: 1
chapter_number: 1
author: "Ba-Ndouwe Steve"
date: "YYYY-MM-DD"
status: "scaffold"  # scaffold | draft | review | final
memorable_phrase: "A short, affirmative sentence of fifteen words or fewer."
concepts_introduced:
  - "Concept name already defined in glossary.md"
incidents_referenced:
  - "Incident_Code_from_case-library"
---
```

Use `scaffold` only for an empty placeholder. A chapter moves from `draft` to `review` when its structure and evidence are complete, then to `final` only after editorial and visual review.

---

## Manuscript skeleton

```markdown
::: {.impact-opener number="01" title="CHAPTER TITLE"}
:::

::: impact-quote
The thesis in one or two lines.
:::

## The moment

Write a concrete scene: a moment, a system, a person or team under pressure,
and a user-facing friction. Use short paragraphs. Do not explain the whole
mechanism yet.

::: tip
Give one immediate diagnostic action. Start with a verb and keep it to two to
four sentences.
:::

## The mechanism

Name the invisible pattern. Explain only what the reader needs in order to see
it at work in the incident.

::: concept
**CONCEPT NAME**

*Definition in 30–60 words. It must be reusable beyond this chapter.*
:::

## The decoy

State the bad belief or false measure of safety. Return to the incident and
show the exact assumption that failed.

::: warning
Make the risk explicit. Explain the consequence; do not use generic alarm.
:::

## Why it persists

Analyze no more than three reinforcing mechanisms. Use clear sub-ideas such as
visibility, ownership, incentives, time pressure, or missing reversal paths.

::: tip
Offer a second concrete diagnostic action if it advances the chapter.
:::

::: impact-quote
A memorable line that creates a deliberate pause.
:::

## Three actions for this week

Bridge from analysis to execution in a short paragraph.

::: operator-rule
1. **Action with a frequency or trigger.** Explain the observable result.

2. **Action with an owner or measurement.** Explain why it matters.

3. **Action with an expiry, review, or test.** Explain the reversal path.
:::

::: field-note
**Context**

The incident in one or two concrete sentences.

**What We Expected**

The belief or metric the team trusted.

**What Happened**

The user-visible reality.

**What We Missed**

The dependency, assumption, or decision that the system did not expose.

**What It Taught Us**

The chapter’s lesson in one reusable sentence.
:::

## Transition

Write a short ending that opens the next chapter. Do not summarize the chapter.
Use a tension, a consequence, or a new question.
```

---

## Block contract

| Block | Job | Limit |
|---|---|---|
| `impact-opener` | Create the dark opening verso. | One per chapter; required `number` and `title` attributes. |
| `impact-quote` | Put the thesis or a key line into visual memory. | One opening quote and one mid-chapter quote maximum. |
| `tip` | Give a field-tested diagnostic action. | Two per chapter maximum. |
| `concept` | Define a stable system term. | One per chapter when a concept is introduced. |
| `warning` | Expose a false assurance or dangerous shortcut. | One per chapter maximum. |
| `operator-rule` | Convert the chapter into three measurable actions. | Exactly one per chapter. |
| `field-note` | Preserve the incident as structured evidence. | Exactly one per chapter, near the end. |
| `keytakeaways` | Summarize a long or online version. | Optional; do not add it to the ten-page rhythm by default. |

The renderer handles the visual presentation of these fenced divs. Do not add manual colours, HTML tables, or spacing tricks to a manuscript.

---

## Editorial controls

Before marking a chapter `review`, verify the following.

| Control | Expected condition |
|---|---|
| Scene | The reader can identify a concrete system, pressure, and failed user transaction. |
| Thesis | The impact quote and Field Note tell the same essential truth. |
| Concept | Every named concept already exists in `glossary.md`, or is added there first. |
| Evidence | Every incident is registered in `case-library.md`; invented metrics are removed. |
| Analysis | No more than three mechanisms are used to explain persistence. |
| Action | Each rule specifies an action and a test, frequency, owner, or expiry. |
| Rhythm | Standard prose contains no more than one callout per page of intended composition. |
| Transition | The final paragraph creates a need for the next chapter rather than repeating the conclusion. |
