# The End of Manual Operations?

In November 2022, Jake Moffatt went to Air Canada’s website after the death of his grandmother. He needed to travel from Vancouver to Toronto and asked the airline’s chatbot about bereavement fares. The chatbot told him that he could book a regular ticket and apply for a reduced fare later, within ninety days. Moffatt followed that instruction. Air Canada later refused the refund because its policy did not permit a retroactive application.[1]

The important detail was not that a chatbot gave bad information. Organisations have always published inaccurate information. The important detail was that the airline had placed an automated system in the path where a customer asked for a commercial commitment. The system did not merely summarize a policy. It told a grieving customer what the company would do.

Air Canada argued that the chatbot was responsible for its own answer and that the correct policy existed elsewhere on the website. The British Columbia Civil Resolution Tribunal rejected both positions. It found that the chatbot was part of Air Canada’s website, that the customer’s reliance was reasonable, and that the airline had not taken reasonable care to ensure the chatbot’s information was accurate. The Tribunal ordered Air Canada to pay CAD 812.02 in damages, interest and fees.[1]

This was not an agent with production credentials. It did not delete a database, deploy a service or change a firewall rule. That is why the case matters here.

A company had automated a front-line operation. It had reduced the need for a person to answer every initial question about fares. Yet it had not removed the organisation’s responsibility for the promise made in that channel. The system had changed how the work arrived. It had not changed who owned the result.

The end of manual operations is often described as if it were a destination. A task becomes automated. A queue becomes smaller. A person no longer copies a value between systems, classifies an alert, searches a knowledge base, drafts a response, opens a ticket or applies a routine change. The savings can be real. The work can become faster, more consistent and available outside the hours in which a team is awake.

But operations do not disappear when those steps disappear.

They move.

## What Automation Actually Removes

The easiest operational work to automate is work with a stable pattern. A well-defined alert appears. A known runbook applies. A system checks a fixed condition. A request falls inside a clear policy. A routine response can be generated from reliable facts. A failed job can be restarted when preconditions are satisfied.

In these cases, manual execution is often a cost rather than a control. It creates delay without adding much judgment. A person may spend time opening the same dashboard, checking the same values, following the same sequence and recording the same outcome. Automation can remove that effort. A copilot can prepare it. An agent can sometimes execute it.

That is progress.

It is not the same as replacing operations.

Manual work is not one thing. Some manual work is repetition. Some is interpretation. Some is evidence gathering. Some is negotiation between competing goals. Some is an exception that reveals the policy no longer fits the world. Some is recovery after a system followed the policy and still produced the wrong outcome.

The mistake is to treat every manual step as proof that the process has not matured. A manual step may be waste. It may also be the last location at which someone notices that the case does not resemble the cases that came before it.

The Air Canada case makes this visible. The chatbot may have reduced a support interaction. It did not know that its answer conflicted with the policy linked on the same website. It did not notice that the customer was making an irreversible purchase decision in a moment of distress. It did not own the cost of the wrong answer. Those were not failures of typing speed. They were failures of operational design.

> ### Evidence Note: Automation Does Not Transfer Accountability
>
> A system can automate the first response, the classification, the recommendation or the execution. It cannot become a separate owner of the promise the organisation makes through it.
>
> If an automated channel can create a customer commitment, change a right, approve an exception or alter a production state, the organisation remains accountable for the outcome.

This distinction becomes more important as systems become more capable. When a workflow is narrow and deterministic, the automation boundary is relatively easy to describe. When a system interprets natural-language requests, chooses a tool, retrieves a policy, handles an exception or completes a multistep workflow, the boundary becomes a design question.

The organisation must decide not only what work can be automated, but what kind of uncertainty the system is allowed to absorb.

## The Work That Moves Elsewhere

Every successful automation programme moves work into a different part of the operating model. It does not eliminate the need for people. It changes what people need to be good at.

First, work moves into **policy definition**. Someone has to decide what a routine case is, which facts count as sufficient evidence, what the system may promise, which actions are reversible and where the decision must stop. A policy that remains implicit in experienced operators is not ready for automation. An agent cannot operate safely on a rule that only exists as a feeling held by the person who has seen the last twenty exceptions.

Second, work moves into **exception handling**. Automation is most useful when the normal path is common. That makes the abnormal path more important, not less. An unusual customer request, an ambiguous alert, a mismatch between two systems, a missing source of truth or an action with a larger blast radius needs a route that does not force the system to guess.

Third, work moves into **assurance**. Someone has to test whether the system still works after the policy changes, the upstream data changes, the model changes, the vendor changes, the permissions expand or the operating environment changes. A workflow that was safe last quarter may become unsafe after an integration quietly changes what the agent can reach.

Fourth, work moves into **recovery**. An automated operation must have a way to contain, reverse, repair and explain an effect. Recovery is not evidence that automation failed. It is evidence that the organisation understands that even bounded systems can encounter conditions they were not designed to resolve.

Finally, work moves into **improvement**. The people closest to the exception must be able to change the policy, narrow the action envelope, add an evidence requirement, revise a runbook or remove authority. If they cannot, the organisation has created a faster way to repeat the same mistake.

The right question is therefore not, *How many manual steps can we remove?*

It is, *Which manual steps create no value, and which ones contain the judgment, recovery and accountability that automation must not erase?*

## The Exception Budget

Every automated operation should have an **exception budget**.

The budget is not a financial limit. It is the amount of ambiguity, novelty and consequence that the operation is allowed to absorb before it stops and asks for a different form of control.

A low-consequence task may have a generous budget. An agent that opens a standard ticket when a known monitoring condition is met can handle a broad range of routine variations. If the ticket is wrong, the effect is easy to revise. The system can record what it did. A person can close or correct the ticket.

A high-consequence task needs a narrow budget. An automated process that changes a customer’s access, sends a legal notice, approves a payment, alters production data or makes a public statement should stop much earlier. A small ambiguity may be enough to require a human decision because the cost of a wrong action is not proportional to the time saved by automation.

The budget should be written before the operation scales. It should answer four questions.

What kinds of cases may the system complete without a new human decision? What kinds of evidence must be present before it does so? Which signals mean that the case has become an exception? And who receives the exception with enough context to make a real decision?

If those questions have no answer, the operation has no reliable boundary. It has only optimism.

> ### Control Question
>
> **When an automated workflow meets a case outside its policy, does it stop with evidence, or does it continue by treating uncertainty as another problem to solve?**
>
> The first design creates an exception path. The second creates an unbounded mandate.

An exception budget also prevents a damaging form of success. A system may handle ninety-five percent of requests quickly and correctly. The remaining five percent may contain the cases with the greatest financial, legal, safety or human consequence. If the organisation measures only the reduction in queue volume, it can mistake the removal of visible work for the removal of risk.

The queue looks smaller. The responsibility has become more concentrated.

## Manual Work as a Control Surface

There is a temptation to describe manual work as the opposite of modern operations. The contrast is too simple.

A manual step can be a control surface when it forces a change in pace at the right moment. It may require a person to compare two independent sources before granting access. It may require an incident commander to decide whether a restart would remove evidence. It may require a customer-service lead to approve an exception that changes someone’s rights. It may require a finance owner to review an action that commits money.

These are not arguments for keeping people busy.

They are arguments for placing human judgment where the action cannot be evaluated by the system’s existing evidence alone.

The distinction matters because superficial approval is not a control surface. A person who is asked to click through a recommendation every few seconds, without time to inspect the evidence or authority to reject the action, is not adding judgment. They are adding ceremony. The system has already decided how the process moves.

Meaningful manual control has three properties. It is **timely**, because the person can intervene before the effect becomes irreversible. It is **informed**, because the person can see the relevant evidence rather than a summary that must be accepted on trust. And it is **effective**, because the person can change, reject or revoke the action.

A mature organisation does not put a human in every loop. It puts the right human at the right boundary.

The NIST AI Risk Management Framework is useful as an organisational lens here. It treats AI risk management as continuing work across governance, context, measurement and management, rather than a one-time check before deployment.[2] That approach fits operations. The authority given to a system has to be reviewed as the system, the policy, the environment and the consequences change.

## The Operator After Automation

The operator’s role becomes more demanding when routine execution becomes easier.

The operator may no longer be the person who copies a configuration, sends a standard response or runs a familiar command. They become the person who decides whether the automation boundary still reflects the organisation’s intent. They investigate the case the system could not classify. They test the action envelope against new conditions. They decide whether a recurring exception should become a policy change or remain a human decision. They own the recovery when an apparently routine action produces an unexpected effect.

This is not a lesser role. It is a more concentrated one.

The old operating model often rewarded memory: the person who knew which dashboard to open, which service account worked, which colleague to ask, which undocumented step made the runbook succeed. Operational AI can reduce dependence on that kind of memory. It can retrieve context, assemble a draft and perform bounded work.

The new model must reward judgment: the person who can identify an unreliable source, notice a category error, recognise a new exception, define a better policy, challenge an apparently plausible recommendation and decide when a system should lose authority rather than gain it.

That is why “the end of manual operations” is the wrong aspiration.

The better aspiration is the end of manual effort that creates no operational value, combined with a deliberate investment in the manual judgment that preserves trust when the world does not fit the workflow.

> ### The Human Remainder
>
> **Humans should not remain in the process to repeat what the system can do. They should remain where someone must interpret an exception, accept a consequence, repair an effect or redefine the boundary.**
>
> The goal is not fewer humans. The goal is fewer humans trapped in work that leaves no room for judgment.

The Air Canada decision offers a quiet warning. An automated channel can make a service feel more available. It can make an organisation appear faster. It can remove a person from the first interaction. But it cannot remove the organisation from the commitment it makes through that channel.

The same is true in operations. An agent can execute a runbook. It cannot decide, by itself, what the organisation is willing to risk when the runbook no longer fits. It can process an exception only if the organisation has already decided which exceptions are safe to process. It can recover only if recovery was designed before the failure.

Automation changes the location of the work. It does not dissolve the work of responsibility.

## Chapter Coda

The end of manual operations is not the end of operators.

It is the end of some manual steps, and the beginning of more deliberate work: defining policies, designing exceptions, inspecting evidence, recovering from effects and deciding what a system may never decide alone.

The organisation that understands this will automate with more confidence, not less. It will remove routine effort where the boundary is clear and preserve human judgment where the boundary is uncertain.

The next part begins with a harder question. Once systems can interpret objectives and act within bounded authority, what new attack surface have we created by giving them credentials, tools and a route to the environments that matter?

## Working Source Notes

[1] *Moffatt v. Air Canada*, 2024 BCCRT 149, British Columbia Civil Resolution Tribunal, February 14, 2024, https://canlii.ca/t/k2spq.

[2] National Institute of Standards and Technology, *AI Risk Management Framework*, https://www.nist.gov/itl/ai-risk-management-framework.

[3] AI Incident Database, *Incident 639: Air Canada Chatbot Reportedly Provides Inaccurate Information*, accessed August 2026, https://incidentdatabase.ai/cite/639/.
