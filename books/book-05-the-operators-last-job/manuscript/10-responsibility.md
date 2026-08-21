---
number: "10"
chapter: "10"
part: "Part III: What Remains Human"
title: "Responsibility"
kicker: "A decision is not accountable because a log exists. It is accountable when someone can answer for what the log made possible."
status: "draft"
memorable_phrase: "A system can record that it acted. Responsibility begins when someone can explain what it was allowed to risk."
---

# Responsibility

::: {.impact-opener number="10" title="RESPONSIBILITY"}
The log named the action. It did not name the decision.
:::

::: {.chapter-guide}
\chapterguideentry{01}{The account after the action}{section-01-account}
\chapterguideentry{02}{A policy had acted}{section-02-policy}
\chapterguideentry{03}{The name in a record}{section-03-name}
\chapterguideentry{04}{Blame is not repair}{section-04-repair}
\chapterguideentry{05}{Authority before the incident}{section-05-authority}
\chapterguideentry{06}{The fact the record could not hold}{section-06-fact}
:::

\clearpage
\phantomsection\label{section-01-account}
\section{The account after the action}

::: {.field-note}
**Access containment record, 2026 composite.**  
`actor=access-guardian :: confidence=0.94 :: action=contain`  
`subject=marin.ortiz :: sessions=revoked :: token=rotated`  
`release=paused :: exception_lookup=none :: review=queued`
:::

The entry appeared at \livetime{04:18}, after most of the people who had built the policy were asleep.

A service account had requested a privileged route from a country where the company had no normal operations. Minutes later, the same identity had opened a maintenance console, initiated a bulk export of configuration metadata, and attempted to request a short-lived build credential. Each event had an explanation available in isolation. Together, they crossed the containment threshold that the security team had set six months earlier.

The system did what it had been permitted to do. It revoked active sessions associated with the identity. It rotated the exposed credential. It paused the release pipeline that could have used the same token. It opened a high-severity incident and posted the evidence to the security channel.

By \livetime{04:23}, the suspicious sequence had stopped.

By \livetime{04:31}, a regional platform team could not complete a repair it had been called in to make.

The identity belonged to Marin Ortiz, a senior operations engineer working for a contracted maintenance partner. A fibre route had failed during the night, leaving a business park with a degraded connection and a small number of customers without their normal failover path. Marin had been travelling between two maintenance sites. A temporary network link had placed him behind an unfamiliar address. He had used an emergency access path from a field laptop after the standard device certificate failed to renew. The configuration export was not an attempt to remove data. It was the inventory step he used before altering a route policy. The build credential was needed to validate a patch that had to be applied before another provider’s maintenance window opened.

Those facts did not make the alert absurd. The pattern had looked dangerous because, in a different context, it would have been dangerous. A privileged identity on an unfamiliar network, a new console session, a broad metadata export, and a request for a temporary credential are the ingredients of many incidents a security team would be criticised for missing.

The containment action was understandable. It was also harmful.

The repair did not happen before the second maintenance window closed. A customer’s fallback route stayed congested until morning. The regional team spent hours proving that Marin’s actions had been legitimate, then more hours restoring the access path the policy had shut down. By then, the question in the incident channel was no longer whether the system had followed the rule. It was who could answer for the rule having been allowed to act this way.

That question is responsibility.

Not blame. Not the search for the person whose name can be attached to a bad outcome. Responsibility is the ability of an organisation to reconstruct what happened, identify the authority that made it possible, take part in repair, and change the conditions that would otherwise produce the same harm again.

\phantomsection\label{section-02-policy}
\section{A policy had acted}

There was no hidden operator pressing a containment button while pretending that software had decided for them. The security system had been deliberately designed to act without waiting when the evidence passed a defined threshold. The policy existed because waiting has costs too.

A compromised privileged account can turn minutes into an incident that spreads through systems faster than an analyst can assemble the relevant screens. The usual argument for automatic containment is not careless. It is operational. If the system can identify a credible high-risk pattern and reduce exposure before an attacker establishes persistence, delay can be the more consequential choice.

The system’s authors had considered this. They had set a threshold. They had limited the action to a reversible access response rather than destructive remediation. They had required an incident record. They had added a review queue for the security team. On paper, the policy looked like a responsible compromise between speed and restraint.

A clear, executable incident-response plan is not bureaucratic decoration. CISA argues that organisations need plans and strategies that can be carried out before an incident grows and causes greater harm.[^ch10-cisa] NIST likewise places incident response inside a wider cycle of preparedness, detection, response, recovery, and risk management.[^ch10-nist]

The problem was not that the organisation had written a policy.

The problem was that the policy had become the most complete account available after it acted.

The access system recorded its own certainty. It preserved the signals, the threshold, the action, and the affected credentials. It could show that the policy had matched a pattern. It could show that the containment had happened within five minutes of the final signal. It could show that the action had been technically reversible.

It could not show why the exception lookup returned none.

It could not show whether the operations team had agreed that an emergency maintenance identity should be treated like a normal privileged identity when a route outage was active.

It could not show who had decided that the cost of an unnecessary containment was acceptable in this class of event.

The log was accurate. Its accuracy did not make it complete.

::: {.traceback}
**04:18** \systemartifact{access-guardian} applied \processstate{contain}.

**04:19** The identity service revoked sessions and rotated the temporary credential.

**04:20** The release controller received \processstate{pause-required}.

**04:24** Marin’s field team reported that the emergency route repair could not be validated.

**04:47** Security confirmed the suspicious pattern was linked to an active maintenance intervention.

**05:16** An incident commander approved a manual restoration after the repair window had materially narrowed.
:::

A traceback is not an account of responsibility. It is the beginning of one.

It tells us how the state changed. It does not tell us whether the organisation had given the system the right boundary, whether someone understood the trade-off when the boundary was approved, or what route existed for a person to make an exception visible before the system treated its absence as evidence.

This distinction becomes difficult precisely because automated actions can be reasonable. If the system had made a childish error, responsibility would look simple. Someone would correct the bug, apologise, and move on. The harder cases are the ones in which every individual step has a defensible logic and the whole sequence still produces a burden that no one can properly own.

\phantomsection\label{section-03-name}
\section{The name in a record}

At \livetime{05:28}, the post-incident review began in the way many reviews begin. Someone asked, “Who owns this policy?”

The question sounded practical. It was not yet precise.

The detection logic belonged to the identity-security team. The action rule had been approved by the security architecture group. The emergency access workflow had been designed by platform engineering. The partner-maintenance registry was maintained by vendor operations. The field repair process belonged to a regional network team. The on-call incident commander had authority to restore access but not to weaken the containment rule permanently. Marin’s manager could verify that he had been assigned the repair, but not why the registry had not identified his maintenance window.

Each team could name a part of the system. None could initially name the whole decision.

::: {.dissent-record}
**Security lead:** “The containment did exactly what we asked it to do.”  
**Network operations lead:** “Then we asked it to make a security decision with a maintenance record it could not see.”
:::

Neither statement was an excuse. Together, they described the problem.

Responsibility becomes evasive when it is reduced to the question of who made the final action. The final action may have been taken by a controller. The controller may have been configured by a team. The team may have implemented a requirement approved by a risk committee. The risk committee may have accepted a trade-off because a different team had described the operational cost as low. A name attached to any one of those steps can be useful. It is not enough.

The relevant question is not, *who touched the button?* It is, *who was entitled to define the conditions under which the button could be touched, and who is able to repair the harm when those conditions prove too narrow?*

Data & Society describes algorithmic accountability as the process of assigning responsibility for harm when algorithmic decision-making produces harmful outcomes. Its value for operations lies less in its public-sector examples than in the underlying refusal to treat opaque design decisions as if they had no consequences for people outside the system.[^ch10-data-society]

The security team did not need to accept personal blame for every delayed repair. The network team did not need to be absolved because the policy had been built elsewhere. The organisation needed a structure in which the people who could change the rule, maintain the exception evidence, restore affected access, communicate with the customer, and learn from the incident could be brought into the same account.

That is what it means for responsibility to have a name. It does not mean one name. It means names connected to powers.

A policy-owner field is not enough. It can create the opposite problem: a person becomes accountable in the record while lacking the authority, evidence, budget, or cross-team relationship required to repair what the policy has done. The policy owner may be able to edit a threshold but not change a partner process. A network manager may be able to authorise a repair but not alter an identity-control rule. An incident commander may be able to contain immediate harm but not decide which customer commitment is represented in a priority label. Responsibility is real only when the account points to people who can do something with the account.

This is why an after-action review should not end by assigning an owner to the defect. It should establish an answerable chain. Who maintains the evidence? Who can alter the decision rule? Who can restore the affected party? Who tells that party what happened? Who decides whether the temporary repair has created a permanent exception? These are not variations of the same role. They are linked duties that prevent an automated action from becoming an orphaned consequence.

The difference matters because systems often create the appearance of accountability by storing more data. They retain actor IDs, policy versions, timestamps, confidence scores, approvals, and ticket references. Those records are valuable. But more records can merely create a more detailed way of showing that nobody was responsible for the relation between them.

An incident record must allow an organisation to ask four questions that a raw log cannot answer on its own. What authority existed before the action? What evidence was allowed to count as an exception? Who was affected by the action? Who can change the conditions and repair the effect now?

The answers need not be held by one operator. They do need to be reachable.

Reachability is more demanding than discoverability. A dashboard can show a name, a ticket can link to a team, and a policy repository can preserve a commit. None of those records guarantees that the relevant person can see the present consequence, call the affected party, reverse the action safely, or change the rule for the future. A system becomes responsible in practice when its records lead to an available path of repair rather than to a directory of people who can explain why the path is somebody else’s problem.

\phantomsection\label{section-04-repair}
\section{Blame is not repair}

The temptation after an automated action causes harm is to find the person nearest the visible decision and call that accountability.

The analyst who approved the rule should have anticipated the edge case. The operations lead should have kept the registry current. Marin should not have used emergency access. The vendor team should have renewed the device certificate. The incident commander should have restored access sooner.

Each statement contains a fragment of truth. None repairs the system.

Blame narrows a complex event into a person who can be disciplined, defended, or forgiven. Responsibility opens the event into the work that must be done. It asks what information failed to travel, which authority was absent, what repair the affected customer is owed, how the incident record should be corrected, and who has the power to alter the policy without waiting for the next injury to make the flaw visible again.

Human factors research on automation errors is useful here because it treats accountability as one of the conditions that shape error management, alongside the consequences of an error, the cost of verification, the task, and the characteristics of the automation itself.[^ch10-mcbride] A person placed at the edge of a system is not automatically able to manage the system’s mistakes. Their capacity depends on whether they can detect the issue, understand it, correct it, and integrate what they have learned into the next design.

Mara’s counterpart in this incident was Leila, the incident commander who approved the restoration. She did not have a better model of intrusion than the access system. She did not need one. Her work was to make the repair possible while preserving the security concern the original containment had surfaced.

She asked a question that changed the room:

\operationalquestion{What can we restore without pretending the signal was harmless?}

That question moved the review away from the false choice between full access and permanent lockout. The team created a temporary, monitored route for the repair. It required a named network owner, a limited credential lifetime, a recorded change window, and a post-repair review. The original token remained rotated. The broad export remained unavailable. The route policy could be validated without asking the field engineer to recreate the suspicious pattern the system had already observed.

The repair was slower than a clean automatic reversal. It was safer than treating the containment as obviously mistaken. Most importantly, it created a record of what the organisation had decided to preserve: the security boundary, the operational repair, and the reason the exception had been granted.

::: {.operator-note}
Responsibility is not the promise that a system will never cause harm. It is the promise that harm will not become ownerless once the system has acted.
:::

That promise has a technical shape. It requires logs, versioned policies, reversible actions, named owners, escalation paths, communication channels, and evidence that can be revisited after the urgency has passed. It also requires something that cannot be installed as a logging feature: an organisation willing to treat repair as part of the decision, not as an administrative task after the real work is over.

The system had responded to a threat signal. The organisation now had to respond to the people and commitments its response had touched.

\phantomsection\label{section-05-authority}
\section{Authority before the incident}

The repair led to an uncomfortable discovery. The partner-maintenance registry had not failed in the ordinary technical sense. It had no outage, no corrupted data, no alert that had been ignored. It simply recorded planned maintenance windows at the level of contracts, not at the level of emergency field interventions. The access policy consulted the registry exactly as designed. The registry answered exactly as it was able.

The missing information was not an implementation bug. It was an authority gap.

No one had decided who could declare that an unscheduled repair should temporarily alter the meaning of a high-risk identity signal. The security team could not invent that exception alone because it did not own the field process. The network team could not declare it alone because it did not own the containment risk. The partner organisation could not reliably express it because its emergency work orders had no interface into the access system.

A responsibility model that begins only after a policy acts arrives too late. The policy has already turned the absence of an approved fact into an operational consequence.

::: {.boundary-condition}
**An automatic containment action against a privileged maintenance identity may be paused only when an active emergency work order is recorded by a named network owner, the requested access is limited to the declared repair scope, the credential is time-bounded, and the security incident remains open for review. If any condition cannot be verified, containment remains in force and the incident commander receives the unresolved case.**
:::

The condition did not make the system soft. It made the authority visible.

It specified who could assert the exception, what evidence was required, which parts of the security response remained non-negotiable, and where an uncertain case would go. It also created a burden that had not existed before. The network team now needed a reliable way to register emergency work. The partner-management team needed to define who could attest to it. Security needed to expose an interface rather than rely on an internal lookup no other team could influence.

These are not implementation details beneath the real decision. They are the real decision rendered in a form a system can act upon.

ENISA’s work on incident and cyber-crisis management emphasizes procedures, shared situational awareness, information exchange, coordination, and decision-making across participants.[^ch10-enisa] The scale of a cross-border crisis is different from an internal access incident. The structure is not. A response becomes fragile when the people who must coordinate hold different fragments of the operational truth and no reliable route exists for those fragments to affect the action in time.

The right response is not to require a human being to approve every containment. That would merely move the problem into an approval queue and ask tired people to certify actions they cannot reconstruct. The right response is to decide, before an incident, which facts change the authority of an action and how those facts become visible to the system that will act.

Responsibility is therefore not a signature applied at the end of a workflow. It is the design of a path by which someone can be found, informed, empowered, and required to answer.

\phantomsection\label{section-06-fact}
\section{The fact the record could not hold}

The revised policy went live three weeks later.

The security team retained its containment threshold. The partner-maintenance process gained an emergency work-order field. The network team received a short-lived repair route with an owner and an expiry. The incident template now required the response record to include the policy version, the authority invoked, the affected operational commitment, and the person responsible for confirming that the repair had reached the people who carried the original harm.

The changes did not make the next incident simple. They made some of its questions answerable.

The original log would always remain true. At 04:18, a policy had identified a risky pattern and acted before a person could reconstruct the whole situation. The record could prove that the action had been fast, consistent, and supported by the evidence available to it.

It could not prove that the absence of an emergency work order meant there was no emergency work.

That fact lived elsewhere: in a field team’s call, a regional repair schedule, a maintenance agreement, a customer dependency, and an assumption that had never been given an interface. Until those fragments could travel, the organisation could name the people involved in the decision without giving them the context needed to make the decision intelligible.

::: {.the-question}
What does it mean to answer for an automated action when the fact that would have changed it existed nowhere the system could see?
:::

::: {.memorable-phrase}
A system can record that it acted. Responsibility begins when someone can explain what it was allowed to risk.
:::

The policy now had names, owners, and a repair route. It still depended on a fact that would only matter if it could cross the boundary between one part of the organisation and another.

::: {.next-chapter}
**Context**  
A decision can have an owner and still be made inside an incomplete world. The next difficulty is not merely who can answer for an action, but which facts are allowed to reach the place where action becomes possible.
:::

## References

[^ch10-cisa]: Cybersecurity and Infrastructure Security Agency, [*Incident Response*](https://www.cisa.gov/topics/cyber-threats-and-response/incident-response).

[^ch10-nist]: National Institute of Standards and Technology, [*SP 800-61 Rev. 3: Incident Response Recommendations and Considerations for Cybersecurity Risk Management*](https://csrc.nist.gov/pubs/sp/800/61/r3/final), 2025.

[^ch10-data-society]: Robyn Caplan, Joan Donovan, Lauren Hanson and Jeanna Matthews, [*Algorithmic Accountability: A Primer*](https://datasociety.net/research-library/algorithmic-accountability-a-primer/), Data & Society, 2018.

[^ch10-mcbride]: Sara E. McBride, Wendy A. Rogers and Arthur D. Fisk, [*Understanding human management of automation errors*](https://pmc.ncbi.nlm.nih.gov/articles/PMC4221095/), *Theoretical Issues in Ergonomics Science*, 2014.

[^ch10-enisa]: European Union Agency for Cybersecurity, [*EU Incident Response and Cyber Crisis Management*](https://www.enisa.europa.eu/topics/eu-incident-response-and-cyber-crisis-management).
