---
number: "14"
chapter: "14"
part: "Part IV: The New Engineer"
title: "From Operator to System Designer"
kicker: "The work moves upstream when the decision that once lived in a person must be made legible before a system can act."
status: "draft"
memorable_phrase: "The new engineer does not give a system more actions. She gives every action a condition, an owner and a way back."
---

# From Operator to System Designer

::: {.impact-opener number="14" title="FROM OPERATOR TO SYSTEM DESIGNER"}
The runbook did not become an agent when it learned the commands. It became an agent when someone decided what the commands were allowed to mean.
:::

::: {.chapter-guide}
\chapterguideentry{01}{The meeting before the incident}{ch14-section-01-meeting}
\chapterguideentry{02}{An intuition has no interface}{ch14-section-02-interface}
\chapterguideentry{03}{The unit of work changes}{ch14-section-03-unit}
\chapterguideentry{04}{Designing a refusal}{ch14-section-04-refusal}
\chapterguideentry{05}{The system that remembers why}{ch14-section-05-remembers}
\chapterguideentry{06}{The work that moves upstream}{ch14-section-06-upstream}
:::

\clearpage
\phantomsection\label{ch14-section-01-meeting}
\section{The meeting before the incident}

::: {.field-note}
**Restoration-agent design review, 2026 composite.**  
`candidate_action=restore_delivery_state`  
`evidence=event_gap + change_record + route_authority`  
`actor=service-restoration-agent`  
`exception_owner=regional-dispatch-lead`  
`unresolved_question=what makes a delayed event safe to replay?`
:::

There was no incident yet.

The delivery platform was healthy. Field devices were receiving routes. The event relay had no gap. The dispatch room was quiet enough that the screens looked decorative rather than urgent. Three engineers sat around a table with a product owner, a service representative from the field-operations team, and a printout of six incidents that had occurred over the previous year.

Each incident had looked different at the start. A certificate change had altered an acknowledgement path. A maintenance window had delayed one connector. A network policy had prevented a regional device group from receiving a route update. A queue worker had lost a lease and accepted work it did not complete. A field supervisor had overwritten an earlier assignment during a storm response. A retry job had restored the old assignment before the later one became visible everywhere it needed to be.

The individual repairs were not difficult for the people who had been on call. They had inspected the event gap, checked the deployment record, compared the current route with the dispatch console, and chosen a replay or a hold. The knowledge sat in their questions, in the order in which they asked them, and in the small hesitations that did not appear in the formal runbook.

Now the organisation wanted an agent to handle the ordinary cases.

The proposal on the table was familiar: let the service-restoration agent identify delivery gaps, search the relevant records, compare the event state, and replay pending route events when the evidence is clear. It could open an incident record, call a constrained recovery tool, and hand exceptions to the duty engineer with a trace of what it had found.

No one in the room objected to the ambition. The system had already been built in a prototype. It could call tools, retrieve runbooks, inspect recent changes, maintain a task state and produce a compact account of its proposed action. These are no longer unusual building blocks. Contemporary agent-development systems combine tool use, orchestration, guardrails, handoffs and traces so that models can work across multi-step tasks in real environments rather than merely describe an answer.[^ch14-openai]

The difficult question sat in the fourth row of a spreadsheet.

> **When may the agent replay a delayed route event without asking a person?**

An engineer named Mara had handled four of the six incidents. She read the question twice.

“Not when it is delayed,” she said. “When it is still the instruction.”

The sentence changed the meeting.

Everyone had understood the action. Replay a pending event. Everyone had understood the goal. Restore delivery. But the action did not depend on whether an event was pending. It depended on whether something more current had changed the meaning of the event while the event was waiting.

The system would not become reliable by learning more commands. It would become reliable by making that distinction explicit before it was asked to act.

\phantomsection\label{ch14-section-02-interface}
\section{An intuition has no interface}

Mara’s answer was accurate. It was also not yet usable by a system.

“Still the instruction” contained several questions that a person could carry without naming them. Has a supervisor created a later route override? Does the override apply to this crew, this location, or the whole region? Is the override active or historical? Who owns it? Has the change been confirmed, or is it a draft that should not prevent an ordinary recovery? If the dispatch console is unavailable, may the replay proceed after a time limit, or must it remain held? Who needs to know that a delivery gap is becoming an exception rather than a retry?

A person on call could improvise answers from experience. The agent could not safely inherit an improvisation. It needed a contract.

The distinction is easy to miss because experience often feels like a property of the individual who has it. In operations, it is usually a collection of relationships between states, tools, roles and consequences. The experienced operator has learned that one apparently simple signal is meaningful only in relation to another system’s authority. The operator has learned which missing fact is normal and which missing fact changes the action. The operator has learned which delay is tolerable and which delay means the incident has become someone else’s decision.

None of that is magic. But it does have to be designed.

::: {.routine-map}
| What the operator used to do | What the system must now make explicit |
|---|---|
| Notice that delivery is delayed. | Define the event gap, its time boundary and the source that declares it incomplete. |
| Check whether a later route exists. | Query a named route-authority service with a current status, owner and expiry. |
| Replay the event if the case is ordinary. | Permit only a bounded replay when no active override, conflict or unverified authority is present. |
| Call dispatch when the case is unusual. | Create an exception, preserve the event set and notify the accountable dispatch role. |
| Explain the choice afterward. | Store the evidence, conditions, action, handoff and unresolved facts in a readable trace. |
:::

The table did not reduce the operator’s work to a machine. It exposed the work that had always existed beneath the command.

This is the first movement from operator to system designer. The designer does not ask, “How can we make the agent behave like Mara?” That question is too vague and too flattering. The designer asks, “Which condition did Mara recognize? Where does it live? Who owns it? How does it change the action? What must the system do when it cannot verify it?”

The answers are less cinematic than an autonomous recovery. They are more valuable.

A system cannot be trusted with an intuition. It can be trusted with a condition that an organisation has made inspectable.

\phantomsection\label{ch14-section-03-unit}
\section{The unit of work changes}

The original runbook had three steps.

1. Check the connector.
2. Confirm the pending route events.
3. Replay the events.

It had been written for a person who knew what each verb implied. The person knew which connector dashboard mattered. They knew that “confirm” included the dispatch console if the incident occurred during a weather response. They knew that “replay” was not a command to run whenever a queue was nonempty. They knew where the event history could be misleading.

For the agent, the team rewrote the runbook as a set of action contracts.

Each contract had an action, a purpose, evidence requirements, sources of authority, a permitted scope, a stop condition, an exception owner, a trace requirement and a repair path. It did not tell the agent that it should be careful. It defined what careful meant for this class of work.

::: {.decision-ledger}
| Decision Ledger | |
|---|---|
| **Action** | Replay pending route events through the corrected connector. |
| **Purpose** | Restore delivery of current route instructions to affected devices. |
| **Evidence required** | Event gap confirmed, connector healthy, event scope bounded, no active route override. |
| **Authority source** | Regional dispatch-authority service, not the event store alone. |
| **Permitted scope** | Events within the identified gap for a single region and connector. |
| **Stop condition** | Active override, conflicting route state, unavailable authority source or event range beyond the defined window. |
| **Exception owner** | Regional dispatch lead, with duty engineer copied. |
| **Repair path** | Preserve event set and trace; do not purge or overwrite the current route state. |
:::

The table looks like governance. It is also executable engineering.

A tool interface can enforce the permitted scope. A context service can provide the authority state. A policy layer can turn an active override into a hold rather than a silent warning. An incident workflow can route the exception to the person whose decision is needed. A trace can preserve the evidence that made the agent proceed or stop. A test suite can create the conflicting states that a happy-path demo never encounters.

The components are technical. The decision to assemble them around a particular action is not merely technical. It says which facts have the right to interrupt speed.

The team also had to test the contract before asking the agent to rely on it in the field. They created fixtures for the cases that had troubled the old runbook: an event delayed while no override existed; an override active for a single crew; an authority source that responded with a stale record; a connector recovered while the event gap extended beyond the agent’s permitted window; a valid replay that became invalid halfway through its preparation because a field supervisor changed the route. The goal was not to prove that the agent could succeed on a standard replay. That was the least interesting case. The goal was to confirm that it would expose the boundary, preserve the event set and hand the exceptional work to the right person without silently broadening its own authority.

This kind of testing changes what an operations team calls a reliable system. Reliability is not only whether a service returns to green after a failure. It is whether the system behaves intelligibly when the case is almost ordinary, when two valid sources disagree, or when the fact that matters arrives after the agent has already prepared an action. Those are the cases that used to live in an experienced operator’s pause before pressing Enter. They now need an explicit place in design, test data and review.

This is why the unit of work changes as execution becomes cheaper. The new engineer’s work is not a larger number of scripts, prompts or tool connections. It is the design of the condition under which a tool connection is allowed to become an action.

This shift is a consequence of the recent evolution of agents, not a fashionable renaming of system design. Earlier automation generally executed a fixed sequence after people had assembled the context and selected the command. The agent in this chapter can inspect changing evidence, retrieve a runbook, select a constrained tool, prepare a multi-step recovery, preserve a trace and route an exception. It takes on pieces of operational work that used to remain separated inside an experienced operator’s judgment. That is why the operator’s tacit distinctions now have to be made explicit before the agent encounters the incident.

The 2026 engineering reality makes this work increasingly visible. In a survey of 1,340 professionals, 57.3% of respondents reported agents in production, 89% reported some form of observability, and 62% reported detailed tracing of agent steps and tool calls.[^ch14-langchain] The survey is not a census of the industry. It does show why the center of gravity is moving. Once agents act across real systems, teams need to decide what to observe, what to evaluate, which decisions to constrain and what their traces must allow a person to reconstruct.

\phantomsection\label{ch14-section-04-refusal}
\section{Designing a refusal}

The team’s most important design decision was not the replay tool. It was the refusal.

They had seen what happened when systems treated missing information as permission to proceed. An unavailable dispatch console could mean that no override existed. It could also mean that the team did not know whether an override existed. A system designed only around efficiency turns those two states into the same result. A system designed for operations makes them different.

Mara wrote the first version of the refusal as a message:

\systemvoice{Replay is not authorized. Current route authority cannot be verified for the affected event range. The event set has been preserved and the regional dispatch lead has been notified.}

The product owner asked whether that message would frustrate users.

“It should,” Mara said. “It is telling them the case is no longer routine.”

The point was not to make the agent sound severe. The point was to prevent a familiar action from borrowing certainty it did not have.

::: {.handoff-note}
**Agent to dispatch lead:** `event_gap=184 :: connector=west-03 :: action=held`  
`reason=route_authority_unverified :: current_route_state=preserved`  
`decision_needed=confirm override status or authorize bounded replay`  
`evidence_link=trace/route-recovery/8f3a`
:::

A good refusal is not a dead end. It carries the incident forward without pretending it can resolve the decision alone. It says what remains safe to do, what has been preserved, who owns the next judgment and what evidence would turn the exception back into an ordinary case.

This is a different standard from the familiar idea of a human approval gate. A generic approval gate asks a person to say yes or no to whatever the system has prepared. A designed refusal gives the person a structured case: the action, the boundary, the fact that is missing, the consequence of proceeding, the source that can resolve the ambiguity and the time at which the decision will become more costly.

The person is not reduced to a signature. The system has prepared the work that makes their judgment useful.

The multi-agency guidance on careful adoption of agentic AI makes a parallel point in the language of security: agents bring together models, tools, external data, memory and planning workflows, so organisations should maintain ongoing visibility and assurance and avoid broad or unrestricted access, especially in sensitive or critical environments.[^ch14-agencies] In operations, a refusal is one way of turning that principle into behavior. It limits what the agent can decide while keeping the evidence and the next human decision in motion.

\phantomsection\label{ch14-section-05-remembers}
\section{The system that remembers why}

The new design solved a problem that had never appeared on the original runbook: it gave the future operator access to the reason an action had been held.

In the old model, Mara’s judgment might have existed in a chat message, a spoken handover or a sentence in an incident document written after the system had recovered. The next person would know that the replay did not happen. They might not know which route override had mattered, whether the authority source had been unavailable, or whether the system was waiting for a named dispatch lead or for a time window to expire.

The agent’s trace became a kind of operational memory. Not a record of every internal model calculation, and not a performance of explanation after the fact. It preserved the evidence that mattered to the action: the event gap, the source consulted, the authority result, the permitted scope, the condition that blocked the replay, the owner of the exception and the follow-up state.

::: {.the-shift}
**Before:** The operator carried the reason an action was safe in an unrecorded sequence of checks.  
**After:** The system carries the conditions, sources and exception path so that a later operator can inspect, contest and improve them.
:::

This is how incident experience becomes a system asset rather than a story told by the people who happened to be present.

It also changes the kind of conversation a team can have after an incident. Instead of asking only who followed the runbook, people can ask whether the action contract expressed the right authority, whether the source was fresh enough, whether the exception arrived with enough context, and whether a future agent should be given the same scope. Those questions turn review from an examination of individual performance into a revision of the system that produced the decision.

The transformation has limits. A trace cannot decide whether the dispatch lead’s confirmation is credible. It cannot know whether a severe weather event changes the priority of a route unless the organisation exposes that fact in a usable form. It cannot settle a disagreement between customer urgency and field safety. But it can stop the organisation from losing the reason those questions appeared in the first place.

The engineer who designs that trace is doing more than adding observability. She is deciding what the organisation will be able to remember when the person who understood the last incident is asleep, on another team or no longer employed there.

\phantomsection\label{ch14-section-06-upstream}
\section{The work that moves upstream}

Six weeks after the design review, the agent encountered its first real exception.

By then, the design artifact had become part of the operating system around the agent. The action contract was versioned with the recovery tool. The route-authority service exposed the small, stable answer the agent needed rather than a raw export of dispatch data. The test fixtures were retained alongside the agent evaluations. The exception owner knew what a handoff would contain. And the on-call team knew that a hold would not mean the system had failed to make progress.

This is the quiet work that the phrase “system designer” can obscure. It includes naming the facts an agent must never infer, negotiating interfaces with the teams that own those facts, deciding which states need an expiry, writing the operational language of an exception, and revisiting the design when a real incident shows that a boundary was too broad or too narrow. It is close to software architecture, service ownership, product design, safety engineering and incident management. It is also the direct continuation of experienced operations.

A connector outage delayed fifty-nine route events during a regional maintenance period. The agent identified the event gap, found the changed connector configuration and prepared the bounded replay. Before it executed, the route-authority service returned an active override for two crews. A field supervisor had moved them after a road closure.

The agent replayed the events for the unaffected crews. It held the two events that touched the active override. It sent the dispatch lead the handoff note. The duty engineer opened the trace, saw the scope and did not need to reconstruct the connector failure from six systems. The dispatch lead confirmed that the hold was correct. Thirty minutes later, the override expired. The agent replayed the remaining events within the permitted range.

Nothing dramatic happened. No person delivered a heroic command. No dashboard exploded and then turned green. The system behaved as if it had learned a small form of judgment.

It had not.

It had been given a condition, an authority source, a boundary, an exception path and a memory of why the boundary existed. The judgment belonged to the people who had decided that an active field override outranked a delayed event, that the absence of proof was not proof of absence, and that an exception should arrive with evidence rather than a blank approval request.

::: {.design-question}
What must be true, observable and owned before this action is allowed to become cheap?
:::

That question belongs at the beginning of a system, not only at the end of an incident.

The movement from operator to system designer does not make the operator less important. It makes operational experience more consequential. The engineer who has seen a recovery fail because an old truth was replayed into a changed situation is no longer only the person who can fix the failure. She is the person who can design the distinction into the next system, where it may protect people she will never meet.

::: {.memorable-phrase}
The new engineer does not give a system more actions. She gives every action a condition, an owner and a way back.
:::

The work has moved upstream, but it has not become neutral. Every boundary favors one consequence over another. Every exception path gives a role the right to interrupt speed. Every authority source determines which statement counts as current when systems disagree.

Once those choices are built into the machinery, the next question is unavoidable: who is entitled to set them, change them and answer for the world they create?

::: {.next-chapter}
**The Engineer as Governor**  
An action contract can make authority visible. It cannot decide whose authority should prevail when the system’s goals come into conflict.
:::

## References

[^ch14-openai]: OpenAI, [*New tools for building agents*](https://openai.com/index/new-tools-for-building-agents/), 11 March 2025.

[^ch14-agencies]: Australian Signals Directorate, Cybersecurity and Infrastructure Security Agency, National Security Agency, Canadian Centre for Cyber Security, New Zealand National Cyber Security Centre and United Kingdom National Cyber Security Centre, [*Careful adoption of agentic AI services*](https://media.defense.gov/2026/Apr/30/2003922823/-1/-1/0/CAREFULADOPTIONOFAGENTICAISERVICES_FINAL.PDF), 30 April 2026.

[^ch14-langchain]: LangChain, [*State of Agent Engineering*](https://www.langchain.com/state-of-agent-engineering), 12 June 2026. The report summarizes a public survey of 1,340 respondents conducted from 18 November to 2 December 2025.
