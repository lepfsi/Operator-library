# Who Owns an AI Agent?

In September 2025, the U.S. Federal Trade Commission issued orders to seven companies that offered consumer-facing AI chatbots acting as companions. The Commission was not announcing a finding that those companies had broken a law. It was asking a more basic set of questions.

How did they measure, test and monitor possible negative effects on children and teenagers? How did they develop and approve the characters users encountered? What did they do to mitigate harm? How did they disclose capabilities and risks? How did they enforce their own rules? How did they handle personal information gathered in conversations?[1]

Those questions matter because none can be answered by the chatbot itself.

A chatbot can generate a reply. It cannot decide what standard the organisation should use to test the reply before deployment. It cannot decide what level of risk the organisation is willing to accept for a particular group of users. It cannot determine how an exception should be handled, when a feature should be changed or which person should explain an unwanted effect.

The system may act. It may appear conversational, useful and autonomous. But it does not own the conditions under which it was allowed to act.

Someone else does.

This is the ownership question for AI agents. It is not a question of who purchased the software, who configured an integration or who receives an alert. It is the question of who has the authority to define the agent’s purpose, narrow its access, stop it, explain its effect and change the operating conditions when the world no longer matches the workflow.

Without that person or role, an agent does not have ownership. It has a gap.

## The Ownership Gap

Most organisations already have a way to own traditional software. A service has a team. A database has an administrator. A business process has a department. A customer channel has a manager. The structure may not be perfect, but it gives people a place to begin when something goes wrong.

Agents make that structure less obvious.

A vendor may provide the model and the agent platform. A platform team may manage the environment. A security team may approve the identity. A business team may define the use case. An operations team may receive the alerts. Individual employees may use the agent every day. A compliance group may review a policy after the system is already live.

Each group can reasonably believe it owns part of the system. None may own the whole of its operational effect.

This is the ownership gap.

The gap often begins with language. An organisation says that a team “owns the tool.” The phrase can mean almost anything. It may mean the team pays the invoice. It may mean the team maintains a connector. It may mean the team is responsible for training users. It may mean the team receives security notifications. None of these meanings, by itself, establishes who owns what the agent is permitted to do on behalf of the organisation.

Ownership is not possession.

It is not product administration.

It is not the ability to open a support ticket with a vendor.

Operational ownership exists when a named person or role has the power to change the agent’s mandate and the responsibility to account for its effect.

> ### Evidence Note: Ownership Is a Control
>
> A useful owner is not merely the name stored in a register. The owner must be able to change the system’s purpose, authority, exception path, evidence requirements and recovery plan.
>
> If a role can be blamed for an outcome but cannot change the conditions that produced it, the organisation has assigned accountability without control.

The Federal Trade Commission’s 2025 inquiry is useful precisely because it makes these responsibilities visible. The Commission asked the companies about development, approval, testing, monitoring, mitigation, disclosures, enforcement and data handling.[1] Those are not separate administrative boxes. Together, they describe what it means to own a system after it has been deployed into a consequential setting.

The same question appears in IT operations. If an agent creates tickets, changes configuration, triages alerts or sends customer messages, someone needs to decide what counts as normal, what requires an exception, what evidence must be retained and who can suspend the workflow when it stops behaving as intended.

The technology changes. The ownership problem remains.

## Three Roles, Not One Label

An organisation does not need a single person to perform every task around an agent. It needs clarity about which role owns which decision.

The first role is the **operational owner**. This role owns the purpose and outcome. The operational owner can explain why the agent exists, which service or process it supports and what success looks like without reducing success to speed or volume. If an agent is used to resolve customer requests, the operational owner owns the service promise. If it is used to coordinate an IT workflow, the operational owner owns the quality and consequence of that workflow.

The second role is the **technical custodian**. This role operates the system safely. They manage the platform, configuration, integrations, reliability and identity mechanisms. They make sure the agent can be observed, updated, separated from inappropriate resources and stopped when necessary. The custodian is essential. But the custodian should not be forced to decide alone what business, clinical, customer or public-service outcome the agent is allowed to optimize.

The third role is the **risk or policy owner**. This role defines conditions that cannot be left to a local workflow: legal requirements, privacy boundaries, safety thresholds, fairness commitments, records obligations or escalation rules. In a small organisation, the same person may hold more than one role. In a large organisation, the roles may be distributed. What matters is that the handoffs are explicit.

An agent should never be able to move between these roles by default.

A technical custodian can make a system available without authorising it to make a consequential promise. An operational owner can request a useful workflow without deciding how credentials are stored. A policy owner can define a boundary without having to run the service every day. The ownership model works when the three roles meet at the point where the agent is given a mandate.

NIST’s 2026 work on AI agents frames secure operation on behalf of users, identity and agent security as foundational areas for trusted adoption.[2] The language is important. Operating on behalf of a user or organisation is not simply a technical feature. It is a delegation relationship. Delegation requires a party that can define and revoke it.

## The Six Owner Commitments

A durable ownership model can be expressed as six commitments. They apply to an agent used in IT, finance, health services, logistics, customer support or public administration. The surrounding process changes. The commitments do not.

**Purpose.** The owner can state the outcome the agent is allowed to pursue. “Help the team” is not a purpose. “Prepare a draft response to routine service requests using approved information” is closer. A purpose should be specific enough to reveal when the agent is being used for something else.

**Authority.** The owner can describe what the agent may read, write, change, send or approve. This includes tools, data, environments and time limits. The chapter before this one established that credentials create reach. Ownership determines whether that reach is appropriate.

**Exception.** The owner decides which cases the agent must stop, escalate or present for a new decision. An exception is not a failure of automation. It is evidence that the organisation understands the boundary of the workflow.

**Evidence.** The owner ensures that meaningful actions can be reconstructed. The record should show the identity used, the instruction or trigger, the relevant evidence, the action, the target and the result. A system that cannot explain its path may still be useful in a low-consequence setting. It is not ready for a setting where people, records, money or production services can be affected.

**Lifecycle.** The owner reviews whether the agent should continue to exist in its current form. This includes model changes, new integrations, role changes, evolving policies, vendor changes and the quiet accumulation of permissions. An agent that had a valid purpose at launch may have an invalid purpose after the surrounding process changes.

**Recovery.** The owner knows who can contain, correct and communicate after an unwanted effect. Recovery cannot be delegated to an incident response team that has no context about the purpose of the workflow. The people who understand the process need to be able to work with the people who understand the system.

These commitments turn ownership into an operating discipline rather than a signature on an approval form.

> ### Control Question
>
> **If this agent produced an unwanted external effect tomorrow, could a named owner explain why it had that authority, stop the workflow, correct the outcome and change the rule that allowed it?**
>
> If each answer belongs to a different team with no agreed handoff, the organisation does not yet own the agent as an operational actor.

## Across Operations

Imagine a health-service scheduling agent. It does not diagnose patients or decide clinical treatment. Its task is narrower: it reads approved appointment rules, proposes available times, sends reminders and routes unusual requests to a human team.

The agent may save time for staff and reduce delays for patients. Yet ownership questions appear immediately.

Who decides which messages the agent may answer? Who determines when a request must be escalated because it contains information outside the scheduling process? Who can inspect the record of a changed appointment? Who disables the workflow if a new integration starts sending the wrong type of message? Who explains the change to a patient if the system has made an error?

The technical answers may involve access controls, logs and monitoring. The operational answer is simpler: a service owner must be able to set the boundary, and a technical custodian must be able to enforce it.

The same pattern holds in IT. An incident-management agent may classify alerts, prepare a runbook and open a ticket. It should not silently own the decision to restart a critical service, notify a regulator or change a customer commitment. The owner must decide where routine assistance ends and a consequential exception begins.

The examples are different. The control is the same.

## Ownership Must Reach the Deployment Environment

A recurring failure in AI governance is to assign ownership during procurement or model selection, then lose it during deployment.

A committee reviews a product. A vendor provides documentation. A pilot begins. Later, an integration is added. A system account is created. New data becomes available. Users discover a new way to prompt the agent. A routine workflow becomes a path to an external action. The original approval remains in a folder, but the operating conditions have changed.

This is why ownership must exist where the agent actually runs.

CAISI’s January 2026 request for information on AI agent security specifically asked about interventions in deployment environments that constrain and monitor the extent of agent access.[3] That is an operational question. The system’s behaviour cannot be governed only at the point where the model is selected. It must be governed where the system encounters tools, data, identities, users and consequences.

An owner should therefore receive more than a quarterly dashboard. They need signals that tell them when the agent’s practical authority has changed. A new tool connection, a new data source, an expanded credential, a rise in exceptions, a repeated override or a failed recovery should trigger a review of the mandate.

Ownership without visibility becomes ceremonial.

Visibility without authority becomes observation.

The two must stay together.

## The Human Remainder

The human role is not to stand behind every agent and repeat its work manually. That would turn automation into a slower interface for the same process.

The human role is to own the conditions the agent cannot legitimately own: the purpose it serves, the authority it receives, the exceptions it must respect, the evidence it must leave and the recovery that follows if it causes an unwanted effect.

> ### The Human Remainder
>
> **An agent may perform a task. It cannot be the accountable owner of the mandate that made the task permissible.**
>
> Ownership remains human or organisational because ownership includes the power to redefine the goal, accept a consequence and change the boundary after learning from a failure.

This is not an argument against autonomy. It is an argument for autonomy that can survive contact with real organisations. The more an agent is trusted to act, the more important it becomes to know who can withdraw that trust, and on what evidence.

The FTC inquiry does not answer every governance question. It does not establish a universal rule for every AI product. But it shows the shape of the question that responsible deployment requires: who approves, who tests, who monitors, who mitigates, who informs and who remains responsible after the system reaches a user?[1]

Those are ownership questions.

They will remain ownership questions even when today’s agent platforms have been replaced.

## Chapter Coda

An AI agent is owned only when someone can change its mandate and answer for its effect.

The vendor may provide the technology. The platform team may operate it. The security team may protect it. Users may benefit from it. But a named owner must hold the purpose, authority, exception path, evidence, lifecycle and recovery plan together.

Ownership is not paperwork.

It is the control that turns an agent from an interesting capability into an accountable operational actor.

The next chapter examines a threat that can exploit an ownership gap even when the agent has a legitimate purpose and a carefully designed identity: the way untrusted content can influence a system that is allowed to act.

## Working Source Notes

[1] Federal Trade Commission, *FTC Launches Inquiry into AI Chatbots Acting as Companions*, September 11, 2025, https://www.ftc.gov/news-events/news/press-releases/2025/09/ftc-launches-inquiry-ai-chatbots-acting-companions.

[2] National Institute of Standards and Technology, *AI Agent Standards Initiative*, updated August 14, 2026, https://www.nist.gov/artificial-intelligence/ai-agent-standards-initiative.

[3] National Institute of Standards and Technology, *CAISI Issues Request for Information About Securing AI Agent Systems*, January 12, 2026, https://www.nist.gov/news-events/news/2026/01/caisi-issues-request-information-about-securing-ai-agent-systems.

[4] OWASP GenAI Security Project, *OWASP Top 10 for Agentic Applications for 2026*, December 9, 2025, https://genai.owasp.org/resource/owasp-top-10-for-agentic-applications-for-2026/.
