---
title: "Incident Response Is Decision Making Under Pressure"
part: "Part III: Operating Reality"
book: "Beyond the Firewall"
book_number: 1
chapter_number: 11
author: "Steve BA-NDOUWE"
date: "2026"
status: "draft"
memorable_phrase: "In an incident, judgment matters more than knowledge."
concepts_introduced:
  - "Incident Decision Loop"
incidents_referenced:
  - "Autopilot_Restart_Disaster"
---

::: {.impact-opener #incident-response-is-decision-making-under-pressure number="11" title="Incident Response Is Decision Making Under Pressure"}
:::

::: chapter-guide
**Inside Chapter 11**

- [01. The fog of war](#the-fog-of-war)
- [02. The fix is easy. The decision is hard.](#the-fix-is-easy-the-decision-is-hard)
- [03. Why teams freeze](#why-teams-freeze)
- [04. Cognitive load is part of the incident](#cognitive-load-is-part-of-the-incident)
- [05. The incident decision loop](#the-incident-decision-loop)
- [06. Train for the moment](#train-for-the-moment)
:::

## The fog of war

The service was slow, but still responding. Customers were timing out in the payment journey. The on-call engineer opened the runbook and saw the familiar first instruction: restart the API service.

It was a reasonable action on an ordinary day. The service had recovered from stuck workers before. The command was known. The procedure was written down.

The engineer restarted it.

The connection pool dropped. The service came back under the same load, the retries multiplied, and the next restart made the queue deeper. What began as a latency problem became an outage that took far longer to unwind.

The technical action was not absurd. The mistake was treating a familiar command as a decision already made.

In an incident, information is partial, opinions arrive quickly, and time changes the cost of every option. A runbook can suggest an action. A dashboard can describe a symptom. Neither can decide whether this is the moment to act, wait, limit blast radius, or choose a different path.

That is the work of judgment.

## The fix is easy. The decision is hard.

Technical knowledge matters. A team needs people who can read a trace, understand a queue, assess a migration, and recognise a dangerous change. But knowledge alone does not organise action when the evidence conflicts and the consequences are immediate.

The hard question is rarely only *what can we do?* It is *what should we do now, with the information we have, and what will tell us whether the choice helped?*

Teams fail this question in two opposite ways. Some act too quickly, applying the most familiar command before they understand the current signal. Others wait too long, collecting more evidence after the reversible action is already clear enough to try.

Good incident response is not the pursuit of perfect certainty. It is the ability to make a proportionate decision, state the reason, observe the result, and adjust without defending the first choice.

::: risk
**The cost of delayed ownership**

An incident can tolerate uncertainty. It cannot tolerate a decision vacuum for long.

When nobody has the right to choose the next action, the bridge call fills with competing theories, repeated checks, and silent waiting for a more senior person. The system keeps degrading while the team tries to remove all doubt.

Assigning decision ownership does not remove expertise from the room. It gives the expertise a path into action.
:::

## Why teams freeze

Teams freeze for understandable reasons. A wrong action can increase impact. A visible decision can create accountability. The people closest to the incident may not feel authorised to change production. Others may be waiting for a person who has handled the system before.

These pressures do not disappear by telling people to be more decisive. They need to be designed for.

A team needs shared decision rights before an incident. It needs to know who can declare severity, who can stop a deployment, who can reduce traffic, who can approve a rollback, and who communicates the current state. These responsibilities can be small and temporary. What matters is that they are clear.

The incident commander is not necessarily the most technical person on the call. The commander creates a decision cadence, protects the team from unbounded debate, makes the current choice explicit, and asks what evidence will change that choice.

Subject-matter experts still matter. They provide options, risks, and observations. They should challenge assumptions when safety, customer harm, or irreversible loss is at stake. But a challenge must lead to a clearer decision, not to a bridge call with no owner.

## Cognitive load is part of the incident

During an incident, the system is not the only thing under load. The people are too.

Alerts repeat. Logs stream. Customers report different symptoms. Managers ask for updates. The team attempts to hold several theories at once while trying to remember the last safe change. Under those conditions, even experienced people can overvalue the newest signal, follow the loudest voice, or mistake activity for progress.

A good incident process reduces that cognitive burden. It separates observation from interpretation. It records decisions as they are made. It assigns someone to communicate, so the person choosing the next action is not also answering every status request. It limits the number of active hypotheses instead of allowing every theory to become a task.

The purpose is not ceremony. It is to preserve enough attention for the next useful choice.

::: warning
**Procedure is not judgment**

A runbook is valuable because it exposes known actions and known risks. It becomes dangerous when the team treats it as a substitute for reading the current incident.

Use procedures to reduce memory load. Use judgment to decide whether their preconditions are true now.
:::

## The incident decision loop

A practical decision loop has four stages: observe, orient, decide, and act.

**Observe** the current evidence. What is the customer impact? Which signals are trustworthy? What changed? What remains normal?

**Orient** around the decision, not around every possible explanation. Which hypotheses would lead to different actions? Which reversible action reduces harm or produces information quickly?

**Decide** what to do next, who will do it, and what result would confirm or challenge the choice. State the decision on the bridge so the team is not working from private assumptions.

**Act** and observe again. If the result changes the picture, revise the decision. Changing course is not failure. It is the loop doing its work.

This structure does not promise that the first action will be correct. It makes the team faster at learning whether the action was useful.

::: concept
**Incident Decision Loop**

A repeatable sequence for operating under incomplete information: observe the impact and evidence, orient around the decisions that matter, choose a proportionate action, then act and use the outcome as new evidence.

The loop turns response from a search for certainty into a disciplined process of reducing harm and learning quickly.
:::

::: tip
**Run a decision drill.** During a game day, give the team an incident with incomplete and conflicting signals. Require the incident commander to name the current impact, the next reversible action, the owner, the expected observation, and the time at which the decision will be reviewed. Afterwards, review the quality of the decision process, not only whether the technical fix worked.
:::

## Train for the moment

Teams often practise troubleshooting in calm conditions. They should also practise the conditions that make troubleshooting difficult: unclear ownership, competing signals, external pressure, partial information, and the temptation to wait for a specialist.

A useful drill is not a performance of a known runbook. It gives the team an imperfect situation and asks them to make choices. What will they protect first? Which action is reversible? Who has decision rights? What will they tell the business? What evidence would make them change course?

The goal is not to make people fearless or to reward the fastest voice. The goal is to make the team recognise hesitation, overconfidence, and cognitive overload while the consequence of a bad choice is still safe to discuss.

The best teams do not eliminate pressure. They build habits that keep pressure from deciding for them.

::: operator-rule
1. **Name the decision owner early.** At the start of a material incident, identify who owns the next operational decision and who will communicate it. Expertise can be distributed; decision ownership cannot be absent.

2. **Choose actions with an observation attached.** Before acting, state what outcome you expect and how long you will wait before reviewing it. An action without a feedback point is only movement.

3. **Prefer proportionate, reversible steps.** When evidence is incomplete, reduce harm and learn with the smallest action that can change the situation. Escalate when the consequence of waiting exceeds the risk of action.

4. **Rehearse the decision process.** Train the command, communication, and review cadence alongside the technical recovery work.
:::

::: {.memorable-phrase}
In an incident, judgment matters more than knowledge.
:::

::: field-note
**Context**

A core banking API began failing under load. The first runbook instruction was to restart the service, a familiar remedy for stuck workers.

**What We Expected**

A restart would clear the immediate condition and bring the API back to normal operation.

**What Happened**

The restart dropped the connection pool while demand remained high. Retries increased, the queue deepened, and repeated restarts turned a latency incident into a longer outage.

**What We Missed**

The team followed a recognised procedure without first deciding whether the current signals met the conditions that made the procedure appropriate.

**What It Taught Us**

A runbook is an input to a decision, not a decision itself. Under pressure, the team needs an owner, a reversible next step, and a clear observation that will confirm or challenge the choice.
:::

::: pullquote
“An incident commander does not need to know everything. The commander needs to make the next decision visible.”
:::

::: keytakeaways
- Incident response is a decision process under uncertainty, not only a sequence of technical commands.
- Decision ownership reduces the cost of unbounded debate without excluding expert challenge.
- Procedures reduce memory load; they do not replace reading the current evidence.
- Every action should include an expected observation and a review point.
- Teams improve under pressure by practising judgment, communication, and decision rights as well as technical recovery.
:::

::: {.next-chapter}
**The Cost of Tribal Knowledge**

A team can make a good decision in the moment and still be exposed if the reasoning, history, and recovery knowledge live only in one person’s head. The next chapter examines the operating cost of knowledge that has no shared home.
:::
