# The AI Has Credentials

In April 2026, Vercel disclosed unauthorized access to certain internal systems. Its security bulletin traced the beginning of the incident to the compromise of Context.ai, a third-party AI tool used by a Vercel employee. According to Vercel, the attacker used that access to take over the employee’s individual Google Workspace account, then their Vercel account, pivoted into a Vercel environment and enumerated and decrypted non-sensitive environment variables.[1]

The incident did not begin with an AI system deciding to attack Vercel. It began with a trust path.

A third-party service had been granted access to an employee account. That account could reach an organisational account. That account could reach an environment. The environment contained values that other systems would accept as proof of authority: API keys, tokens, database credentials and signing keys. Each step had a technical purpose. Together, they created a route from one compromised integration to a meaningful operational surface.

That is what credentials do.

They translate possibility into effect.

A model can describe a deployment. A credential can create one. A model can propose a customer record change. A credential can submit it. A model can identify a file, an account or an environment. A credential can open it, alter it, copy it or pass its authority to another service.

This distinction is easy to miss because credentials often appear as a configuration detail. They sit in an environment variable, a password manager, a secret store, a service-account setting or an OAuth consent screen. They are discussed during setup, then disappear into the background. But every credential is an authority decision that another system will enforce.

The AI has credentials when an organisation has decided that something acting on its behalf can be recognized, accepted and trusted by another system.

That is the beginning of a new attack surface.

## The Model Is Not the Identity

A common description of an agent starts with the model. The model reasons over a request, retrieves context, selects a tool and produces an answer or action. This description is useful, but incomplete.

The model is rarely the identity that an external system trusts.

A cloud platform does not grant access because a language model wrote a convincing sentence. A database does not accept a query because the query appears sensible. An email service does not send a message because an agent has a plausible objective. External systems act because they receive a token, a session, a certificate, a signed request, a service account or another form of credential they have been configured to accept.

The credential is the bridge between interpretation and consequence.

This is why the question “What can the model do?” is too vague for operations. A more useful question is: **Which identity will the external system believe is acting, and what is that identity allowed to do?**

The answer may be a human employee whose existing session is reused by a tool. It may be a shared service account. It may be an OAuth grant, where a user authorizes a third-party application to access a defined set of resources without receiving the user’s password. It may be a short-lived workload identity issued for a particular task. It may be an API token copied into a configuration file years ago and never reviewed.

These are not interchangeable designs.

A reused human session can make an agent appear to have the full range of a person’s standing access. A shared service account can remove the ability to distinguish one workload from another. A long-lived token can retain authority after the reason for its creation has been forgotten. A short-lived, narrowly scoped identity can make an action easier to attribute and easier to stop.

The technical format changes. The operating question does not.

Who is acting? What can it reach? Why does it need that authority now? How will anyone know if the identity is used in the wrong context?

> ### Evidence Note: Credentials Turn Capability into Reach
>
> A capable system is not necessarily an authorised system. A credential is the mechanism that turns a system’s capability into access another system will accept.
>
> The security question is therefore not only whether the model can make a poor decision. It is whether a poor decision, a compromised integration or an unintended instruction can reach an identity with meaningful authority.

Vercel’s bulletin makes this concrete. Its public account did not describe a failure of language generation. It described a chain of delegated access: a third-party AI tool, an employee’s Google Workspace account, a Vercel account, an internal environment and environment variables that had to be treated as potentially exposed.[1] Vercel advised affected users to rotate credentials, review activity logs and treat values such as API keys, tokens, database credentials and signing keys as priorities for review.[1]

The lesson is not that every AI tool is unsafe. The lesson is that every integration deserves the same identity design discipline as any other route into an organisation.

## A Credential Is a Delegation

When a person grants an application access, the interface often makes the action feel administrative. A screen asks for permission. A user approves a scope. A connection is created. The work can begin.

Operationally, something more significant has happened.

The organisation has delegated part of a person’s ability to access information or cause an effect. The delegation may be narrow and temporary. It may be broad and durable. It may be visible to an administrator. It may be buried in a marketplace approval, a developer console or an old project setting. It may be revoked easily. It may remain active long after the system that needed it has been replaced.

The degree of risk is not determined by whether the recipient is called an AI agent. The same question existed for scripts, integrations, service accounts and automation platforms before current models arrived. Agents make the question more urgent because they can connect the credential to a broader range of instructions, tools and sequences.

A traditional script generally follows the narrow flow it was written to follow. An agent may choose among tools, interpret a request, retrieve additional context, retry a failed step or compose several actions. That flexibility can be useful. It also means that the authority embedded in its credentials can be exercised in situations the original implementer did not anticipate.

The answer is not to deny all access. An agent without any route to an external system is an assistant with limited operational value. The answer is to make the delegation visible, bounded and reviewable.

NIST’s AI Agent Standards Initiative, created in February 2026 and updated in August, explicitly identifies agent security and identity as areas requiring work to support secure operation on behalf of users.[2] This does not make every emerging practice a settled standard. It does confirm the direction of travel: identity and authorization are not auxiliary problems around agents. They are central conditions for using agents with confidence.

> ### Control Question
>
> **If this credential were used by the wrong workflow, from the wrong environment or at the wrong time, what would stop the action before it became an external effect?**
>
> If the answer is “someone would notice later,” the credential has more practical authority than the operating design can control.

## The Five Credential Questions

Before an agent receives access to a resource, an organisation should be able to answer five questions in plain language. These questions are intentionally durable. They apply whether the system uses a current frontier model, a smaller local model, a scripted workflow or a future agent protocol.

**First: identity.** Which actor is this? An organisation should be able to distinguish an agent used for support triage from an agent used for deployment review, even if both are built on the same underlying platform. The ability to say “the AI did it” is not enough. It removes the detail needed to investigate, limit or revoke authority.

**Second: authority.** What exact resource, action, environment and time window does the identity permit? “Access to the cloud” is not an authority definition. “Read this incident channel for twenty minutes, then create a draft ticket in this project” is closer. Authority becomes safer when it can be described in terms that an owner can recognize and challenge.

**Third: delegation.** Who authorised this access, for what purpose and under which policy? A credential should not survive merely because no one has found the setting where it was created. It should have an accountable human or service owner who can explain why the identity exists.

**Fourth: lifecycle.** How is access issued, rotated, reviewed and revoked? Most identity failures are not failures of initial setup. They are failures of time. A temporary project becomes a permanent integration. A test token reaches production. A person changes roles while an approval remains. A vendor connection outlives the contract that justified it. The lifecycle is where a clean design meets an organisation’s actual history.

**Fifth: evidence.** Can the organisation reconstruct which identity used which credential, for which action, against which resource and with what result? Without that record, a credential is not merely hard to audit. It is hard to control. An owner cannot learn from an effect they cannot attribute.

These questions create a practical distinction between access and authority. Access is the technical ability to reach a resource. Authority is the organisational decision that reaching it is appropriate under defined conditions.

A system may have access without legitimate authority. A user may have authority without the right mechanism to exercise it safely. Good operational design brings the two together and leaves a record when they are used.

## Scope Is a Safety Property

The most dangerous credential is not always the one with the widest visible permission. It may be the one whose scope is poorly understood.

A token may appear limited because it is attached to a single application. Yet that application may be able to read a secret that grants access somewhere else. An OAuth grant may appear limited because it applies to a single user. Yet that user may hold standing access to shared resources. An environment variable may appear harmless because it is not marked sensitive. Yet it may contain a database password, a signing key or an API token with production reach.

This is why Vercel’s recommendation after its 2026 incident did not stop at deleting projects or accounts. Its bulletin stated that compromised secrets may still provide access to production systems and advised users to rotate environment variables that were not marked sensitive, including API keys, tokens, database credentials and signing keys.[1]

Scope is not a label attached to a credential. It is the set of effects that can follow when the credential is accepted across a real environment.

The organisation therefore needs to ask not only, *What does this permission say it permits?* It needs to ask, *What other systems will accept the consequences of this permission?*

This is where agents raise the stakes. A person may understand that a credential is powerful and use it only in a familiar context. An agent may be placed in a workflow where it receives dynamic instructions, retrieved content, tickets, documents or messages from other systems. If that workflow can influence which tool is selected or which resource is addressed, the scope of the credential becomes part of the system’s action envelope.

OWASP’s Top 10 for Agentic Applications for 2026 identifies critical risks for autonomous and agentic systems that plan, act and make decisions across complex workflows.[3] The value of this framework for operators is not a new set of labels to memorize. It is a reminder that agentic risk emerges at the joins: instructions meet tools, tools meet authority, authority meets data, and data meets external consequence.

A safe design narrows those joins. It uses separate identities for separate jobs. It prefers permissions that expire. It limits credentials to the environments they need. It avoids treating a personal account as an integration account. It records meaningful actions. It makes revocation possible before a crisis.

These practices are not glamorous. They are what make an operational promise credible.

## The Lifecycle Problem

Issuing a credential is easy. Ending its authority is harder.

A team creates an integration during an experiment. The experiment succeeds. The integration becomes part of a workflow. New tools connect to the same account. The original owner changes roles. The service is renamed. The credential remains because no one sees a failure. Months later, an incident forces the organisation to discover which connections still exist and what they can reach.

This pattern is common because access is created in a moment of purpose and reviewed in a moment of doubt. Good operations make review routine rather than exceptional.

A credential lifecycle should have a beginning, a purpose, an owner, a review point and an end. The end may be a timed expiry, a completed task, a contract termination, a role change or a deliberate renewal. What matters is that authority does not become permanent by accident.

For agentic systems, lifecycle discipline also protects against a quieter form of drift. A system can gain practical reach without receiving a new obvious permission. A new tool may be added to a workflow. A data source may be connected. A service account may inherit a role. A prompt may begin to include information that changes how a previously permitted action is used. The original credential has not changed, but the effective action envelope has.

That is why identity review cannot be separated from system review. The agent, its tools, its context, its permissions and its operating environment have to be reviewed as one system.

## The Owner Behind the Identity

A non-human identity should never imply non-human accountability.

This does not mean that every action needs a person to approve it in real time. That would erase much of the value of bounded automation. It means that an organisation must be able to name the person or role responsible for the identity’s purpose, scope, lifecycle and evidence.

The owner does not have to execute the action. The owner has to be able to answer the questions the system cannot answer for itself: why the access exists, what outcome it serves, what risk is acceptable, when the authority should be narrowed and what to do when the result is wrong.

This is a higher standard than assigning a generic team mailbox. An owner needs enough proximity to the operating purpose to recognize an exception and enough authority to change the boundary. Otherwise, accountability becomes a directory entry rather than a control.

> ### The Human Remainder
>
> **The human role is not to impersonate the agent’s judgment after the fact. It is to own the conditions under which the identity exists: purpose, scope, review, revocation and recovery.**
>
> A system may hold a credential. It cannot hold responsibility for why that credential was issued.

The Vercel incident is recent, specific and still subject to the limits of a public security bulletin. Its deeper value is not as a warning about one vendor or one OAuth application. It demonstrates a durable operational truth. Trust paths are composed. A credential accepted in one system can become a route into another. A small integration can inherit the importance of the account, environment or secret it is allowed to touch.

The question is not whether organisations should allow agents to use credentials. They already allow software to use credentials everywhere.

The question is whether the organisation can see the identity it has created, describe its authority, bound its reach, observe its use and remove it when the reason for trust has ended.

## Chapter Coda

The AI has credentials when another system accepts its identity.

That acceptance is not a technical footnote. It is the point at which a model, a tool and an instruction can become an operational effect.

Every agent identity therefore needs an owner, a boundary, a lifecycle and evidence.

Once an organisation grants that identity, a harder question follows. A credential tells us that an agent can act. It does not tell us who owns the agent as an operational actor.

## Working Source Notes

[1] Vercel, *Vercel April 2026 security incident*, April 2026, https://vercel.com/kb/bulletin/vercel-april-2026-security-incident.

[2] National Institute of Standards and Technology, *AI Agent Standards Initiative*, created February 17, 2026; updated August 14, 2026, https://www.nist.gov/artificial-intelligence/ai-agent-standards-initiative.

[3] OWASP GenAI Security Project, *OWASP Top 10 for Agentic Applications for 2026*, December 9, 2025, https://genai.owasp.org/resource/owasp-top-10-for-agentic-applications-for-2026/.
