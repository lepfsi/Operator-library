---
number: "07"
chapter: "07"
part: "Part II: The Automation Curve"
title: "Then We Let Machines Act"
kicker: "The action becomes consequential when the permission has already been designed."
status: "draft"
memorable_phrase: "An agent does not become trustworthy when it can act. It becomes trustworthy when its permission has an edge."
---

# Then We Let Machines Act

::: {.impact-opener number="07" title="THEN WE LET MACHINES ACT"}
The first autonomous action is rarely dramatic. It is a command someone decided was safe enough to stop watching.
:::

::: {.chapter-guide}
\chapterguideentry{01}{The action that did not wait}{section-01-action}
\chapterguideentry{02}{What an action really contains}{section-02-contains}
\chapterguideentry{03}{Permission before panic}{section-03-permission-before-panic}
\chapterguideentry{04}{When a rollback is not a retreat}{section-04-rollback}
\chapterguideentry{05}{The action envelope}{section-05-envelope}
\chapterguideentry{06}{After execution, a different question}{section-06-question}
:::

\clearpage
\phantomsection\label{section-01-action}
\section{The action that did not wait}

The first record in the incident was not an alert. It was a dry run.

::: {.field-note}
**Dry run record, 2026 composite.**  
`candidate=checkout-eu-3 :: authorization_failures=rising :: route_change=suspected`  
`proposed_action=drain_12_percent :: rollback=restore_previous_route`  
`stop_condition=retry_latency_above_threshold :: owner=payments-reliability`
:::

The checkout service had begun returning authorization failures for a rising share of payments routed through one European cell. The timing suggested a configuration rollout. The error pattern was narrow enough to make a response feel familiar and sharp enough to make waiting uncomfortable. A mitigation controller had already correlated the route change, the increase in authorization failures, and the known-good route that preceded it. It had found capacity elsewhere. It had simulated a drain. It had produced a command that could be executed in seconds.

No one had asked the controller to solve the incident. Someone had done something more consequential earlier: they had given it permission to act under a defined set of conditions.

That distinction becomes easy to overlook when the proposed action is technically reversible. Drain a routing cell. Shift a bounded share of traffic. Restore the earlier rule if a threshold is crossed. In the language of infrastructure, this looks prudent. In the language of the business, it may still redirect retry traffic toward a payment gateway under maintenance, change the point at which customers see a failure, and make one class of authorization attempt harder to reconcile after the fact.

The controller did not know whether the payments lead had already warned the gateway team. It did not know that a commercial partner was examining a separate latency problem. It did not know whether a temporary rate limit, harmless for ordinary checkout traffic, would become expensive once the retries began to move. It knew only what its action envelope made legible.

::: {.case-signal}
**A technically reversible action can still redirect irreversible work.**  
A traffic shift may be easy to undo in a routing table while remaining difficult to untangle in payments, customer communication, reconciliation, and partner operations.
:::

This is the point at which a book about automation becomes a book about authority. Diagnosis arranged the evidence. Action changes the world that evidence describes.

An engineer can look at the dry run and ask a narrow question: *Will the drain reduce the failure rate?* The more important question is broader: *What else becomes true if it does?* A controller that acts correctly on the first question can still create a second incident if no one has designed for the second.

Google’s SRE material makes the case for automation clearly. Well-scoped, known procedures benefit from speed and consistency. But it also warns that automation applied thoughtlessly can create as many problems as it resolves, especially when it acts across a domain whose implicit safety signals have not been made explicit.[^ch7-automation] The question is not whether a person should stand beside every button. The question is whether the button has been surrounded by enough structure to deserve delegation.

\phantomsection\label{section-02-contains}
\section{What an action really contains}

A command is visible. Its assumptions are usually not.

`drain_checkout_routing_cell` sounds like an infrastructure operation. It is also a claim about capacity, customer impact, retry behavior, ownership, observability, and the time horizon within which a recovery will be judged. The command carries a compact version of the organization’s risk model, whether or not anyone has written that model down.

The on-call engineer, Leila, did not reject the controller’s proposal. She read the dry run as a draft of the decision the team was about to make.

::: {.decision-ledger}
\renewcommand{\arraystretch}{1.56}
\begin{tabular}{@{}>{\centering\arraybackslash}m{29mm}|>{\raggedright\arraybackslash}m{60mm}@{}}
{\ttfamily\scriptsize\color{systemblue}\textsc{Proposed action}} & {\calloutcode Drain checkout-eu-3 and shift up to 12 percent of traffic to the prior route.} \\ \hline
{\ttfamily\scriptsize\color{systemblue}\textsc{Immediate benefit}} & {\calloutcode Remove the newly configured route from the authorization path and reduce the observed failure rate.} \\ \hline
{\ttfamily\scriptsize\color{systemblue}\textsc{Hidden exposure}} & {\calloutcode Concentrate retry traffic on a gateway operating under a separate maintenance constraint.} \\ \hline
{\ttfamily\scriptsize\color{systemblue}\textsc{Reversibility}} & {\calloutcode The routing change can be restored. Customer confusion, duplicate attempts, and partner workload may not unwind with it.} \\ \hline
{\ttfamily\scriptsize\color{systemblue}\textsc{Authority required}} & {\calloutcode The on-call engineer may authorize the bounded drain after payments ownership and stop conditions are confirmed.}
\end{tabular}
:::

A ledger like this does not slow the action by turning it into a meeting. It removes a more dangerous delay: the delay created when a fast technical recovery later has to be explained by people who were never told its cost.

Leila opened the payments channel. The payments lead replied, \humanvoice{“If you move that much retry traffic, I need the attempt identifiers preserved. We have no safe story for a customer whose payment appears twice.”}

That sentence did not invalidate the controller’s reasoning. It changed its scope. The proposed drain was still likely to be right. It was no longer sufficient to say that it would lower the error rate.

This is why the human role does not disappear the moment a system can propose a good action. The remaining work is often not to discover a different command. It is to discover the conditions under which the same command remains acceptable.

An action can be technically valid and operationally incomplete. It can restore a service while creating an obligation another team must carry. It can be reversible in code while being difficult to reverse in memory, in customer expectation, or in a partner’s work queue. The more quickly a system can execute, the more carefully an organization has to define which of those consequences count before execution begins.

\phantomsection\label{section-03-permission-before-panic}
\section{Permission before panic}

The old model of approval is easy to picture. An incident happens. A proposed action appears. A human is asked to approve it. The person either says yes or says no. This model has a comforting clarity. It is also too late to carry much of the work that matters.

At the moment an incident is active, an approval can become a ritual. The operator sees a recommendation, a risk summary, and a timer that makes delay feel negligent. A system that has already gathered the facts, estimated confidence, and framed the remedy can make refusal appear to be a decision against evidence. The human still has a button. The system has supplied the conditions under which the button feels usable.

The stronger design moves the difficult work earlier. It decides in calm conditions what an autonomous actor may do, what it may never do, which facts must be present, how wide the blast radius may become, who will be notified, what evidence must survive the action, and what signal must stop it. Approval is then not an exhausted person reading a concise summary. It is a permission that has been designed, tested, and bounded before the incident asks for it.

::: {.boundary-condition}
**The controller may drain one affected routing cell for no more than twenty minutes, shift no more than 12 percent of checkout traffic, preserve all payment attempt identifiers, notify the payments owner, and stop automatically if retry latency crosses the agreed threshold.**
:::

This is not bureaucracy around an API call. It is the action itself, made explicit.

A permission with no expiry becomes standing authority. A permission with no ceiling becomes scale without judgment. A permission with no stop condition becomes hope disguised as automation. Each missing boundary transfers work into the future, where someone will have to reconstruct what the system was allowed to do and why it kept doing it.

The boundary also needs a language that an incident can carry. “Keep the action safe” is not a condition. “Do not shift more than 12 percent of checkout traffic; stop at this retry threshold; preserve these identifiers; notify this owner” is a condition. The first phrase relies on a future operator to supply the meaning under pressure. The second gives the controller something it can test and gives the operator something they can challenge.

This is why dry run support matters more than a ceremonial preview. A useful dry run does not merely repeat the command in a different colour. It makes the intended change legible before the system mutates production: which route will lose traffic, which route will receive it, which records will be written, which threshold will halt expansion, and which rollback can still be performed without guessing. The action is faster because the difficult questions were moved to a moment when the service was not asking for an answer.

The practical benefit is not only safety. It is speed with a shape. Once a team has defined the action envelope, a controller can move faster than a person could move, without pretending that speed has erased the organization’s other obligations.

\phantomsection\label{section-04-rollback}
\section{When a rollback is not a retreat}

The controller’s dry run found enough capacity on the prior route. The drain began. Authorization failures fell. For several minutes, the incident looked like the kind of success automation is supposed to create: a narrow failure detected, a known action selected, an immediate improvement observed.

Then retry latency began to rise.

The stop condition had not been written to catch a failure of the drain. It had been written to catch the cost of the drain elsewhere. The controller halted further traffic movement, preserved the routing state, and posted the following update to the incident record.

::: {.system-statement}
mitigation=partially_applied
authorization_failures=decreasing
retry_latency=above_stop_threshold
automatic_expansion=halted
next_owner=payments_on_call
:::

The result was neither a triumph nor a failure. It was an action that had reached the edge of its permission and stopped.

That distinction changes the incident review. The team does not have to argue after the fact about whether the controller should have been “smarter.” It can ask whether the stop condition represented the right exposure, whether the threshold was observed in time, whether the handoff named the person who could act next, and whether the action produced the evidence needed to tune the next envelope. The action becomes reviewable because its authority was structured before it was exercised.

A rollback is often described as retreat, as though the system had failed to hold its nerve. In operations, a rollback can be a sign that the team designed the action honestly. It acknowledges that a planned intervention was conditional from the beginning. The controller was not permitted to prove its competence by continuing after the condition had changed.

This is one reason that machine action can improve operations without making operators ornamental. A well-designed controller makes the action inspectable. It records its scope, the evidence it used, the action it took, the condition that narrowed its authority, and the point at which it handed the incident back. The human work shifts from repeating a runbook to authoring the conditions under which a runbook can be trusted.

\phantomsection\label{section-05-envelope}
\section{The action envelope}

The phrase *human in the loop* is too vague for this work. It tells us that a person remains somewhere in the process. It does not tell us whether that person has authority, time, context, a real alternative, or a clear record of what the system has already done.

An action envelope is more demanding. It gives the autonomous actor a bounded authority and gives the operator a concrete object to govern. It contains a scope, an expiry, a ceiling, a stop condition, an observation path, a rollback path, and a named owner for the consequence that lies outside the control plane.

::: {.operator-note}
The operator’s job is not to stand between every machine and every action. It is to decide where an action’s permission begins, where it ends, and who notices when it reaches the edge.
:::

This design has an uncomfortable implication. If an organization cannot state those boundaries, it may not yet understand the action well enough to delegate it. That is not an argument for preserving manual work as a badge of seriousness. It is an argument for doing the engineering that makes a narrow action safe, observable, and reversible enough to be automated.

Pre-authorization is therefore not a shortcut around judgment. It is judgment made durable. It requires service owners to decide which forms of customer impact are acceptable, security teams to decide which credentials an agent may use, engineers to decide which metrics are sufficient to verify the action, and operators to decide how a system returns authority when it reaches a condition it cannot safely interpret. The permission is collective even when the execution is singular.

The distinction matters at scale. Google’s more recent SRE guidance describes progressive authorization, real-time risk evaluation, agent-specific circuit breakers, dry-run support, least privilege, and interruptibility as the conditions under which AI agents can act safely in production.[^ch7-agentic-safety] These are not cosmetic guardrails. They are the operational form of a question every organization must answer: when a system acts quickly, where does responsibility remain visible?

\phantomsection\label{section-06-question}
\section{After execution, a different question}

The incident ended without a major customer impact. The route change was partially rolled back. The gateway constraint was addressed. The final review did not celebrate a controller that had rescued the service from human hesitation. It asked whether the action envelope had been narrow enough, whether the payments owner had been brought in early enough, and whether the retry threshold should be adjusted before the controller encountered the same situation again.

This is the shift that matters. The question moves from *Can the machine execute the action?* to *Has the organization designed the permission well enough to let it execute?*

::: {.the-shift}
**FROM HUMAN APPROVAL TO DESIGNED PERMISSION**  
The mature control is not a person who clicks yes at the end of a recommendation. It is a bounded authority whose scope, evidence, stop condition, and owner were decided before the pressure arrived.
:::

The human contribution becomes less visible to people who measure work only at the moment of execution. It becomes more consequential to everyone who must live with what execution changes. Operators define the boundaries. Engineers build the controls that enforce them. Service owners accept the risks that cannot be expressed as a latency graph. Incident responders inherit a record that says not only what the system did, but what it was allowed to do and why.

But the operator has already been moved one step away from the incident. The route was chosen before the room gathered. The stop condition was written before the pressure arrived. The human did not disappear, yet their place in the sequence has changed: from the person who selects the action to the person who authored its limits and must answer for the consequences those limits did not contain.

::: {.the-question}
Who has the authority to decide which consequences a machine may delegate to someone else?
:::

The answer cannot be an access token. It cannot be a generic approval workflow. It cannot be an appeal to speed. Authority is a relationship between an action, its consequence, and the person or institution that is prepared to answer when the action changes the wrong thing.

::: {.memorable-phrase}
An agent does not become trustworthy when it can act. It becomes trustworthy when its permission has an edge.
:::

::: {.next-chapter}
**The Day the Runbook Became an Agent**  
Once the controller can observe its own action and choose another one, the operator is no longer merely outside the command. They are outside the continuity between commands.
:::

[^ch7-automation]: Google SRE, *The Evolution of Automation at Google*, emphasizes both the value of automation for well-scoped procedures and the risk of automation applied without careful scope or reliable safety signals.
[^ch7-agentic-safety]: Google SRE, *AI in SRE: How Google is Engineering the Future of Reliable Operations*, describes progressive authorization, risk evaluation, least privilege, dry-run support, circuit breakers, and interruptibility for agentic action in production.
