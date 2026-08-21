---
number: "17"
chapter: "17"
part: "Part IV: The New Engineer"
title: "Building Systems Worth Trusting"
kicker: "A system earns trust when its action can be bounded, inspected and repaired after the conditions change."
status: "draft"
memorable_phrase: "Trust is not the belief that an agent will be right. It is the evidence that the system can show its work, limit its reach and survive being wrong."
---

# Building Systems Worth Trusting

::: {.impact-opener number="17" title="BUILDING SYSTEMS WORTH TRUSTING"}
The agent rolled the release back correctly. The system was not yet safe to trust.
:::

::: {.chapter-guide}
\chapterguideentry{01}{The rollback that appeared to work}{ch17-section-01-rollback}
\chapterguideentry{02}{Trust is a property of the path}{ch17-section-02-path}
\chapterguideentry{03}{An agent needs a testable world}{ch17-section-03-testable}
\chapterguideentry{04}{A trace is not a story}{ch17-section-04-trace}
\chapterguideentry{05}{Reversibility is a design budget}{ch17-section-05-reversibility}
\chapterguideentry{06}{The system that can survive surprise}{ch17-section-06-survive}
:::

\clearpage
\phantomsection\label{ch17-section-01-rollback}
\section{The rollback that appeared to work}

::: {.field-note}
**Release-recovery trace, 2026 composite.**  
`agent=release-steward :: service=dispatch-router :: rollout=2026.08.17.4`  
`signal=delivery_timeout ↑ :: action=traffic_rollback`  
`canary=restored :: outcome_check=disagrees`  
`retry_queue=accepted :: downstream_ack=missing :: state=hold`
:::

At \livetime{14:26}, the release steward began to reverse a deployment without waiting for an engineer to type the first command.

The dispatch-router was a modest service with an immodest responsibility. It accepted confirmed work orders from customer systems, translated them into an internal delivery format, and placed them on queues used by routing, billing and field-coordination services. A new release had passed its pre-production tests. It had been rolled out gradually. For the first twenty minutes, nothing suggested trouble.

Then delivery acknowledgements began to arrive late.

The release steward watched deployment events, request latency, service errors, queue depth, downstream acknowledgements and the dependency map associated with the release. It had permission to halt a rollout, shift traffic away from a new version, restore the immediately preceding container image and open an incident with the evidence it had collected. It did not have permission to alter customer work orders, purge queues, edit billing records or bypass the state checks that protected those systems.

At first, the agent behaved exactly as its designers hoped. It compared the current error pattern with the release baseline. It found that the elevated timeouts began after the new version reached half of the traffic. It checked whether the same signature had appeared in a recent dependency alert. It found no matching platform incident. It reduced the release to the previous image for a small traffic slice, waited for the canary metrics, then restored the old version across the remaining traffic.

The customer-facing error rate fell within minutes.

In the incident channel, a status line appeared:

\systemvoice{Rollout reversed. Dispatch latency and timeout rate returned to baseline. Monitoring downstream acknowledgment recovery.}

The sentence sounded like a conclusion. It was not.

The retry queue had accepted the work orders that timed out during the failed release. The router was again processing new work normally. Yet one downstream acknowledgement stream was quiet. The release steward had verified that the old image was receiving traffic. It had not verified that every accepted work order had reached a terminal state after the reversal.

A person reading only the customer-facing dashboard might have declared the incident resolved. The system looked green. The rollout had been reversed. The agent had performed the action that an experienced operator would probably have performed first.

But a system worthy of trust does not stop at the action that seems right. It checks whether the action produced the state it was supposed to protect.

\phantomsection\label{ch17-section-02-path}
\section{Trust is a property of the path}

Trust is often spoken of as a feeling that accumulates around a system. The agent has worked before. The team likes its summaries. It catches problems quickly. It makes the incident channel calmer. People begin to say they trust it.

Those impressions matter, but they are not enough.

An agent can be impressive and still be unsafe to rely on. It can identify the most likely cause, call the apparently correct tool and produce a plausible explanation while missing the fact that matters outside its immediate action. The risk rises as agents move beyond fixed automation. They can retrieve context, choose tools, form multi-step plans, modify live state and adapt when an intermediate result changes. Those capacities make them useful. They also make the route from observation to consequence longer and harder to inspect.[^ch17-anthropic]

The release steward had not failed by taking the rollback action. It had earned part of the team’s reliance by taking a bounded action for which the evidence was strong. The important design choice came afterward. Its success condition was not “old version is serving traffic.” Its success condition was “the old version is serving traffic and the work accepted during the failure can be accounted for.”

::: {.case-signal}
**What looked recovered:** customer-facing timeout rate returned to baseline after traffic moved back to the prior release.  
**What remained unverified:** the set of work orders accepted during the rollout had not yet produced a matching terminal acknowledgement downstream.  
**Why the difference matters:** a recovered interface can conceal an unfinished operational state.
:::

The distinction is not academic. An action may be correct at one boundary and incomplete at another. A database can be reachable while a reconciliation is still ambiguous. A traffic shift can succeed while a narrow class of queued work is stranded. A compromised credential can be revoked while a downstream token remains valid. An agent that sees only the first boundary may create the illusion of control precisely because its action is fast, legible and reassuring.

Trustworthy systems make the second boundary visible.

This is why trust is a property of the path, not only of the result. The team needs to know what prompted the agent, which evidence it used, what alternatives it considered, which tools it called, what each tool changed, what checks followed the action and what condition caused the system to stop. The final statement is useful. The sequence that produced it is what makes the statement examinable.

\phantomsection\label{ch17-section-03-testable}
\section{An agent needs a testable world}

The release steward existed because the team had stopped treating a runbook as a document that described a response. They had turned the runbook into a testable system of conditions.

The old runbook contained a familiar instruction: if a release correlates with rising delivery timeouts, roll back the deployment and monitor recovery. It was sensible advice. It also left too much inside the phrase *monitor recovery*. Which signals counted? How long should the system wait? What did it mean for recovery to be complete? Could a rollback proceed if the queue was still accepting work but acknowledgements were absent? Who owned the distinction between an accessible queue and an accounted-for order?

The agent could not be given a useful answer by adding a larger language model to the runbook. It needed a world in which those questions had operational forms.

::: {.routine-map}
| From a familiar runbook phrase | To a condition the agent can test |
|---|---|
| “The release appears related.” | Error signature begins after rollout milestone and no independent platform incident explains the change. |
| “Roll back safely.” | Shift traffic only to the prior signed image; preserve in-flight work; do not alter queues or records. |
| “Confirm recovery.” | Front-door latency returns to baseline **and** accepted work orders reconcile with downstream acknowledgements inside the defined interval. |
| “Escalate if needed.” | Hold the incident when terminal-state verification disagrees, attach the trace and page the queue-integrity owner. |
:::

The table did not remove judgment. It relocated some judgment into a form that could be tested before an incident.

The team built a small evaluation suite from prior release failures, near misses and difficult exercises. One case contained a release that created visible errors and a clean rollback. Another contained a release where traffic recovered but a retry mechanism duplicated a small number of events. A third contained a dependency problem whose timing made the release look guilty even though it was not. A fourth contained a healthy queue that delivered nothing because the downstream consumer’s acknowledgement contract had changed.

The purpose was not to make the agent infallible. It was to find out whether the system preserved the right distinctions when an attractive answer was not sufficient.

The team also separated a successful transcript from a successful outcome. A transcript could show that the agent inspected the release, found the threshold, used the approved rollback tool and opened an exception. Those were useful signs of disciplined behavior. They did not establish that the affected work orders had reached their intended state. For that, the team needed state checks outside the agent’s own account: source records, downstream acknowledgements, consumer-group reconciliation and a replay test against a controlled subset.

This distinction matters whenever an agent acts through several systems. A tool call can return success while a later dependency rejects the state it created. An agent can complete every planned step while its plan is based on a stale dependency map. A final summary can sound coherent while the outcome remains incomplete. Testing only whether an agent followed the expected sequence would reward compliance without verifying the thing the sequence was supposed to protect.

The evaluation suite therefore graded both sides. It asked whether the agent stayed within its authority, used the required tools and stopped at the right boundary. It also asked whether the release state, queue state and terminal business state agreed after the action. When the two answers diverged, the agent had not failed silently. The system had found a condition that required repair.

Contemporary guidance on agent evaluation makes this explicit. Agents can use tools across multiple turns, modify state and adapt to intermediate results. Evaluation therefore needs more than a final response score. Teams need tasks with clear success criteria, repeated trials, traces, outcome checks and a combination of code, model and human judgment.[^ch17-anthropic]

The release team used a simple rule: every significant failure should become a test before it becomes a memory. A post-incident lesson that survives only in a conversation will disappear when the people change. A test becomes part of what the agent must continue to get right after its model, tools or policies evolve.

\phantomsection\label{ch17-section-04-trace}
\section{A trace is not a story}

At \livetime{14:31}, the release steward opened the queue-integrity exception. It attached the following record.

::: {.traceback}
`14:26:14` rollout milestone reached: `50%`  
`14:26:49` delivery-timeout signature exceeded release threshold  
`14:27:03` dependency scan: no matching platform incident  
`14:27:18` canary rollback initiated: `5% → prior-signed-image`  
`14:28:07` canary latency normalized; timeout rate declined  
`14:29:11` full traffic rollback complete  
`14:30:04` accepted-work count and terminal-ack count disagree  
`14:31:00` action boundary reached: no queue mutation permitted  
`14:31:02` queue-integrity exception created; owner paged
:::

A trace is often misunderstood as an answer to the question, *why did the agent do that?* It is not an answer by itself. It is the material from which an answer can be tested.

A useful trace connects a decision to the state that justified it. It shows the policy version, the input sources, the timestamps, the tool calls, the parameters that mattered, the state transitions, the verification checks and the condition that ended the agent’s authority. Without those elements, a polished explanation can become a story told after the fact. The system may sound reasonable while the team cannot determine whether the right control actually ran.

OpenAI’s 2025 technical example for agent evaluation describes this engineering reality in practical terms: a trace can include the agent workflow, individual model calls and tool calls; online evaluation can track metrics such as latency, cost and user feedback, while offline evaluation checks behavior before a change reaches production.[^ch17-openai]

The release steward’s trace did not prove that its reasoning was perfect. It made the system’s behavior inspectable enough for the queue-integrity owner to continue the work. The owner could see that the agent had not silently discarded work. They could see that it had not been granted permission to replay or purge the queue. They could compare the accepted-work identifiers with the missing acknowledgements. They could decide whether the fault lay in a consumer, an acknowledgement contract or a retry state.

::: {.operator-note}
A trace earns its value when it lets the next person verify a system’s action without having to trust the system’s account of itself.
:::

This is different from logging everything. A vast collection of records can still fail to expose the transition that mattered. The design task is to preserve the evidence necessary to reconstruct authority and consequence. Which policy allowed the tool call? Which source made the condition true? Which state was changed? What state remained unverified? Who received the exception? If the trace cannot answer those questions, the system has recorded activity without creating accountability.

The trace must also be useful to someone who did not build the agent. An incident responder should not need to infer the meaning of an opaque internal score. A service owner should be able to see which of their systems was included and why. A reviewer should be able to compare the agent’s permitted scope with its actual tool calls. A repair team should receive the identifiers and state boundaries needed to continue the work, not only a natural-language description of what the agent believed it had done. In this sense, observability is not a dashboard feature. It is the interface through which an organisation keeps a system’s agency answerable to the people affected by it.

\phantomsection\label{ch17-section-05-reversibility}
\section{Reversibility is a design budget}

The release steward could roll traffic back. It could not repair every consequence of a release.

This limitation was intentional. The agent’s permissions were shaped by a simple principle: autonomy should expand only where the effect can be bounded and the recovery path is understood. Reversing traffic to a prior signed image was a narrow, practiced action. Deleting a queue, replaying customer work orders or editing a billing record was not. Those actions required different evidence, different authority and a different form of review.

::: {.boundary-condition}
**The release steward may halt a rollout and restore traffic to the immediately preceding signed image only when the image is available, the canary state is healthy and the action preserves in-flight work. It may not replay, purge or edit queued work. If acceptance and terminal-state verification disagree, the agent must hold, preserve the trace and route the exception to the queue-integrity owner.**
:::

Reversibility is sometimes treated as a binary property. Either the change can be rolled back or it cannot. In practice, it is more useful to think of reversibility as a budget. A system may be able to reverse traffic but not recreate an external side effect. It may restore a configuration but not recover the reason an operator made an emergency change. It may undo a deployment while leaving work in a state that requires reconciliation.

The engineer’s task is to spend the autonomy budget where the system can afford it. That requires identifying the smallest action that relieves the present risk while preserving options for the next decision. In the release incident, traffic rollback stopped the growing failure. Holding the queue exception preserved the ability to inspect the accepted work. The agent did not attempt a dramatic recovery because the evidence did not justify the authority.

A good design makes this restraint visible before the incident begins. It defines which tools are available in each state, what proof expands the action boundary, what proof contracts it, how long a partial state may persist, and what evidence must survive a rollback. These are not restrictions added after the agent has demonstrated power. They are the conditions that allow power to be delegated without turning every ambiguous case into an emergency for a human operator.

The security stakes of this restraint are increasingly concrete. OWASP’s 2025 work on agentic applications describes the transition from helpful chatbots to goal-driven systems that plan, act and coordinate across workflows. It identifies risks including tool misuse, identity and privilege abuse, memory and context poisoning, cascading failures and exploitation of human trust in agent outputs.[^ch17-owasp]

The response is not to make every agent powerless. A powerless agent cannot help in the moment that made automation valuable. The response is to make every permission legible, narrow enough to contain a mistake, and paired with a verification and repair path proportionate to its consequence.

\phantomsection\label{ch17-section-06-survive}
\section{The system that can survive surprise}

At \livetime{14:46}, the queue-integrity owner found the missing work orders.

The failed release had altered a serialization field used only by a small group of downstream consumers. The old router had resumed traffic correctly, but the consumer had rejected a set of messages whose retry metadata had been written by the new version. No customer work order was lost. The affected set could be reprocessed after a narrow transformation, verified against the source record and released in batches.

The recovery took longer than a clean dashboard would have suggested. It was also less damaging than an early declaration of success would have made it.

The team changed three things after the incident. They added the serialization case to the evaluation suite. They strengthened the outcome check so that terminal acknowledgements were classified by consumer group rather than only in aggregate. They added a pre-release compatibility test for the metadata contract between router and consumer.

::: {.assumption-check}
**Assumption:** A rollback that restores latency has repaired the release.  
**Evidence after the incident:** The interface recovered while a narrow set of accepted work orders remained unacknowledged by one consumer class.  
**Design response:** Verify terminal state by consumer group, preserve the exception path and add the failure to the regression suite.
:::

This is how a system becomes worth trusting. Not by avoiding every surprise. Not by predicting every path a capable agent might take. It becomes trustworthy by treating surprise as a condition the system can survive without concealing, widening authority or abandoning the evidence needed for repair.

Trust also has to be maintained. A new model, tool integration, policy revision, data source or recovery dependency can change the meaning of a boundary that was once well tested. The team therefore reviews traces after real incidents, turns newly discovered failure modes into cases, reruns the regression suite before material changes, and revisits permissions when the agent receives a new capability. The work is continuous because the system’s authority is continuous. A one-time safety review cannot govern a workflow whose behavior evolves with its tools and context.

The work is demanding because agentic systems make execution easier while making design mistakes propagate more quickly. An agent that can inspect, plan and act across systems can also carry an unclear policy, a stale context or an overly broad permission through several tools before a person notices. The answer is not to return to a world in which each action waits for a command. It is to build the boundaries, tests, traces and recovery paths that let speed remain accountable.

::: {.memorable-phrase}
Trust is not the belief that an agent will be right. It is the evidence that the system can show its work, limit its reach and survive being wrong.
:::

A trustworthy agent does not merely execute a good action. It leaves the people around it able to inspect what happened, interrupt what should not continue, and repair what the action did not fully resolve.

When systems can do more of the work that once required an operator’s hands, the value of human work does not vanish with the command. It gathers around the conditions that make action safe enough to delegate and failure recoverable enough to learn from.

::: {.next-chapter}
**The Work That Survives**  
The work that remains is not the residue of what machines could not do. It is the work of deciding what should be delegated, what must remain contestable and what kind of system people can still live with after it acts.
:::

## References

[^ch17-anthropic]: Anthropic, [*Demystifying evals for AI agents*](https://www.anthropic.com/engineering/demystifying-evals-for-ai-agents), 9 January 2026.

[^ch17-openai]: OpenAI Developers, [*Evaluating Agents with Langfuse*](https://developers.openai.com/cookbook/examples/agents_sdk/evaluate_agents), 31 March 2025.

[^ch17-owasp]: OWASP, [*Top 10 for Agentic Applications*](https://genai.owasp.org/2025/12/09/owasp-top-10-for-agentic-applications-the-benchmark-for-agentic-security-in-the-age-of-autonomous-ai/), 9 December 2025.
