# Chapter 7 — Then We Let Machines Act

## Role in Part II

Chapter 7 is the third movement of *The Automation Curve*. Chapter 5 established that automating routine can remove the evidence through which teams learn. Chapter 6 established that automated diagnosis orders an investigation before it commands an action. Chapter 7 crosses the next threshold: a system does not merely recommend a rollback, a drain, or a traffic shift. It performs one.

The chapter must not reargue that people should approve everything. That would be both operationally implausible and intellectually weaker than the book’s thesis. Its concern is the design of a permission that can be delegated safely: scope, evidence, blast radius, reversibility, stop condition, observation, and ownership.

## Composite operational case

**Context:** A multi-region retail checkout service experiences a sharp rise in payment authorization failures after a routing configuration rollout. An autonomous mitigation controller is authorized to act on a narrow class of incidents.

**Proposed action:** The controller performs a dry run to drain the newly configured routing cell and shift a bounded share of checkout traffic to the prior route.

**Complication:** The action will lower the visible error rate, but it also moves retry traffic toward a payment gateway already operating under a maintenance constraint. The technical action is reversible; the commercial and operational consequence is not automatically harmless.

**Human role:** The on-call engineer does not take the command away. She narrows the authority: the controller may drain the affected cell for twenty minutes, may shift no more than 12 percent of traffic, must preserve payment attempt identifiers, must stop when retry latency crosses a defined threshold, and must notify the payments owner. The human contribution is not button pressing. It is the creation of an action envelope that makes delegated execution safe enough to be useful.

## Narrative form

The chapter opens with a **dry-run record**, not a timestamped scene. It then reconstructs the action envelope from the point of view of the person who has to sign the permission. This distinguishes the chapter from the queue reconstruction of chapter 5 and the diagnostic dossier of chapter 6.

| Movement | Function | Form |
|---|---|---|
| The action that did not wait | Establish the threshold from diagnosis to actuation. | Dry-run record and restricted system output. |
| What an action really contains | Show that an API call carries assumptions about scope, cost, and reversal. | Concrete operational reconstruction. |
| Permission before panic | Explain pre-authorization as a design act, not a rubber stamp. | Decision Ledger. |
| The action envelope | Define scope, expiry, stop condition, observation, and owner. | Boundary Condition. |
| When a rollback is not a retreat | Show that a reversible technical act can still redirect risk. | Case Signal and prose. |
| What remains with the operator | Locate human work in authoring and auditing permissions. | Operator’s Note and The Shift. |
| The question after execution | End with authority rather than reassurance. | The Question and memorable phrase. |

## Callout profile

Seven components are retained because each has a distinct function:

| Component | Function |
|---|---|
| Case Signal | Marks the moment a technically safe action is not operationally neutral. |
| Decision Ledger | Makes permission, scope, owner, stop condition, and cost inspectable. |
| Boundary Condition | States the action envelope as a pre-commitment. |
| Operator’s Note | Names the human work as the design of constrained authority. |
| The Shift | Moves from approval after the fact to permission designed in advance. |
| The Question | Asks who has authority to decide which consequences may be delegated. |
| Memorable Phrase | Retains the chapter’s distinction between action and permission. |

The dry-run record is a light mono process register, not an eighth callout.

## Provisional lines

**Impact opener:** *The first autonomous action is rarely dramatic. It is a command someone decided was safe enough to stop watching.*

**Memorable phrase:** *An agent does not become trustworthy when it can act. It becomes trustworthy when its permission has an edge.*

## Factual grounding

This is a composite incident. Its operational principles are grounded in Google SRE material: automation is valuable for well-scoped procedures but can amplify error when applied thoughtlessly; automated actions need bounded domains, safe rollback behavior, explicit risk evaluation, progressive authorization, dry-run support, least privilege, circuit breakers, and interruptibility.[1] [2]

## References

[1]: https://sre.google/sre-book/automation-at-google/ — *The Evolution of Automation at Google*

[2]: https://sre.google/resources/practices-and-processes/ai-engineering-reliable-operations/ — *AI in SRE: How Google is Engineering the Future of Reliable Operations*
