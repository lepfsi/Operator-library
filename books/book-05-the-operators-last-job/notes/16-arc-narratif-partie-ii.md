# Part II Narrative Audit — The Automation Curve

## Judgment

The titles of Part II already carry a compelling ladder:

> **First we automated the routine. Then we automated the diagnosis. Then we let machines act. Then the runbook became an agent.**

The current chapters explain each rung well in isolation. Their weakness is not the line of thought. It is the *felt continuity* between incidents. The reader can understand the progression without always experiencing it as an unavoidable escalation. Part II must make every new delegation feel like the sensible answer to the problem just exposed by the preceding chapter, and then reveal the new cost that delegation creates.

## Stable escalator

| Chapter | What becomes cheap | What initially feels gained | What becomes endangered | Handoff that must be felt |
|---|---|---|---|---|
| 5. First We Automated the Routine | Repeatable handling of familiar tickets. | Speed, consistency, reduced queue pressure. | The operator’s exposure to the weak signal inside routine. | If routine no longer teaches us, diagnosis will be delegated next. |
| 6. Then We Automated the Diagnosis | Correlation, summary, first hypothesis, route into an incident. | Faster explanation under pressure. | Alternative explanations and the boundary between a recommendation and permission. | If diagnosis arrives first, the system will soon be trusted to initiate the remedy. |
| 7. Then We Let Machines Act | Bounded mitigation actions. | Lower error rate before the room is fully staffed. | Ownership of a permission and the cost shifted elsewhere by an action. | If a system can choose a second action, the runbook has already become something more than a procedure. |
| 8. The Day the Runbook Became an Agent | Continuous reconciliation of state. | Persistent recovery, records, and execution at machine speed. | Ownership of the desired state, the trajectory, and the stop condition. | Part III must ask which human work remains when execution, diagnosis, and action all continue without waiting. |

## Revisions required to make the ladder felt

### Part II page

The part opener must state the four-stage movement once, with restraint. It should not summarize the chapters. It should make a promise: every delegation removes a delay and moves a decision to a less visible place.

### Chapter 5 to 6

The final paragraph of Chapter 5 should not merely announce diagnosis. It should establish the consequence of losing routine exposure: a system that sees the recurring pattern first will be invited to name the cause as well.

### Chapter 6 to 7

The final paragraph of Chapter 6 already approaches the needed line. It should be tightened around a single progression: an explanation that arrives before context will eventually be permitted to recommend the next action. Chapter 7 should begin by showing an action record, so the reader feels the permission has already been granted.

### Chapter 7 to 8

The Chapter 7 handoff must name the decisive transformation: an action that can be chosen, measured, and followed by another action is no longer a command. Chapter 8 must open with an action trajectory and immediately reveal that the runbook has acquired an operational identity.

### Chapter 8 to Part III

The final question should leave the reader with no stable refuge in generic oversight. The human role now begins where desired state, authority, accountability, and irreducible consequence must be negotiated.

## Narrative rules

1. **Each chapter begins in a different form.** Chapter 5 begins with a service desk queue, Chapter 6 with a historical operational record, Chapter 7 with a dry run, Chapter 8 with an action trajectory.
2. **Each chapter inherits one unresolved pressure from the last chapter.** The inherited pressure should appear within the first two pages, not only in the Next Chapter box.
3. **No chapter may use the same comfort language.** Avoid repeated dashboard imagery, midnight scenes, generic green status, or a generic claim that a model “helps”.
4. **The last paragraph must produce a necessity, not a tease.** The next chapter should feel unavoidable because the prior chapter has created its problem.
5. **The 2026 horizon must be visible without prediction theatre.** The chapter should describe capabilities already credible in current operations: agent-assisted diagnosis, tool calling, change execution, policy-bounded controllers, action histories, and human review of non-reducible stakes.

## Credibility and durability policy

| Scene type | Use | Rule |
|---|---|---|
| Documented pre-2024 incident | Use as a mechanism or antecedent. | Name its date and do not imply that contemporary generative AI caused it. Explain what operational pattern remains relevant in 2026. |
| 2025–2026 public incident | Use as a current anchor. | Attribute narrowly, link to the original record, and avoid inflated causal claims. |
| Composite 2026 scene | Use for the reader’s lived experience of modern agentic operations. | Label it as a composite; make the topology, permissions, observability, failure path, and human stakes concrete enough to be falsifiable. |
| Near-future extension | Use sparingly for long-term energy. | Extend a present mechanism, not a speculative product claim. The scene must still work if a current vendor disappears. |

## Tests before a Part II chapter is approved

A chapter must pass all five tests:

1. **Mechanism test:** Could an experienced operator explain why this incident happens?
2. **Permission test:** Is it clear what the system is allowed to do, and what it cannot decide?
3. **Consequence test:** Does the system’s success on one metric risk a cost elsewhere?
4. **Continuity test:** Does the closing pressure make the next delegation feel necessary?
5. **Durability test:** Would the scene still be meaningful in 2036 if named models, vendors, and interfaces had changed?
