# Chapter Template — The Operator’s Library

> **Usage** : copy this file, rename it `NN-title-in-slug-form.md`, then replace every placeholder.
> **Language** : final manuscript content is written in English.
> **Editorial standard** : [`design/referentiel-editorial-v1.md`](../design/referentiel-editorial-v1.md), complété par [`design/chapter-rhythm-10-page.md`](../design/chapter-rhythm-10-page.md).

This template does not imitate a conventional essay. It alternates an opening, an incident, a named mechanism, an operational warning, a practical rule, a field note, a memorable phrase, a pull quote, key takeaways, and a transition. A long chapter may add further scene-and-analysis pairs, but it keeps one opening, one Operator’s Rule, one Field Note, one Memorable Phrase, one Pull Quote, and one Key Takeaways block.

---

## YAML front matter

```yaml
---
title: "Chapter title"
part: "Part I — The System We See"
book: "Beyond the Firewall"
book_number: 1
chapter_number: 1
author: "Steve BA-NDOUWE"
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

::: {.chapter-guide}
**Inside Chapter 01**

- [01. The first section](#the-moment)
- [02. The mechanism](#the-mechanism)
- [03. The operational decision](#three-actions-for-this-week)
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

::: {.memorable-phrase}
One original sentence of 20–45 words that holds the chapter’s idea without repeating the title.
:::

::: pullquote
One consequence or tension of 25–55 words. It should deepen the memorable phrase, not paraphrase it.
:::

::: keytakeaways
- First applied teaching point.
- Second applied teaching point.
- Third applied teaching point.
- Fourth applied teaching point.
- Optional fifth applied teaching point.
:::

::: {.next-chapter}
**NEXT CHAPTER TITLE**

Write a short ending that opens the next chapter. Do not summarize the chapter. Use a tension, a consequence, or a new question.
:::
```

---

## Block contract

| Block | Job | Limit |
|---|---|---|
| `impact-opener` | Create the dark opening verso. | One per chapter; required `number` and `title` attributes. |
| `impact-quote` | Put an indispensable thesis into visual memory. | Optional; only when it adds a genuine editorial break, never to fill a page. |
| `tip` | Give a field-tested diagnostic action. | Two per chapter maximum. |
| `concept` | Define a stable system term. | One per chapter when a concept is introduced. |
| `warning` | Expose a false assurance or dangerous shortcut. | One per chapter maximum. |
| `operator-rule` | Convert the chapter into three measurable actions. | Exactly one per chapter. |
| `field-note` | Preserve the incident as structured evidence. | Exactly one per chapter, near the end. |
| `memorable-phrase` | Fix the chapter’s core insight in memory. | Exactly one per complete chapter, 20–45 words. |
| `pullquote` | Extend the chapter’s consequence or tension. | Exactly one per complete chapter, 25–55 words. |
| `keytakeaways` | Convert the chapter into a concise operational recall. | Exactly one per complete chapter, four or five bullets. |

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
| Closing system | Field Note, Memorable Phrase, Pull Quote, Key Takeaways, then Next Chapter all appear in that order. |
| Transition | The final paragraph creates a need for the next chapter rather than repeating the conclusion. |
