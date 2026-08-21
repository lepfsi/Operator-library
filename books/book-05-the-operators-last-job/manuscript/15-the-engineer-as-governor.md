---
number: "15"
chapter: "15"
part: "Part IV: The New Engineer"
title: "The Engineer as Governor"
kicker: "An agent can apply a policy at speed. It cannot decide whose interests the policy was allowed to represent."
status: "draft"
memorable_phrase: "Governance begins when a system can act on a choice that no one remembers making."
---

# The Engineer as Governor

::: {.impact-opener number="15" title="THE ENGINEER AS GOVERNOR"}
The agent did exactly what the policy told it to do. That was the problem.
:::

::: {.chapter-guide}
\chapterguideentry{01}{The queue that already had a policy}{ch15-section-01-queue}
\chapterguideentry{02}{An objective is never neutral}{ch15-section-02-objective}
\chapterguideentry{03}{Authority has to be named}{ch15-section-03-authority}
\chapterguideentry{04}{Dissent is operational data}{ch15-section-04-dissent}
\chapterguideentry{05}{Govern the change, not every action}{ch15-section-05-change}
\chapterguideentry{06}{What remains for the engineer}{ch15-section-06-remains}
:::

\clearpage
\phantomsection\label{ch15-section-01-queue}
\section{The queue that already had a policy}

::: {.field-note}
**Capacity broker review, 2026 composite.**  
`agent=tenant-recovery-broker :: available_warm_capacity=17%`  
`policy=impact-score-v3 :: affected_tenants=112`  
`objective=minimize_weighted_access_delay`  
`exception=field-operations tenant :: priority=unclassified`
:::

The access platform was not down. It was choosing who would wait.

A control-plane incident had invalidated a large portion of the platform’s regional credential cache. The underlying identity records were intact. No accounts had been compromised. But applications that relied on the cached authorization state had to be rehydrated in a controlled sequence. The recovery infrastructure could restore only a portion of the tenants at a time without creating a second failure in the central identity store.

The tenant-recovery broker had been built for this moment.

It read the current cache state, the rate at which the identity store could safely issue new tokens, the number of active requests per tenant, the status of the recovery workers, and a policy called \processstate{impact-score-v3}. It then created batches, scheduled their restoration, monitored the load, and adjusted the next batch as capacity returned.

At \livetime{09:11}, it began with the largest commercial tenants. Their request volumes were high. Their service-level commitments were expensive. Their users were already generating visible error traffic. On the recovery dashboard, the broker’s behavior looked excellent. It was restoring the greatest number of sessions per minute while keeping the central store below its safety threshold.

At \livetime{09:19}, a service manager noticed a tenant near the bottom of the queue: a regional field-operations system used by maintenance crews during a severe weather event. It had fewer active sessions than a large retail tenant and a modest contract tier. Its impact score was low. Yet the crews relying on it were coordinating inspections, road closures and equipment dispatch after a series of overnight faults.

The broker had not ignored the system. It had ranked it.

Its policy weighted three signals: contractual tier, active-session volume and current error rate. The formula had been approved eighteen months earlier, when the platform’s main concern was reducing downtime for its largest customer accounts. No one had expected it to decide the order in which constrained recovery capacity would be distributed during a regional emergency.

The broker did exactly what the policy told it to do.

That was the problem.

\phantomsection\label{ch15-section-02-objective}
\section{An objective is never neutral}

People often describe a recovery system as if it had one clear objective: restore service as fast as possible.

That sentence is useful only until service cannot be restored for everyone at once.

When capacity is scarce, every definition of “fastest” contains a distribution. Restore the highest number of sessions first. Restore the customers with the strictest commitments first. Restore the systems with the greatest financial exposure first. Restore the systems serving the most time-sensitive work first. Restore the lowest-risk dependencies first so that the rest of the platform can recover more safely.

Each objective produces a different queue. None of them is a purely technical fact.

The broker’s original score had not been malicious or careless. It was reasonable for the ordinary environment in which it had been designed. The problem was that its reasonableness had become invisible. A number called *impact* had quietly combined business value, observable traffic and contractual obligation. It did not include a way to recognize that a low-volume system could become operationally urgent when a weather response changed the meaning of delay.

::: {.decision-ledger}
| Decision Ledger | |
|---|---|
| **Action available** | Reorder tenant recovery batches while identity-store capacity is constrained. |
| **Current policy** | Prioritize contractual tier, active-session volume and current error rate. |
| **What the policy optimizes** | Weighted access delay across the tenant portfolio. |
| **What the policy cannot see** | A time-bound public-service or field-safety consequence that is not represented in contract tier or traffic. |
| **Decision required** | Whether a declared operational-criticality state may outrank the ordinary recovery score. |
| **Owner needed** | A named role entitled to classify the exception and accept the consequences of reordering other tenants. |
:::

The service manager asked the obvious question: “Can we move them up?”

The engineer responsible for the broker did not answer immediately.

The broker could move them up. The tool allowed a manual priority override. But the engineer had learned that an override was not the same as a policy. An override could solve one visible problem while leaving the organisation unable to explain why another customer waited longer, who had made the trade-off, whether the same request would receive the same answer tomorrow, or how long the special priority would remain active.

An objective is not neutral because it appears in a configuration file. It is a decision about whose delay the system is allowed to create.

The score also concealed a second decision: what was allowed to count as evidence. The platform had excellent telemetry for traffic volume and error rate. It had a clear commercial record of contract tier. It had no dependable, owned signal for time-bound field criticality. The absence of that signal did not mean field criticality was less real. It meant the platform had been designed around facts that were easy to collect and commercially familiar, while a different kind of consequence remained outside the interface.

That is how a policy becomes difficult to see. No one writes a rule saying that an unmeasured consequence does not matter. They write a system that cannot receive the fact in a form it can evaluate. The agent then treats the missing representation as if the world did not contain it. The problem is not that the agent lacks empathy. The problem is that the organisation has not decided which source is entitled to change the queue.

This is the point at which the engineer becomes a governor. Not because she holds every permission. Not because she chairs a committee. She becomes a governor because she can see that an optimization function has become an authority system, and that the authority system has outgrown the assumptions under which it was written.

\phantomsection\label{ch15-section-03-authority}
\section{Authority has to be named}

The team did not give the service manager a permanent override.

Instead, they created an emergency criticality declaration with three elements. A designated field-operations lead could declare that a tenant was supporting an active, time-bound response. The declaration had to include a reason category, a scope, an expiry and a named accountable person. The declaration was then reviewed by the continuity owner, whose role was to confirm that reordering capacity would not create a more severe dependency failure elsewhere. Once both conditions were present, the broker could assign the tenant to a protected recovery class for a limited period.

The change took less than a day to implement. The argument that led to it took longer.

Who could declare operational criticality? The service manager knew the customer’s pain but did not own the regional response. Could a customer success manager make the request? What if a commercial tenant claimed that a delayed transaction was also critical? Should an automated feed from the field system be allowed to declare the priority itself? How would the broker distinguish an active emergency from a standing claim that every workload was important?

These questions did not delay the technical work. They were the technical work.

::: {.boundary-condition}
**A tenant may enter protected recovery only when a named operational lead declares a current criticality category, the declaration identifies its expiry and scope, and the continuity owner confirms that the capacity reallocation will not violate a higher safety or integrity constraint. The broker may apply the protected class only for the declared period and must record the displaced batches.**
:::

The boundary condition did not make the queue fair in every possible sense. It made the authority visible.

It also turned a verbal escalation into a reproducible operating path. The field lead could not elevate a tenant indefinitely by calling someone who happened to be on duty. The continuity owner could not quietly create a new priority class without leaving a record. The broker could not treat a one-hour emergency declaration as a permanent property of the tenant. Each role had a limited power, and the limits were part of the implementation rather than a promise written beside it.

That visibility matters because agents do not merely carry out commands. They apply categories at speed. A policy may be no more than a few fields and a score until it determines who receives access, who waits, which team gets a faster recovery, or what information the next system is allowed to treat as urgent. At that point, policy is not background configuration. It is an operational act with people downstream of it.

The current governance problem around agents is partly an identity problem. A 2026 Cloud Security Alliance research note argues that organisations need an inventory that identifies each agent, its delegated permissions, connected tools and data sources, human owner and supported business process. It also calls for authorization controls and audit evidence suited to agentic systems.[^ch15-csa]

That work can sound administrative. In the incident room, it becomes concrete. If the broker makes a priority decision, what identity is it acting under? Which policy version did it apply? Who gave the policy the right to reorder customers? Who can suspend the rule? Which affected party can question the outcome? A system that cannot answer those questions may be automated. It is not governed.

\phantomsection\label{ch15-section-04-dissent}
\section{Dissent is operational data}

The most useful voice in the review did not agree with the new policy.

A commercial account lead asked why a field-operations declaration should outrank a customer with a contractually guaranteed recovery target. Her concern was not trivial. The platform could not promise a tiered service and then quietly ignore the tier whenever a compelling story appeared. A reliability engineer asked whether the protected class would be used too broadly. The capacity team warned that manual exception paths tend to accumulate until the ordinary queue has no meaning.

These were not obstacles to governance. They were evidence that the policy had consequences worth exposing.

::: {.dissent-record}
**Concern:** Protected recovery may become an unbounded escalation path that disadvantages tenants whose contractual recovery commitments are clear and priced.  
**Response:** The protected class is limited to named categories, requires two distinct authorities, expires automatically, records displaced batches, and is reviewed after each activation.  
**Unresolved question:** Which outcomes should trigger revision of the ordinary impact score rather than repeated use of the exception path?
:::

A dissent record serves a different purpose from an approval trail. An approval trail proves that someone said yes. A dissent record preserves the competing claim that would otherwise vanish once a decision is made.

This matters because a policy may work exactly as written while still revealing that the organisation has written the wrong thing. If the emergency exception is invoked twice a year, it may be a useful boundary. If it is invoked every week, the exception is telling the team that the ordinary objective has failed to represent part of the work the platform actually serves.

The engineer’s job is not to eliminate disagreement from the system. It is to give disagreement a place where it can change the next version of the system rather than become a private complaint after the incident closes.

The European Commission’s summary of the AI Act emphasizes risk management, activity logging, documentation, appropriate human oversight, monitoring and serious-incident reporting as part of the broader approach to trustworthy AI in regulated settings.[^ch15-eu] An IT recovery broker will not automatically fall into a regulated high-risk category. But the operational principle is relevant: systems that make consequential distinctions need evidence, information for those responsible for deployment, and a way to examine the conditions under which the distinction was made.

Dissent is part of that evidence.

\phantomsection\label{ch15-section-05-change}
\section{Govern the change, not every action}

The engineer did not begin approving each recovery batch herself.

That would have been the easiest way to feel responsible. It would also have been the wrong design. The broker was valuable because it could carry out ordinary capacity decisions faster than a person could watch a queue. Asking an engineer to bless each batch would slow the system without resolving the authority embedded in the scoring policy.

A human approval is meaningful only when the person has the information, authority and real option to change the outcome. Otherwise it merely moves the visible moment of responsibility to the end of a decision chain whose consequential choices were encoded earlier. The engineer’s task was not to make approval more frequent. It was to ensure that the choices requiring authority were made explicit at the point where they could still be designed, challenged and revised.

Instead, the team governed the conditions under which the broker could act. They registered the policy version. They named the data sources and their owners. They made the protected class time-bound. They specified the two authorities needed to activate it. They required the broker to record both the batches it advanced and the batches it displaced. They added a review after every activation, not to punish the requester but to discover whether the normal queue was still representing the organisation’s actual priorities.

They also changed how a policy update could reach production. A proposed score change had to be tested against a library of past recovery states and simulated constrained-capacity periods. The team reviewed not only whether the revised score reduced average delay, but which tenants would have moved earlier, which would have moved later, and whether the policy created a class of requests that could never surface because their consequence remained unrepresented. The proposed version then ran in shadow mode beside the existing policy for a defined period. It could recommend a different queue. It could not change the queue until the owners had examined the differences.

This is not bureaucracy for its own sake. It is how a team prevents a policy adjustment from becoming an invisible redistribution of harm. A score can be changed with one line of configuration. The people who wait because of that line may never know it changed. The engineer as governor makes the change observable before the new rule exercises power.

::: {.operator-note}
The engineer as governor does not stand beside every automated decision. She designs the policy, evidence and review path that make ordinary decisions safe to delegate and exceptional decisions possible to challenge.
:::

This is different from governance as a layer of paperwork placed above technical work. The policy must exist where the agent can apply it. The identity must exist where a tool can verify it. The expiry must exist where a stale declaration cannot survive by accident. The trace must exist where an affected team can see why it waited. The review must use the same evidence that shaped the runtime decision.

If these elements are absent, a policy deck may exist. The system will still be governed by whatever default behavior its tools happen to permit.

The practical test is simple. When someone asks why the agent prioritized one tenant over another, the team should be able to reconstruct the answer without asking the model to explain itself in general terms. They need the policy version, input values, data freshness, capacity state, exception declarations, authorizing roles, tool calls and expiry conditions. A readable trace turns governance from a claim into something an engineer, an affected customer or an incident reviewer can inspect.

MIT Sloan’s 2026 account of agentic AI makes the same practical point from implementation research. The difficult work is often not the model itself but the data engineering, stakeholder alignment, governance and workflow integration that allow an agent to function in a real organisation.[^ch15-mit]

This is why the engineer’s role becomes more consequential as agents become more capable. Faster execution does not remove the need for authority. It causes authority to travel farther and take effect more quickly. A priority score can become a customer outcome before the people who defined it remember that it exists.

The distinction from earlier automation is important. A traditional recovery scheduler applied a predefined order to a known queue. The broker in this chapter observes changing capacity, consults current tenant state, selects batches, adapts its next action as conditions shift, invokes constrained recovery tools and produces a record of its choices. The policy is therefore no longer only a rule for a future operator to interpret. It is an authority that the agent can exercise repeatedly at runtime. As agents become capable of this kind of dynamic prioritization, the engineer’s work becomes the governance of the objective that the system will carry into situations no one has pre-reviewed.

\phantomsection\label{ch15-section-06-remains}
\section{What remains for the engineer}

At \livetime{09:42}, the field-operations lead made the declaration. The continuity owner confirmed it. The broker moved the affected tenant into protected recovery for ninety minutes and recorded the commercial batches that would wait as a result.

The field crews received access soon afterward. The retail tenants waited longer than the original score would have allowed. The account lead received a trace that showed the policy version, the temporary class, its expiry and the capacity effect.

Nothing about the outcome was free of conflict. That was not the measure of its quality.

The protected recovery declaration also did not settle the policy permanently. It gave the team a disciplined way to act while the emergency was current. After the event, they had to ask whether the declaration identified a rare condition that deserved an exception or an ordinary kind of work that the impact score had never understood. If field continuity became a recurrent reason to move a tenant ahead of commercial volume, then leaving it in an emergency workflow would be another form of neglect. The policy itself would need to change, with a different source, owner and test.

That is the difference between a priority that is declared and a priority that is legitimate. A declaration may be urgent, bounded and necessary. Legitimacy requires that the organisation can explain how a category entered the policy, which evidence supports it, whose interests it may displace and when the decision will be reviewed. The governor’s work is to keep those two timescales connected: act clearly in the present, then revise the machinery before the next present arrives.

The decision was better because the conflict had been made visible before the agent acted. The affected parties could see what the system had done. The engineer could review whether the protected class had achieved its stated purpose. The reliability team could ask whether the ordinary impact score needed a new category. The account lead could contest the decision without being told that the queue was simply “automatic.”

::: {.the-question}
When an agent turns policy into action at machine speed, where can the people affected by that policy still make themselves heard?
:::

The question is larger than a recovery queue. It applies when an agent routes work, grants access, prioritizes a ticket, recommends a remediation, narrows an investigation or postpones a customer’s request. In each case, the technical action may be easy. The policy that gives the action meaning may be old, hidden, incomplete or owned by no one who is present when the consequence arrives.

The engineer as governor does not solve this by becoming a permanent human checkpoint. She solves it by ensuring that policy has an owner, authority has boundaries, exceptions have an expiry, affected decisions have a trace, and disagreement can become a revision rather than an afterthought.

::: {.memorable-phrase}
Governance begins when a system can act on a choice that no one remembers making.
:::

A person can be placed at the end of an agent’s workflow and asked for approval. But if the objective, category, authority and exception path were never made explicit, that person is only receiving the last screen of a decision that has already been designed elsewhere.

::: {.next-chapter}
**The Human in the Loop Is Not Enough**  
A human signature cannot repair a workflow whose meaningful choices were made before the request reached the human being.
:::

## References

[^ch15-csa]: Cloud Security Alliance, [*The AI Agent Governance Gap: What CISOs Need Now*](https://labs.cloudsecurityalliance.org/research/csa-research-note-ai-agent-governance-framework-gap-20260403/), 3 April 2026.

[^ch15-eu]: European Commission, [*AI Act: Shaping Europe’s digital future*](https://digital-strategy.ec.europa.eu/en/policies/regulatory-framework-ai), accessed August 2026.

[^ch15-mit]: MIT Sloan, [*Agentic AI, explained*](https://mitsloan.mit.edu/ideas-made-to-matter/agentic-ai-explained), 18 February 2026.
