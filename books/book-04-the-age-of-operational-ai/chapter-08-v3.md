# Prompt Injection Is Not the Whole Problem

In the last chapter, an organisation assigned an owner to an AI agent. The owner could define the mandate, change the authority, inspect the evidence and stop the workflow.

That is necessary. It is not sufficient.

An agent can have a legitimate owner, a carefully limited credential and a sensible purpose. It can still encounter an email, a webpage, a document or a database record that contains language designed to redirect its attention and change its behaviour.

The owner may have approved the mandate. The untrusted content may propose another one.

In January 2025, the U.S. Center for AI Standards and Innovation published work on evaluating a form of indirect prompt injection it called **agent hijacking**. The research involved collaboration with the UK AI Security Institute and tested agents in simulated environments such as a workspace, a travel service, a messaging application and a banking context.[1]

The evaluation did not describe a production breach. It did not claim that every deployed agent would behave in the same way. Its value is more precise than that.

A legitimate task might require an agent to read an email, inspect a file or visit a website. Within that data, an attacker can place instructions that attempt to make the agent perform a different task. The evaluation tested consequences such as downloading and executing a program, sending data to an unknown recipient and creating personalised phishing messages.[1]

The important fact is not the wording of the malicious instruction.

The important fact is that the agent has been exposed to an outside influence while holding authority it was given for a legitimate purpose.

That is why prompt injection is not the whole problem.

It is one way an agent can be influenced. The larger problem is the path between untrusted content and consequential action.

## A Boundary That Current Models Do Not Reliably Enforce

Traditional software has familiar ways to distinguish a command from data. A database can be designed so that a parameter is handled as a value rather than as a command. A browser can distinguish text on a page from code it is asked to execute. These controls are imperfect in practice, but the underlying systems have different mechanisms for different types of input.

Current large language models work differently.

When an agent combines its own instructions with a document, an email, a webpage or a user request, the model does not possess a reliable built-in security boundary that says: *this is policy; this is untrusted data; this text must never change the purpose of the task.* The model processes the combined context and predicts what should come next.

The UK National Cyber Security Centre made this distinction explicit in December 2025. Its analysis argues that prompt injection should not be treated as a variant of SQL injection. In an LLM, the distinction between instruction and data is not enforced in the same way, which means a perfect, one-time technical cure may not exist for current systems.[2]

This does not mean that agents are useless.

It means that an organisation must stop designing them as though a prompt filter can produce the same guarantee as a deterministic access control.

A filter can reduce the chance that known malicious language reaches a model. Better model behaviour can reduce the chance that the model follows misleading content. Clearer formatting can make trusted instructions more salient. These are useful measures.

None of them should be the only thing standing between an untrusted email and a sensitive external action.

> ### Evidence Note: A Useful Distinction
>
> **Prompt injection** is an attempt to make a model or agent follow an instruction embedded in content it was supposed to treat as data.
>
> **External influence** is the wider operational problem: an agent consumes information from a party that does not share the organisation’s goals, then uses its own authority to act on that information.
>
> The first is a known attack class. The second is the control problem that remains when the attack language changes.

## The Four-Part Failure

A useful way to understand this risk is to follow four parts of a failure path.

The first part is **untrusted content**. This could be a webpage, an email, a résumé, an uploaded document, a support ticket, a shared file or a public record. The content may be honest, mistaken, manipulated or deliberately adversarial. The organisation does not control it merely because its agent can read it.

The second part is **model interpretation**. The agent uses a model to decide what the content means and what should happen next. This is where an embedded instruction may compete with the agent’s intended task. It is also where ambiguous, misleading or emotionally manipulative content can have an effect even when it contains no obvious attack phrase.

The third part is **operational reach**. The agent may have access to a database, a calendar, an inbox, a workflow tool, an internal search system, a customer record or a production service. Chapter 6 showed why credentials matter. They turn an agent from a system that can suggest into a system that can reach.

The fourth part is **external effect**. The agent sends a message, changes a record, makes a request, discloses information, starts a process or triggers a tool. The effect may be small and reversible. It may also be consequential and difficult to undo.

Prompt injection becomes dangerous when these parts connect.

Untrusted content alone is not an operational failure. A model misunderstanding alone may be annoying but recoverable. A credential alone may be appropriately limited. The risk rises when untrusted content influences model interpretation, interpretation reaches a privileged tool and the tool produces an external effect.

The language used by one security team can make this easier to remember. A **source** is the route through which an influence enters the system. A **sink** is the capability that becomes dangerous in the wrong context. An incoming email is a source. A tool that can send the organisation’s files to an unknown recipient is a sink. The control problem is not solved by staring only at the email.

It is solved by making the sink difficult to reach without a rule the model cannot rewrite.

## Why Content Filtering Is Not Enough

It is tempting to search incoming data for familiar phrases: “ignore previous instructions,” “reveal the system prompt” or “send this information elsewhere.” That can catch simple attacks. It can also create a false sense of completion.

Language can be rephrased. Instructions can be divided across documents. A malicious request can look like a normal request made with confidence, urgency or social pressure. An attacker does not need to use a recognisable phrase if they can persuade the agent that an unsafe action is part of the ordinary task.

OpenAI’s 2026 analysis of agents exposed to the open web makes this point in a different way. It describes more sophisticated prompt injection attempts as increasingly similar to social engineering. The important defence is not only to identify a suspicious string, but to constrain the impact of manipulation when a system is exposed to an adversarial outside world.[3]

This analogy is useful because organisations already understand that a human support agent can be misled by a persuasive customer, a forged document or an urgent-looking email. The answer is not to assume that the human will never make a mistake. It is to give the human clear rules, limited authority, review paths and controls around actions with serious consequences.

An AI agent needs the same kind of operating environment.

The model may improve. The wording of attacks will change. The control principle remains: a system that reads untrusted content should not silently acquire more authority because the content was convincing.

## Deterministic Limits Around Probabilistic Systems

A model’s judgement is probabilistic. A production control should not be probabilistic when the cost of failure is high.

This is the practical implication of the UK NCSC’s warning and the NIST evaluation work. The organisation should assume that some external influence will eventually be confusing, ambiguous or adversarial. It should then decide which safeguards remain effective even if the model has interpreted the content badly.

The first safeguard is **least authority**. An agent that reads public webpages does not need the same tools as an agent that operates an internal scheduling workflow. An agent that prepares a draft does not need authority to send it. An agent that classifies a request does not need authority to change a customer record.

The second safeguard is **separation of observation and action**. A system can collect information in one context and propose an action in another. The action step can then be evaluated by a policy engine, a limited allow list, a deterministic rule or a human decision. The agent’s ability to explain why it recommends an action can be useful. Its explanation should not be the only approval mechanism.

The third safeguard is **constrained egress**. An agent should not be able to send information, follow links, call external tools or create new recipients without limits that match the sensitivity of the workflow. A new external destination, a new high-value data type or an unusual volume of action should create a new decision point.

The fourth safeguard is **evidence and detection**. The organisation should log the content source, model output, tool invocation, target, identity and result. Failed actions matter too. An attacker may probe the system several times before finding an instruction or a tool path that succeeds.

The fifth safeguard is **recovery**. If the agent does something unwanted, the organisation needs a way to contain the workflow, correct the outcome and understand which part of the four-part path allowed the effect. A recovery plan that begins with “we will update the prompt” is incomplete.

> ### Control Question
>
> **If untrusted content persuaded this agent to pursue the wrong task, which safeguard outside the model would prevent the most harmful tool action?**
>
> If the answer is “the model should know better,” the boundary is not yet strong enough.

## Across Operations

The control problem is not limited to systems administrators or software engineers.

The Cyber Security Agency of Singapore’s 2026 addendum on securing agentic AI describes agentic workflows across scenarios including coding assistants, automated client onboarding and automated fraud detection.[4] These examples matter because the same pattern appears outside a production environment.

Imagine an onboarding agent that reads an uploaded document, checks information against approved sources and prepares a decision for a service team. The document is necessary to the workflow. It is also untrusted content.

The agent may be helpful if it extracts fields, identifies missing information and presents a structured summary. It should not be able to reinterpret a persuasive sentence in the document as an instruction to approve an exception, alter a rule or send sensitive information to a new destination.

The service owner decides the purpose of the workflow. The technical custodian limits the tools and data the agent can reach. A deterministic rule decides which documents require a human review. The system keeps evidence of what the agent read, what it recommended and what a person or policy engine ultimately approved.

This is not a banking rule or a legal conclusion. It is a general operational pattern.

The same design applies to an IT agent reading a support ticket, a customer-service agent reading an email or a logistics agent interpreting a supplier update. The content can be useful and untrusted at the same time.

## Prompt Injection Is a Signal, Not a Complete Theory

It would be a mistake to build the whole security strategy around prompt injection and ignore other ways an agent can be influenced or misconfigured.

An agent can receive bad data through a compromised connector. It can use a tool with a misleading description. It can inherit access that no longer matches its purpose. It can follow an outdated workflow. It can be given a legitimate instruction with an unsafe objective. It can be placed in a process that has no owner able to see when its authority has expanded.

Prompt injection reveals these broader weaknesses because it forces an organisation to ask a hard question: when the system encounters information from outside its trust boundary, what controls still hold?

The answer cannot be only a better prompt.

It is a combination of ownership, limited identity, constrained tools, explicit policies, evidence, monitoring and recovery. Each element has a different job. Together, they reduce both the likelihood of influence and the impact when influence succeeds.

That is why this book treats prompt injection as important but not complete. It is a warning that an agent’s reasoning environment is not the same as a secure command interpreter. The durable response is to design the surrounding system so that reasoning alone cannot decide an irreversible outcome.

## The Human Remainder

The human role is not to inspect every sentence an agent reads. That would eliminate much of the usefulness of automation.

The human role is to decide which actions are too consequential to leave to an interpretation of untrusted content. It is to define the source boundary, the action boundary and the exceptions that must reach a person or a deterministic policy.

> ### The Human Remainder
>
> **An agent can interpret a document. It cannot be the final authority on whether an untrusted document should expand its own power.**
>
> The organisation must decide which changes of state require a boundary the model cannot cross by persuasion alone.

## Chapter Coda

Prompt injection is real. It may remain difficult to eliminate completely in systems that combine trusted instructions with untrusted content.

But a prompt is only one route of influence.

The larger question is whether an influenced agent can reach a consequential action without a control outside the model. If it can, the organisation has not merely a prompt problem. It has an authority design problem.

The next chapter takes that question to its highest-stakes environment. When an agent can reach production, a confusing input is no longer only a reasoning error. It may become a live operational event.

## Working Source Notes

[1] National Institute of Standards and Technology, *Technical Blog: Strengthening AI Agent Hijacking Evaluations*, released January 17, 2025; updated December 19, 2025, https://www.nist.gov/news-events/news/2025/01/technical-blog-strengthening-ai-agent-hijacking-evaluations.

[2] UK National Cyber Security Centre, *Prompt Injection Is Not SQL Injection (It May Be Worse)*, December 8, 2025, https://www.ncsc.gov.uk/blog-post/prompt-injection-is-not-sql-injection.

[3] OpenAI, *Designing AI Agents to Resist Prompt Injection*, March 11, 2026, https://openai.com/index/designing-agents-to-resist-prompt-injection/.

[4] Cyber Security Agency of Singapore, *Securing Agentic AI – An Addendum to the Guidelines and Companion Guide on Securing AI Systems*, June 17, 2026, https://www.csa.gov.sg/resources/publications/addendum-on-securing-ai-systems/.

[5] OWASP GenAI Security Project, *LLM01:2025 Prompt Injection* and *Top 10 for Agentic Applications for 2026*, https://genai.owasp.org/llmrisk/llm01-prompt-injection/ and https://genai.owasp.org/resource/owasp-top-10-for-agentic-applications-for-2026/.
