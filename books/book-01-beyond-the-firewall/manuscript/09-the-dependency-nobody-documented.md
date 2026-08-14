---
title: "The Dependency Nobody Documented"
part: "Part II: The System We Don't See"
book: "Beyond the Firewall"
book_number: 1
chapter_number: 9
author: "Steve BA-NDOUWE"
date: "2026"
status: "draft"
memorable_phrase: "The most dangerous dependency is the one you do not know exists."
concepts_introduced:
  - "Shadow Operations"
incidents_referenced:
  - "Phantom_Cron_Production"
---

::: {.impact-opener #the-dependency-nobody-documented number="09" title="The Dependency Nobody Documented"}
:::

::: chapter-guide
**Inside Chapter 09**

- [01. The dependency that did not exist](#the-dependency-that-did-not-exist)
- [02. The job that disappeared](#the-job-that-disappeared)
- [03. Why systems hide their dependencies](#why-systems-hide-their-dependencies)
- [04. Shadow operations](#shadow-operations)
- [05. Discover before you change](#discover-before-you-change)
- [06. Make ownership visible](#make-ownership-visible)
:::

## The dependency that did not exist

A system can fail because a component is broken. It can also fail because a component that nobody knew existed has quietly stopped doing work that the business depends on.

The second kind of failure is harder to prevent because it does not appear in the architecture diagram. It may not be deployed through the normal pipeline. It may not have an owner, a runbook, an alert, or a line in the service catalogue. Yet every night, every month, or every time a customer takes an action, it changes the outcome.

Teams often assume that important work must be visible. If a job matters, somebody would have documented it. If a dependency is critical, it must be monitored. If a process touches production, it must be owned.

This is not how systems grow.

A short script becomes permanent because it solves an urgent problem. A scheduled task is installed directly on a server because the backlog is full. A spreadsheet becomes a reconciliation control. A service account gains one permission that no one later reviews. The local workaround works, so the organisation stops seeing it as a workaround.

By the time it fails, it is no longer a convenience. It is architecture.

## The job that disappeared

A logistics company rebuilt the server that hosted its ERP platform. The project was planned, tested, and completed within the expected maintenance window. The core application started. Users logged in. Orders were visible. Monitoring was green.

Three weeks later, finance noticed that a group of invoices had been produced with the wrong consolidation logic.

The missing dependency was a nightly cron job. Years earlier, a team member had installed it directly on the ERP server to prepare billing data before the morning batch. It was not part of the application repository. It was not represented in infrastructure code. It did not have an owner. It did not have an alert. The person who wrote it had left.

The rebuild did exactly what the team had specified. It did not recreate work that nobody had specified.

The incident was not caused by a careless command. It was caused by a model of the system that was incomplete. The server was visible. The ERP application was visible. The dependency that made invoices correct was invisible until it disappeared.

::: risk
**The cost of an invisible dependency**

An undocumented dependency does not fail loudly. It often continues to hide behind a system that appears healthy, while a downstream process slowly produces the wrong result.

The longer it remains invisible, the more likely the team is to discover it through a business exception instead of an operational signal.
:::

## Why systems hide their dependencies

Dependencies become invisible for predictable reasons.

**They are created outside the delivery path.** A script is copied to a host, a scheduler is changed by hand, or a service account is granted access from an administrator console. The work succeeds without leaving a trace in the repository that everyone recognises.

**They cross team boundaries.** An application depends on a vendor feed, a shared mailbox, a finance export, a network rule, or a platform identity managed by another team. Each group sees only its own part of the relationship.

**They are activated by time, not traffic.** A nightly job, month-end reconciliation, certificate renewal, or archive process may not appear during ordinary daytime testing. The system can look healthy until the calendar reaches the condition that matters.

**They have no named owner.** Ownership is assumed to be obvious because the dependency is small. Small dependencies are precisely the ones that survive without a review cycle.

**They are useful enough to keep and informal enough to avoid scrutiny.** The workaround does not feel like architecture until other processes begin to rely on it.

The absence of documentation is not proof that a dependency is unimportant. It is often evidence that it has escaped the organisation’s normal controls.

::: warning
**Three signs of a hidden dependency**

Look for work that runs outside the normal delivery path, work that only one person can explain, and work whose failure would first be noticed by a business team rather than an alert.

When all three signs appear together, do not wait for an incident. Treat the dependency as production architecture now.
:::

## Shadow operations

Not every important operation is visible in the operating model. The difference between the written system and the system that actually runs is where shadow operations live.

A shadow operation can be a cron job, a manual database export, a spreadsheet, an unowned queue consumer, a service account, a certificate renewal command, or a vendor process that someone checks by hand. The specific technology is less important than the condition: the work produces or protects a business outcome, but it is not represented with the same care as the rest of the service.

Shadow operations are not necessarily bad engineering. Many begin as sensible responses to urgency. The risk comes from leaving them unobserved after the urgency has passed.

The goal is not to eliminate every manual or small dependency. The goal is to decide consciously which ones are allowed to exist, who owns them, how they are observed, and how a change will preserve them.

::: concept
**Shadow Operations**

Production work that influences a business outcome but sits outside the organisation’s recognised delivery, ownership, monitoring, or documentation path.

Shadow operations become dangerous when the team cannot answer four questions: what triggers the work, what it depends on, who owns it, and how its result is verified.
:::

## Discover before you change

A dependency inventory is not a document you complete once. It is a change practice.

Before rebuilding a server, migrating a platform, retiring a queue, changing an identity provider, or rotating a critical key, walk outward from the outcome that the system supports. Ask what schedules it, what reads or writes its data, which identities call it, which exports leave it, which people perform manual steps around it, and which teams will notice first if it stops.

Then inspect the runtime, not only the diagram. Review scheduled jobs, startup scripts, service definitions, automation accounts, network flows, repositories, vendor configurations, and recent operational tickets. The goal is not exhaustive discovery in one sitting. The goal is to reduce the unknowns that could make a change look successful while it quietly breaks the business.

A useful inventory names the dependency, the outcome it affects, its owner, its trigger, its location, its verification signal, and the consequence of its loss. If you cannot fill in those fields, you have found work that needs attention.

::: tip
**Perform a dependency walk.** Before the next material change to a critical service, choose one user or business outcome and trace it through the system. Include scheduled work, service identities, handoffs, vendor calls, files, queues, and manual checks. For every dependency, record an owner and a signal that proves the dependency still completes its work.
:::

## Make ownership visible

Discovery without ownership only produces a longer list of worries. Once a dependency is found, the team must decide whether to absorb it into the supported architecture, replace it, retire it, or explicitly accept the risk for a limited time.

For dependencies that remain, ownership needs to be operational. A named team should be able to explain the dependency, change it safely, monitor its result, and participate in a recovery exercise. The dependency should appear in the same places as the service it supports: delivery records, runbooks, change reviews, and incident analysis.

This does not mean every small job needs a large platform. It means a small job that can corrupt invoices, block identity, or delay customer work deserves the proportionate controls that make its outcome visible.

::: operator-rule
1. **Inventory dependencies before material changes.** Do not approve a migration, rebuild, retirement, or major configuration change until the team has traced the scheduled, automated, identity, vendor, and manual work around the affected outcome.

2. **Assign an owner and a proof.** Every retained dependency needs a responsible team and a signal that confirms its result, not only that its process started.

3. **Turn recurring work into recognised architecture.** If a script, spreadsheet, or manual action repeatedly protects or produces a business outcome, bring it into the delivery, documentation, and review path.
:::

::: {.memorable-phrase}
The most dangerous dependency is the one you do not know exists.
:::

::: field-note
**Context**

A logistics platform rebuilt an ERP server during a planned maintenance window. The core application was tested and the visible service returned normally.

**What We Expected**

The rebuilt platform would preserve the work the previous host performed and billing operations would continue as usual.

**What Happened**

A nightly cron job that prepared billing consolidation did not return after the rebuild. It had been installed directly on the former host and was absent from the application repository, infrastructure records, and monitoring.

**What We Missed**

The rebuild review focused on visible services and user login. It did not trace the scheduled work and downstream business outcomes surrounding the ERP platform.

**What It Taught Us**

A change is not complete when the primary application starts. It is complete when the dependencies that make the business outcome correct are visible, owned, and verified.
:::

::: pullquote
“Systems do not only depend on what is written in the diagram. They depend on what still runs after everyone has forgotten why it was added.”
:::

::: keytakeaways
- Important production work can exist outside repositories, dashboards, and ownership models.
- Scheduled jobs, identities, vendor connections, and manual checks can be critical dependencies even when the core application is healthy.
- Material changes need a dependency walk that starts with the business outcome, not only the visible component.
- Every retained dependency needs an owner and a signal that proves its result.
- Repeated work that protects a business outcome is architecture, whether the organisation recognises it or not.
:::

::: {.next-chapter}
**When Temporary Becomes Architecture**

Hidden dependencies are often born as shortcuts that were meant to disappear. The next chapter examines what happens when temporary decisions become the structure nobody intended to build.
:::
