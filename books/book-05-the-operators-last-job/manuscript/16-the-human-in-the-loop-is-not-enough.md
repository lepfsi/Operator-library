---
number: "16"
chapter: "16"
part: "Part IV: The New Engineer"
title: "The Human in the Loop Is Not Enough"
kicker: "A person asked to approve an action without its context, authority or alternatives is not exercising judgment. They are absorbing the system’s uncertainty."
status: "draft"
memorable_phrase: "A human in the loop is not a safeguard if the system has already decided what the human is allowed to know."
---

# The Human in the Loop Is Not Enough

::: {.impact-opener number="16" title="THE HUMAN IN THE LOOP IS NOT ENOUGH"}
The approval arrived with all the information needed to say yes and none of the information needed to decide.
:::

::: {.chapter-guide}
\chapterguideentry{01}{The last screen}{ch16-section-01-screen}
\chapterguideentry{02}{A person is not a control surface}{ch16-section-02-surface}
\chapterguideentry{03}{Information without authority}{ch16-section-03-authority}
\chapterguideentry{04}{The approval budget}{ch16-section-04-budget}
\chapterguideentry{05}{Put judgment back in the workflow}{ch16-section-05-workflow}
\chapterguideentry{06}{What a meaningful loop requires}{ch16-section-06-requires}
:::

\clearpage
\phantomsection\label{ch16-section-01-screen}
\section{The last screen}

::: {.field-note}
**Entitlement remediation review, 2026 composite.**  
`agent=access-baseline-steward :: proposed_action=enforce_baseline`  
`entitlements=3,814 :: affected_services=28`  
`approval_window=12_minutes :: confidence=high`  
`unknown=breakglass_entitlement_state :: execution=pending`
:::

At \livetime{18:04}, Daniel received an approval request that looked like good engineering.

The access-baseline steward had been deployed to identify permissions that survived a migration from one identity system to another. It compared the intended role model with active group membership, service-account privileges and the temporary access records it could find. Most nights, it did not change anything. When it found a clear mismatch, it prepared a scoped correction and sent it to the duty engineer for approval.

That evening, it had found 3,814 inherited entitlements that no longer matched the baseline. The request listed twenty-eight services. It showed a high-confidence classification. It said that a dry-run simulation had completed without application errors. It promised that removing the entitlements would reduce the attack surface created by the migration.

At the bottom of the screen were two buttons.

> **Approve baseline enforcement**  
> **Defer for manual review**

The request had arrived at the end of a long day. Daniel was covering the identity platform after the normal owner had left. He had seen six similar requests in the previous hour. Five had been straightforward. Each involved a stale group, a retired service account or an application team that had already confirmed the expected access model.

This request looked larger, not stranger.

The agent had summarized the risk in a clean paragraph. The broad permissions had survived a role migration. No production service reported a dependency on them. The recommended remediation was reversible for four hours through a generated rollback file. The approval deadline existed because the migration cleanup window would close before an overnight change freeze.

Then Daniel noticed one group name in the affected set: `regional-incident-bridge`.

The group was not part of the normal role model. It had been created during a severe-weather response to give a rotating set of field coordinators access to a dispatch map, a maintenance-image store and an escalation channel. It was meant to expire after the response. The field response had changed shape twice that week. Daniel did not know whether the group was still needed, whether another team had extended it, or who had the authority to say.

The agent did not know either.

\systemvoice{Baseline enforcement is ready. Simulated policy evaluation found no declared production dependency. Breakglass-state confirmation is unavailable for one affected entitlement. Approval is required to proceed or defer.}

The approval arrived with all the information needed to say yes and none of the information needed to decide.

\phantomsection\label{ch16-section-02-surface}
\section{A person is not a control surface}

The phrase *human in the loop* makes a reassuring image. A system moves quickly, but a person remains somewhere in the circuit, ready to preserve judgment.

The image hides the design question. What exactly is the person doing there?

A person can perform several different roles in an automated workflow. They can supply a fact that the system cannot observe. They can exercise authority that has not been delegated. They can decide between competing objectives. They can review a bounded action for a particular kind of harm. They can stop a system when a condition changes. They can own the consequences of a decision.

Or they can click a button.

Those roles are not interchangeable.

Daniel had been given a formal control. He could approve or defer. But his control was weak in the ways that mattered. He did not own the field-response access. He did not know whether the breakglass group had been extended. The twelve-minute deadline made a full investigation impractical. Deferring the request would preserve the broad baseline drift and cause the agent to re-present the same ambiguity to another person later. Approving it might remove access from people coordinating a live response. The system had offered him two actions, neither of which repaired the missing decision.

::: {.assumption-check}
**Assumption:** A human approval step makes the remediation supervised.  
**What the workflow actually proves:** A human can accept or delay the remediation after the agent has selected the scope, framed the evidence, set the deadline and omitted the source needed to evaluate the exception.  
**What remains unproven:** Whether the approver has authority, relevant context or a workable alternative.
:::

A human at the final screen cannot turn an incomplete workflow into a complete one.

The problem is not that Daniel lacked skill. An experienced identity engineer could have inspected the request for an hour and still failed to learn whether the field group had a current operational owner. The information was not waiting in another dashboard. It existed in a handover between the regional response lead and a support team. The system had no reliable route to receive it.

The person in the loop had become a place where the organisation deposited uncertainty it had failed to design elsewhere.

This kind of late oversight creates a dangerous reversal of responsibility. The workflow is designed upstream by people who select the sources, write the eligibility conditions, group the cases, set the time limits and define the buttons. The final reviewer inherits the consequences of those choices with too little ability to alter them. If the reviewer approves, the action appears to have human backing. If the reviewer defers, the known problem remains. Either way, the original design failure can disappear behind the visible fact that a person was present.

A meaningful review does not ask a person to rediscover everything the workflow has omitted. It makes the omission itself an operational state. If the system cannot verify the owner of an emergency entitlement, the request should not be presented as a normal remediation with a small warning. It should become a different class of work, with a different owner, a different time horizon and a different action boundary.

\phantomsection\label{ch16-section-03-authority}
\section{Information without authority}

Daniel opened the incident bridge and wrote a short message.

::: {.human-exchange}
“I can see the group is outside the baseline,” he wrote. “I cannot see whether it is still an emergency entitlement. Who owns that call?”

A field coordinator replied four minutes later. “It is still being used. We have contractors joining shifts overnight. Please do not remove it.”

Daniel asked whether the group had an extension record. The coordinator answered, “I thought the response team handled that.”
:::

The exchange was human. It was also not yet operationally usable.

The coordinator knew the group mattered. They did not have the identity-platform permission to extend it. Daniel had the permission to approve the remediation. He did not have the authority to classify a regional response entitlement as still justified. The normal identity owner could have resolved the issue, but was unavailable until the next morning. The policy team that defined breakglass access had no duty contact in the agent’s handoff path.

The system had created a familiar kind of theater. It had made people visible to one another without making any person able to change the relevant state safely.

::: {.decision-ledger}
| Decision Ledger | |
|---|---|
| **Action proposed** | Remove inherited permissions that conflict with the identity baseline. |
| **Ordinary evidence** | Role-model mismatch, dry-run result, service dependency checks and rollback package. |
| **Missing evidence** | Current validity, owner and expiry of the regional-response breakglass entitlement. |
| **Approver present** | Duty identity engineer. |
| **Authority actually needed** | Named regional-response owner, with identity-policy authority to extend, expire or retire emergency access. |
| **False choice presented** | Approve a potentially unsafe removal or defer a known access-control gap without resolving it. |
| **Action that would make judgment possible** | Freeze only the exceptional entitlement, route the owner question to a defined role, and continue safe remediation for unaffected groups. |
:::

This is why a generic approval gate is often too late. It asks the person to decide after the system has already grouped diverse cases into one action. The duty engineer is asked to approve the removal of thousands of ordinary entitlements and one exceptional entitlement at the same time. The agent has compressed the work. The approval request has compressed the meaning.

A more useful design would preserve the distinction. The agent could remove the entitlements whose evidence was complete. It could isolate the breakglass group. It could keep the evidence, notify the response owner, set a defined expiry check, and present a question that only the responsible role could answer.

The person would still be in the workflow. But they would enter at the point where their judgment could change an outcome.

\phantomsection\label{ch16-section-04-budget}
\section{The approval budget}

Every approval system spends attention.

At low volume, an approval can feel like care. At high volume, it becomes a queue of requests that share the same visual shape and compete for the same limited concentration. The system may call each request low risk. The approver experiences the accumulation as a different kind of risk: a growing pressure to treat the next decision as similar to the last one.

Daniel had already approved five clean remediation requests that hour. The sixth arrived with the same confidence language, the same green simulation result and the same deadline. The difference sat in a group name that could be read as a historical artifact or as evidence of an active emergency.

The agent had no reason to make the difference more visible because the breakglass group had not been connected to a current source of authority. The approval interface did not have a category for “the evidence required to decide is held by someone outside this queue.” It could only show the exception as an unresolved detail beside a complete plan.

::: {.process-output}
APPROVAL REQUEST: `enforce_baseline / change-6621`

- Scope: 3,814 entitlement removals across 28 services
- Ordinary controls: simulation complete; rollback package prepared
- Exception: `regional-incident-bridge`
- Exception state: current owner and expiry not verifiable
- What approval would mean: remove all entitlements, including the exception
- What deferral would mean: retain all entitlement drift; no owner handoff created
:::

The request was not wrong because it was concise. It was wrong because concision had become a substitute for decision structure.

An approval budget has to be designed. Which decisions deserve scarce attention? What evidence must be included? Which requests should be grouped, and which must be separated because their authority or consequence differs? When should an agent continue with the safe portion of its plan rather than force a person to approve an all-or-nothing bundle? When should the system stop presenting prompts and start creating an exception with a named owner?

The most useful human role is not to watch every agent action. It is to be asked for the work that cannot be safely reduced to a routine condition.

This principle changes the measurement of an approval system. A team should not celebrate a high approval rate by itself. A near-perfect rate might mean the agent is selecting genuinely routine work. It might also mean people have learned that refusing a request creates more work than approving it. The useful questions are different: how often does an approval reveal a missing authority source; how often does a reviewer change the scope rather than accept the whole action; how many exceptions return because the workflow lacked a decision owner; and how often do repeated approvals signal that a policy should be revised upstream?

A healthy approval queue is not one in which humans are maximally busy. It is one in which attention is reserved for choices that remain open, legible and consequential. The rest should either be safely delegated or clearly classified as an exception before it reaches a person at the end of a shift.

Deadlines deserve the same scrutiny. A timer can protect an operational window, but it can also manufacture consent by making the time to understand a case shorter than the time needed to investigate it. A good workflow distinguishes urgency in the underlying service from urgency in the approval screen. If a broad entitlement cleanup can safely wait while one emergency role is verified, the person should not be forced to choose between an unreviewed removal and a misleading all-or-nothing deferral. The system needs alternatives that preserve both security work and the exceptional context.

The European Commission’s current account of the AI Act identifies documentation, logging, information for deployers, appropriate human oversight, monitoring and serious-incident reporting as part of the risk-based requirements for high-risk uses.[^ch16-eu] The access-remediation agent in this chapter is not a claim about a regulated high-risk system. The operational lesson is narrower: oversight requires an environment that allows a person to understand, interrupt and act on the decision, not merely to witness it after the important framing has occurred.

\phantomsection\label{ch16-section-05-workflow}
\section{Put judgment back in the workflow}

Daniel did not approve the request. He did not simply defer it either.

He separated the change through a scoped remediation tool that the team had built for ordinary exceptions. The agent enforced the baseline for the groups whose evidence was complete. It held the regional-response entitlement. It created an exception record with the group’s current members, connected services, original creation event, latest observed use and the exact baseline rule it conflicted with. It paused the blanket re-presentation of the request. It routed the record to the regional response desk and the identity-policy owner, with a deadline that did not erase the group by default.

The fix was not heroism. It was an escape route the workflow should have contained from the beginning.

::: {.boundary-condition}
**An emergency entitlement may be changed only when the system can verify a current owner, reason category and expiry, or when the named emergency-access authority explicitly approves its removal. If the authority source is unavailable, the agent may remediate unrelated baseline drift but must preserve the exceptional entitlement, record the exception and route it to the responsible role.**
:::

The boundary condition shifted judgment earlier. The agent no longer waited until every entitlement had been assembled into one request. It checked the exceptional access category before it constructed the final action. The response owner was no longer invited to comment on a decision already presented to the duty engineer. Their authority became part of the state the system needed to decide whether the action was ordinary.

The new workflow also made room for a third outcome. The earlier interface forced Daniel to approve or defer. The redesigned workflow allowed the agent to continue the safe portion, hold the exceptional portion and create a traceable case for the role that could resolve it. This is a small change in interface design and a large change in operational meaning. It stops the system from treating uncertainty as an all-or-nothing obstacle, while refusing to convert uncertainty into permission.

This is the difference between adding a human to a loop and designing a loop around the work humans actually do.

Contemporary agents are capable of planning, tool use and multi-step execution across live systems. Their practical deployment therefore depends heavily on data engineering, stakeholder alignment, governance and workflow integration, not merely model capability.[^ch16-mit] The labor of creating a meaningful exception route is not a delay on the way to automation. It is the work that makes automation safe enough to deserve its speed.

The multi-agency guidance on careful adoption of agentic AI reaches a related conclusion in the language of security: when systems combine models, tools, data, memory and planning, organisations need deliberate controls, visibility and assurance rather than broad authority and optimistic assumptions.[^ch16-agencies]

The system did not become less autonomous because it held one group. It became more specific about the conditions under which autonomy was legitimate.

\phantomsection\label{ch16-section-06-requires}
\section{What a meaningful loop requires}

A meaningful human loop has five conditions.

The person needs **information** that relates to the actual consequence, not only a compressed recommendation. They need **authority** to alter the relevant action, not merely the ability to accept or postpone it. They need **time** proportionate to the decision, not a deadline designed for the convenience of the workflow. They need **scope** that separates ordinary cases from exceptional ones. And they need an **interruption path** that preserves evidence, reaches the correct owner and keeps safe work moving while the exceptional work is resolved.

Remove any one of these conditions and the human may remain present while the judgment has already disappeared.

The conditions also have to survive the pace of the system. Information that arrives after the approval window closes is not meaningful context. Authority that belongs to a role that cannot be reached is not meaningful authority. A stop button that leaves no way to preserve evidence or direct the exception is not meaningful interruption. Teams often test whether an agent can call a tool. They should also test whether a human can change the action in the circumstances for which the human role was created.

::: {.the-question}
If the only choice a person can make is to accept or delay a decision designed elsewhere, where in the system did human judgment actually occur?
:::

The next morning, the regional response owner confirmed that the group remained necessary for one more shift. The identity-policy owner replaced the temporary group with a named, time-bounded emergency role. The agent could now see an owner, a reason and an expiry. At the next baseline review, it excluded the new role from ordinary remediation until the expiry passed.

The broad migration drift was reduced. The exceptional access was no longer invisible. Daniel did not have to become the permanent guardian of a field operation he did not own.

::: {.memorable-phrase}
A human in the loop is not a safeguard if the system has already decided what the human is allowed to know.
:::

The phrase *human in the loop* survives because it names a real aspiration. We do not want systems to outrun the people who must live with their consequences. But the phrase becomes empty when it is used as an excuse to add one final click to a workflow whose context, authority and alternatives were lost upstream.

A reliable system does more than request approval. It distributes judgment to the moment, role and evidence where judgment can still matter.

This matters with particular force as agents move beyond fixed automation. A conventional workflow might ask a person to approve a known command against a stable checklist. The agent here has assembled the affected scope, selected evidence, summarized risk, created a rollback plan, imposed an approval deadline and compressed thousands of permissions into one proposal before the person sees the screen. That capability is useful precisely because it removes preparation work. It also means that a late approval cannot by itself restore the context, alternatives and authority that the agent’s workflow has already shaped. The new engineer therefore designs the supervision path before the agent composes the decision, not after it.

That is the foundation of a system worth trusting.

::: {.next-chapter}
**Building Systems Worth Trusting**  
Trust does not emerge from an agent’s confidence or a reviewer’s signature. It is built into the boundaries, records, repair paths and human roles that remain meaningful when the system is under pressure.
:::

## References

[^ch16-eu]: European Commission, [*AI Act: Shaping Europe’s digital future*](https://digital-strategy.ec.europa.eu/en/policies/regulatory-framework-ai), accessed August 2026.

[^ch16-mit]: MIT Sloan, [*Agentic AI, explained*](https://mitsloan.mit.edu/ideas-made-to-matter/agentic-ai-explained), 18 February 2026.

[^ch16-agencies]: Australian Signals Directorate, Cybersecurity and Infrastructure Security Agency, National Security Agency, Canadian Centre for Cyber Security, New Zealand National Cyber Security Centre and United Kingdom National Cyber Security Centre, [*Careful adoption of agentic AI services*](https://media.defense.gov/2026/Apr/30/2003922823/-1/-1/0/CAREFULADOPTIONOFAGENTICAISERVICES_FINAL.PDF), 30 April 2026.
