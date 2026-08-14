---
title: "Everything Was Green. Everything Was Broken."
part: "Part I: The System We See"
book: "Beyond the Firewall"
book_number: 1
chapter_number: 3
author: "Steve BA-NDOUWE"
date: "2026"
status: "draft"
memorable_phrase: "Green means the system responded. It does not mean the system worked."
concepts_introduced:
  - "Monitoring Illusion"
incidents_referenced:
  - "Streaming_Authentication_Deadlock"
  - "Trading_Cache_Deadlock"
---

::: {.impact-opener #everything-was-green-everything-was-broken number="03" title="Everything Was Green. Everything Was Broken."}
:::

::: {.chapter-guide}
**Inside Chapter 03**

- [01. The green paradox](#the-green-paradox)
- [02. What monitoring actually checks](#what-monitoring-actually-checks)
- [03. The case of the silent deadlock](#the-case-of-the-silent-deadlock)
- [04. Why thresholds fail](#why-thresholds-fail)
- [05. Test the transaction, not the component](#test-the-transaction-not-the-component)
- [06. The signal that matters](#the-signal-that-matters)
:::

## The green paradox

It was a Wednesday afternoon. A streaming platform had reported 99.9 percent availability for six months. Its dashboard looked calm: CPU nominal, memory stable, network latency within range, every major component green.

For four hours, users had been unable to sign in.

The operations team was staring at the dashboard because the dashboard was the evidence they had. They paged the network team, checked the load balancer, and considered whether an attack was underway. Nothing in the visible telemetry supported the failure customers were reporting.

There was no attack. One authentication database had entered a deadlock state. It still accepted connections. It still answered the health check. It was technically alive, but it could no longer complete a login transaction.

The check verified that a port was open. The user transaction verified that the system could think.

The dashboard was green. The business was broken.

::: warning
A green alert is not proof of health. It proves only that a component answered the question it was asked. If the question is “are you alive?”, a “yes” says nothing about whether the component can still do its work.
:::

## What monitoring actually checks

Most monitoring tools are built to answer a narrow question: is the component running? They measure CPU, memory, disk space, process state, packet loss, and network latency. These are useful signals, but they are proxy signals. They suggest health. They do not prove it.

A database can return `SELECT 1` in two milliseconds and still reject a real write because a lock is blocking the transaction. A load balancer can return `200 OK` and still route most traffic to a backend that cannot complete the request. A firewall can show zero dropped packets and still deny the specific API call that matters to a customer.

A system is not a collection of components. It is a collection of transactions. The useful question is not whether the process exists. It is whether the transaction completes within a time the user can accept.

## The case of the silent deadlock

I was called into a financial trading firm with a version of the same failure. Its monitoring dashboard was impressive: real-time, colour-coded, and built around every major service. Every indicator was green. The platform had run for years without a visible infrastructure outage.

Traders were still seeing execution delays of up to forty-five seconds. In a trading system, forty-five seconds is long enough to miss the market window that made the order worthwhile.

We traced the transaction instead of reading the dashboard. The order service called a pricing service. The pricing service called a cache. Under one particular race condition, an internal cache lock was not released. The cache still answered pings. The service still reported healthy. The light never turned yellow, let alone red.

We found the failure by rebuilding the transaction path. The dashboard had been describing components. The incident was happening between them.

::: tip
Do not test system health with only a ping or `SELECT 1`. Run a synthetic end-to-end transaction at a useful frequency. If the critical transaction fails, the service is down, even when every component remains green.
:::

## Why thresholds fail

Teams like thresholds because they are easy to read. CPU at 80 percent means warning. Memory at 90 percent means critical. Disk usage at 95 percent means alert. Those values feel objective because they are numbers.

The problem is that thresholds assume a direct relationship between a resource metric and the user experience. That relationship is often weak.

A CPU at 60 percent can be a deadlock loop. A CPU at 85 percent can be normal during a scheduled batch. Disk I/O can stay low while a database is heavily locked. Network latency can be perfect while an application waits for a third-party API that has stopped responding.

Thresholds are trained on average behaviour. Outages are created by exceptional behaviour. A normal graph cannot explain the edge case that is breaking a user now.

## Test the transaction, not the component

The answer is not to add more thresholds. It is to change the source of truth.

::: concept
**MONITORING ILLUSION**

*The belief that component-level signals describe service health, even when the user transaction that gives the service its purpose has already failed.*
:::

Transaction-dependent health starts from the outcome that matters. If users submit an order, measure the time from **Submit** to **Order Confirmed**. If users log in, measure the time from **Credentials Sent** to **Dashboard Rendered**. If a system synchronises data, measure the time from **Source Change** to **Target Updated**.

This kind of test crosses the dependencies that component checks leave apart. It follows authentication, queues, caches, databases, APIs, and rendering as the user experiences them. It is not perfect. It is much closer to the service you are actually responsible for.

## The signal that matters

When the transaction becomes the source of truth, the colour of the dashboard becomes secondary. A working transaction tells you the path currently works. A failed transaction tells you something customers need is broken, even if you do not yet know where.

::: operator-rule
1. **Run a synthetic transaction.** Execute the critical business path every sixty seconds or at another frequency that matches the cost of delay.

2. **Alert on transaction failure.** Page the right team when the user outcome fails, not only when a CPU or memory threshold changes.

3. **Trace one failed path each month.** Spend thirty minutes following a real failed transaction through its dependencies. Record every undocumented handoff you discover.
:::

These actions do not replace component monitoring. They place it in the right position. Component signals help diagnose the failure. The transaction tells you that there is a failure worth diagnosing.

::: warning
A successful synthetic transaction is not proof that every user journey works. A failed synthetic transaction is proof that at least one critical journey is broken. Treat it as early detection, not as a certificate of complete health.
:::

::: field-note
**Context**

Financial trading firm, real-time order execution. Every infrastructure dashboard was green.

**What We Expected**

If the platform had a meaningful problem, CPU, memory, network, or process health would expose it.

**What Happened**

Traders experienced forty-five-second execution delays. A cache lock was deadlocked but the cache still answered pings and health checks.

**What We Missed**

The health check measured the service lifecycle. It did not measure the transaction logic that joined pricing, cache, and execution.

**What It Taught Us**

If the transaction fails, the system is down. The colour of the LED does not change that fact.
:::

The dashboard did not lie maliciously. It answered the questions it had been asked. The failure was that the organisation treated those answers as the whole truth.

::: {.memorable-phrase}
Green means the system responded. It does not mean the system worked for the person waiting at the end of the transaction.
:::

::: pullquote
The dashboard describes components. The incident happens between them, on the path the user is trying to complete.
:::

::: keytakeaways
- A component health check proves only that the component answered a narrow question.
- Transaction health follows the outcome that gives the service its purpose.
- Thresholds describe normal behaviour; outages often live in exceptional behaviour and dependency gaps.
- Synthetic transactions give early evidence of a broken critical path.
- The transaction is the source of truth. Component signals help diagnose it.
:::

::: {.next-chapter}
**When Monitoring Becomes a Comfort Blanket**

Green dashboards do more than describe a system. They can make teams emotionally dependent on the feeling of control they provide.
:::
