---
title: "Everything Was Green. Everything Was Broken."
part: "Part I: The System We See"
book: "Beyond the Firewall"
book_number: 1
chapter_number: 3
author: "Steve BA-NDOUWE"
date: "2026"
status: "draft"
memorable_phrase: "A component can respond perfectly and still be unable to complete the work that gives it a purpose."
concepts_introduced:
  - "Monitoring Illusion"
incidents_referenced:
  - "Trading_Cache_Deadlock"
---

::: {.impact-opener #everything-was-green-everything-was-broken number="03" title="Everything Was Green. Everything Was Broken."}
:::

::: chapter-guide
**Inside Chapter 03**

- [01. The order path that could not complete](#the-order-path-that-could-not-complete)
- [02. The question behind the check](#the-question-behind-the-check)
- [03. What a transaction proves](#what-a-transaction-proves)
- [04. Build a synthetic transaction](#build-a-synthetic-transaction)
- [05. Define failure from the outcome](#define-failure-from-the-outcome)
:::

## The order path that could not complete

A financial trading platform reported that its execution path was available. Connections opened. Pricing returned ordinary responses. Network probes and cache pings stayed within their expected range.

During a period of active trading, orders could be submitted but confirmation did not return in time for traders to act on it.

A cache lock had stalled the sequence that joined pricing, execution, and confirmation. The cache remained reachable and the pricing service continued to answer. The component signals were real. They simply did not prove that one order could complete.

This was not a monitoring outage. The checks ran exactly as designed. Their design proved a smaller condition than the team believed it proved.

::: operating-fact
A health check is evidence only for the condition it actually executes. It cannot certify work it never attempts.
:::

The failure became clear when the team followed one order from submission to an execution confirmation that a trader could use. That path included pricing, cache, execution, confirmation, and a response returned to the trading screen. The existing probes had inspected small steps. The trader depended on the whole path.

## The question behind the check

Every check asks a question, whether its name makes that clear or not.

A port check asks whether a network listener can be reached. A process check asks whether a process exists. A `SELECT 1` query asks whether the database can execute that query. A load-balancer probe asks whether the selected endpoint returned the expected response.

Those questions are useful because they reduce uncertainty quickly. They become harmful only when a team silently upgrades their meaning.

A successful `SELECT 1` does not prove that a real write can acquire its locks. A `200 OK` does not prove that the response contains usable data. A queue depth that remains low does not prove that a message is consumed by the service that should act on it.

The useful discipline is simple: write down the question behind every critical check. Then write the customer outcome that the check is supposed to protect. If the two sentences do not match, the check is diagnostic evidence, not service proof.

::: warning
**Do not promote a proxy into a verdict.**

A fast answer to a narrow probe can help locate a failure. It does not tell you that a customer can complete the work that matters.
:::

## What a transaction proves

A transaction is an observable path from a meaningful start to a meaningful completion.

For a login, the path may begin when credentials are sent and end when a session is established and the intended page is available. For an order, it may begin at submission and end when the customer receives a confirmation that the order system can honour. For a data synchronisation, it may begin with a source change and end when the target contains the expected record.

A transaction test does not need to prove every possible journey. It should prove one named outcome that the business cannot afford to lose without prompt detection.

During the same execution delay, the service checks, network probes, and cache pings still passed. Traders, however, waited up to forty-five seconds for an order confirmation.

Under a race condition, an internal cache lock was not released. The cache remained reachable. The pricing service still returned ordinary replies. But the order path waited on the locked sequence and missed the market window that made the trade worthwhile.

The missing evidence was not another component metric. It was a test of the outcome: *submit an order, receive a confirmation, measure the time to completion.*

::: concept
**MONITORING ILLUSION**

*The belief that a collection of component signals describes service health, even though the outcome that gives the service its purpose has not been tested.*

Monitoring illusion is created when the team confuses the evidence it has with the condition it needs to know.
:::

## Build a synthetic transaction

A synthetic transaction is a controlled attempt to complete a critical path and record the result. It gives the team an independent signal before a customer has to report the problem.

The test must be safe. It can use a dedicated account, a harmless record, a non-settling payment path, or an isolated message. Safety does not mean vagueness. The test still has to perform the same dependencies, permissions, validation, and response steps that make the real outcome meaningful.

::: tip
**At the next monitoring review, build one transaction test.**

Choose one outcome a customer would notice. Write its start event, completion event, acceptable completion time, test identity, frequency, and failure evidence. Run it through the production path without creating an irreversible business effect. If the test fails, alert on the named outcome before opening component graphs.
:::

A weak test says, “the service returned success.” A strong test says, “the expected record was created, received by the next service, and became visible where the user needs it.”

The difference is not more telemetry. It is a clearer claim.

## Define failure from the outcome

A component can remain useful while the service it supports has failed. That is why component monitoring remains necessary. It helps the team investigate the failed outcome, narrow the path, and isolate the relevant dependency.

But it cannot be the first definition of success.

Start from the outcome. Ask what the user attempted, what completion looks like, how long completion may take, and which evidence proves it occurred. Then decide which component signals help explain a failure of that outcome.

::: operator-rule
1. **At the next monitoring review, name one critical outcome.** Write the exact start and completion event in a sentence that a support engineer and an operator would both recognise.

2. **Run the smallest safe version of that outcome.** Use a dedicated identity or record, then retain the trace, identifier, and completion evidence produced by the test.

3. **Alert on outcome failure first.** When the test fails, begin by confirming the broken path. Use component signals to diagnose the cause, not to overrule the failure.
:::

The target is not a perfect model of every user journey. It is one proof that a named path can complete now, in the way the user needs. It does not promise that comparable attempts will keep succeeding across a population, a condition, and a time window. That is the separate question of reliability.

::: {.memorable-phrase}
A component can respond perfectly and still be unable to complete the work that gives it a purpose.
:::

::: field-note
**Context**

A financial trading platform maintained ordinary process, network, and cache responses during a period of order-execution delay.

**What We Expected**

If the platform could accept requests and each named component answered its probe, an order should complete within the expected window.

**What Happened**

A cache lock remained held during a race condition. The cache remained reachable and the pricing service continued to answer, but traders waited up to forty-five seconds for an execution confirmation.

**What We Missed**

Our checks proved that individual services could respond. They did not prove that pricing, cache, and execution could complete one order together.

**What It Taught Us**

The first useful proof is that the named path can complete at that moment. Component checks are the evidence that helps explain why that path failed.
:::

::: pullquote
“The first question is not whether the component is alive. It is whether the outcome a person depends on can still complete.”
:::

::: keytakeaways
- A health check proves only the condition it actually performs.
- Proxy signals are useful for diagnosis but cannot certify an outcome they never test.
- A synthetic transaction should name its start, completion, safe test identity, acceptable time, and evidence.
- Component signals help explain an outcome failure after the failure is known.
- A completed critical transaction proves a named path can complete now; it does not by itself make a promise about future conditions.
:::

::: {.next-chapter}
**When Monitoring Becomes a Comfort Blanket**

Incomplete evidence creates a technical blind spot. The next failure begins when an experienced team allows that blind spot to decide what it is willing to investigate.
:::
