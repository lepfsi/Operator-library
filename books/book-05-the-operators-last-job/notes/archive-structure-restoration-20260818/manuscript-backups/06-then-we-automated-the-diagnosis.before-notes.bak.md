---
number: "06"
part: "Part II — The Automation Curve"
chapter: "06"
title: "Then We Automated the Diagnosis"
kicker: "The handover becomes consequential when the explanation arrives before the context."
status: "draft"
memorable_phrase: "The system did not take the decision. It made every other decision look unreasonable."
---

# Then We Automated the Diagnosis

> *The system had an answer before the room had agreed on the question.*

::: {.chapter-guide}
\chapterguideentry{01}{The alert that already had an answer}{section-01-answer}
\chapterguideentry{02}{The diagnosis that narrows the room}{section-02-narrows}
\chapterguideentry{03}{When confidence arrives before context}{section-03-confidence}
\chapterguideentry{04}{A diagnosis is already an action}{section-04-action}
\chapterguideentry{05}{The work of keeping a question open}{section-05-open}
\chapterguideentry{06}{The next handover}{section-06-handover}
:::

\phantomsection\label{section-01-answer}
## The alert that already had an answer

At \livetime{11:48}, the graph is wrong before anyone knows why.

A client that should fetch a speaker-recognition file once a day is fetching it again and again. The release has reached a quarter of the fleet. Requests climb toward the quota that protects the service. The on-call engineer stops the rollout, opens a bug, and writes down the one fact no one disputes: the system is doing far more work than it was designed to do.

This is a familiar beginning. There is an abnormal signal. There is a recent change. There is a queue of facts that have not yet become a cause.

In the Google Home incident described in the *Google SRE Workbook*, a known defect looked close enough to explain the additional traffic. It was a real defect. It did create extra work. It was not the reason the files were being fetched so much more often. A quota increase reduced the immediate pressure, and the release resumed. The explanation had done what plausible explanations often do: it had made the next move feel reasonable. [1]

::: {.case-signal}
**Case signal — Google Home, 2017.** A mitigation can be useful without being complete. Increasing the quota repeatedly reduced user impact, but the service could not be made reliably safe until the deeper cause was understood. Relief is evidence that pain has decreased; it is not proof that the story is finished. [1]
:::

Nothing in that sequence requires negligent people. The signal was real. The known bug was real. The mitigation helped. The trouble was subtler: each true thing arrived in an order that made an incomplete story persuasive.

For years, the space between those facts was where operators worked. Someone read the deployment note, remembered an exception from a previous incident, called the team that owned an adjacent dependency, and asked whether the cleanest explanation was merely the first one available. From a distance, this could look like delay. Inside an incident, it was disciplined caution.

Then we built systems that could perform much of the search in seconds.

\phantomsection\label{section-02-narrows}
## The diagnosis that narrows the room

The new systems are genuinely helpful.

They collect alerts before the incident channel opens. They compare an error spike with recent deploys, retrieve a runbook, identify the service owner, summarize the last similar outage, and rank the likely causes. They do not enter the room declaring that they are replacing the operator. They enter with a quieter promise: *Here is what changed. Here is what is probably happening. Here is where to look next.*

That promise deserves to be welcomed. No serious operator wants two hundred alerts, ten dashboards, three chat threads, and four equally plausible owners. A useful diagnosis returns attention to people who have been drowning in signals. It can make the first fifteen minutes of an incident less wasteful.

This is also why adoption will rarely arrive as a dramatic replacement programme. It will arrive as a better handoff at 02:13, when the on-call engineer is alone, the dashboard is loud, and the agent can assemble the change history before the first colleague joins. It will arrive as fewer blind searches, cleaner incident notes, and a recommendation that spares a team the ritual of rediscovering what the system already knows. The operator has every practical reason to accept that help.

But a diagnosis is not only a finding. It is a selection.

It decides that this signal matters more than that one. It makes the migration central and the cache flush incidental. It names one owner before another. It turns some facts into evidence and leaves other facts in the background. It gives the team a route through the noise.

That is why diagnosis feels like relief: it reduces the size of the room.

The question is not whether the system should reduce that room. It should. The question is what the team must preserve outside it.

Before automated diagnosis, an operator could say, “We do not know yet.” The statement was unsatisfying, but it was ordinary. Weak hypotheses could coexist in public while the team gathered more context. After an automated diagnosis, disagreement has a different cost. The operator is no longer simply uncertain. They are contradicting an explanation with a confidence score, a timeline, correlated events, a linked pull request, and a recommended runbook.

The answer may be good. It may even be better than the answer the room would have found alone. Still, the burden of saying *wait* has changed. A team accustomed to the speed of the first answer can begin to experience a second investigation as waste. The pressure does not need to be stated aloud. It is built into the contrast between an available recommendation and the slower work of finding out whether its confidence is earned.

\phantomsection\label{section-03-confidence}
## When confidence arrives before context

This is not a warning against pattern recognition. Pattern recognition is one of the oldest forms of operational expertise. Experienced engineers recognize a shape in a graph, a sequence in a log, or a familiar kind of silence from a dependent service. AI extends that ability across more data, more incidents, and more tired hours.

The limit appears when a correlation starts to sound like a cause.

A system may correctly observe that a deployment occurred four minutes before the first alert, that the change touched a connection-pool setting, and that a prior incident was resolved by rolling back a similar change. Each statement can be well sourced. The conclusion can still be wrong. A database migration may be holding table locks while a scheduled cache flush produces the more visible CPU spike. Temporal proximity makes the cache job easy to blame; causal understanding requires looking past it. [2]

The more fluent the explanation, the easier it is to forget this distinction.

::: {.field-note}
**Field Note — Operational composite: a control room beyond IT.** A decision-support system in a regional power-control room correlates a frequency change with lower renewable output and recommends shedding a block of industrial demand. The figures are accurate. The recommendation is plausible. An operator pauses because a substation has just moved to delayed telemetry during a maintenance cutover; the displayed state may be true, but it is not current enough to govern a disruptive response. The operator is not rejecting automation. She is restoring the condition that lets a recommendation become an authorization.
:::

The sector changes; the mechanism does not. In a network operations centre, a hospital bed-management desk, a rail-control room, or a financial-operations team, the system may have more data than any one person. Yet the decision can still depend on an obligation, a relationship, an exception, or a timing condition that the data did not carry with it.

This is the first discomfort the chapter asks the reader to feel. Not fear. Not nostalgia. A professional discomfort: the recognition that a clear answer can arrive before the context required to trust it.

\phantomsection\label{section-04-action}
## A diagnosis is already an action

We often draw the boundary too late.

We say that the human remains in control because the system only recommends. It has not rolled back the release, drained the cell, increased the quota, or failed traffic away from a region. It has merely described the situation.

But description is not neutral when a system is under pressure.

The first action in an incident is usually an allocation of attention. Someone decides which graph to open, which owner to page, which hypothesis to test, which risk to accept, and which possibility to postpone. A diagnosis that performs those selections has already acted on the incident. It has created a path through the noise.

Often, that path will be excellent. It may save twenty minutes of unstructured searching. It may prevent a small failure from becoming a large one. Its value is precisely why organizations will rely on it.

::: {.boundary-condition}
**Boundary condition.** A suggestion becomes evidence only when its limits are visible. Evidence becomes a decision only when someone accepts the consequences. A decision becomes authorization only when the organization has identified who is entitled to make it—and what must remain reversible if the explanation changes.
:::

The danger is not that the system makes every decision. The danger is that it makes every other decision look irresponsible.

A human name can remain on an approval button long after meaningful judgment has disappeared from the process. If the explanation arrives faster than the organization can inspect it, accountability becomes a label attached after authority has already moved.

The question is therefore not whether the system should be allowed to help. It should. The question is whether the organization has preserved a place where help can still be refused for a reason the system cannot score.

\phantomsection\label{section-05-open}
## The work of keeping a question open

The operator who remains useful in this world is not the person who races the model across the same evidence.

That contest is already lost where it should be lost. The machine can retrieve faster. It can compare more incident timelines. It can retain the dependency graph without growing tired at three in the morning. Pretending otherwise is nostalgia disguised as professionalism.

The operator’s work moves somewhere else.

Its quality is not measured by how often it stops the system. It is measured by whether the system’s speed still leaves enough room for consequences to surface before they become irreversible.

It begins with a question the confidence score cannot settle: *What would make this explanation dangerous even if it were true?*

A recommendation to restart a service may be technically sound and operationally wrong because it destroys the only remaining evidence. A recommendation to shift traffic may be reversible and still wrong because it transfers failure to a customer who was never meant to become the buffer. A recommendation to roll back may be causally justified and still collide with a change freeze protecting a regulated migration.

These are not mystical human insights. They are obligations. Someone has to decide which obligation governs when the available facts point in different directions.

::: {.memorable-phrase}
**The system did not take the decision. It made every other decision look unreasonable.**
:::

The operator’s new record therefore includes more than what the system observed. It records what may have been omitted, which relationship sits outside the model, which old exception has become relevant, and what the team would regret discovering five minutes after acting.

This is not a ceremonial human-in-the-loop. A person who clicks *approve* after the answer has become inevitable is not providing oversight. Meaningful oversight keeps the question open long enough for the organization to see whether the answer deserves to become an action.

In the Google Home incident, this would not have required refusing every quota increase. It would have required treating each successful mitigation as a reason to ask a sharper question before resuming the rollout: *What has stopped? What has been explained? What remains unexplained? Who is not yet in the room?* [1]

Those questions sound modest. Under pressure, they are expensive. They delay the clean story. They require an organization to value the person who can say, “This is working, and I still do not think we understand it.”

\phantomsection\label{section-06-handover}
## The next handover

The curve does not stop at explanation.

Once a system can observe the incident, retrieve the context, rank the causes, estimate the blast radius, and recommend the lowest-risk fix, the remaining human approval begins to look inefficient. Every minute spent testing the difference between a plausible story and a sufficient one can be described as latency.

That is the seduction of the next handover.

First, we automated the routine because the action was familiar. Then we automated the diagnosis because the evidence was abundant. Soon the system will be asked to act because its recommendation has been right often enough for waiting to feel like the greater risk.

The question will no longer be whether the machine understands the incident. It will be whether we have remembered what it means to authorize a response.

::: {.next-chapter}
**Then We Let Machines Act**

A recommendation becomes a workflow. A workflow becomes a decision. The next boundary is not whether the system can act safely in the familiar case, but who notices when the unfamiliar case arrives.
:::

## References

[1] Google, “Incident Response,” *Google SRE Workbook*, case study “Software Bug—The Lights Are On but No One’s (Google) Home.” https://sre.google/workbook/incident-response/

[2] Tom Wentworth, “AI Root Cause Analysis: Accuracy Testing Guide,” *incident.io*, 20 February 2026. https://incident.io/blog/ai-root-cause-analysis-accuracy-testing-guide
