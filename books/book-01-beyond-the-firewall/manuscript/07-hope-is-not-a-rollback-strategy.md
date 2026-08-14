---
title: "Hope Is Not a Rollback Strategy"
part: "Part II: The System We Don't See"
book: "Beyond the Firewall"
book_number: 1
chapter_number: 7
author: "Steve BA-NDOUWE"
date: "2026"
status: "draft"
memorable_phrase: "A rollback plan you have not executed recently is a wish, not a recovery capability."
concepts_introduced:
  - "Rehearsed Recovery"
incidents_referenced:
  - "Rollback_That_Never_Ran"
---

::: {.impact-opener #hope-is-not-a-rollback-strategy number="07" title="Hope Is Not a Rollback Strategy"}
:::

::: chapter-guide
**Inside Chapter 07**

- [01. The promise we make to ourselves](#the-promise-we-make-to-ourselves)
- [02. The rollback that never ran](#the-rollback-that-never-ran)
- [03. The anatomy of a failed rollback](#the-anatomy-of-a-failed-rollback)
- [04. Why we do not test](#why-we-do-not-test)
- [05. The confidence gap](#the-confidence-gap)
- [06. Rehearse the return](#rehearse-the-return)
:::

## The promise we make to ourselves

Every deployment has a sentence that is meant to make the team feel safe:

> If the deployment fails, roll back to the previous version.

The sentence appears in the change ticket. It is reviewed, approved, and then quietly treated as a property of the system. The team assumes the previous version still starts, the schema remains compatible, the configuration has not drifted, the credentials still work, and somebody remembers the exact sequence when the pressure is real.

None of that is guaranteed by writing the sentence.

A rollback plan is not a plan because it exists in a document. It becomes a plan only when a team can execute it against the environment that matters, within a recovery objective that matters, and verify that the user journey is safe again.

Hope fills the gap between the documented sequence and the proven sequence. It is not a strategy.

## The rollback that never ran

A deployment to a financial services platform introduced an error into a trading workflow. Balances became inconsistent for a subset of users. The team stopped the rollout and chose the obvious response: return to the previous application version.

The rollback script existed. The commands were documented. The change record had been signed off.

The rollback failed.

The new release had introduced a schema change. The old application expected the previous schema shape and could no longer initialise against the database. A configuration value had also been updated for the new release. The older service started only far enough to expose another failure.

The team did not discover that one command was wrong. They discovered that the rollback was a collection of assumptions: a former environment, an old schema, valid credentials, accessible images, and a sequence nobody had exercised together.

The incident lasted far longer than the deployment itself. The visible application error was only the first failure. The untested return path was the second.

::: risk
**The cost of an untested return**

An untested rollback does not fail politely. It fails at the moment the team has the least time to understand it. Every hidden dependency becomes a decision under pressure, and every missing permission becomes a new outage inside the original one.

A rollback that has never run is not a safety net. It is an unpriced assumption.
:::

## The anatomy of a failed rollback

Rollback failures are predictable because the system moves while the document stays still.

**Schema incompatibility** appears when the new release has migrated data or changed a database contract that the old version cannot understand. Returning the application binary does not return the data model.

**Configuration drift** appears when flags, endpoints, capacity settings, or feature toggles were changed for the new release and not reversed. The old version is restored into an environment that no longer belongs to it.

**Data incompatibility** appears when a new process writes records in a form the old process cannot read. The application may start successfully and still fail every transaction that reaches the changed data.

**Credential rotation** appears when a key, certificate, identity binding, or policy was altered during the rollout. The old service returns but cannot reach the dependencies it needs.

**Manual dependency** appears when the documented sequence expects a specific person, terminal, approval, or memory. At 03:00, that dependency is just as real as a missing database.

These are not edge cases. They are what happens when a return path is treated as a paragraph instead of a capability.

::: warning
**The triple threat of an untested rollback**

A rollback becomes dangerous when three things combine: the plan is stale, the team has not rehearsed it, and the environment has changed around it. Each condition adds uncertainty. Together, they turn a recovery step into a live investigation.

If the rollback has not been executed against a representative environment since its dependencies changed, do not call it ready.
:::

## Why we do not test

The reasons are familiar. The change window is narrow. The deployment looks routine. Restoring the previous state seems more complex than moving forward. Teams fear that testing the return will create the very incident they are trying to avoid.

These reasons are understandable. They are also the reason the return path decays.

A deployment can be automated every day while its rollback is preserved in a ticket from eighteen months ago. The forward path receives attention because it is used. The return path becomes obsolete because it is trusted without being exercised.

Testing is not a ceremony added after the real work. It is how the team learns whether the recovery promise still belongs to the current system.

## The confidence gap

The teams with the most complex deployments often have the least slack to rehearse a return. Their changes touch more services, more identities, more data, and more customer outcomes. They are also the teams most likely to say that rollback testing will happen next time.

This is the confidence gap. Need rises with complexity, while rehearsal falls because the perceived cost of rehearsal also rises.

The answer is not to force every team to reverse a production release on an arbitrary calendar. The answer is to define a recovery exercise that is proportional to the risk: a production-like environment for safe rehearsal, a controlled canary for a critical path, a reversible change under a maintenance window, or a documented proof that the data and configuration rollback were actually validated.

The important rule is simple: deployment approval and recovery readiness are the same decision. If the team cannot explain and demonstrate how it returns to a safe state, it has not finished preparing the change.

::: concept
**Rehearsed Recovery**

A recovery path that has been executed recently against a representative system, observed by the people who will use it, and measured against an agreed outcome.

The goal is not to prove that a document exists. The goal is to expose dependencies, permissions, data contracts, and human decisions before an incident forces the lesson.
:::

## Rehearse the return

A useful recovery rehearsal has a beginning, a proof, and an end.

Start with a believable failure. Deploy a reversible change to a representative environment, stop a dependency, introduce a controlled configuration mismatch, or use a planned canary reversal. The exercise must resemble the conditions the actual team will face.

Then execute the return path as written. Do not allow a single expert to repair it from memory while everyone else watches. Observe which credentials are needed, which instructions are missing, where decisions stall, and which data cannot safely move backwards.

Finally, prove the recovery through the user outcome. A process is not restored because a service starts. It is restored when the critical journey is safe again: an order can complete, a record can be written, a balance can be trusted, or a request can be handled within the agreed limits.

::: tip
**Run the return exercise.** Choose one critical service. Before its next significant change, execute a controlled recovery rehearsal in the safest representative environment available. Record the time to detect, decide, reverse, and verify the user journey. Turn every surprise into a change to the runbook, script, or architecture.
:::

::: operator-rule
1. **Make recovery proof part of change approval.** Every significant release must name its safe return state, the person accountable for the decision, and the evidence that the return path was recently exercised.

2. **Automate the reversible steps.** Convert repeatable recovery work into reviewed, idempotent automation. Preserve manual judgement only where a human decision adds genuine safety.

3. **Verify the journey after the return.** A successful rollback means more than an old version running. Test the transaction, data integrity, identities, and dependencies that the user requires.
:::

::: {.memorable-phrase}
A rollback plan you have not executed recently is a wish, not a recovery capability.
:::

::: field-note
**Context**

A high-risk deployment destabilised a financial services workflow. The team held a documented rollback procedure and believed the previous version could be restored quickly.

**What We Expected**

The previous application version would return the service to a safe state once the rollout was stopped.

**What Happened**

The old version could not initialise against the changed database contract. Configuration and credentials had also drifted since the rollback document was written.

**What We Missed**

No one had executed the full return sequence against a representative environment after the schema, configuration, and access model changed.

**What It Taught Us**

Recovery is a capability the team must practise. A written sequence becomes reliable only when its technical and human dependencies have been exercised together.
:::

::: pullquote
“A return path that only works in a document will fail at the moment the system needs it most.”
:::

::: keytakeaways
- A documented rollback is not evidence that recovery will work.
- Schema, configuration, data, credentials, and human steps can each invalidate a return path.
- Recovery proof belongs in deployment approval, not only in incident response.
- Rehearsal should be proportional to risk and must verify a real user outcome.
- A team that can deploy but cannot return safely has not completed the change.
:::

::: {.next-chapter}
**The Backup Nobody Tested**

A rollback returns a recent change. A backup is supposed to return something older and more fundamental. The next chapter asks the same hard question: when did anyone last prove that the promise could be kept?
:::
