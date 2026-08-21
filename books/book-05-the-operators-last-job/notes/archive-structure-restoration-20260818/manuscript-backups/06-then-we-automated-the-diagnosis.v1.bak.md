---
number: "06"
part: "Part II — The Automation Curve"
chapter: "06"
title: "Then We Automated the Diagnosis"
kicker: "The handover becomes dangerous when the explanation arrives before the context."
status: "draft"
memorable_phrase: "The system did not take the decision. It made every other decision look unreasonable."
---

# Then We Automated the Diagnosis

> *The system had an answer before anyone had agreed on the question.*

::: {.chapter-guide}
\chapterguideentry{01}{The alert that already had an answer}{section-01-answer}
\chapterguideentry{02}{The diagnosis that narrows the room}{section-02-narrows}
\chapterguideentry{03}{When confidence arrives before context}{section-03-confidence}
\chapterguideentry{04}{A diagnosis is already an action}{section-04-action}
\chapterguideentry{05}{The work of refusing a plausible story}{section-05-refusal}
\chapterguideentry{06}{The next handover}{section-06-handover}
:::

\phantomsection\label{section-01-answer}
## The alert that already had an answer

At \livetime{11:48}, the graph is wrong before anyone knows why.

The requests are arriving too often. A client that should fetch a speaker-recognition file once a day is fetching it again and again. The line climbs until it is no longer a line but a warning. A release has reached a quarter of the fleet. The on-call engineer stops it, opens a bug, and writes down the visible fact: traffic is far above the capacity the service was designed to absorb.

This is the moment every operator recognizes. There is an abnormal signal. There is a system that used to behave one way and now behaves another. There is a growing queue of facts that do not yet form a cause.

In the Google Home incident documented in the *Google SRE Workbook*, a known defect looked close enough to explain the extra traffic. When an application refreshed authentication and enrollment state, the speech processor restarted. That defect was real. It did produce additional work. It was not, however, the cause of the much more frequent fetches that the team had observed. A quota increase reduced the immediate pressure. The release resumed. The explanation had done what plausible explanations often do: it had made the next move feel reasonable. [1]

Nothing in that sequence required bad engineers. The signal was real. The known bug was real. The mitigation helped. The problem was that each true thing arrived in an order that made the incomplete story persuasive.

An operator learns to live inside that gap. The dashboard shows a symptom. The ticket names a service. A recent change supplies a suspect. The pressure to restore service supplies a remedy. Between these pieces is the part that cannot be read directly from a graph: whether this explanation is sufficient to authorize the next action.

For a long time, this work was slow because it was human. Someone had to read the deployment note, remember an exception from a previous incident, call the team that owned an adjacent dependency, and ask whether the cleanest explanation was merely the first one available. The work was not admired because it was not easily visible. It looked, from a distance, like delay.

Then we built systems that could do much of it in seconds.

They collect alerts before the incident channel opens. They compare the error spike with recent deploys. They retrieve the runbook, locate the service owner, summarize the last similar outage, and rank the likely causes. They do not enter the room saying, *I am replacing the operator.* They enter saying, *Here is what happened, here is why, and here is what you should do next.*

That is a much easier handover to accept.

\phantomsection\label{section-02-narrows}
## The diagnosis that narrows the room

Automating routine had removed a visible action from the queue. Automating diagnosis removes something less visible: the open field of possible explanations.

A diagnosis is not only a finding. It is a selection.

It says that this signal matters more than that one. It says the database migration is probably relevant and the cache flush probably is not. It says the deployment is the beginning of the story, not the billing exception that changed the traffic shape two days earlier. It gives the team a sequence in which some facts become evidence and others become background noise.

That is why a good diagnosis feels like relief. It reduces the size of the room.

The relief is genuine. During an incident, no one wants two hundred alerts, ten dashboards, three chat threads, and four plausible owners. A system that groups the alerts, finds the recent change, and offers three relevant hypotheses can return attention to people who have been drowning in signals. The value is not imaginary. It is exactly why these systems will be adopted.

But the reduction has a cost. Each answer that appears early changes the burden of disagreement.

Before the automated diagnosis, an operator might say, “We do not know yet.” That statement was unsatisfying, but it was ordinary. The team could compare weak hypotheses in public. After the diagnosis, the operator who disagrees is no longer merely uncertain. They are contradicting an explanation that has a confidence score, a timeline, correlated events, a link to the relevant pull request, and a recommended runbook.

The machine has not made the decision. It has changed what counts as a reasonable decision.

::: {.case-signal}
**Case signal — Google Home, 2017.** A quota increase repeatedly reduced the immediate user impact, while the deeper cause of repeated fetches remained unresolved. The release proceeded before the root cause was understood, and the failure returned at a larger scale. The lesson is not that mitigation is wrong. It is that relief is evidence of reduced pain, not proof of understood cause. [1]
:::

In the Google Home incident, the team had enough information to make the quota explanation compelling. It had abnormal request volume. It had a known bug linked to extra traffic. It had a mitigation that appeared to work. What it did not yet have was a shared causal account across the client and server sides of the system. The incident did not lack intelligence. It lacked a way to keep an incomplete explanation from becoming the governing one.

That distinction matters more when diagnosis becomes automated. The system can search more logs than any operator. It can hold more deployments, traces, past incidents, and topology data in view at once. Yet breadth of retrieval is not the same as completeness of context. It may see the commit and miss the contractual constraint that forbids a rollback. It may see a CPU spike and miss that the spike is a symptom of a database lock. It may find an old runbook whose recommendation was correct before the architecture changed.

The more fluent the explanation, the easier it is to forget this.

\phantomsection\label{section-03-confidence}
## When confidence arrives before context

Modern incident systems are built to make uncertainty legible. That is useful until legibility is mistaken for certainty.

An AI system can say that a deployment occurred four minutes before the first alert, that the change modified a connection-pool setting, and that a prior incident was resolved by rolling back a similar change. Every part of the sentence can be well sourced. The conclusion can still be wrong.

Correlation has always been a trap in operations. A database migration begins. A scheduled cache job runs. Latency rises. A system that sees temporal proximity may blame the CPU spike caused by the cache job while missing the table locks that were holding the actual workload still. This is not a failure of speed. It is a failure of causal understanding. [2]

The risk is not limited to false answers. It also appears when the answer is almost right.

A diagnosis may identify the component that is failing but miss the condition that makes one response unacceptable. It may correctly recommend a failover without knowing that the replica is two hours behind. It may recognize a saturation pattern without knowing that the customer traffic being shed belongs to the one client whose service-level obligation cannot be breached. It may retrieve the runbook that worked last year without knowing that the dependency it tells you to restart no longer exists.

None of these are exotic edge cases. They are the ordinary material of operations: exceptions, histories, relationships, promises, and consequences that are not reliably present in a telemetry stream.

This is where the operator’s fear becomes difficult to name. The fear is not simply that the system will know more. It will often know more. The fear is that what the system knows will arrive as a finished story before the operator has had time to discover what it does not know.

The old incident room tolerated silence. Someone could say, “That is a possibility, but I want to see the other cell.” The statement did not need to defeat an interface. It only needed to keep the investigation open.

The new incident room has a different pressure. The recommendation is already written. The evidence has already been gathered. The next step is already one click away. To pause now can look like hesitation. To ask for context can look like resistance to progress. To insist on uncertainty can look, especially to people outside the room, like a refusal to use the tool that was purchased to make uncertainty disappear.

That is how confidence becomes authority before anyone has formally granted it.

\phantomsection\label{section-04-action}
## A diagnosis is already an action

We often draw the boundary too late.

We say that the human remains in control because the system only recommends. The agent has not changed production. It has not rolled back the release, drained the cell, increased the quota, or failed traffic away from a region. It has merely described the situation.

But description is not neutral when a system is under pressure.

The first action in an incident is usually not a command. It is an allocation of attention. Someone decides which graph to open, which owner to page, which hypothesis to test, which risk to accept, and which possibility to postpone. A diagnosis that performs these selections has already acted on the incident. It has created a path through the noise.

That path may be excellent. It may save twenty minutes of unstructured searching. It may surface the deployment that a tired engineer would otherwise have missed. It may prevent a small failure from becoming a large one.

It can also make every other path look irresponsible.

> **The system did not take the decision. It made every other decision look unreasonable.**

This is the threshold the previous chapter prepared us for. When we automated routine, we delegated a known response to a known condition. The danger was that the routine would disappear from view and take its learning with it. When we automate diagnosis, we delegate the framing of an unfamiliar condition. The danger is that the operator may retain the final approval while losing the practical ability to challenge what is being approved.

A signature is not the same thing as judgment.

The incident commander who accepts an automated recommendation may still be accountable for the outcome. The organization may still record a human approver. The audit trail may still show a name. But if the explanation arrived faster than the organization could interrogate it, accountability has become a label attached after authority has already moved.

The question is not whether the system should be allowed to help. It should. The question is whether the organization has designed a place where help can still be refused for a reason the system cannot score.

\phantomsection\label{section-05-refusal}
## The work of refusing a plausible story

The operator who remains useful in this world is not the person who races the model across the same evidence.

That contest is already lost where it should be lost. The machine can retrieve faster. It can compare more incident timelines. It can hold the dependency graph in memory without getting tired at three in the morning. Pretending otherwise is nostalgia disguised as professionalism.

The operator’s work moves somewhere else.

It begins with a question that cannot be outsourced to a confidence score: *What would make this explanation dangerous even if it were true?*

A recommendation to restart a service may be technically sound and operationally wrong because it destroys the only remaining evidence. A recommendation to shift traffic may be technically reversible and ethically wrong because it transfers failure to a group that was never told it would become the buffer. A recommendation to roll back may be causally justified and still violate a change freeze that exists because a hospital integration is in the middle of a regulated migration.

The system can be given these facts. In time, it may retrieve many of them. The point is not that human beings possess mystical context. The point is that context creates obligations. Someone must decide which obligation governs when the available facts point in different directions.

That decision cannot be hidden inside the word *recommended*.

The new operator therefore keeps a different kind of incident record. Not merely: *What did the system observe?* But also: *What did it omit? Which relationship did it not see? Which old exception is now relevant? What would we regret if we discovered it five minutes after acting?*

This is not a ceremonial human-in-the-loop. A person who clicks *approve* after an answer has become inevitable is not providing meaningful oversight. Meaningful oversight preserves the right—and the capacity—to reopen the question.

In the Google Home incident, a more disciplined response would not have meant refusing every quota increase. It would have meant treating each successful mitigation as a reason to ask a sharper question before resuming the rollout. What has stopped? What has been explained? What remains unexplained? Who has not yet been brought into the room? [1]

Those questions sound modest. Under pressure, they are expensive. They delay the clean story. They require an organization to value the person who says, “This is working, and I still do not think we understand it.”

That person is not the last obstacle to automation.

They are the boundary that keeps automation from becoming unexamined authority.

\phantomsection\label{section-06-handover}
## The next handover

The curve does not stop at explanation.

Once a system can observe the incident, retrieve the context, rank the causes, estimate the blast radius, and recommend the lowest-risk fix, the remaining human approval begins to look inefficient. The operator may still see the difference between a plausible story and a sufficient one. But every minute spent making that distinction can be described as latency.

This is the seduction of the next handover.

First, we automated the routine because the action was familiar. Then we automated the diagnosis because the evidence was abundant. Soon the system will be asked to act because its recommendation has been right often enough for waiting to feel like the greater risk.

The question will no longer be whether the machine understands the incident.

It will be whether we have remembered what it means to authorize a response.

::: {.next-chapter}
**Then We Let Machines Act**

A recommendation becomes a workflow. A workflow becomes a decision. The next boundary is not whether the system can act safely in the familiar case, but who notices when the unfamiliar case arrives.
:::

## References

[1] Google, “Incident Response,” *Google SRE Workbook*, case study “Software Bug—The Lights Are On but No One’s (Google) Home.” https://sre.google/workbook/incident-response/

[2] Tom Wentworth, “AI Root Cause Analysis: Accuracy Testing Guide,” *incident.io*, 20 February 2026. https://incident.io/blog/ai-root-cause-analysis-accuracy-testing-guide
