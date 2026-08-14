---
title: "The Temporary Rule That Became Permanent"
part: "Part I: The System We See"
book: "Beyond the Firewall"
book_number: 1
chapter_number: 2
author: "Steve BA-NDOUWE"
date: "2026"
status: "draft"
memorable_phrase: "A temporary exception without an expiration date is a future security incident."
concepts_introduced:
  - "Permanent Temporary"
incidents_referenced:
  - "Firewall_Temp_Rule"
---

::: {.impact-opener #the-temporary-rule-that-became-permanent number="02" title="The Temporary Rule That Became Permanent"}
:::

::: {.chapter-guide}
**Inside Chapter 02**

- [01. The discovery](#the-discovery)
- [02. The illusion of temporary](#the-illusion-of-temporary)
- [03. Why it happens](#why-it-happens)
- [04. Permanent Temporary](#permanent-temporary)
- [05. The cost of forgetting](#the-cost-of-forgetting)
- [06. Three rules for every exception](#three-rules-for-every-exception)
- [07. Look beyond the rule](#look-beyond-the-rule)
:::

## The discovery

The firewall rule had no expiration date. It had been created during a crisis with one instruction attached to it: *Temporary. Remove after the fix.* Twenty-three months later, it was still there.

I remember the afternoon clearly. A financial services company had asked for a review of its firewall configuration before a security audit. The team was confident. Their perimeter was well funded, carefully maintained, and central to the way they described their security posture.

We sat in a small conference room while the rules scrolled across a projector screen. Hundreds of lines passed by. Most were grouped, named, and easy to explain. Then, near the bottom of the list, one entry stopped the conversation.

::: {.config-block}
rule 214 {\
  source:      any\
  destination: any\
  service:     tcp/22 (ssh)\
  action:      allow
}
:::

There was no description. No owner. No expiry date. One line gave SSH access from anywhere to anywhere.

I asked the network administrator what it was for.

He narrowed his eyes at the screen. “That? We opened it for a vendor. It was temporary. We were going to remove it soon.”

I pointed to the creation date. It was twenty-three months old.

He looked at it for a long moment, then said the sentence that mattered most in the room: “We forgot.”

::: warning
A temporary rule without an owner is not temporary. It is a permanent exposure waiting to be noticed again. Forgetting is not an operational excuse. It is a gap in the process that was meant to close the exception.
:::

## The illusion of temporary

This pattern is ordinary because the first decision is usually reasonable. A service fails. A vendor needs access. A deployment is blocked. The team needs a path through the problem now, not after a review cycle.

A firewall rule is added in minutes. It works. The service returns. Everyone moves to the next incident.

The vendor contract ends, but access remains. The engineer changes teams, but the exception lives on. A fix created under pressure becomes part of the perimeter without anyone choosing it as architecture.

The dangerous belief is that cleanup happens naturally. It does not. Memory is not a control. Good intentions are not a review mechanism. An exception with no date, no owner, and no reason has no force pulling it back out of the system.

## Why it happens

Pressure is the first mechanism. During an outage, process feels slower than risk. The fastest available change is often the one that bypasses the normal design. That choice can be right for the moment. The failure comes when the moment ends and nothing tells the team to return.

Forgetfulness is the second mechanism. Operations move from one urgent request to the next. A rule that does not interrupt a dashboard, a ticket queue, or a weekly report becomes invisible. It survives because no one is actively looking for it.

The third mechanism is the absence of an expiry path. Most platforms will preserve a rule indefinitely unless someone creates a date, a notification, and a review. Without that mechanism, the configuration treats a temporary exception as permanent by default.

::: tip
Do not rely on collective memory to remove exceptions. Create a reminder at the moment the exception is approved, link it to a named owner, and make its expiry visible in the same queue as other operational work.
:::

## Permanent Temporary

::: concept
**PERMANENT TEMPORARY**

*A temporary exception that becomes permanent operational architecture because no mechanism exists to review, renew, or remove it.*
:::

A Permanent Temporary is not limited to firewall rules. It can be an unused VPN profile, a shared administrator account, an IAM permission granted for one project, or a bypass added during a migration. The technology changes. The pattern does not.

The common feature is that the organisation stops seeing the exception as a decision. It becomes background configuration. That is when a short-term compromise begins to shape the system for the long term.

## The cost of forgetting

Rule 214 triggered a broader audit. The company believed its firewall was clean because the main rules were documented and the dashboard reported no recent intrusion activity. The audit showed something different: a quiet accumulation of exceptions that no one had revisited.

The vendor integration linked to Rule 214 had ended months earlier. No record connected the rule to the contract. No review task existed. The engineer who created it had left the company.

The firewall was doing exactly what it had been told to do. It allowed the traffic. The monitoring stack reported ordinary activity because nothing in it had been designed to ask whether that access was still justified.

The team did not react with panic. They reacted with confusion. They had not deliberately accepted the risk. They had simply stopped seeing it.

::: warning
A dashboard showing no blocked intrusion is not proof of a clean network. It may only prove that monitoring cannot see the gaps created by the organisation’s own exceptions.
:::

The Permanent Temporary is therefore not a security issue alone. It is evidence of an organisational failure. Every exception is a deviation from the designed state. When that deviation is not recorded, reviewed, and removed, it becomes part of the architecture.

## Three rules for every exception

If you manage a firewall, an access control list, a privileged account, or any temporary resource, the rule is simple: every exception must remain accountable to the organisation that created it.

::: operator-rule
1. **This week, review one active exception.** Set its expiration date, confirm the condition that makes removal safe, and create the review task now. When that date arrives, continuation must be justified rather than renewed automatically.

2. **Assign an owner.** Every exception needs a named person who receives the reminder, understands the original reason, and can decide whether the access should remain.

3. **Document the reason.** Record the problem it solves, who requested it, and the condition that makes removal safe. A short explanation is enough, but no explanation means no review can be trusted.
:::

These rules do not eliminate urgent work. They make urgent work visible after the urgency has passed. They turn a silent workaround into a managed deviation.

::: {.memorable-phrase}
A temporary exception without an expiration date is a future security incident waiting for a quieter day.
:::

::: field-note
**Context**

Financial services company, firewall audit. A single SSH exception was discovered with no owner and no expiry date.

**What We Expected**

Firewall rules would be documented, justified, and reviewed on a regular cycle.

**What Happened**

Rule 214 allowed SSH from any source to any destination. It was twenty-three months old, labelled temporary, and had never been removed.

**What We Missed**

The rule was added during an urgent vendor integration. No expiration was set, no review process existed, and the engineer who created it had left.

**What It Taught Us**

Every temporary exception needs an expiration mechanism. Without one, urgency becomes architecture.
:::

## Look beyond the rule

A firewall rule reveals the boundary. It does not reveal the whole system that depends on it.

The next chapter moves behind the rule and into the dependencies nobody documented: the hidden architecture that keeps work moving until one unseen connection fails.

::: pullquote
“Every exception is a design decision. Treating it as temporary does not stop it from becoming architecture.”
:::

::: keytakeaways
- An exception becomes dangerous when its reason, owner, and end date disappear.
- “Temporary” is not a control. An enforced expiry and a review mechanism are controls.
- Urgent access should remain visible after the urgency has passed.
- A rule that no one can explain is an operational dependency no one can manage.
- Removing a deviation is part of the original work, not optional cleanup.
:::

::: {.next-chapter}
**Everything Was Green. Everything Was Broken.**

A dashboard can confirm that components are available while the transaction that matters has already stopped.
:::
