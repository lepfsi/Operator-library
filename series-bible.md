# SERIES BIBLE

## Titre de la collection
**The Operator's Library**

---

## 1. Manifeste (en une phrase)

We design, build, operate, and depend on increasingly complex systems. These books examine the technical, human, and organizational realities of keeping them reliable, secure, and governable.

> *Validation : Cette formulation te convient-elle ? Souhaites-tu la simplifier ou la rendre plus percutante ?*

---

## 2. Promesse au lecteur

**You will learn to see the invisible system behind the infrastructure.**

C'est la transformation intellectuelle que chaque lecteur doit vivre, quel que soit le livre lu.

> *Question : Est-ce bien la promesse centrale ? Ou veux-tu y ajouter une dimension plus pratique (ex. "et agir pour la renforcer") ?*

---

## 3. Public cible

- CTO, CIO, RSSI
- Ingénieurs ops, SRE, ingénieurs fiabilité
- Consultants en organisation et en cybersécurité
- Dirigeants de PME qui gèrent une infrastructure
- Étudiants ou professionnels en transition vers les métiers de l'exploitation

> *Note : Les livres 4 et 5 (IA) élargiront ce public vers les architectes IA, les responsables de gouvernance des données, etc. Mais le cœur reste l'opérateur moderne.*

---

## 4. Les cinq livres et leur rôle dans l'arc

| # | Titre | Sous-titre provisoire | Rôle dans l'arc |
|---|-------|----------------------|-----------------|
| 1 | Beyond the Firewall | The Reality of Modern IT Operations | Établit la crédibilité terrain : les vrais facteurs de réussite ou d'échec sont invisibles. |
| 2 | The Human Single Point of Failure | Knowledge, Trust and Organizational Resilience in Modern IT | Élargit du technique vers l'organisationnel : la dépendance humaine comme risque majeur. |
| 3 | The Complexity Trap | Why Modern IT Keeps Getting Harder to Operate | Passe du problème humain au problème systémique : complexité émergente. |
| 4 | The Age of Operational AI | How AI Agents Will Change the Way We Build, Operate and Secure Technology | Projette la réflexion vers le futur : l'IA comme nouvel opérateur. |
| 5 | The Operator's Last Job | Humans, AI and the Future of IT Operations | Pose la question fondamentale du rôle humain quand l'exécution devient bon marché. |

> *Question : Les sous-titres des livres 1, 2, 4 et 5 sont-ils définitifs ? Pour The Complexity Trap, tu avais proposé "Why Modern IT Keeps Getting Harder to Operate" ; je le garde.*

---

## 5. Vocabulaire maison (taxonomie DailyOps) — 17 termes

Ces termes doivent être définis précisément, utilisés de manière cohérente dans tous les livres, et idéalement expliqués lors de leur première occurrence.

| Terme | Définition en une phrase |
|-------|--------------------------|
| **Human SPOF** | Une dépendance organisationnelle concentrée sur une seule personne, dont l'absence bloque la capacité à opérer. |
| **Permanent Temporary** | Une exception temporaire qui devient une architecture permanente par absence de mécanisme d'expiration. |
| **Monitoring Illusion** | La situation où la présence de métriques donne une fausse impression de contrôle, sans compréhension réelle du système. |
| **Operational Drift** | L'écart progressif entre l'état attendu d'un système et son état réel, souvent non détecté. |
| **AI Operational Trust** | La confiance nécessaire avant de laisser un agent IA agir sur un environnement réel, fondée sur l'identité, l'audit et la gouvernance. |
| **Complexity Budget** | La limite volontaire de dépendances et de couches qu'un système peut supporter avant de devenir inopérable. |
| **Institutional Capability** | La capacité d'une organisation à conserver et transmettre la connaissance indépendamment des individus. |
| **Exception Factory** | Une organisation qui, sous la pression, produit des exceptions temporaires sans mécanisme de suivi, transformant chaque urgence en dette opérationnelle future. |
| **Operational Amnesia** | La perte progressive de mémoire organisationnelle après un incident, un départ ou une réorganisation, qui conduit à répéter les mêmes erreurs. |
| **Trust Debt** | L'accumulation de confiance non vérifiée dans des personnes, des processus ou des systèmes, qui finit par devenir un risque en soi. |
| **Automation Paradox** | Le phénomène par lequel l'automatisation réduit la charge sur une partie du système tout en augmentant la complexité et la charge cognitive ailleurs. |
| **Runbook Rot** | La dégradation silencieuse des procédures documentées qui ne sont plus testées ni mises à jour, créant une fausse impression de préparation. |
| **Shadow Operations** | L'ensemble des actions non officielles, non documentées, mais parfois indispensables, que les équipes réalisent en dehors des processus formels. |
| **Incident Amnesia** | L'oubli organisationnel des causes profondes et des leçons d'un incident majeur, souvent masqué par le soulagement d'avoir rétabli le service. |
| **Cognitive Load Debt** | La charge mentale accumulée par les opérateurs lorsqu'ils doivent naviguer dans des systèmes trop complexes, avec trop d'outils, de consoles et d'exceptions. |
| **Trust Boundary Erosion** | L'effacement progressif des frontières de confiance entre composants, équipes ou entre humains et machines, rendant le système plus vulnérable. |
| **The Last Mile of Automation** | La dernière étape d'un processus automatisé, celle où l'intervention humaine est encore nécessaire, et qui est souvent la moins pensée et la plus risquée. |

> *Tu peux en ajouter au fil de l'écriture, mais ils devront être centralisés ici.*

---

## 6. Règles de style

Elles s'appliquent à tous les livres, pour créer une voix reconnaissable.

- Phrases courtes, directes, sans jargon académique inutile.
- Chaque chapitre doit produire au moins une phrase mémorable (pouvant vivre seule sur LinkedIn, X, DailyOps.Tech).
- Utiliser le schéma unique **Hook → Mauvaise croyance → Principe → Preuve → Analyse → Application → Phrase mémorable → Transition** (8 étapes ; cf. `templates/chapter-template.md`).
- Montrer les erreurs et les fausses croyances, pas seulement les réussites.
- Ne jamais paraître plus intelligent que le lecteur : expliquer simplement, même les concepts complexes.
- Citer des sources crédibles (NIST, CISA, SRE literature, postmortems publics) pour étayer l'expérience terrain.
- Les produits OpsDoc, OpsRun, OpsVault, OpsGate, etc. ne doivent apparaître que comme des réponses naturelles aux problèmes décrits, jamais comme des arguments de vente.

---

## 7. Non-objectifs

- Ce n'est pas un manuel technique.
- Ce n'est pas une suite d'opinions personnelles sans preuves.
- Ce n'est pas un catalogue de produits DailyOps.
- Ce n'est pas un livre purement académique.
- Ce n'est pas un recueil d'anecdotes sans analyse.

---

## 8. Méthode de travail (pour éviter de s'égarer)

- Rédiger chaque chapitre selon le template unique (**Hook → Mauvaise croyance → Principe → Preuve → Analyse → Application → Phrase mémorable → Transition**).
- Maintenir une **Case Library** (tableau des incidents réels anonymisés) pour alimenter les livres.
- Maintenir un **Glossaire** pour le vocabulaire maison.
- Rédiger **un seul livre à la fois**, en commençant par *Beyond the Firewall*.
- Avant d'écrire un chapitre, remplir sa fiche (titre, idée centrale, phrase mémorable cible, incidents à utiliser).
- **Versionner tous les textes en Markdown avec Git.**

---

## 9. Structure détaillée — chapitres par livre

> Référence de navigation globale : titre de chaque chapitre, organisé par partie. Le détail par chapitre (idée centrale, phrase mémorable, concept introduit, incidents) vit dans chaque `books/book-NN-.../book-blueprint.md`. Le livre 1 reprend son blueprint verrouillé (13 chapitres, structure restructurée) ; les livres 2 à 5 reflètent la structure retenue par l'auteur et devront être verrouillés avant la rédaction.

### 9.1 Cartographie des concepts DailyOps par livre

| Livre | Concepts introduits officiellement (1re occurrence) |
|-------|------------------------------------------------------|
| 1 — *Beyond the Firewall* | Monitoring Illusion · Permanent Temporary · Shadow Operations · Human SPOF · Runbook Rot · Institutional Capability · Operational Drift |
| 2 — *The Human Single Point of Failure* | Operational Amnesia · Trust Debt |
| 3 — *The Complexity Trap* | Exception Factory · Complexity Budget · Automation Paradox · Cognitive Load Debt |
| 4 — *The Age of Operational AI* | AI Operational Trust · Trust Boundary Erosion |
| 5 — *The Operator's Last Job* | The Last Mile of Automation · Incident Amnesia |

> *7 + 2 + 4 + 2 + 2 = 17 termes, conformément à la taxonomie (section 5). Distribution indicative ; chaque `book-blueprint.md` précise le chapitre exact d'introduction.*

---

### 9.2 Livre 1 — Beyond the Firewall (13 chapitres · blueprint verrouillé)

#### Part I — The System We See (6)
1. Beyond the Firewall
2. The Temporary Rule That Became Permanent
3. The Dependency Nobody Documented
4. The Cost of Tribal Knowledge
5. Everything Was Green. Everything Was Broken.
6. Availability Is Not Resilience

#### Part II — The System We Don't See (3)
7. Hope Is Not a Rollback Strategy
8. The Backup Nobody Tested
9. Incident Response Is Decision Making Under Pressure

#### Part III — Operating Reality (2)
10. Why Documentation Fails
11. Designing for the Day You Are Not There

#### Part IV — Beyond Operations (2)
12. From Infrastructure to Systems Thinking
13. The Operator's Mindset

> *Note éditoriale : dans `books/book-01-beyond-the-firewall/book-blueprint.md`, l'en-tête « Part III — Operating Reality (3 chapitres) » n'en liste que deux (ch. 10 et 11). Incohérence à homogénéiser lors du verrouillage définitif.*

---

### 9.3 Livre 2 — The Human Single Point of Failure (18 chapitres)

#### Part I — The Human Infrastructure (5)
1. The Human Single Point of Failure
2. The Person Who Knew Everything
3. The Day They Left
4. Bus Factor: The Metric Nobody Tracks
5. When Experience Becomes Dependency

#### Part II — Knowledge (5)
6. Knowledge Silos: The Most Dangerous SPOF in IT
7. Documentation Is Not Knowledge
8. The Difference Between Knowing and Being Able to Repeat
9. Tribal Knowledge
10. The Invisible Architecture Inside People's Heads

#### Part III — Trust (4)
11. The Admin Nobody Audited
12. Shared Accounts and Shared Responsibility
13. When Trust Becomes a Security Control
14. The Problem With "Ask John"

#### Part IV — Organizational Resilience (4)
15. Designing for Employee Absence
16. From Individual Expertise to Institutional Capability
17. Runbooks, Documentation and Operational Memory
18. Building Organizations That Remember

---

### 9.4 Livre 3 — The Complexity Trap (19 chapitres)

#### Part I — More Technology, More Complexity (5)
1. The Complexity Trap
2. When Better Tools Create Worse Systems
3. The Architecture Nobody Designed
4. Every Integration Has a Cost
5. Complexity Is a Dependency Graph

#### Part II — Operational Complexity (5)
6. Too Many Consoles
7. The Monitoring Paradox
8. Automation Without Understanding
9. The Exception Factory
10. Technical Debt Is Not Just Code

#### Part III — Security Complexity (4)
11. When Security Becomes the Complexity
12. The Policy Nobody Understands
13. More Controls, More Blind Spots
14. Complexity as an Attack Surface

#### Part IV — Escaping the Trap (5)
15. Designing for Simplicity
16. The Power of Fewer Dependencies
17. Standardization Without Stagnation
18. Complexity Budgets
19. The Architecture You Can Explain at 2 A.M.

---

### 9.5 Livre 4 — The Age of Operational AI (20 chapitres)

#### Part I — The Shift (5)
1. The Age of Operational AI
2. From Software to Agents
3. The Operator Gets a Copilot
4. When AI Starts Taking Actions
5. The End of Manual Operations?

#### Part II — The New Attack Surface (5)
6. The AI Has Credentials
7. Who Owns an AI Agent?
8. Prompt Injection Is Not the Whole Problem
9. When Agents Can Reach Production
10. The AI Supply Chain

#### Part III — Trust (5)
11. Can We Trust an Autonomous Operator?
12. Identity for Non-Human Actors
13. Ephemeral Access
14. Auditing the Machine That Acts
15. Human Approval in an Autonomous World

#### Part IV — The New IT (5)
16. AI-Native Operations
17. Security by Delegation
18. Designing the AI Control Plane
19. What Humans Should Never Delegate
20. The Organization of Tomorrow

---

### 9.6 Livre 5 — The Operator's Last Job (18 chapitres)

#### Part I — The Operator (4)
1. The Operator's Last Job
2. What Engineers Actually Do
3. The Work We Thought Was Technical
4. When Expertise Becomes Data

#### Part II — The Automation Curve (4)
5. First We Automated the Routine
6. Then We Automated the Diagnosis
7. Then We Let Machines Act
8. The Day the Runbook Became an Agent

#### Part III — What Remains Human (5)
9. Judgment
10. Responsibility
11. Context
12. Trust
13. Knowing When Not to Act

#### Part IV — The New Engineer (5)
14. From Operator to System Designer
15. The Engineer as Governor
16. The Human in the Loop Is Not Enough
17. Building Systems Worth Trusting
18. The Last Job Was Never About Typing Commands

---

> *Total collection : 13 + 18 + 19 + 20 + 18 = 88 chapitres.*
