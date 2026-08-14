---
title: "Availability Is Not Resilience"
part: "Part I: The System We See"
book: "Beyond the Firewall"
book_number: 1
chapter_number: 6
author: "Steve BA-NDOUWE"
date: "2026"
status: "draft"
memorable_phrase: "Availability tells you whether a system answered. Resilience tells you what the system does after the answer is no."
concepts_introduced:
  - "Resilience Margin"
incidents_referenced:
  - "FiveNines_First_Failover"
  - "Read_Only_Checkout_Failure"
---

::: {.impact-opener #availability-is-not-resilience number="06" title="Availability Is Not Resilience"}
:::

::: chapter-guide
**Inside Chapter 06**

- [01. The seduction of the nines](#the-seduction-of-the-nines)
- [02. Availability is defensive](#availability-is-defensive)
- [03. Resilience is offensive](#resilience-is-offensive)
- [04. The MTTR trap](#the-mttr-trap)
- [05. The read-only failure](#the-read-only-failure)
- [06. Design for recovery](#design-for-recovery)
:::

## The seduction of the nines

At 08:30, the service review opened with a number everyone recognised: **99.99% availability over thirty days**. It appeared in the board pack, the operations report, and the weekly status slide. The number was clean enough to end a conversation.

At 08:47, support escalated a different story. Customers could sign in, browse the catalogue, add items to a basket, and inspect their order history. They could not complete a checkout. The platform had not disappeared. It had stopped completing the transaction that paid for its existence.

The availability figure was not false. The interpretation was.

Five nines can be an excellent engineering target when it is attached to a precise service and a precise consequence. It becomes a comfort object when it is treated as proof that users are safe. A service may answer every health check, stay reachable on the network, and still leave every important user action unfinished.

Availability tells you whether something was present. It does not, by itself, tell you whether the service remained useful.

## Availability is defensive

Availability is a defensive measure. It records how often a defined service was not declared unavailable. That definition matters more than the decimal places.

A ping can establish that a host responds. A health endpoint can establish that a process is running. A successful read query can establish that a database is reachable. None of these tests establish that a customer can pay, a clinician can retrieve a record, or an operator can apply a safe change.

Partial failure lives in this gap. A service can be slow enough to force users to abandon it. It can return stale data that causes the next decision to be wrong. It can accept requests but drop the work before completion. If the measurement only asks whether a component responded, each of these failures can sit behind a green indicator.

Availability is necessary. It is the floor, not the ceiling.

::: concept
**Availability vs. Resilience**

**Availability** measures whether a defined service is reachable or responds according to an agreed condition. It is usually defensive and often binary.

**Resilience** measures the system’s ability to detect disturbance, contain its impact, recover to an acceptable state, and preserve the user outcome where possible. It is continuous, behavioural, and tested under stress.

One measures presence. The other measures the capacity to remain useful when presence is no longer enough.
:::

## Resilience is offensive

Resilience does not mean that failures never occur. It means the system has been designed with failure in mind before the incident arrives.

A resilient service detects a meaningful change quickly. It degrades deliberately instead of collapsing everywhere. It restores a safe state with as little manual intervention as possible. It records what happened so that the next failure is smaller, shorter, or easier to understand.

This is why resilience is offensive. It does not wait for a component to die and then celebrate the restart. It creates recovery paths, failure boundaries, and exercises before the system is under pressure.

The useful question is not, “Can this component stay up?” It is, “When this component fails in a believable way, what does the user still get, how quickly do we know, and how do we regain an acceptable service?”

::: tip
**Define a resilience margin.** For every critical journey, write down the minimum acceptable outcome during disturbance: complete service, delayed service, read-only access, queued work, or an explicit refusal. That margin makes degraded mode a design decision rather than an improvised apology.
:::

## The MTTR trap

Mean Time To Recovery is important because long recovery turns a contained failure into a user event. It is not, however, a substitute for thinking.

A low average can conceal a severe outlier. A short recovery for a non-critical component can say nothing about the recovery of checkout, identity, or data integrity. A team can also reduce an MTTR report by changing the moment at which the clock starts while users are still waiting.

Use recovery time with the rest of the story: the frequency of failure, the number of affected users, the integrity of the result, the quality of the degraded mode, and the recovery objective that the business can actually tolerate.

Two systems cannot be compared by uptime and MTTR alone. A service that fails briefly every week may be preferable to one that fails rarely but turns a whole afternoon into manual work. The comparison becomes meaningful only when both systems are measured against the same user journey and the same consequence.

::: warning
**The curse of the nines**

Chasing another decimal place can consume the time that should have gone into recovery. Teams build expensive failover paths that they never exercise, then discover that the first real recovery takes hours because access, data, ownership, or decision rights were missing.

Do not trade a rehearsed recovery for an impressive percentage. A recovery path that has never run is only an assumption with a diagram.
:::

## The read-only failure

The e-commerce incident did not begin as a visible outage. A transaction log reached its limit, and the database moved into a protected read-only state.

The platform still looked healthy to most of the monitoring stack. Product pages loaded. Search worked. Caches responded. The application nodes remained reachable. Every dashboard associated with infrastructure availability stayed green.

Checkout could not write an order.

This is the read-only failure: the system preserves enough of its surface to look alive while losing the action that matters. It is particularly dangerous because it rewards the wrong kind of observation. The team sees green components and assumes the user is protected. The user sees a basket that will not become an order.

A read-only state may be the correct protection for data. The failure is not the protective state itself. The failure is treating it as normal availability when the promised journey requires a successful write.

::: risk
**A reachable service can still be unavailable**

If a system can browse but cannot create, update, pay, approve, or record the action it exists to perform, it is unavailable for that journey. Do not let a component-level health check overrule the outcome the user was promised.
:::

## Design for recovery

Recovery is designed long before an incident. It begins with the failure modes the team is willing to name.

Start with detection. Which signal exposes the failure before support calls arrive? For a payment journey, it may be a synthetic transaction that completes and verifies the result. For a data platform, it may be a write followed by a read from the path users actually depend on.

Then design the response. Decide which work can queue, which requests should fail clearly, which functions can remain read-only, and which dependencies must be isolated before they pull the rest of the service down with them.

Finally, rehearse the restoration. A runbook that exists only as prose has not yet become a recovery capability. The people, permissions, scripts, rollback paths, and decision thresholds must all work together under a time limit.

::: tip
**Run a game day for the slow failure.** Introduce one believable degradation: a cache that becomes read-only, a dependency that responds after five seconds, or a secondary data path that disappears. Observe the user journey, the alerts, the first decision, and the time to acceptable service. This is not a performance test. It is a survival test.
:::

::: operator-rule
1. **Measure recovery at the user journey.** Define a recovery objective for each critical outcome, including the time to detect, the time to decide, and the time to acceptable service.

2. **Automate the repeatable repair.** When a recovery requires the same manual sequence more than once, turn the safe part into a tested script or workflow. Keep the human decision where judgement is still required.

3. **Design the degraded mode before the outage.** For every critical dependency, decide what remains possible when it is slow, read-only, absent, or corrupt. A dependency without a degradation plan is an unpriced single point of failure.
:::

::: {.memorable-phrase}
Availability tells you whether a system answered. Resilience tells you what the system does after the answer is no.
:::

::: field-note
**Context**

Peak sales period on a commerce platform. The primary dashboards showed every service as available.

**What We Expected**

A green availability board meant customers could complete the purchase journey and revenue would continue to flow.

**What Happened**

A transaction-log protection moved the order database to read-only mode. Customers could browse, search, and fill baskets, but checkout could not create an order.

**What We Missed**

The team monitored reachability, CPU, and successful reads. No synthetic transaction verified that an order could be written and confirmed through the same path as a customer.

**What It Taught Us**

A system can be technically present and operationally absent. Availability must be measured against the business action the service exists to complete.
:::

::: pullquote
“A service that stays up but cannot complete the work is not available in the way users need.”
:::

::: keytakeaways
- Availability is a service definition, not a universal proof of usefulness.
- Resilience is expressed through detection, containment, recovery, and learning under disturbance.
- MTTR matters only when it is attached to a journey, an impact, and an agreed recovery objective.
- A read-only or stale-data state may protect components while still failing the business outcome.
- Recovery paths become real only when teams rehearse them with the permissions, scripts, and decisions they will need.
:::

::: {.next-chapter}
**Hope Is Not a Rollback Strategy**

A system may recover from failure and still fail the next change. In Part II, we move from visible service health to the hidden assumptions that decide whether a rollback, a runbook, or a familiar procedure will work when the pressure is real.
:::
