---
number: "11"
chapter: "11"
part: "Part III: What Remains Human"
title: "Context"
kicker: "A fact becomes operational only when it can reach the decision in time, with its meaning intact."
status: "draft"
memorable_phrase: "Context is not everything a system can retrieve. It is what changes the meaning of the action it is about to take."
---

# Context

::: {.impact-opener number="11" title="CONTEXT"}
The agent had found the incident. It had not found the situation.
:::

::: {.chapter-guide}
\chapterguideentry{01}{The incident the agent could read}{section-01-read}
\chapterguideentry{02}{Context is not a pile of information}{section-02-pile}
\chapterguideentry{03}{The fact without a route}{section-03-route}
\chapterguideentry{04}{Retrieval does not create permission}{section-04-permission}
\chapterguideentry{05}{Context has a lifetime}{section-05-lifetime}
\chapterguideentry{06}{What the agent must be able to know}{section-06-know}
:::

\clearpage
\phantomsection\label{section-01-read}
\section{The incident the agent could read}

::: {.field-note}
**Work-order recovery trace, 2026 composite.**  
`agent=route-recovery :: event_gap=26m :: affected_region=west-03`  
`tools=telemetry,change-log,runbook,work-order-store,release-calendar`  
`proposed_action=replay_pending_route_events :: confidence=0.91`  
`dispatch_override=not_in_retrieval_scope`
:::

The work-order platform had become quiet in the wrong way.

For twenty-six minutes, the system that assigned field crews to network repairs had received updates without delivering them to the devices in the vans. The central work-order service was healthy. The dispatch database was healthy. The mobile application was healthy. But an event relay between them had accumulated a small, stubborn gap after a certificate rotation altered the way one regional connector acknowledged messages.

The gap did not look like an outage. It looked like a disagreement about whether work already completed was allowed to be forgotten.

By \livetime{06:42}, an agentic recovery service had assembled the relevant evidence. It had read the relay telemetry and located the first missed acknowledgement. It had queried the deployment record, confirmed the certificate rotation, and compared the current queue with a stored recovery procedure. It had checked the release calendar, verified that no planned maintenance was active, and searched the work-order store for route events whose delivery state remained pending.

The system had an action available. It could replay the pending route events through the corrected connector. The replay had an idempotency key. The affected events had a recent timestamp. The recovery procedure had been used before. The risk score was low. The estimated restoration time was under two minutes.

The agent wrote its recommendation to the incident channel:

\systemvoice{Acknowledge mismatch isolated to connector west-03. No conflicting change detected. Replay of 184 pending route events is reversible and expected to restore mobile delivery.}

A duty engineer opened the trace and found it unusually good. The agent had not produced a vague explanation. It had named the connector, the certificate change, the number of events, the recovery path, the evidence it had checked, and the tool calls it had made. The trace showed a sequence of useful work that, six months earlier, would have required one operator to move between telemetry, tickets, release notes and a runbook while a second operator tried to keep the incident record coherent.

Contemporary agent systems are increasingly built for exactly this shape of task: a model that works over multiple turns, invokes tools, retrieves documents or files, performs actions through an environment, hands work between components, and produces traces that can be inspected afterward.[^ch11-openai]

The recovery service had done those things well.

The duty engineer approved the replay.

At \livetime{06:46}, the pending route events began to move again. On the dashboard, the gap closed. The agent updated the incident state from \processstate{degraded} to \processstate{recovering}. The work-order service returned to its expected rhythm.

Then a dispatcher in the regional coordination room called.

“Why are crews being sent back to the old sites?”

During the twenty-six-minute gap, a storm response supervisor had manually changed fourteen route assignments. A flooded access road had made the original plans unsafe and impractical. The supervisor had moved the crews to alternative locations in the regional dispatch console, which was used for active field coordination during severe-weather events. Those changes had been intentionally held back from the normal work-order stream while the supervisor confirmed which access points remained open.

The replay did not erase the supervisor’s changes. It did something more difficult to see. It reintroduced the earlier route events after the manual overrides, making the older assignments appear fresh again on the mobile devices. Several crews began turning toward sites that had already been taken out of the response plan.

The agent had found the incident. It had not found the situation.

\phantomsection\label{section-02-pile}
\section{Context is not a pile of information}

It is tempting to describe this as a data problem. The agent needed more data. If the dispatch console had been another tool, the story would have ended differently.

That is true, but incomplete.

The agent already had more information than any one person would normally carry at the beginning of a connector incident. It had metrics, recent changes, queue state, the recovery runbook, event timestamps, delivery status and an internal history of similar failures. It could search those sources faster than an engineer could remember where each one lived. It could retain a trace of the path it had followed. It could distinguish a late event from an unprocessed event. It could calculate that the replay was technically reversible.

Adding the regional dispatch console to a long menu of tools would not, by itself, have made the action safe. The agent would still need to know when the console was relevant, which record mattered, whether the changes inside it were authoritative, how long they remained valid, and whether those changes should prevent a replay, reshape it, or simply be made visible to the person approving it.

Context is not everything a system can retrieve.

Context is the information that changes the meaning of the action the system is about to take.

For the recovery agent, the pending events looked like incomplete delivery. Inside the storm response, some of those events were no longer instructions to deliver. They were historical statements about a plan that had been superseded by people working with a different operational picture.

The difference was not semantic decoration. It changed the action from “replay delayed work” to “replay a previous world over a world that has since changed.”

Anthropic’s 2025 engineering guidance on agents describes context as the evolving state made available to a model, including system instructions, tools, external data and message history. It emphasizes that context is finite, must be curated, and may be retrieved progressively rather than loaded indiscriminately at the beginning of a task.[^ch11-anthropic]

That account is useful because it refuses two comforting mistakes. The first is to believe that a larger context window removes the need to decide what matters. The second is to believe that retrieval is neutral. Every retrieval design makes a choice about what can be found, how it is named, which source outranks another, and what the agent should do when two sources describe different states of the same work.

A person also works with partial context. The difference is not that a human sees everything. A dispatcher may not understand the connector’s acknowledgement protocol. A field supervisor may not know that the recovery agent has reached the replay stage. An engineer may not know which crews were rerouted in the last ten minutes. The work of operations has always been to make these partial pictures meet before one of them becomes an irreversible action.

Agentic systems do not remove that work. They make the cost of doing it badly arrive sooner.

::: {.system-statement}
`retrieval_scope=telemetry + change_log + runbook + work_order_store`  
`missing_source=regional_dispatch_override`  
`decision_question=is_pending_delivery still an active instruction?`  
`agent_answer=yes`  
`operational_answer=only if no later route authority exists`
:::

The system had not lacked intelligence. It had lacked a context contract.

A context contract defines which facts must be consulted before a class of action, who owns those facts, how recent they must be, what happens when they disagree, and what the system must do when it cannot verify them. It is less glamorous than a larger model, but it determines whether a technically correct action is allowed to be applied to the current state of the work.

The contract also protects the operator from a false expectation. When an agent has searched widely, its answer can feel more complete than a person’s first answer. The trace is longer. The sources are named. The reasoning appears patient. Yet completeness of search and relevance of context are different properties. A system may recover ten useful records and still miss the one relationship that changes whether an action is allowed. The correct design does not ask the agent to prove it knows everything. It asks the system to identify the conditions under which it must admit that it does not know enough to proceed routinely.

\phantomsection\label{section-03-route}
\section{The fact without a route}

The storm supervisor’s override was real. It was timestamped. It had a named owner. It was visible to every dispatcher in the coordination room. It was not hidden from the organisation.

It was simply invisible to the decision that mattered.

That distinction is the source of many operational failures. A fact can exist in a database, a ticket, a conversation, a control room, a spreadsheet, an email, a phone call, a field device, or a person’s working memory. It becomes context for a system only when it has a route into the system’s decision at the time the decision is made.

The route has several parts. The agent must be permitted to ask for the fact. The source must identify the fact in a form the agent can use. The source must state whether the fact is current. The decision policy must say what the fact changes. And the tool that performs the action must honor that change.

If any one of those parts is absent, the fact may be true but operationally unavailable.

The regional dispatch console had no failure. It was doing precisely what it was designed to do: let people coordinate quickly during an active response without waiting for a slower enterprise workflow to settle. The work-order service had no failure either. It represented the state of the planned route events it had received. The recovery agent had correctly interrogated the sources it was given. The error existed in the relationship between the systems.

::: {.assumption-check}
**Assumption:** A route event that has not reached a device remains the current instruction for that device.  
**What the assumption ignores:** A later authority may have changed the route in a system whose purpose is to manage the present, not the record of planned work.
:::

This is why context failures often survive ordinary testing. A team can test that the agent finds a connector error. It can test that the agent retrieves the runbook. It can test that a replay is idempotent and that a stale event does not create a duplicate job. It can even test that the agent queries the regional dispatch console when the console contains a named override.

The more difficult test is whether the organisation has recognized all the situations in which the meaning of an event changes outside the system that owns the event. The answer cannot be found by giving a model an unlimited collection of documents. It requires people who understand the relationships between planning, execution, exception handling, safety, customer commitments and recovery.

A tool can retrieve a source. It cannot decide by itself that a source has become the authority that limits another tool’s action.

That authority must be designed.

\phantomsection\label{section-04-permission}
\section{Retrieval does not create permission}

After the incident, one engineer suggested the obvious repair: give the agent access to the regional dispatch console.

The proposal sounded sensible. It was not yet safe.

The console contained names, live coordinates, contractor contact details, detailed descriptions of access constraints and field notes that sometimes included information shared under emergency conditions. A broad search tool could expose more than the recovery agent needed. A direct tool call could also create a new failure mode: the agent might treat a draft coordinator note as a final route instruction, or retrieve a previous storm’s override that had been closed but not archived correctly.

Tools do not merely supply facts. They establish a contract between an agent and an information or action space. That contract includes the scope of access, the form of the result, the distinction between final and provisional state, the identities allowed to make a change, and the constraints placed on the next action. Contemporary guidance for agent building similarly treats tools as central to the model’s information and action space, and cautions that ambiguous or overlapping tool functions create ambiguous decision points for an agent.[^ch11-anthropic]

The right repair was not a general search box labelled *dispatch*. The team designed a narrow context service.

The service would answer one question: does an active, named dispatch override exist for this route event or its assigned crew? If the answer was yes, it would return the owner, the status, the expiry and a reason category. It would not expose the full field record. It would not permit the recovery agent to alter the override. It would give the agent only what it needed to decide whether a replay remained routine.

::: {.boundary-condition}
**The recovery agent may replay a pending route event only when no active dispatch override exists for the affected route or assigned crew. An active override converts the event into an exception case. The agent must preserve the event, notify the named dispatcher, and present the unresolved state to the duty engineer.**
:::

The condition did not make the agent less capable. It made the boundary of its capability honest.

The agent could still inspect the connector, recover ordinary pending deliveries and close a common class of failure before it became a morning of manual work. It could not quietly decide that a fact stored outside its original retrieval scope was irrelevant. The system had a way to say: something else has changed the meaning of this action, and the action must now wait for the person who owns that change.

OWASP’s 2025 guidance on agentic applications treats agents as systems that plan, act and make decisions across complex workflows, and emphasizes the need to reduce their operational security risks through explicit controls.[^ch11-owasp] The lesson applies beyond security. An agent is not constrained only by what it may execute. It is constrained by what it is entitled to treat as sufficient context for execution.

This is the part of context engineering that does not disappear when models become better at search, reasoning or long-horizon planning. Better agents will find more. They will move through systems more effectively. They will be able to read, compare and summarize a wider range of evidence. The question will become sharper, not smaller: which evidence is allowed to change which decision, and who is responsible for making that relationship legible?

\phantomsection\label{section-05-lifetime}
\section{Context has a lifetime}

The storm override had another property the agent did not know: it was temporary.

The supervisor had created it for an access condition expected to last ninety minutes. Some road closures would clear. Some crews would complete their work and return to their planned route. A route event that was unsafe to replay at \livetime{06:46} might be correct again at \livetime{08:30}. The override was neither permanent truth nor a mere note. It was a fact with a lifetime.

This matters because context is often described as if it were a document. Put the right information in the prompt. Retrieve the right record. Add the right memory. But the context of operations is not static. It expires, changes authority, crosses a threshold, and is superseded by a new event.

A good agentic system therefore needs more than access to information. It needs a way to reason about the freshness, provenance and scope of that information. What did this source mean when it was written? Is it still active? Is it authoritative for this particular action? Does it apply to every route, a team, a region, or a single work order? What other source is allowed to supersede it?

These questions can be partially represented in systems. Timestamps, ownership, status, expiry, version history and scopes are not glamorous metadata. They are the structure that allows a fact to travel without losing its meaning.

::: {.handoff-note}
**Dispatch to recovery:** `override=active :: scope=crew-17, route-cluster-w3 :: owner=storm-supervisor :: expires=08:15 :: replay=hold`  
**What the receiver must know:** This is not a permanent cancellation. It is a current constraint on what may be restored automatically.
:::

The team had originally written the override as a convenience for human coordination. After the incident, it became a shared operational object with an owner, a scope, an expiry and an effect on recovery. That change did not make the work more bureaucratic. It made the correct state expressible to the systems that needed it.

The insight extends beyond a storm response. A customer freeze, a legal hold, a financial close, an active security investigation, a clinical review, a change window, a field safety condition, and a temporary business exception all share this shape. They are facts that may be absent from the system producing the action but determine whether the action is still appropriate in the wider world.

The future of agents will make this more important. As tool-using systems can retrieve files, query current information, operate applications, preserve traces and pursue multi-step tasks, they can reach more of an organisation’s work than earlier automation could.[^ch11-openai] That reach is valuable. It also means that the organisation must decide which temporary, local or human-held facts need a route into the actions an agent can take.

Context is not a universal database. It is a set of carefully maintained relationships between facts and decisions.

\phantomsection\label{section-06-know}
\section{What the agent must be able to know}

The corrected recovery agent ran again two months later.

A connector in another region lost acknowledgements after a network policy update. The agent diagnosed the mismatch, read the change record, checked the route events and asked the new context service whether an active override existed. There was none. It replayed the pending work. The delivery gap closed. No one wrote an incident report because the system had handled an ordinary case within an ordinary boundary.

Later that afternoon, a second relay gap appeared in the storm region. This time the context service returned an active override. The agent did not attempt the replay. It preserved the pending events, named the dispatcher, and sent the duty engineer a compact account of the conflict.

The engineer did not need to recreate the connector diagnosis. The agent had already done that. She did not need to read every field note. The context service had already expressed the relevant constraint. Her work was to determine whether the dispatch override should stand, be narrowed, or be superseded by a different operational priority.

This is a more demanding idea of augmentation than the familiar phrase *human in the loop*. The person is not added at the end because the system lacks confidence. The person appears where a fact changes the authority of the action and where the organisation has decided that the difference cannot be collapsed into a generic rule.

::: {.the-question}
If a system can search every relevant source, how will it know which source has the right to change the meaning of the action?
:::

The question is not hostile to agents. It is a design requirement for agents that will become more capable and more embedded in real work.

An organisation earns the benefits of agentic speed when it gives its agents narrow, useful routes to the facts that matter. It loses those benefits when it either hides the facts in disconnected systems or attempts to solve every ambiguity by exposing everything. One approach produces blindness. The other produces noise, privacy risk and a new kind of confident confusion.

The better design is selective. It names the relevant fact, its owner, its lifetime, its scope and its consequence for an action. It allows the agent to proceed quickly when the fact is absent or stable. It makes the agent stop clearly when the fact changes the case.

::: {.memorable-phrase}
Context is not everything a system can retrieve. It is what changes the meaning of the action it is about to take.
:::

The recovery agent now knew when it did not have the whole situation. That knowledge was not a failure of intelligence. It was a condition for using intelligence without making the rest of the organisation disappear.

The point is not to make every ordinary recovery wait for a committee. It is to make the exceptional fact legible early enough that an ordinary recovery does not overwrite it. Speed remains valuable. Context determines when speed has stopped being a benefit and become a way of carrying an unseen consequence into the next system.

::: {.next-chapter}
**Trust**  
A system can show its evidence, name its limits and hand an exception back. The remaining question is whether the people around it can rely on that behavior when the pressure to move faster returns.
:::

## References

[^ch11-openai]: OpenAI, [*New tools for building agents*](https://openai.com/index/new-tools-for-building-agents/), 11 March 2025.

[^ch11-anthropic]: Anthropic Applied AI, [*Effective context engineering for AI agents*](https://www.anthropic.com/engineering/effective-context-engineering-for-ai-agents), 29 September 2025.

[^ch11-owasp]: OWASP, [*Top 10 for Agentic Applications for 2026*](https://genai.owasp.org/resource/owasp-top-10-for-agentic-applications-for-2026/), 9 December 2025.
