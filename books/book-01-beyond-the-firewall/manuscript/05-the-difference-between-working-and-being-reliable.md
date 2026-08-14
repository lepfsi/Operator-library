---
title: "The Difference Between Working and Being Reliable"
part: "Part I: The System We See"
book: "Beyond the Firewall"
book_number: 1
chapter_number: 5
author: "Steve BA-NDOUWE"
date: "2026"
status: "draft"
memorable_phrase: "Working is a photograph. Reliability is a trajectory."
concepts_introduced:
  - "Working vs. Reliable"
incidents_referenced:
  - "Streaming_Edge_Throttling"
---

::: {.impact-opener #the-difference-between-working-and-being-reliable number="05" title="The Difference Between Working and Being Reliable"}
:::

::: {.chapter-guide}
**Inside Chapter 05**

- [01. The false equivalence](#the-false-equivalence)
- [02. Working is a snapshot](#working-is-a-snapshot)
- [03. Reliability is a pattern](#reliability-is-a-pattern)
- [04. The dimension of time](#the-dimension-of-time)
- [05. The user’s definition](#the-users-definition)
- [06. Measure the outcome](#measure-the-outcome)
:::

## The false equivalence

Operations teams often use *working* and *reliable* as if they mean the same thing. A server answers a ping, so it is working. A process is running, so the service is healthy. A status endpoint returns `200 OK`, so the system can be trusted.

Those statements describe a moment. They do not describe a dependable service.

Working is a binary state. A component answers or it does not. A port is open or closed. A process is present or absent.

Reliability is a pattern of outcomes. A system is reliable when it delivers the expected result, within an acceptable time, for a defined proportion of meaningful attempts, across a period that matters to the people depending on it.

One is a photograph. The other is a trajectory.

Confusing them is not a semantic error. It changes what the team looks at, what it measures, and what it accepts as evidence. It is why many systems remain technically alive while users quietly stop trusting them.

## Working is a snapshot

A component is working right now. It responded to the last health check. CPU is below threshold. Memory is not exhausted. The process has not crashed.

None of that tells you whether it will work in the next minute, under the next batch, or for the specific request a user is about to make. It says nothing about correctness, freshness, completeness, or the ability to complete the transaction that gives the service its purpose.

Consider a database. It responds to `SELECT 1` in one millisecond. That is a successful health check. It may still reject every `INSERT` because the transaction log is full.

Consider a load balancer. Its status endpoint returns `200 OK`. It may still route forty percent of traffic to a backend that returns errors.

Working is the lowest bar a system can clear while remaining technically alive. It is useful evidence, but it is not a reliability claim.

::: concept
**WORKING VS. RELIABLE**

*Working is a point-in-time component state. Reliable is an end-to-end property: the expected outcome succeeds, within an accepted tolerance, repeatedly and over a defined time window.*
:::

## Reliability is a pattern

Reliability cannot be observed from a single event. It emerges from a sequence. The latest successful request is a data point. The shape of many requests is evidence.

To make a reliability claim, the team needs three things.

First, define success. Does the service need to complete an order, return accurate data within 300 milliseconds, or synchronise a file without corruption? “The API is up” is not a definition of success.

Second, define the population. One successful transaction is noise. A representative stream of transactions gives the team a signal. The sample must include the paths, locations, and loads that users actually experience.

Third, define the time window. Reliable over the last five minutes is not the same claim as reliable during month-end, a peak sale, or the weekly batch job. A service can look calm in the morning and fail predictably every afternoon.

Without these definitions, *reliable* is only an encouraging adjective.

## The dimension of time

The working and reliable distinction becomes operationally important when conditions change.

A component that works today can fail tomorrow. A service that works at 09:00 can degrade at 14:00 when the batch job starts. A queue that clears under normal traffic can become a bottleneck when retries arrive faster than consumers can process them.

Reliability is therefore a disciplined prediction. When a team says a service is reliable, it is making a claim about the next request based on the behaviour of comparable requests under known conditions.

That prediction must include its limits. A system may be reliable for authenticated users in one region, under normal load, with its primary dependency available. State the conditions. Otherwise the reliability claim will be mistaken for a guarantee.

::: warning
A service can meet a monthly availability target and still fail completely during the five minutes that matter most. Averages hide tails. Users do not experience an average latency. They experience the slow request in front of them.
:::

## The user’s definition

The user does not care whether the component is working. The user cares whether the outcome is dependable.

From the user’s perspective, working means: “I clicked the button and the thing I expected happened, in the time I expected.”

If the server is up but the page takes eight seconds to load, the service is not reliable for that interaction. If the database responds but an order is corrupted, the service is not reliable. If an API returns `200 OK` but the data is stale, the service has only satisfied the wrong measure.

The user never sees the dashboard. The user sees the result.

## Measure the outcome

The practical move is to stop treating input metrics as the final measure of health. CPU, memory, disk, and process state are useful for diagnosis. They are not the outcome.

Start from the successful user transaction instead. For each critical service, write a short sentence that describes the happy path in observable terms.

::: tip
**DEFINE THE HAPPY PATH**

Write one success sentence for every critical service. For example: “An authenticated user submits an order with three items. The system validates stock, calculates price, records the order, and returns a receipt within two seconds.”

Measure the success rate and latency of that transaction. Then decide what level of failure, delay, or stale data users can actually tolerate.
:::

That sentence becomes the basis for a Service Level Indicator, or SLI. The indicator measures what happened on the path that matters. A Service Level Objective, or SLO, states the level of performance the team has agreed to sustain. Neither number should be copied from another company. Both should be derived from the cost of failure for this service and its users.

## The paradox of working

There is a cruel irony in optimisation. A team that optimises only for components being alive can make the overall service less dependable.

Longer timeouts keep a request open, but they also make users wait longer and hold resources that other requests need. Aggressive retries can hide a short failure, then amplify it into a load spike. Redundancy can keep individual nodes available while hiding a shared dependency that will eventually fail every replica at once.

Reliability requires accepting that some failures must be visible. It requires fast, understandable degradation rather than a system that responds slowly and incorrectly for weeks.

::: warning
Retries without limits, timeouts without budgets, and health checks that observe only lifecycle create systems that appear alive while operating far below an acceptable standard. The component is working. The user is still suffering.
:::

::: operator-rule
1. **Define one user-centred indicator.** For every critical service, identify a successful transaction and measure its success rate, latency, correctness, or freshness.

2. **Choose an objective that fits the consequence.** Set the tolerated failure rate and delay from the cost to the user and business, not from a default number copied into a dashboard.

3. **Use the error budget to change behaviour.** When the agreed reliability margin is consumed, pause risky change, investigate the transaction path, and repair the outcome before adding more work.
:::

A reliability practice is not a promise that failure will disappear. It is a promise that the team will know what success means, recognise degradation early, and make decisions before users absorb the cost.

::: field-note
**Context**

Streaming platform. Every media server reported healthy: low CPU, ample memory, and successful local checks.

**What We Expected**

Users could start and play content without interruption because the infrastructure looked quiet under load.

**What Happened**

Users reported buffering every thirty seconds. Time to first frame had degraded from 800 milliseconds to 2.4 seconds. The servers were still working perfectly by their own measures.

**What We Missed**

A CDN provider was throttling the edge cache. Local servers answered health checks, but retrieval from the origin was timing out. No owned component looked failed. The video outcome was failing.

**What It Taught Us**

Working is local. Reliability is end-to-end. If you only monitor components you own, the most important failure may be in the dependency you do not control.
:::

::: {.memorable-phrase}
Working is a photograph. Reliability is a trajectory. One captures a moment. The other tells you whether the next request deserves trust.
:::

::: pullquote
If the system is working but the user is waiting, the system is not reliable. You have defined success by the wrong measure.
:::

::: keytakeaways
- A component can be alive and still fail the transaction that users need.
- Reliability needs a defined outcome, a representative population, and a meaningful time window.
- Averages conceal tails, and tails are often where users experience the failure.
- The happy path is a better source of truth than a component status endpoint.
- Reliability improves when teams expose degradation rather than keeping unhealthy behaviour technically alive.
:::

::: {.next-chapter}
**Availability Is Not Resilience**

Reliability helps a system deliver predictable outcomes. Resilience begins when a failure still reaches the system and the organisation must recover without losing its ability to operate.
:::
