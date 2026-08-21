# The AI Supply Chain

A production boundary can be narrow on paper and wide in practice.

An agent may be authorised to send a specific kind of email, change one service configuration or prepare a bounded operational action. Its access contract can name the environment, the action class, the evidence required and the person who can stop it.

But the agent does not act alone.

It acts through a model it did not train, a runtime it may not host, instructions that can change, connectors that define its tools, packages that interpret requests, data sources that shape its context, credentials that grant reach and observability systems that decide what anyone can later reconstruct.

Each component can change the meaning of the agent’s authority.

A production access contract answers a necessary question: *what is this agent allowed to do?* It does not answer another: *what has assembled the agent that is doing it?*

That second question is the supply chain question.

## A Tool That Changed the Message

On September 25, 2025, Snyk reported that an npm package called `postmark-mcp` had been modified to add a blind-copy recipient to outbound emails. The package presented itself as a Model Context Protocol server that allowed AI assistants to send emails through the Postmark service. Snyk’s analysis said that the behaviour appeared in later package versions, and that the package was subsequently removed from npm.[1]

The reported effect was simple and serious. A tool intended to help an agent send ordinary email could copy message content to an external address. Depending on what an agent sent, that content could include customer correspondence, attachments, reset links, internal communications or credentials that happened to appear in a message.[1]

The report is security research, not a complete postmortem from npm, Postmark or the package author. It does not establish the full extent of adoption or impact. That limit belongs to the case.

Its lesson does not depend on those unknowns.

A team may have carefully defined what an agent can send. It may have assigned a narrow email scope, recorded an owner and required a review before a campaign begins. Yet a component inside the tool path can alter where the message goes without changing the agent’s stated objective.

The authority changed inside the supply chain.

This is not a special property of email. A connector can add a recipient. A library can change a request. A model update can alter tool selection. A retrieval source can add context that changes a decision. A package can use a credential differently from the way its installer expected. A remote service can modify behaviour after the deployment that depended on it has already been approved.

The agent remains the visible actor.

The chain behind it determines what that actor can actually become.

> ### Evidence Note: A Reported Supply-Chain Case
>
> The `postmark-mcp` case is drawn from a 2025 report by Snyk, a security company that analysed the published npm package and its code changes.[1]
>
> The chapter does not treat the report as a complete account of impact. It uses the documented component behaviour to show why a tool’s implementation belongs inside an agent’s authority model.

## Authority Is Assembled

The phrase *AI supply chain* can sound abstract because it gathers unlike things under one label.

Code dependencies belong to a supply chain. So do model releases, prompt templates, tool definitions, connector packages, retrieval indexes, identity providers, evaluation suites and hosted services. They do not all create the same kind of risk. They share one important property: each can affect what an agent sees, decides or does.

An agent’s authority is assembled across those components.

A model determines how instructions and context may be interpreted. A system instruction provides an operating boundary, but only if its owner, update path and enforcement are known. A tool definition tells the agent what action exists. A connector decides how that action becomes a request to another system. A credential gives the request reach. A data source may introduce facts, instructions or errors into the working context. An observability system determines whether the organisation can see the action after it has happened.

None of these components needs to be malicious to change the resulting authority.

A routine version update can add a capability. A harmless configuration change can broaden a query. A dependency can introduce a new egress path. A team can exchange a static credential for a more convenient shared token. An evaluation can be removed because it slows a release. Each decision may look local. Together they determine whether the agent’s mandate still means what the organisation believes it means.

This is why the supply chain cannot be delegated to procurement alone, security alone or the team that first built the agent.

It is part of operations.

## From an Ingredients List to an Authority Chain

In May 2026, CISA and G7 partners published *Software Bill of Materials for AI – Minimum Elements*. The guidance describes an SBOM as an ingredients list that helps organisations understand supply chains and make risk-informed decisions about protecting critical systems. It treats AI systems as software systems while recognising that AI-specific components require additional transparency.[2]

The phrase *ingredients list* is useful. It makes an invisible system more legible.

For an operational agent, however, an inventory needs one more question: which ingredient can alter authority?

A model identifier alone is not enough. An organisation should know which model is used, what release path governs it, where it runs and who is allowed to replace it. A connector name alone is not enough. The organisation should know which tool it exposes, what permissions it uses, which endpoints it can reach, which package version defines it and how it can be revoked.

This chapter calls the resulting record an **authority chain inventory**.

The inventory does not promise that every component is safe. No realistic inventory can do that. It creates the conditions for three things that are otherwise difficult:

1. noticing that authority has changed;
2. identifying which component introduced the change; and
3. revoking the component without treating the entire agent system as unknowable.

The authority chain inventory has six layers.

The first is the **model and runtime**. Record the model or release channel, the hosting boundary, the update owner and the fallback behaviour. A system that changes model version without a recorded evaluation has changed a decision component without evidence.

The second is **instructions and policy**. Record the system instructions, policy rules, approval logic and the people or systems allowed to change them. A prompt is not merely text when it governs what tools an agent will attempt to use.

The third is **tools and connectors**. Record the tool definitions, APIs, MCP servers, packages, versions, endpoints and permission scopes. This is the layer where routine capability can become a hidden egress path.

The fourth is **data and retrieval**. Record which sources can enter the agent’s context, what permissions govern them, how they are updated and what trust classification they carry. A retrieved document may be content. It may also be influence.

The fifth is **identity and credentials**. Record the issuer, scope, lifecycle, revocation path and evidence of use. The same credential can be safe in a bounded connector and dangerous in a connector whose target selection has changed.

The sixth is **evaluation and observability**. Record the tests, monitors, logs, change record and incident owner. A supply chain can be inventoried at launch and still drift without a way to observe what changed.

> ### Control Question
>
> **If an agent began using a new tool, recipient, endpoint or data source tomorrow, which record would reveal the change, which owner would approve it and which control could revoke it before it reached a live effect?**
>
> If the organisation cannot answer these questions, it has a component list rather than an authority chain.

## The Connector Is a Boundary, Not a Convenience

Connectors are often presented as conveniences. They let an agent email a customer, query an internal system, create an issue, schedule a task, update a record or call a business API.

That description is incomplete.

A connector is a translation boundary. It turns an agent’s proposed action into an action that another system recognises. It may transform arguments, supply defaults, hold a token, select a destination, retry a request or expose capabilities that the agent itself never describes in plain language.

The connector therefore belongs inside the operational boundary.

A strong design treats each connector as a product that needs an owner, a version, a declared purpose, a scope, an approval path and a revocation path. It is not enough to approve “access to the customer system.” The organisation should approve a named connector with a defined action set.

This distinction matters because a tool may look limited while its implementation is broad. A message-sending connector may read message templates, attachments and sender settings. A deployment connector may also enumerate projects, environments and secrets. A retrieval connector may cache a dataset beyond the period a team expects. A workflow tool may follow redirects, invoke webhooks or introduce another provider into the execution path.

The safe question is not *does the agent need this tool?*

The safer question is *what authority does this tool assemble, what data can it carry and how will that authority change when the tool changes?*

## Change Is an Operational Event

Software supply chains have long taught organisations that dependencies change. Agent systems make the consequence more immediate because a dependency may sit directly between language and action.

A change to a model, connector or retrieval index should therefore be handled as an operational event whenever it can alter reach, interpretation or evidence.

This does not mean that every package update requires a committee meeting. It means the review should match the authority it can change.

A documentation-only update may be routine. A connector update that changes outbound destinations, additional permissions, tool arguments or a credential path deserves a different level of evidence. A model replacement in a workflow that selects production actions may need a replay against known scenarios, a narrowed action envelope or a staged rollout before it receives the same live authority.

The CISA and G7 guidance is valuable because its supply-chain approach encourages organisations to make components visible before an incident forces the inventory to exist.[2]

Visibility is necessary but not sufficient.

A complete inventory can still overwhelm a team. The authority chain inventory adds a practical priority: review the components that can change an external effect first. A new font in a dashboard is not the same as a new package that handles recipient selection. A model card update is not the same as a change in the service account used by an agent. A connector patch is not the same as a new tool that can delete data.

The review follows consequence.

## Provenance Without False Certainty

Provenance means being able to say where a component came from, how it was introduced, what version is in use and who is responsible for changing it.

It does not mean that an organisation can prove a component will never fail or be compromised.

This distinction is important because teams sometimes abandon provenance work when they realise it cannot deliver total certainty. That is the wrong standard.

A shipping manifest does not prove that every part of a machine will survive every condition. It still allows an operator to identify which part was installed, where it came from and which machines need attention when a defect is found.

An authority chain inventory serves the same purpose.

When the `postmark-mcp` package was removed from npm, that public event did not remove already installed copies from environments. An organisation still needed to know whether it used the package, where it ran, which credentials passed through it and what communications might have been affected.[1]

Provenance turns a broad warning into an answerable operational question.

Without it, the team receives an alert and begins a manual search across repositories, agent hosts, configuration files, pipelines and employee knowledge. The time between discovery and containment expands. The uncertainty becomes part of the incident.

With it, the team can identify the component, suspend the connector, rotate the relevant credentials, review the affected action path and preserve evidence of what occurred.

That is not certainty.

It is recoverability.

## Across Operations

The supply-chain problem exists whenever an automated workflow depends on components its owner did not build alone.

In IT, the visible form may be a model, an MCP server, a package registry, a cloud API and a service credential. In a procurement or service workflow, the same structure can appear as a document-processing provider, a routing integration, a third-party template service, a records connector and a delegated approval mechanism.

The organisation does not need to treat every external service as hostile. It does need to know which component can alter a commitment, redirect information, add a recipient, broaden a query or change the interpretation of a request.

A service workflow can use an authority chain inventory to record its routing component, source documents, identity provider and communication channel. If a new integration changes where a document is sent, that is not just an implementation detail. It is a change in the workflow’s authority.

The practical disciplines remain the same: name the component, define its purpose, record its scope, observe its changes and preserve a route to revoke it.

## The Trust That Reputation Cannot Supply

A familiar provider, a popular package or a widely adopted protocol can reduce some forms of uncertainty. None of them can substitute for evidence.

Reputation does not reveal which version is installed. It does not show which permissions a connector inherited. It does not explain why an agent selected a tool. It does not preserve the action path after a change. It does not tell an organisation how to revoke a component when a risk is discovered.

Trust needs records that can be inspected.

An authority chain inventory gives a team the record. The production access contract gives it a boundary. Observability gives it evidence. Recovery gives it a way to act when the boundary or a component fails.

These controls do not remove the speed that makes agents useful.

They make the speed governable.

## Chapter Coda

An agent does not arrive with authority fully formed.

Authority is assembled through models, instructions, tools, connectors, data, credentials and the systems that observe them. A change anywhere in that chain can alter what the agent can reach.

The organisation therefore needs more than a trusted name on a component. It needs evidence of what has been assembled, what has changed and how the relevant authority can be revoked.

From that evidence, a harder question emerges: when an agent acts without continuous supervision, what would justify trusting it at all?

## Working Source Notes

[1] Liran Tal, “Malicious MCP Server on npm postmark-mcp Harvests Emails,” Snyk, September 25, 2025, https://snyk.io/blog/malicious-mcp-server-on-npm-postmark-mcp-harvests-emails/.

[2] Cybersecurity and Infrastructure Security Agency, “Software Bill of Materials for AI – Minimum Elements,” May 12, 2026, https://www.cisa.gov/resources-tools/resources/software-bill-materials-ai-minimum-elements.

[3] National Institute of Standards and Technology, “CAISI Issues Request for Information About Securing AI Agent Systems,” January 12, 2026, https://www.nist.gov/news-events/news/2026/01/caisi-issues-request-information-about-securing-ai-agent-systems.

[4] Cloud Security Alliance, “MCP Security Crisis: Systemic Design Flaws in AI Agent Ecosystems,” May 4, 2026, https://labs.cloudsecurityalliance.org/research/csa-research-note-mcp-security-crisis-20260504-csa-styled/.

[5] OWASP GenAI Security Project, “Top 10 for Agentic Applications for 2026,” https://genai.owasp.org/resource/owasp-top-10-for-agentic-applications-for-2026/.
