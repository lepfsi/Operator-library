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
incidents_referenced:
  - "Identity_Workaround_Ghost"
  - "Firewall_Temp_Rule"
---

::: {.impact-opener #when-temporary-becomes-architecture number="10" title="When Temporary Becomes Architecture"}
:::

::: chapter-guide
**Inside Chapter 10**

- [01. The ghost in the machine](#the-ghost-in-the-machine)
- [02. The architecture of accumulation](#the-architecture-of-accumulation)
- [03. The mechanisms that make temporary permanent](#the-mechanisms-that-make-temporary-permanent)
- [04. The cost of permanence](#the-cost-of-permanence)
- [05. The audit that reveals the system](#the-audit-that-reveals-the-system)
- [06. Design for reversibility](#design-for-reversibility)
:::

## The ghost in the machine

The authentication service still answered its health checks. The database still accepted connections. The network path still existed. The dashboards were green.

Yet new users could not register and existing users could not reset a password.

The visible components looked healthy because they were doing the narrow things their checks asked them to do. The failure lived in a configuration override between the application and an external identity provider. Years earlier, the provider had changed ownership and routing. A team added a short-term endpoint override while a larger migration was being planned.

The workaround solved the immediate problem. It stayed through later releases. It was not given an owner, an expiry date, a review, or a removal path.

When the override eventually stopped matching the external service, the team did not initially know to look for it. The core service was present. The component checks were green. The business journey was broken by a dependency that had become too ordinary to notice.

The temporary had become permanent. The permanent had become invisible. The invisible had become a failure.

## The architecture of accumulation

Production architecture is rarely the clean diagram a team draws at the start of a programme. It is the result of decisions made under different pressures: an urgent firewall exception, a vendor transition, a capacity workaround, an access policy, a script copied to a host, a configuration flag nobody wanted to touch during an outage.

Many of these decisions are reasonable when made. The problem is not that teams respond to urgency. The problem is allowing an emergency decision to remain in production without deciding what it has become.

A system accumulates these decisions over time. A workaround becomes a dependency for the next release. A temporary route becomes the assumed route. A manual check becomes the control that catches a revenue error. A permission added for a one-off task becomes part of the access model.

The result is not necessarily bad architecture. It is architecture that has not been made explicit, reviewed, or owned at the same level as the visible architecture.

## The mechanisms that make temporary permanent

Temporary decisions usually become permanent through a combination of three mechanisms.

**Urgency** gives the first decision a valid reason to exist. The team needs service restored, an integration kept alive, or a customer impact contained. A smaller workaround is often the responsible immediate choice.

**Missing expiry** removes the trigger to revisit the decision. If a change has no review date, no measurable condition for removal, and no owner who expects to answer for it, it remains by default.

**Absorbed dependency** makes removal harder over time. Other services, runbooks, habits, or customers begin to rely on the workaround. What was once easy to delete becomes risky because the team can no longer see all of its effects.

This sequence matters because it changes the response. Do not blame the original engineer for making a fast decision. Build an operating model that turns a fast decision into an explicit choice before it becomes hidden structure.

::: concept
**Architectural Accretion**

The gradual accumulation of emergency decisions, exceptions, and dependencies that remain in production without a clear owner, review point, or removal decision.

Each layer may have been sensible on the day it was added. The risk appears when the layers begin to constrain one another and no one can explain the system as it actually operates.
:::

## The cost of permanence

Permanent temporaries create cost in more than one way.

They lengthen incidents because the team spends time discovering relationships that should have been known. They increase change risk because an apparently local adjustment can disturb an old assumption. They add cognitive load because experienced operators begin to avoid touching parts of the system they no longer trust themselves to understand.

They also change the organisation. If a team cannot explain why an exception exists, who owns it, and how it will be removed, the team gradually loses agency over the system. Change becomes a negotiation with ghosts.

The answer is not a purity campaign that deletes every exception. Some exceptions are justified and long-lived. The answer is to make their existence intentional, visible, and reviewable.

::: risk
**The cost of unowned permanence**

An exception without an owner or a review condition accumulates risk silently. It may never cause an incident. But when it does, the team pays twice: once for the failure, and once for the time needed to rediscover why the exception existed.

Treat every long-lived workaround as a design decision that requires the same level of ownership as any other production dependency.
:::

## The audit that reveals the system

A useful audit does not begin by asking whether the architecture diagram is accurate. It begins by comparing the diagram with the places where the system really expresses itself: firewall rules, load balancer configuration, environment variables, scheduled jobs, service identities, feature flags, database migrations, and vendor settings.

The goal is not to create a list of technical debt to shame the team with. The goal is to classify what exists.

For each unusual rule, override, script, or setting, ask four questions. What original problem did this solve? Who owns its current existence? What evidence shows it is still needed? What event or date should trigger its review or removal?

When a team cannot answer, it has discovered an architectural decision that has escaped governance. The next step is not necessarily deletion. It is to contain the risk: name an owner, document the dependency, define a test, and decide whether the element is retained, replaced, or retired.

::: warning
**The comfort trap**

Stable systems are the easiest place to postpone architectural archaeology. The service is working, the team is busy, and the workaround is not visible in the current incident queue.

That calm is precisely when the audit should happen. Under pressure, teams preserve whatever keeps the system moving. In a healthy window, they can decide what no longer belongs.
:::

## Design for reversibility

Reversibility does not mean every change can be undone with one command. Some data migrations, security changes, and vendor transitions require forward recovery rather than a literal rollback.

It means every material change has an explicit exit strategy. The team knows which state is safe, how to reach it, who may decide, what data or configuration will change, and what outcome proves the system is safe again.

For a firewall exception, the exit may be an expiration date and a replacement control. For an endpoint override, it may be a planned migration and a verification test. For a cron job, it may be moving the work into a scheduled service with ownership and monitoring. For a feature flag, it may be a removal task that is created when the flag is created.

A reversible system is not a system without complexity. It is a system where complexity has a path back to a state the team understands.

::: tip
**Run an architecture archaeology session.** Once each quarter, choose one critical path and inspect the configuration, scheduled work, identities, exceptions, and vendor settings around it. Select one element that no one can fully explain. Trace its effect in a safe environment, assign an owner, and decide whether to retain, replace, or retire it.
:::

::: operator-rule
1. **Record the exit when you add the exception.** A temporary change should state its purpose, owner, review date, removal condition, and verification signal at the moment it enters production.

2. **Review decisions where they live.** Put ownership and expiry close to the code, configuration, ticket, or infrastructure definition that implements the exception. A document nobody sees will not govern a live system.

3. **Make removal a planned change.** When an exception becomes long-lived, create a named decision: retain it with controls, replace it, or remove it. Silence is not a decision.
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

The override had no owner, expiry, or review record. When the external service changed again, registration and password reset failed while component health checks remained green.

**What We Missed**

The team treated the workaround as a short-term implementation detail rather than a dependency that needed ownership, monitoring, and a removal decision.

**What It Taught Us**

Temporary changes become architecture when other work depends on them. The moment a workaround remains in production, the team needs to decide how it will be governed or removed.
:::

::: pullquote
“Architecture is not only what a team designs. It is also what the team leaves behind.”
:::

::: keytakeaways
- Temporary decisions become architecture when they remain in production without an owner, review, or exit path.
- Urgency explains why a workaround starts; it does not explain why it should remain invisible.
- Audits should compare diagrams with live configuration, identities, scheduled work, and vendor dependencies.
- Reversibility requires a known safe state and an explicit path to it, not always a literal rollback.
- The discipline of removal makes hidden architecture visible before it becomes an incident.
:::

::: {.next-chapter}
**Part III · Operating Reality**

The system can now be seen more clearly: the signals, the recovery paths, the backups, the dependencies, and the temporary decisions beneath them. The next movement shifts to the people who must make decisions when that understanding is incomplete and the pressure is real.
:::
