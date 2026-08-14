---
title: "The Cost of Tribal Knowledge"
part: "Part III: Operating Reality"
book: "Beyond the Firewall"
book_number: 1
chapter_number: 12
author: "Steve BA-NDOUWE"
date: "2026"
status: "draft"
memorable_phrase: "Knowledge that exists only in someone's head is not organizational knowledge."
concepts_introduced:
  - "Human SPOF"
incidents_referenced:
  - "Solo_Engineer_Blackout"
---

::: {.impact-opener #the-cost-of-tribal-knowledge number="12" title="The Cost of Tribal Knowledge"}
:::

::: chapter-guide
**Inside Chapter 12**

- [01. The expert who was not there](#the-expert-who-was-not-there)
- [02. The knowledge that walks out the door](#the-knowledge-that-walks-out-the-door)
- [03. The architecture in people’s heads](#the-architecture-in-peoples-heads)
- [04. Capability is observed work](#capability-is-observed-work)
- [05. The cost of concentration](#the-cost-of-concentration)
- [06. Map and prove critical capability](#map-and-prove-critical-capability)
:::

## The expert who was not there

The payment platform needed a critical security patch. The change itself was not unusual. The patch had been evaluated, the maintenance window was available, and the team understood why the work mattered.

Then they reached the deployment step.

Only one senior engineer knew how to complete the release safely. The deployment involved an order of operations that was not in the pipeline, a service identity whose purpose was poorly understood, and a manual verification step known only from past incidents. That engineer was on emergency leave.

The team did not lack intelligent people. They lacked a shared path to act with confidence.

The patch waited. Each day increased the exposure, but no one wanted to guess at a production deployment with money movement behind it. When the engineer eventually returned, the change was completed quickly. The difficulty had never been the command. It had been the knowledge that made the command safe.

This is not a failure of the person who knew the system well. It is a failure of the system that allowed essential capability to be held by only one person.

## The knowledge that walks out the door

Every operating team relies on knowledge that is not fully written down. People learn which signal matters first, which dependency is fragile, which customer path has unusual constraints, and which fix is safe only under certain conditions.

That context is valuable. It is often what allows an experienced operator to see a pattern before the rest of the team sees it.

The problem begins when the organisation confuses personal expertise with organisational capability. A person may know how the system works. The team does not reliably possess that knowledge until other people can find it, understand it, test it, and use it under the conditions that matter.

Knowledge concentration creates a gap between a system that works while a particular person is present and a system that can be operated by the team that is supposed to own it.

People leave, take leave, change roles, forget details, and cannot be on every incident call. None of this is exceptional. A resilient operating model plans for it.

## The architecture in people’s heads

Ask several people to explain a critical service without opening a diagram. Listen for the corrections that appear after the first explanation.

“There is also that scheduled export.”

“That certificate is renewed differently.”

“The database can fail over, but only after this queue drains.”

Those corrections are not embarrassing. They are evidence. They show where the real architecture exceeds the architecture the team has made visible.

Some of this knowledge cannot be compressed into a single document. It comes from judgment, history, and patterns seen over time. The aim is not to pretend that every person will hold every detail. The aim is to make the critical paths, constraints, and decisions available to more than one person.

A team does not need universal expertise. It needs sufficient shared capability to operate, recover, and change the services it owns without waiting for one individual to become available.

::: risk
**The risk of concentrated capability**

When only one person can safely deploy, recover, approve, or explain a critical service, that person becomes a human single point of failure.

The risk is not the person. The risk is the absence of a tested second path when that person is unavailable.

Treat concentrated knowledge as an operational dependency: identify it, assign a plan, and verify that the team can work without it.
:::

## Capability is observed work

Text can support a transfer. It cannot prove that a second operator has acquired the judgment, access, and context needed to act safely.

The transfer happens when someone other than the expert leads a realistic operation, explains the choices, reaches the verification point, and exposes the question that no page answered. Documentation should capture that evidence. Chapter 13 addresses how the record stays current. This chapter asks a different question: can the team perform the work without waiting for the expert?

::: warning
**The hero trap**

Organisations often reward the person who resolves every difficult incident alone. That reward can unintentionally preserve the dependency.

Recognise the expert who makes other people capable: the one who pairs, hands over a real decision, observes another operator lead the path, and creates a second way to act.
:::

## The cost of concentration

The cost of concentrated knowledge rarely appears as a line item. It appears as delayed maintenance, cautious changes, long bridge calls, and a team that waits for one name before moving.

It also changes behaviour. People avoid touching services they do not understand. They route questions to the same expert. They postpone improvements because they do not know which dependency will react. Over time, the expert becomes more overloaded and the rest of the team gets fewer opportunities to learn.

This cycle creates an operating bottleneck. The organisation may still have excellent engineers, strong tooling, and good intent. But its ability to act is limited by where the knowledge happens to sit.

The measure that matters is not how many pages exist in a wiki. It is whether more than one person can execute and explain the critical work without improvising under pressure.

::: concept
**Human SPOF**

A human single point of failure exists when a critical operational outcome depends on the availability of one person’s unshared knowledge, judgment, access, or authority.

It does not mean the person is a problem. It identifies a concentration risk that the team must reduce through shared practice and verified capability.
:::

## Map and prove critical capability

Knowledge transfer works best when it follows real work.

First, make the capability visible. For one critical outcome, name the work the team must perform, the people who can lead it, the access it needs, the evidence that proves it worked, and the next scenario that will test the second path.

Choose one critical path. Pair an experienced operator with a second person. Begin with a scenario: deploy a change, recover a service, rotate a credential, or investigate a known failure. Ask the expert to explain what they look for, which assumption could be wrong, and what evidence would make them stop.

Then reverse the roles. The second person leads the activity while the expert observes. The observer corrects gaps, but the learner must make the decisions, perform the checks, and update the record.

Finally, rehearse the scenario without the expert directing it. If the team can complete the work safely, explain its choices, and improve the runbook from the exercise, the knowledge has begun to become organisational.

This practice should be routine, not triggered only by a resignation. The most useful time to share knowledge is while the expert is available, the service is healthy, and the team has enough space to ask basic questions without an outage watching.

::: tip
**Create one Capability Map.** For a critical outcome, record the lead operator, second operator, required role access, preconditions, verification signal, and date of the next practice. Then have the second operator lead a safe scenario. Record the questions that blocked action and use them to improve the shared path.
:::

::: operator-rule
1. **This week, create one Capability Map.** For a critical outcome, list the work, lead operator, second operator, access, verification signal, and next practice.

2. **Transfer knowledge through observed practice.** Pairing, reverse shadowing, and rehearsals reveal the context that static documentation misses.

3. **Verify the second path.** A named backup is not enough. Test whether the second operator can complete a critical scenario and explain the decisions involved.

4. **Reward capability multiplication.** Treat shared access, coaching, and successful second-path practice as operational work, not as optional extra effort.
:::

::: {.memorable-phrase}
Knowledge that exists only in someone’s head is not organizational knowledge.
:::

::: field-note
**Context**

A senior engineer was the only person who could safely deploy a payment platform. The deployment path relied on undocumented sequence, identity, and verification knowledge accumulated through previous incidents.

**What We Expected**

The team could apply a critical security patch within the available maintenance window.

**What Happened**

The engineer was unexpectedly unavailable. The team understood the need for the patch but could not verify the safe deployment path, so the change was delayed while exposure remained open.

**What We Missed**

The team had treated the presence of one highly capable engineer as a substitute for shared operational capability.

**What It Taught Us**

Expertise is most valuable when it creates another safe operator. A critical service is not resilient if its essential work has only one trusted path.
:::

::: pullquote
“An expert is not a risk. A team that has no second way to act is.”
:::

::: keytakeaways
- Tacit knowledge is valuable, but it becomes a risk when critical work depends on one person being available.
- Documentation must be exercised by someone other than its author before it can be trusted as a transfer mechanism.
- The useful unit of knowledge transfer is a real operational scenario, not a document dump.
- Human SPOF risk is reduced when at least two people can execute and explain critical work safely.
- Teams become more resilient by multiplying capability, not by making expertise disappear.
:::

::: {.next-chapter}
**Why Documentation Fails**

Shared knowledge needs a place to live, but documents can still mislead when they are stale, abstract, or disconnected from the work. The next chapter examines why documentation fails and how to make it operational.
:::
