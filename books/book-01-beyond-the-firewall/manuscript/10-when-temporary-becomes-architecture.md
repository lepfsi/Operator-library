---
title: "When Temporary Becomes Architecture"
part: "Part II: The System We Don't See"
book: "Beyond the Firewall"
book_number: 1
chapter_number: 10
author: "Steve BA-NDOUWE"
date: "2026"
status: "draft"
memorable_phrase: "A temporary fix left in production is a design decision that has not yet been named."
concepts_introduced:
  - "Architectural Accretion"
  - "Exception Ledger"
incidents_referenced:
  - "Identity_Workaround_Ghost"
  - "Firewall_Temp_Rule"
---

::: {.impact-opener #when-temporary-becomes-architecture number="10" title="When Temporary Becomes Architecture"}
:::

::: chapter-guide
**Inside Chapter 10**

- [01. Start with the running system](#start-with-the-running-system)
- [02. The exception ledger](#the-exception-ledger)
- [03. The cognitive cost of hidden structure](#the-cognitive-cost-of-hidden-structure)
- [04. Retain, replace, or retire](#retain-replace-or-retire)
- [05. Design for reversibility](#design-for-reversibility)
:::

## Start with the running system

An architecture review opened with a clean identity diagram. It showed the application, the external identity provider, and the intended routing path between them.

New users still could not register and existing users could not reset a password.

The failure was not visible on the diagram. Years earlier, a team had added an endpoint override while ownership of the identity provider changed. The override kept the service running through the transition. It survived later releases, a vendor change, and several handovers.

No one had recorded who owned the override, what evidence still justified it, or what would replace it. When the external provider changed again, the login recovery path followed an assumption that had become invisible.

The useful review did not begin with the diagram. It began with the running system: the live endpoint, environment values, service identity, routing rules, scheduled work, and settings that actually controlled the outcome.

::: operating-fact
The system that constrains the next change is the system expressed in live decisions, not the system remembered in the last diagram.
:::

The lesson from Chapter 2 remains true: temporary choices can become permanent. This chapter begins after that realization. Once an exception has stayed, the team must govern it as operating architecture.

## The exception ledger

An exception ledger is a short record of the unusual rules, overrides, scripts, access grants, routes, feature flags, and vendor settings that materially affect a critical path.

It is not a catalogue of technical debt for blaming people. It is a way to decide what the organisation is actually willing to operate.

::: concept
**EXCEPTION LEDGER**

*A current record of long-lived operating exceptions, their original purpose, their present owner, the evidence that they remain necessary, and the decision that will govern their future.*

The ledger makes an exception visible before an incident forces the team to rediscover why it exists.
:::

A useful entry is compact enough to survive in the work stream. It belongs close to the infrastructure definition, change record, service ownership record, or configuration repository where the exception lives.

::: tip
**Create one exception entry this week.**

1. **Exception and critical path:** Which unusual element affects which outcome?
2. **Original problem:** What condition did it solve when it was added?
3. **Current owner:** Who is accountable for its existence now?
4. **Evidence of need:** What proves the exception is still necessary?
5. **Dependencies:** Which services, procedures, or people now rely on it?
6. **Review trigger:** What event or expiry condition requires a decision?
7. **Decision:** Retain, replace, or retire?
8. **Verification:** What proves the chosen decision is safe?

Choose the element that makes experienced operators say, “do not touch that.” That reaction is evidence that the system needs a clearer decision.
:::

## The cognitive cost of hidden structure

Long-lived exceptions do more than create a possible incident. They change how a team thinks and acts.

An unowned firewall rule makes a security review slower because nobody can explain the traffic it permits. A copied script makes a deployment fragile because operators avoid changing the host where it runs. A feature flag with no removal decision turns every new release into a question about an old path. An access grant that nobody reviews becomes part of the security model by default.

Over time, the team learns to avoid areas it no longer understands. Changes are delayed. Reviews become performative. The people who remember the exception gain informal decision power. The organisation stops designing and starts negotiating with its own accumulated history.

::: warning
**Hidden structure increases the cost of every future decision.**

An exception without an owner or a review condition may remain harmless for a long time. But it consumes attention whenever a team must change, secure, explain, or recover the path around it.
:::

This is architectural accretion in its operational form. The issue is not that the original workaround was unreasonable. The issue is that its continuing cost is now paid by people who did not make the original choice.

## Retain, replace, or retire

An audit should end with a decision, not a longer list.

**Retain** an exception when it remains necessary, is understood, has an accountable owner, and can be tested. Retention is a design decision. It requires controls, documentation where the work happens, and a condition that will trigger the next review.

**Replace** an exception when the current path still serves a real need but its mechanism is too fragile, opaque, or manual. A temporary endpoint override may become a supported integration. A copied script may become an owned workflow. A one-off access rule may become a role with a defined purpose.

**Retire** an exception when its original condition no longer exists or when another control now performs its function. Retirement is not deletion by assumption. The team must trace the dependency, remove the element safely, and verify the outcome it once protected.

::: operating-fact
Silence is not a decision. Every long-lived exception is being retained, replaced, or retired by the way the team behaves around it.
:::

The point is not purity. Some production exceptions are justified and durable. The point is that durability deserves the same governance as any other dependency on the critical path.

## Design for reversibility

Chapter 7 addressed the return from a recent change. Reversibility here is broader. It asks whether the team has an intelligible path away from a long-lived exception when the system, vendor, risk posture, or business need changes.

For a firewall exception, the exit may be a replacement control and a verified removal. For an endpoint override, it may be a supported routing path and a test of account recovery. For a scheduled script, it may be an owned service with an observable result. For a feature flag, it may be a removal task created at the same moment as the flag.

A reversible operating model does not promise that every decision can be undone easily. It makes the exit path explicit while the team still has time to understand it.

::: operator-rule
1. **This week, inspect one critical path outside the diagram.** Compare the intended design with live routes, identities, configuration, scheduled work, and vendor settings.

2. **Create one exception ledger entry.** Name the original problem, current owner, evidence of need, dependencies, review trigger, and planned decision.

3. **Make one deliberate choice.** Retain with controls, replace with an owned mechanism, or retire with a verification plan. Do not leave a long-lived exception without a named future.
:::

::: {.memorable-phrase}
A temporary fix left in production is a design decision that has not yet been named.
:::

::: field-note
**Context**

An authentication service retained a temporary endpoint override after an external identity provider changed routing. The override survived several releases because it kept the login path working.

**What We Expected**

The override would be removed during the wider identity migration, before it became a long-term dependency.

**What Happened**

The override had no owner, expiry, or review record. When the external service changed again, registration and password reset failed while component checks continued to pass.

**What We Missed**

The team treated the workaround as a short-term implementation detail rather than a dependency that needed ownership, monitoring, and an exit decision.

**What It Taught Us**

Temporary changes become operating architecture when other work depends on them. The moment a workaround remains in production, the team needs to decide how it will be governed, replaced, or removed.
:::

::: pullquote
“Architecture is not only what a team designs. It is also what the team leaves behind.”
:::

::: keytakeaways
- The useful audit starts from live configuration, identities, routes, and scheduled work, not only from the intended diagram.
- An exception ledger records why an unusual path exists, who owns it, and what decision governs its future.
- Hidden structure increases the cognitive cost of every change, incident, review, and recovery.
- A long-lived exception must be retained with controls, replaced with an owned mechanism, or retired with verification.
- Reversibility makes the exit path explicit before an old decision becomes an emergency constraint.
:::

::: {.next-chapter}
**Part III · Operating Reality**

The system can now be seen more clearly: its signals, recovery paths, backups, dependencies, and retained exceptions. The next movement shifts to the people who must make decisions when that understanding is incomplete and the pressure is real.
:::
