---
number: "06"
part: "Part II: The Automation Curve"
chapter: "06"
title: "Then We Automated the Diagnosis"
kicker: "The handover becomes consequential when the explanation arrives before the context."
status: "draft"
memorable_phrase: "The system did not take the decision. It made every other decision look unreasonable."
---

# Then We Automated the Diagnosis

::: {.impact-opener number="06" title="THEN WE AUTOMATED THE DIAGNOSIS"}
A diagnosis becomes consequential the moment it closes more possibilities than it names.
:::

::: {.chapter-guide}
\chapterguideentry{01}{The fact that arrived too early}{section-01-early}
\chapterguideentry{02}{The first plausible answer}{section-02-plausible}
\chapterguideentry{03}{When ranking becomes pressure}{section-03-pressure}
\chapterguideentry{04}{A recommendation changes the incident}{section-04-changes}
\chapterguideentry{05}{The work of keeping an alternative alive}{section-05-alternative}
\chapterguideentry{06}{When the first answer arrives before you}{section-06-handover}
:::

\clearpage
\phantomsection\label{section-01-early}
\section{The fact that arrived too early}

On the morning a Google Assistant release became difficult to explain, no alert had summoned a war room. A developer was already looking at the request graph. Something in the traffic had stopped behaving like a background task.

Google Home devices were expected to fetch speaker-recognition training data once a day. After version 1.88 reached a quarter of the fleet, they were fetching it roughly every thirty minutes instead. The requests were pushing against the service quota that protected Google Assistant from overload. The developer on call paused the release and opened a bug. That was a sensible first move. It was also only the beginning of the story. [^1]

::: {.field-note}
**Operational record: Google Home, 22 May 2017.**  
`11:48 PST :: Google Assistant 1.88 :: rollout 25%`  
`expected: one training-data fetch per day`  
`observed: approximately forty-eight fetches per day`  
`immediate action: release paused; investigation opened`
:::

The initial facts did not contradict one another. A release had changed something. The traffic was real. A known defect could explain part of it. The quota was under pressure. In an ordinary operating environment, that much coherence is enough to make a response feel responsible.

A previously reported issue was soon linked to the new traffic. When the application refreshed a device's authentication and enrollment state, the speech processor restarted. That bug did produce some extra work. The team requested a temporary quota increase while it was investigated. The release resumed. The explanation had not been fabricated. It was simply too close to the incident to be challenged with the force it required. [^1]

A quota increase reduced the immediate impact, and the linked defect was real. Neither fact established the cause of the repeated fetches. The incident remained capable of returning because relief had been mistaken for completion. [^1]

::: {.case-signal}
**Google Home, 2017**  
A quota increase reduced the immediate impact, and the linked defect was real. Neither fact established the cause of the repeated fetches. The incident remained capable of returning because relief had been mistaken for completion. [^1]
:::

The later review makes the incident more instructive, not less. The quota increases were useful mitigations, but the work remained fragmented. Client and server developers did not yet share a full account of the failure. Customer reports accumulated without bringing the response into a managed incident structure. The rollout continued after impact had eased, even though the reason the system was crossing its quota boundary had not been established. The missing work was not another graph. It was the work of holding mitigation, communication, ownership, and unanswered questions in the same operating frame. [^1]

This distinction matters because automated diagnosis will not usually arrive as a dramatic claim of superiority. It will arrive with a smaller promise. It will identify the recent deploy, retrieve the bug that resembles the symptom, find the service owner, reconstruct the last similar incident, and explain why a familiar mitigation is likely to help. Every element of that package can be useful.

The risk begins when usefulness becomes closure.

For years, the gap between a plausible account and a sufficient account was where operators worked. They read a release note and then called the team that owned the adjacent service. They remembered that a quota issue had once been a symptom rather than a source. They noticed when a customer report did not fit the clean version of events. From a distance, this can look like unstructured delay. Inside a real incident, it is the work of preserving an alternative long enough to test it.

\phantomsection\label{section-02-plausible}
\section{The first plausible answer}

A diagnosis system is built to make that search less wasteful. It can collect the alerts before an incident channel exists. It can connect a spike in requests to a release, retrieve the relevant runbook, identify the owner who last changed the service, and place recent events in a timeline that would otherwise take a person twenty minutes to assemble.

At \livetime{02:13}, when an on-call engineer is alone and several services are producing contradictory signals, that help can be decisive. The system may have already gathered the commit history, the dependency map, the previous postmortem, and the change window before the first colleague has joined the call. It can offer a concise route into the problem:

::: {.system-statement}
Recent release detected. Known authentication-refresh defect matches a portion of the traffic increase. Quota pressure is likely contributing to the observed errors. Recommended first check: verify refresh activity before resuming rollout.
:::

No serious operator should want to give up that kind of assistance. A good diagnosis removes blind searching. It gives a tired team somewhere credible to begin. It makes the first fifteen minutes less dependent on who happens to remember a brittle detail from six months ago.

But the system has done more than gather material. It has ordered the material. It has made one event central and another peripheral. It has named an owner, weighted a prior incident, and turned a field of unresolved facts into a route through the noise.

A confident first answer quietly assumes that the relevant evidence is present in connected systems, that the available history contains a comparable case, that the newest visible change is more informative than a quieter older condition, and that no person outside the incident channel holds a fact that changes the meaning of the pattern.

::: {.assumption-check}
**What a confident first answer quietly assumes.** The relevant evidence is present in the connected systems; the available history contains a sufficiently comparable case; the newest visible change is more informative than a quieter older condition; and no person outside the incident channel is holding a fact that changes the meaning of the pattern.
:::

Those assumptions are not evidence that a diagnosis system is poor. They are the price of any diagnosis. Human operators make them as well. The difference is that a system can make them all at once, in a fluent form, before the team has had time to notice which of them it has inherited.

The first answer can therefore create pressure without issuing an order. Once a timeline, a confidence score, a linked pull request, and a recommended runbook are visible, uncertainty changes status. The engineer who asks the team to pause is no longer merely asking for more information. They appear to be resisting an explanation that has already arranged the available information into a convincing shape.

That pressure is organizational before it is psychological. Incident systems frequently attach a recommended owner, a severity estimate, a draft update, and a next action to the same diagnosis. Each attachment is reasonable in isolation. Together they change the cost of choosing another route. The team must now justify an alternative investigation to colleagues, customers, and leaders who have already been given a coherent first story. The diagnosis has not issued a command, but it has distributed attention and expectation as if it had.

This is why the quality test for an automated diagnosis cannot be limited to whether it named the root cause eventually. The test is also whether its first answer leaves the organization able to inspect, widen, and contradict the path it proposes. A wrong hypothesis that remains visibly provisional is a different operational object from a plausible hypothesis presented as the only responsible way forward.

\phantomsection\label{section-03-pressure}
\section{When ranking becomes pressure}

Correlation is not a small technical distinction here. It is the line between an answer that helps a team search and an answer that persuades a team to stop searching.

A recent example used in guidance on testing AI root-cause tools is deliberately mundane. A database migration begins, holds table locks, and raises latency. Minutes later, a scheduled cache-flush job produces a visible CPU spike. A correlation system can connect the spike and the latency with complete accuracy about timing while still placing the causal weight in the wrong place. [^2]

The problem is not that the system saw the cache flush. The problem is that temporal proximity gives a clean account of the incident before the team has established whether it is the governing account.

::: {.decision-ledger}
\begin{tabularx}{\linewidth}{@{}p{34mm}|Y@{}}
\textbf{What the system can rank} & \textbf{What still has to be established} \\ \hline
Recent deploy & Did the deploy create the condition, reveal it, or merely occur nearby? \\ \hline
Visible CPU spike & Is the spike a cause, a symptom, or an unrelated scheduled event? \\ \hline
Prior incident & Does the prior fix apply to the present architecture and operating moment? \\ \hline
Recommended action & What evidence would make that action unsafe, even if its explanation is partly correct? \\
\end{tabularx}
:::

A good diagnosis interface should not hide this difference behind a larger confidence number. It should make the basis of the ranking inspectable. It should say what it searched, what it did not search, which signals were treated as causal candidates, and what observation would lower its confidence.

The professional question is not, “Do we trust the diagnosis?” It is, “Can we see the conditions under which this diagnosis should lose its authority?” A recommendation that cannot describe its own limits is not yet ready to shape an irreversible response.

This is one reason the language of automated diagnosis deserves care. To call a system's output a root cause when it is a ranked hypothesis turns an investigation into a verdict too early. To call it a recommendation when it has already filtered the evidence, assigned attention, and made dissent costly understates the role it has played.

The most useful systems will be those that are precise about this boundary. Their output should make its own limits available to the room:

::: {.system-statement}
These are the three explanations I can support. This recent change makes one of them likely. This is the evidence I cannot see. This is what would falsify my first answer.
:::

Such a system still saves time. It simply refuses to spend the team's judgment before the team has agreed to spend it.

::: {.operator-note}
An automated diagnosis becomes dangerous when its confidence makes a different question look like delay.
:::

That design is more demanding than adding a confidence score. It requires the diagnosis to preserve provenance. Was the deployment record read from the change system or inferred from a chat message? Was the earlier incident comparable because the same service failed, or because the same dependency pattern was present? Did the system search the active incident record, the support queue, the current change freeze, and the exception register, or only the logs it could reach? An answer that exposes those boundaries gives the next engineer something to work with. An answer that conceals them turns speed into a substitute for memory.

\phantomsection\label{section-04-changes}
\section{A recommendation changes the incident}

We often draw the boundary too late.

We say that a human remains in control because the system has not yet rolled back the release, drained the cell, increased the quota, or redirected traffic. It has only described the situation. That description sounds passive because it did not touch the production environment.

But incidents are not governed only by production commands. They are governed by attention. Someone decides which graph deserves the next ten minutes, which owner is paged, which hypothesis is tested first, which risk can wait, and which possibility is treated as noise. A diagnosis that makes those selections has already changed the incident.

A recommendation becomes evidence when the team can inspect its basis. Evidence becomes a decision when someone accepts the consequence of acting on it. A decision becomes authorization only when the organization has named who may take the action, what must remain reversible, and what new fact would require the action to stop.

::: {.boundary-condition}
**A recommendation becomes evidence** when the team can inspect its basis. **Evidence becomes a decision** when someone accepts the consequence of acting on it. **A decision becomes authorization** only when the organization has named who may take the action, what must remain reversible, and what new fact would require the action to stop.
:::

This does not make recommendation suspect. In many cases, it is exactly what the operator needs. It may turn two hundred alerts into three credible paths. It may identify a failing dependency before customers can describe the problem. It may protect a team from the expensive theatre of rediscovering a known pattern under pressure.

The shift is quieter than autonomous remediation, but it matters just as much. When the system chooses the path of investigation, it is no longer only reducing information. It is assigning the human role. The operator becomes the person who confirms, refuses, or reopens a route that has already been made to feel normal.

A person can still be placed beside a button marked \processstate{approve}. That does not guarantee meaningful oversight. If the answer arrived before the organization could inspect its premises, approval becomes an acknowledgement of momentum. If the team cannot name what would justify refusal, the human presence has become a record of consent rather than an exercise of authority.

\phantomsection\label{section-05-alternative}
\section{The work of keeping an alternative alive}

The operator who remains useful in this world is not the person who tries to outrun the model across the same evidence. That contest should be lost where the system is genuinely better: recall of old incidents, correlation across services, retrieval of change history, and patient comparison of details that a tired person would forget.

The operator's work moves to the part of the diagnosis that no ranking can settle by itself.

::: {.the-question}
What would need to be true for this useful explanation to become unsafe?
:::

That question changes the shape of an investigation. It asks whether the proposed restart would destroy the last evidence of a failure. It asks whether a traffic shift would transfer an obligation to a customer who was never intended to absorb it. It asks whether a rollback, although causally reasonable, collides with a migration freeze whose purpose is not visible in the observability stack.

These are not mystical human insights. They are commitments, exceptions, and relationships. They can be documented more carefully than they usually are. They can be exposed to a system as constraints. They can even become part of a future diagnosis. But someone must first decide that they belong in the account of what is happening.

In the Google Home incident, the right lesson would not have been to reject every quota increase. The mitigation did reduce user impact. The stronger discipline would have been to let each successful quota increase sharpen the next question before the rollout resumed:

The next question was simple: \humanvoice{“What has stopped? What has been explained? What still has no owner?”}

The difference is subtle, and it is costly under pressure. It delays the pleasure of a clean story. It keeps people in a room after a number has improved. It requires an organization to value an engineer who can speak against the clean story:

Someone still had to be able to say, \humanvoice{“This is helping, but I do not think we understand it yet.”}

::: {.memorable-phrase}
The system did not take the decision. It made every other decision look unreasonable.
:::

A mature operating model will therefore preserve more than the system's recommendation. It will record which evidence was absent, which alternative was considered, who was asked to confirm the contextual constraint, and what condition would reopen the question. The diagnosis becomes part of the incident record, not the end of it.

\phantomsection\label{section-06-handover}
\section{When the first answer arrives before you}

The automation curve does not stop at explanation.

A useful diagnosis changes the room before anyone says so. The operator who once gathered the evidence now receives a ranked account of it. The colleague who would have argued for a second cause must first argue against an explanation that already sounds complete. When that explanation has been right often enough, waiting for a person starts to look like latency rather than care.

This is how a human position is lost without anyone being dismissed. First the ordinary cases leave the queue. Then the first interpretation arrives before the operator has built one. The remaining human work is still serious, but it begins later, with less authority over the frame, and under a new burden: to explain why an answer that is probably right should not yet be allowed to change the world.

The next boundary is not whether a machine can act safely in a familiar case. It is whether the organization still has someone with enough time and authority to recognize the unfamiliar case before a good recommendation becomes a consequential action.

::: {.next-chapter}
**Then We Let Machines Act**

A recommendation that makes waiting feel irresponsible will eventually be asked to remove waiting as well. The next delegation is not a command. It is permission to change another person’s world.
:::

\section*{Notes}

[^1]: Google, “Incident Response,” *Google SRE Workbook*, case study “Software Bug: The Lights Are On but No One’s (Google) Home,” accessed 17 August 2026, https://sre.google/workbook/incident-response/.

[^2]: Tom Wentworth, “AI Root Cause Analysis: Accuracy Testing Guide,” *incident.io*, 20 February 2026, accessed 17 August 2026, https://incident.io/blog/ai-root-cause-analysis-accuracy-testing-guide.
