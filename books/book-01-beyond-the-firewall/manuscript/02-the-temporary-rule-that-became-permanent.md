---
title: "The Temporary Rule That Became Permanent"
part: "Part I — The System We See"
book: "Beyond the Firewall"
book_number: 1
chapter_number: 2
author: "Ba-Ndouwe Steve"
date: "2026"
status: "draft"
memorable_phrase: "A temporary exception without an expiration date is a future security incident."
concepts_introduced:
  - "Permanent Temporary"
incidents_referenced:
  - "Firewall_Temp_Rule"
---

# Chapter 2 — The Temporary Rule That Became Permanent

## Hook

The firewall rule had no expiration date. It was created in a hurry, during a crisis, with a note: "Temporary — remove after fix." Two years later, it was still there.

---

## The Discovery

I remember the afternoon clearly. A financial services company asked me to review their firewall configuration as part of a security audit. They were confident. Their perimeter was solid. The firewall was the crown jewel of their defense.

We sat in a small conference room, a projector humming, the firewall rules scrolling on the screen. Hundreds of lines. Most were clean, well-documented, and logically grouped. But then, near the bottom, I saw something that made me pause.

Rule 214. Source: Any. Destination: Any. Port: 22. Allow.

No description. No owner. No expiration. Just a single line that allowed SSH from anywhere to anywhere.

I turned to the network administrator. “What’s this rule?”

He frowned, squinted at the screen, and said the words I’ve heard a hundred times since:

“That? Oh, that’s temporary. We opened it for a vendor last year. We’ll remove it soon.”

I pointed to the creation date. It was twenty-three months old.

He stared at it for a long moment. Then he whispered, “We forgot.”

---

## The Illusion of Temporary

This is not a rare story. It is one of the most common patterns in IT operations. A problem appears. A firewall rule is added to solve it quickly. The team says: “We’ll remove it later.” But later never comes.

The rule stays. The vendor contract ends, but the access remains. The developer leaves, but the exception lives on. The urgent fix becomes a permanent hole in the perimeter.

---

## The Bad Belief

We believe that a temporary exception is harmless. We believe that once the crisis passes, the exception will be cleaned up naturally — by memory, by review, or by good intentions. This belief ignores the mechanism of neglect. Without an expiration date, a temporary exception becomes architecture not by decision, but by default.

---

## Why It Happens

**Pressure.** When a system is down, or a vendor needs immediate access, there is no time for process. The priority is to restore service. The firewall rule is the fastest solution. It is added in minutes, tested, and works. Everyone is relieved. The crisis is over.

But the crisis leaves a trace. A rule that was born in urgency, without a plan for removal.

**Forgetfulness.** The human brain is not designed to remember every temporary exception. We move on to the next incident, the next project, the next fire. The rule remains in the configuration, invisible and forgotten.

**The absence of an expiration mechanism.** Most firewall platforms do not force an expiration date. If you don’t set one manually, the rule lives forever. And because no one thinks about it, it stays.

The result is what I call the Permanent Temporary.

---

## Evidence / Incident

The discovery of Rule 214 led to a broader audit. The company believed their firewall was clean. What we found was a pattern of silent accumulation.

The firewall logs showed zero blocked intrusions in the previous quarter. The security team presented this as evidence of health. Behind the firewall, the architecture was simpler than anyone admitted. A single exception — created for a vendor integration that had ended months earlier — allowed unrestricted SSH access from any source. There was no documentation linking the rule to the vendor contract. There was no expiration. There was no review process in place.

When the audit revealed the rule, the team’s first reaction was not concern — it was confusion. They had genuinely forgotten it existed. The mechanism for remembering had never been built. The exception had become invisible not by design, but by neglect.

The firewall saw nothing unusual. The firewall was working. The exception was permanent.

---

## DAILYOPS CONCEPT

::: concept
**PERMANENT TEMPORARY**

*A temporary exception that becomes permanent operational architecture, without a mechanism for review or removal.*
:::

---

## The Cost of Forgetting

When I showed the company how many similar rules existed — not just firewall rules, but temporary user accounts, unused VPN profiles, old IAM permissions — they were shocked. They had believed they were secure because their main systems were protected. But the perimeter was full of tiny holes, each one invisible to their monitoring dashboards.

This is the illusion of control. We look at the firewall and see a solid wall. But the wall is made of thousands of rules, each one a potential gap. The dashboard shows green, but the wall is already leaking.

The company had a firewall that was working. The business was not protected from its own exceptions.

---

## Analysis

The Permanent Temporary is not a security problem alone. It is a symptom of organizational failure. Every exception represents a deviation from the designed state. If that deviation is not tracked, reviewed, or removed, it becomes part of the architecture. And architecture, by definition, is durable.

The mechanism that creates this failure has three parts.

First, urgency overrides process. When a vendor needs access or a service must be restored, the exception is the fastest path. There is no time to design a permanent, secure solution. The exception is rational — at the moment.

Second, the absence of an expiration mechanism means the exception lives by default. If there is no date forcing a review, the exception outlasts the crisis. It survives the departure of the engineer who created it. It survives the end of the vendor contract. It survives the organizational memory.

Third, the lack of documentation connects the exception to nothing. There is no link to the vendor, the project, or the crisis that created it. Without this link, no one can evaluate whether the exception is still needed. It exists in isolation, invisible to everyone except the firewall itself.

This pattern is not rare. It is common. And it is dangerous because it is invisible.

---

## Principle

Every exception needs an expiration mechanism. Every temporary fix must have a date — a date by which it must be reviewed, renewed, or removed. Without this mechanism, temporary becomes permanent. With it, every exception remains accountable to the organization that created it.

---

## Application

If you manage or oversee any firewall, any access control list, or any temporary resource, implement three rules immediately.

**One: set an expiration date.** Every exception must have a date — one week, one month, one quarter — by which it must be reviewed. When the date arrives, the exception does not renew automatically. Someone must justify its continuation.

**Two: assign an owner.** Every exception must have a named person responsible for it. That person receives the notification when expiration approaches. Without an owner, no one is accountable.

**Three: document the reason.** Every exception must have a brief explanation: what problem it solves, who requested it, and when it should be removed. Without documentation, no one can evaluate whether the exception is still needed.

These three rules transform temporary fixes from silent risks into managed deviations. They create visibility where there was only neglect. They turn exceptions into architecture that can be reviewed, not architecture that hides.

---

## FIELD NOTE

::: field-note
**Context:** A financial services company conducted a firewall audit. A single SSH exception rule was discovered with no expiration or owner.

**What We Expected:** Firewall rules would be documented, justified, and regularly reviewed.

**What Happened:** Rule 214 allowed SSH from any source to any destination. It was 23 months old, labeled temporary, and never removed.

**Why It Happened:** The rule was added during an urgent vendor integration. No expiration was set. No review process existed. The engineer left, and the rule was forgotten.

**What It Taught Us:** Every temporary exception needs an expiration mechanism. Without one, urgency becomes architecture.
:::

---

## Memorable Phrase

> A temporary exception without an expiration date is a future security incident.

---

## Pull Quote

::: pullquote
The firewall was working.
The exception was permanent.
The business was not protected.
:::

---

## Transition

The firewall reveals the boundary. But the boundary is not the failure. In the next chapter, we go deeper behind the firewall — not just past the rules, but into the dependencies that nobody documented: the hidden architecture that holds the system together, and that can break it without anyone noticing.

---

## KEY TAKEAWAYS

::: keytakeaways
- A temporary exception without an expiration date is a future security incident.

- The Permanent Temporary is created by urgency, forgetfulness, and the absence of review mechanisms.

- Every exception must have an owner, an expiration date, and a documented reason.

- Trust without verification is not an operational control.

- The discipline to remove temporary fixes is what separates mature operations from fragile ones.
:::
