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
  - "Recovery Proof"
incidents_referenced:
  - "Rollback_That_Never_Ran"
---

::: {.impact-opener #hope-is-not-a-rollback-strategy number="07" title="Hope Is Not a Rollback Strategy"}
:::

::: chapter-guide
**Inside Chapter 07**

- [01. A rollback sentence is not proof](#a-rollback-sentence-is-not-proof)
- [02. The return path that failed](#the-return-path-that-failed)
- [03. Three different returns](#three-different-returns)
- [04. Recovery proof in the change ticket](#recovery-proof-in-the-change-ticket)
- [05. Rehearse the return](#rehearse-the-return)
:::

## A rollback sentence is not proof

Every deployment has a sentence meant to make the team feel safe:

> If the deployment fails, roll back to the previous version.

The sentence appears in the change ticket, is reviewed, and then quietly becomes a property the team assumes the system has. It assumes the previous version still starts, the schema remains compatible, the configuration has not drifted, the identities still work, and someone can execute the sequence when pressure is real.

Writing the sentence proves none of those conditions.

A rollback becomes a recovery capability only when the team can execute it against a representative environment, within an agreed recovery objective, and verify that the user journey has returned to a safe state.

::: operating-fact
A rollback is not one action. It is a return path across application, data, configuration, access, and user outcome.
:::

## The return path that failed

A deployment to a financial services platform introduced an error into a trading workflow. Balances became inconsistent for a subset of users. The team stopped the rollout and chose the obvious response: return to the previous application version.

The script existed. The commands were documented. The change record had been approved.

The return failed.

The new release had introduced a schema change. The previous application expected the former schema shape and could not initialise against the database. A configuration value had also changed for the new release. The old service started only far enough to expose another failure.

The team had not found one bad command. It had found a collection of untested assumptions: a former environment, a compatible schema, valid credentials, accessible images, and a sequence nobody had exercised together.

The visible application error was the first failure. The untested return path was the second.

::: risk
**The cost of an untested return**

An untested rollback fails when the team has the least time to understand it. Every hidden dependency becomes a decision under pressure, and every missing permission becomes a new outage inside the original one.

A return path that has never run is an unpriced assumption.
:::

## Three different returns

The word *rollback* can hide three different recovery problems. Treating them as one is how change tickets create false confidence.

**Application rollback** returns a deployable artifact to a previous version. It can be safe when the previous artifact, runtime, dependency contract, and deployment path are still compatible. It is the simplest return only when the application is the only thing that changed.

**Schema or data rollback** returns or repairs a data contract. This is often not a literal reverse action. A migration may be additive and safe to keep while the application returns. A data transformation may require a forward correction, a controlled restore, or a reconciliation step. The critical question is not “can we revert the binary?” It is “can the previous and current states read, write, and preserve the data safely?”

**Configuration rollback** returns the environment around the application. It includes flags, endpoints, routing, capacity values, feature policies, identities, certificates, and secrets. Configuration is often the overlooked return because it is spread across several systems. The prior artifact may be correct while the environment it needs no longer exists.

::: concept
**REHEARSED RECOVERY**

*A recovery path executed recently against a representative system, observed by the people who will use it, and verified against an agreed user outcome.*

Rehearsal does not prove that every future failure will be simple. It reveals which application, data, configuration, access, and human assumptions must be repaired before the next change depends on them.
:::

A serious change can involve all three returns. The right response is not to pretend every return is quick. It is to state which return is possible, which recovery needs forward repair, and where the user outcome is safe again.

## Recovery proof in the change ticket

Recovery Proof is the small body of evidence that lets an approver decide whether a return path exists now, not only on paper.

It should sit beside the change, not in a separate document that nobody opens during an incident. The proof is not a long plan. It is a set of explicit answers that can be checked before approval.

::: tip
**Recovery Proof template**

1. **Change and critical outcome:** What outcome is at risk?
2. **Safe return state:** Which state is acceptable again?
3. **Return type:** Application, schema or data, configuration, or a combination?
4. **Compatibility decision:** Which data, configuration, and identity conditions must be reversed or preserved?
5. **Recovery authority:** Who can make the return decision and execute it?
6. **Recent evidence:** When was the path rehearsed or verified against a representative system?
7. **Outcome proof:** What user evidence ends the recovery clock?
8. **Stop condition:** What condition halts the change and triggers the return?

If a field cannot be answered, the change is not necessarily forbidden. It is not yet ready to be described as safely reversible.
:::

The template changes the approval conversation. Instead of asking, “Do we have a rollback?” the team asks, “Which return do we mean, what has been demonstrated, and what outcome proves the return worked?”

::: operating-fact
Approval for a change and evidence of a safe return are the same decision.
:::

## Rehearse the return

A useful recovery rehearsal has a beginning, a proof, and an end.

Start with a believable failure. Deploy a reversible change to a representative environment, stop a dependency, introduce a controlled configuration mismatch, or use a planned canary reversal. The exercise must resemble the conditions the actual team will face.

Then execute the return path as written. Do not allow one expert to repair it from memory while everyone else watches. Observe which credentials are needed, which instructions are missing, where decisions stall, and which data cannot safely move backwards.

Finally, prove recovery through the user outcome. A process is not restored because a service starts. It is restored when the critical journey is safe again: an order can complete, a record can be written, a balance can be trusted, or a request can be handled within the agreed limits.

::: tip
**Run the return exercise.** Choose one critical service. Before its next significant change, execute a controlled recovery rehearsal in the safest representative environment available. Record the time to detect, decide, return, and verify the user journey. Turn every surprise into a change to the runbook, script, recovery proof, or architecture.
:::

::: operator-rule
1. **This week, classify one planned change.** State whether its return is application, schema or data, configuration, or a combination. Do not use the word rollback without naming the return.

2. **Add Recovery Proof to its change ticket.** Name the safe return state, the recovery owner, the last verification, and the user evidence that ends the recovery clock.

3. **Verify one return path before approval.** Execute the safest representative test available, then update the evidence when data, configuration, identities, or dependencies change.
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

The former version could not initialise against the changed database contract. Configuration and credentials had also drifted since the rollback document was written.

**What We Missed**

No one had executed the application, data, configuration, and access return sequence together after the environment changed.

**What It Taught Us**

Recovery is a capability the team must practise. A written sequence becomes reliable only when its technical and human dependencies have been exercised together.
:::

::: pullquote
“A return path that only works in a document will fail at the moment the system needs it most.”
:::

::: keytakeaways
- Application, schema or data, and configuration returns are different recovery problems.
- A prior application artifact does not prove that the current data and environment can support it.
- Recovery Proof makes the return decision explicit in the change ticket before approval.
- Rehearsal should verify a real user outcome, not only that an old service version starts.
- A team that can deploy but cannot return safely has not completed the change.
:::

::: {.next-chapter}
**The Backup Nobody Tested**

A return path recovers a recent change. A backup is supposed to recover something older and more fundamental. The next chapter asks the same hard question: when did anyone last prove that the promise could be kept?
:::
