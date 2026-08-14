---
title: "The Difference Between Working and Being Reliable"
part: "Part I: The System We See"
book: "Beyond the Firewall"
book_number: 1
chapter_number: 5
author: "Steve BA-NDOUWE"
date: "2026"
status: "draft"
memorable_phrase: "Working is a photograph. Reliability is a promise that must survive the conditions in which people depend on it."
concepts_introduced:
  - "Working vs. Reliable"
  - "Reliability Claim"
incidents_referenced:
  - "Streaming_Edge_Throttling"
---

::: {.impact-opener #the-difference-between-working-and-being-reliable number="05" title="The Difference Between Working and Being Reliable"}
:::

::: chapter-guide
**Inside Chapter 05**

- [01. A service that passed once](#a-service-that-passed-once)
- [02. The four boundaries of a reliability claim](#the-four-boundaries-of-a-reliability-claim)
- [03. The pattern behind the result](#the-pattern-behind-the-result)
- [04. What a user can depend on](#what-a-user-can-depend-on)
- [05. Review the promise every week](#review-the-promise-every-week)
:::

## A service that passed once

At 09:00, the streaming platform started a video quickly. At 14:00, it did the same. The release had completed, the service was accepting traffic, and the first checks after deployment showed no abnormal condition.

At 20:00, when viewers arrived for a live event, time to first frame became unpredictable. Some sessions started normally. Others waited long enough for viewers to abandon the stream. The service had worked all day. It had not been dependable when the condition that mattered arrived.

This is the difference between working and being reliable.

Working describes a result at one point in time. Reliable describes whether a defined result keeps occurring for the people, paths, and conditions the team has agreed to serve.

A successful test after a deployment is useful. It is not a reliability claim. A reliability claim begins only when the team can say what success means, for whom it must happen, under which conditions, and across what period.

::: operating-fact
A successful result proves that one attempt worked. Reliability begins when the team can explain what comparable attempts should do next.
:::

## The four boundaries of a reliability claim

A useful reliability claim has four boundaries.

**Outcome.** Name the result rather than the component. “A viewer reaches first frame” is an outcome. “The media service is available” is a broad statement that needs more definition.

**Population.** State whose attempts count. Does the claim cover all viewers, authenticated viewers, a region, a subscription tier, a mobile application, or a known partner integration? A claim that ignores the affected population can look healthy while excluding the people who carry the consequence.

**Conditions.** State the meaningful load, dependency state, data shape, or event that tests the promise. A service can be dependable for a normal weekday and unreliable during a live event, a month-end batch, or a regional dependency failure.

**Time window.** State the period that makes the claim useful. A five-minute view can show an ordinary moment. A weekly view can hide a recurring degradation. The right window follows the rhythm of the work the service supports.

::: concept
**RELIABILITY CLAIM**

*A defined promise that an outcome will succeed for a stated population, under known conditions, across a meaningful time window.*

A reliability claim is stronger than “the service works” because its limits are visible. It tells the team what evidence to collect and what degradation it must not dismiss as normal.
:::

The four boundaries prevent false confidence in both directions. They stop teams from calling one good request proof of reliability. They also stop teams from creating a universal target that ignores the conditions their users actually experience.

## The pattern behind the result

Reliability is visible in the shape of outcomes over time.

A live stream that succeeds for most viewers but repeatedly stalls for users in one region has a pattern. An order path that completes quickly except during inventory synchronisation has a pattern. A data pipeline that produces correct records except after a schema change has a pattern.

The pattern is where operations becomes useful. It tells the team whether the degradation is random, periodic, conditional, regional, or connected to a dependency. A single average can smooth away that information.

Do not begin with a percentage because a percentage is easy to report. Begin with the failure shape that a user experiences. Then choose the measure that lets the team see that shape early enough to act.

For the streaming platform, the useful measure was not whether servers remained available. It was time to first frame, separated by viewer location and the peak event window. That view revealed edge throttling that ordinary server telemetry could not explain.

::: warning
**Averages can conceal the condition you promised to handle.**

A result that is acceptable in aggregate can still be unacceptable for a defined population at the time the outcome matters most. Keep the slice that carries the consequence visible.
:::

## What a user can depend on

Users do not need an abstract assurance. They need a dependable result.

For one service, that result may be a confirmed order. For another, it may be a record that is current enough to make a decision. For a clinical application, the outcome may be correct access to a patient record without uncertainty about freshness. The relevant detail changes. The discipline does not.

The team must decide what delay, error, stale result, or partial completion a user can tolerate before the service has failed its promise. That decision cannot be copied from another company’s status target. It belongs to the consequence of this specific outcome.

An SLI is useful when it measures the chosen result. An SLO is useful when it expresses a sustainable target for that result. Neither should become a decorative number. Their purpose is to trigger a decision before users absorb more cost than the organisation has agreed to accept.

## Review the promise every week

Reliability does not improve because a team writes a target once. It improves when the team revisits the claim against new evidence.

Choose one critical outcome and run a short weekly review. Look at the outcome by the population and condition that carry risk. Find the worst recurring slice, not only the overall average. Ask whether the user promise still matches the current product, dependency, and traffic pattern.

::: tip
**Review one reliability claim this week.**

Write one outcome, population, condition, and time window on a single page. Pull the recent evidence for that exact slice. Mark the slowest or least reliable recurring condition. Assign one verification or improvement that changes the next week’s evidence, then review the same claim again.
:::

The review is not an exercise in blame. It is how a team discovers that its promise has changed before the user discovers it through a failure.

::: operator-rule
1. **This week, write one reliability claim.** Name the outcome, the population that matters, the condition that tests the promise, and the time window that makes the evidence meaningful.

2. **Inspect the failure shape, not only the average.** Separate the data by the region, dependency, product action, or peak period that carries the consequence.

3. **Turn the claim into a decision.** When the chosen slice degrades, pause or adapt the change that increases risk, investigate the path, and record what must improve before the promise is trusted again.
:::

A reliable service is not one that never varies. It is one whose expected outcome, limits, and degradation are visible enough for the team to act before trust is lost.

::: {.memorable-phrase}
Working is a photograph. Reliability is a promise that must survive the conditions in which people depend on it.
:::

::: field-note
**Context**

A streaming platform completed normal playback tests throughout the day. The production release appeared stable before a live event began.

**What We Expected**

If viewers could start a stream after the release, the service would remain dependable through the event.

**What Happened**

Time to first frame became unpredictable for viewers routed through one edge region. Some sessions began normally while others waited long enough for viewers to abandon playback. The pattern appeared only during the event window.

**What We Missed**

We had treated a successful early test as a reliability statement. We had not defined the affected population, the peak condition, or the time window that made the promise meaningful.

**What It Taught Us**

Reliability belongs to a specific outcome under specific conditions. A single successful result is evidence of possibility, not evidence of dependable service.
:::

::: pullquote
“Users do not depend on the fact that a service worked once. They depend on the conditions under which it will work again.”
:::

::: keytakeaways
- Working describes one result; reliability describes a dependable pattern of results.
- A reliability claim needs an outcome, population, conditions, and a meaningful time window.
- Failure shape often teaches more than an average because it reveals the slice carrying the consequence.
- SLI and SLO are useful only when they express a user promise and trigger a practical decision.
- A weekly review keeps the promise aligned with the service users experience now.
:::

::: {.next-chapter}
**Availability Is Not Resilience**

A reliability claim defines the result a team promises to sustain. The next question is what happens when that result cannot be sustained and the service must recover to an acceptable state.
:::
