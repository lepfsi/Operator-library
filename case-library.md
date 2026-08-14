# Case Library — *The Operator's Library*

> **Anonymized incidents**, shared across all books.
> Each incident is referenced by its `code` in chapter manuscripts.
> When a new incident is needed, add it here **before** drafting the chapter that uses it.

---

## Conventions

- **Code** : short PascalCase identifier, e.g. `Office365_Dashboard`, `Firewall_Temp_Rule`.
- **Anonymization** : remove company name, person names, customer identifiers. Keep sector, scale, time period, technologies, and consequences (in qualitative terms).
- **Status** : `idea` (raw) → `developed` (incident used in at least one draft) → `locked` (validated for publication).
- **Books used in** : list of books / chapters where this incident appears.

---

## Incidents

### Firewall_Green_Business_Down
- **Status** : idea
- **Sector / scale** : mid-market SaaS, ~300 employees
- **Period** : November 2019
- **Context** : e-commerce platform behind a state-of-the-art firewall, CASB and SIEM stack; security posture praised in audits
- **Decision** : invest all operational energy in perimeter hardening and compliance, none in release procedures
- **Hidden assumption** : "if the perimeter is solid, the business is safe"
- **Consequence** : a routine deployment took the checkout flow down for 4 hours; the firewall, the SIEM and every security control stayed green the whole time
- **Lesson** : A secure perimeter does not protect you from the failures happening behind it
- **Books used in** : Beyond the Firewall — ch. 1

---

### Firewall_Temp_Rule
- **Status** : developed
- **Sector / scale** : mid-market SaaS, ~80 employees
- **Period** : rule added Q1 2020, discovered Q2 2022
- **Context** : urgent access for a subcontractor to push an emergency patch
- **Decision** : add firewall rule for source IP without expiration date or ticket linkage
- **Hidden assumption** : "we'll come back to clean it up"
- **Consequence** : rule remained active for ~2 years; during a pentest, exposed an internal admin port that had been considered internal-only
- **Lesson** : Every exception needs an expiration mechanism
- **Books used in** : Beyond the Firewall — ch. 2

---

### Phantom_Cron_Production
- **Status** : idea
- **Sector / scale** : logistics scale-up, ~150 employees
- **Period** : September 2021
- **Context** : billing consolidation relied on a nightly cron script on the ERP server, installed years earlier by a former team member
- **Decision** : rebuild the server hosting the ERP; no dependency inventory was done first
- **Hidden assumption** : "if it's important, somebody would have documented it"
- **Consequence** : the cron job did not survive the rebuild; invoices went out wrong for three weeks before the drop was noticed
- **Lesson** : The most dangerous dependency is the one you don't know exists
- **Books used in** : Beyond the Firewall — ch. 3

---

### Solo_Engineer_Blackout
- **Status** : idea
- **Sector / scale** : fintech scale-up, ~120 employees
- **Period** : July 2020
- **Context** : a senior engineer was the only person who knew how to deploy the payment platform
- **Decision** : never pair, never document the deployment, never rotate the role
- **Hidden assumption** : "he'll always be there — and if not, someone will figure it out"
- **Consequence** : the engineer went on emergency leave; a critical security patch waited 9 days because nobody could run the deployment
- **Lesson** : Knowledge that exists only in someone's head is not organizational knowledge
- **Books used in** : Beyond the Firewall — ch. 4

---

### Office365_Dashboard
- **Status** : developed
- **Sector / scale** : scale-up B2B, ~200 employees
- **Period** : March 2022
- **Context** : post-migration to Microsoft 365
- **Decision** : rely on Microsoft 365 service health dashboard without independent user-experience monitoring
- **Hidden assumption** : "green status = working for our users"
- **Consequence** : silent degradation of authentication for ~6 hours, undetected by ops, flagged by customers
- **Lesson** : Monitoring must measure what matters, not what is easy
- **Books used in** : Beyond the Firewall — ch. 5

---

### FiveNines_First_Failover
- **Status** : idea
- **Sector / scale** : healthcare SaaS, ~400 employees
- **Period** : April 2023
- **Context** : platform marketed at 99.99% availability; active-passive pair in two data centers, failover never exercised
- **Decision** : advertise the SLO, but treat the DR runbook as paperwork that "cannot be tested in production"
- **Hidden assumption** : "the redundancy is there, so the resilience is there"
- **Consequence** : first real failover after a network partition took 6 hours — the passive node had never received a full sync, and no one had a current procedure
- **Lesson** : Working is an event. Reliability is a property. A system that never fails has never been tested
- **Books used in** : Beyond the Firewall — ch. 6

---

### Rollback_That_Never_Ran
- **Status** : idea
- **Sector / scale** : mid-market e-commerce, ~90 employees
- **Period** : October 2022
- **Context** : database migration scheduled with a documented "rollback in case of problems"
- **Decision** : trust the rollback plan without ever executing it in staging
- **Hidden assumption** : "the rollback will work because it's simple"
- **Consequence** : during the migration, the rollback failed after 40 minutes of uncertainty; the team then chose forward-fix under pressure, creating a long outage
- **Lesson** : A rollback plan you haven't tested is a wish, not a strategy
- **Books used in** : Beyond the Firewall — ch. 7

---

### Backup_Job_Silently_Failing
- **Status** : idea
- **Sector / scale** : education software firm, ~60 employees
- **Period** : March 2021
- **Context** : nightly backup job to a NAS, unchanged for years, monitored only by "SUCCESS" logs
- **Decision** : assume backups work because the log format looks right
- **Hidden assumption** : "the backup says OK, therefore it could be restored"
- **Consequence** : ransomware encrypted the file server; restore attempts failed — the NAS had been silently out of space for 6 weeks, truncating every night's job
- **Lesson** : A backup you never restored is an assumption, not a recovery strategy
- **Books used in** : Beyond the Firewall — ch. 8

---

### Autopilot_Restart_Disaster
- **Status** : idea
- **Sector / scale** : bank subsidiary, ~500 employees
- **Period** : June 2020
- **Context** : core banking API started failing under load; the on-call engineer followed the runbook's first step — restart the service
- **Decision** : execute the predefined procedure without reading the current error signals
- **Hidden assumption** : "the runbook's first step is the right step for this incident"
- **Consequence** : the restart dropped the connection pool twice in a row, turning a latency problem into a 3-hour outage
- **Lesson** : In an incident, judgment matters more than knowledge
- **Books used in** : Beyond the Firewall — ch. 9

---

### Runbook_Rot_Blindspot
- **Status** : idea
- **Sector / scale** : insurance IT services, ~250 employees
- **Period** : September 2019
- **Context** : a critical runbook describing the recovery of the policy engine had not been touched in 18 months
- **Decision** : treat documentation as "done once, written forever"
- **Hidden assumption** : "if the runbook exists, the operation is under control"
- **Consequence** : during a datacenter incident, the runbook pointed at a load balancer name that no longer existed; the team lost 90 minutes rediscovering the architecture
- **Lesson** : Documentation is not a project. It's a byproduct of operation
- **Books used in** : Beyond the Firewall — ch. 10

---

### Creator_Exit_System_Blackout
- **Status** : idea
- **Sector / scale** : manufacturing software vendor, ~180 employees
- **Period** : January 2023
- **Context** : the architect who built the factory-scheduling system left; the system kept running exactly as he left it
- **Decision** : keep the system "as is" because it works, and because nobody else fully understands it
- **Hidden assumption** : "a working system needs no one; maintenance will be trivial"
- **Consequence** : three weeks later a certificate expiry could not be renewed — the rotation procedure existed only in the architect's head; production scheduling stopped for a day
- **Lesson** : The best system is the one that doesn't need you
- **Books used in** : Beyond the Firewall — ch. 11

---

### Upgraded_Part_Still_Red
- **Status** : idea
- **Sector / scale** : public administration IT, ~800 employees
- **Period** : May 2022
- **Context** : the citizen-request portal was slow; each team blamed its own neighbor's component
- **Decision** : upgrade the database node, then the web tier, then the cache — one component at a time, never measuring end-to-end
- **Hidden assumption** : "fix the parts and the system heals itself"
- **Consequence** : after three expensive upgrades, the portal remained slow; the real bottleneck was a chatty integration between two services nobody had mapped
- **Lesson** : You can't fix a system by fixing its parts
- **Books used in** : Beyond the Firewall — ch. 12

---

### Silent_Config_Drift
- **Status** : idea
- **Sector / scale** : telecom operator, ~1,200 employees
- **Period** : August 2022
- **Context** : a network element had its timeout config changed months earlier to "fix" a cosmetic alert; the change was never called out
- **Decision** : rely on the "golden config" document instead of comparing actual state to expected state
- **Hidden assumption** : "the configuration we manage is the configuration that runs"
- **Consequence** : under the next traffic spike, the drifted timeouts caused cascading failovers that the team could not explain until a deep config audit
- **Lesson** : The operator's real job is not to run the system. It's to understand it
- **Books used in** : Beyond the Firewall — ch. 13

---

### _Add new incidents below using the same structure_

```
## Code
- **Status** : idea | developed | locked
- **Sector / scale** :
- **Period** :
- **Context** :
- **Decision** :
- **Hidden assumption** :
- **Consequence** :
- **Lesson** :
- **Books used in** :

```

---

## Index by book

| Book | Chapter | Incident(s) |
|------|---------|-------------|
| Beyond the Firewall | 1 | Firewall_Green_Business_Down |
| Beyond the Firewall | 2 | Firewall_Temp_Rule |
| Beyond the Firewall | 3 | Office365_Dashboard |
| Beyond the Firewall | 4 | (none yet — candidates: Office365_Dashboard / Firewall_Green_Business_Down shared, or new incident) |
| Beyond the Firewall | 5 | (none yet — candidates: FiveNines_First_Failover shared, or new incident) |
| Beyond the Firewall | 6 | FiveNines_First_Failover |
| Beyond the Firewall | 7 | Rollback_That_Never_Ran |
| Beyond the Firewall | 8 | Backup_Job_Silently_Failing |
| Beyond the Firewall | 9 | Phantom_Cron_Production |
| Beyond the Firewall | 10 | Firewall_Temp_Rule (shared with ch. 2) |
| Beyond the Firewall | 11 | Autopilot_Restart_Disaster |
| Beyond the Firewall | 12 | Solo_Engineer_Blackout |
| Beyond the Firewall | 13 | Runbook_Rot_Blindspot |
| Beyond the Firewall | 14 | (none yet — candidates: Autopilot_Restart_Disaster shared, or new incident) |
| Beyond the Firewall | 15 | Creator_Exit_System_Blackout |
| Beyond the Firewall | 16 | Upgraded_Part_Still_Red |
| Beyond the Firewall | 17 | (none yet — candidates: FiveNines_First_Failover / Backup_Job_Silently_Failing shared, or new incident) |
| Beyond the Firewall | 18 | Silent_Config_Drift |