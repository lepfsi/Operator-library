# Source Strategy — The Operator’s Last Job

## Purpose

The book must not read as a paraphrase of any single operations doctrine. Its evidence should remain technically credible while drawing on distinct traditions: distributed systems, reliability engineering, human factors, public incident analysis, safety engineering, standards, and professional practice.

A source is not included to decorate the manuscript. It must either establish a factual constraint, challenge a comfortable assumption, supply a case mechanism, or clarify how an operator’s responsibility changes.

## Source families

| Family | Use in the book | Preferred source types | Constraint |
|---|---|---|---|
| Distributed systems and cloud-native control | Controllers, reconciliation, state, retries, agents, failure modes. | Official Kubernetes, CNCF, vendor architecture documentation, original technical papers. | Do not use vendor documentation as an independent safety claim. |
| Reliability and incident practice | Operational action, mitigation, rollback, runbooks, observability, post-incident learning. | Google SRE, AWS Builders’ Library, Microsoft Azure architecture, Cloudflare engineering, Netflix TechBlog, USENIX SREcon material. | Google SRE may be one voice, never the sole foundation of a chapter. |
| Human factors and safety science | Automation bias, verification burden, authority, situation awareness, control constraints. | Peer-reviewed research, safety engineering literature, professional aviation or medical safety bodies. | Avoid transferring a medical or aviation statistic directly to IT without explaining the analogy. |
| Standards and governance | Accountability, risk tolerance, assurance, documentation, critical infrastructure. | NIST, ISO, OECD, ENISA, CISA, national safety authorities. | Use standards for the nature of governance, not to claim that compliance equals safety. |
| Public incidents and practitioner evidence | Concrete failure sequences, institutional context, lived operational detail. | Official postmortems, public regulator reports, company incident reports, court or inquiry records, conference talks. | Attribute narrowly and preserve uncertainty; do not invent organizations or causal certainty. |
| Other operator domains | Controlled 25% widening of the reader’s field: payments, logistics, health, aviation, customer support. | Primary investigations, domain standards, peer-reviewed studies. | Each analogy must return explicitly to IT operations within two paragraphs. |

## Chapter-level allocation

Each chapter must draw, where research is required, from **at least two source families**. Across any four consecutive chapters, no organization should supply more than two principal sources. This prevents the book from acquiring a single institutional accent.

| Chapter group | Dominant technical family | Counterweight |
|---|---|---|
| 5–8: Automation Curve | Cloud-native systems, incident practice, public engineering evidence. | Human factors or governance. |
| 9–13: What Remains Human | Human factors, safety science, governance. | Technical systems or public incident analysis. |
| 14–18: The New Engineer | Standards, architecture, practitioner evidence. | Human factors or public incident analysis. |

## Chapter 8 source basket

Chapter 8, *The Day the Runbook Became an Agent*, will use a deliberately mixed set:

| Role | Source family | Candidate source |
|---|---|---|
| Explain a runbook becoming a controller | Cloud-native architecture | Kubernetes documentation on controllers and desired versus current state. |
| Examine verification burden and deference to recommendations | Human factors research | Lyell and Coiera’s systematic review of automation bias and verification complexity. |
| Frame accountable risk practice | Standards and governance | NIST AI Risk Management Framework. |
| Ground the operational scenario | Public incident or original postmortem | To be selected from an official incident report or public postmortem, not from a vendor marketing narrative. |

## Citation rule

Citations in the manuscript will appear only where a reader benefits from knowing the origin of a factual claim, public event, research result, or formal guidance. Composite scenes will be labeled as composite. The bibliography will give readers a path to the underlying material without turning prose into a report.

## References

[1]: https://kubernetes.io/docs/concepts/architecture/controller/ — *Kubernetes Controllers*

[2]: https://pmc.ncbi.nlm.nih.gov/articles/PMC7651899/ — Lyell and Coiera, *Automation bias and verification complexity: a systematic review*

[3]: https://www.nist.gov/itl/ai-risk-management-framework — *NIST AI Risk Management Framework*

## Evidence retained for chapter 8

The chapter will use a composite operational scene, not a fictionalized version of one company’s incident. The following sources establish distinct mechanisms that the composite may draw on:

| Source | Mechanism retained | Editorial use |
|---|---|---|
| Kubernetes controllers documentation | A controller watches current state, compares it with desired state, acts through an API, and reports resulting state for other control loops. | Distinguish a runbook from a continuous actor that reconciles state. |
| Lyell and Coiera’s systematic review | Decision support can reduce error while encouraging overreliance; verification becomes especially difficult when the task is cognitively complex. | Explain why an explanation is not, by itself, a reliable safeguard against deference to an agent. |
| NIST AI RMF | AI risk practice should be incorporated into the design, development, use, and evaluation of systems. | Frame governance as an operating property rather than an after-the-fact policy. |
| Cloudflare’s November 2025 postmortem | A bad configuration file propagated repeatedly, initial symptoms were misread, and recovery required halting propagation, restoring a known-good file, and introducing stronger ingestion and kill-switch controls. | Show how a system that distributes change needs an explicit way to stop, inspect, and recover from its own propagation. |
| Cloudflare Workers rollback design | A rollback becomes an identifiable new deployment with a recorded reason and visible lineage. | Show that a recoverable action needs an auditable history, not merely an undo button. |

## Additional references

[4]: https://blog.cloudflare.com/18-november-2025-outage/ — *Cloudflare outage on November 18, 2025*

[5]: https://blog.cloudflare.com/introducing-rollbacks-for-workers-deployments/ — *Introducing Rollbacks for Workers Deployments*
