---
title: "The Age of Operational AI"
subtitle: "How AI Agents Will Change the Way We Build, Operate and Secure Technology"
book_number: 4
collection: "The Operator's Library"
status: "draft"  # draft | locked
author: "Auteur"
date: "2026-08-13"
---

# Book Blueprint — The Age of Operational AI

**Titre** : The Age of Operational AI
**Sous-titre retenu** : How AI Agents Will Change the Way We Build, Operate and Secure Technology
**Livre** : 4 / 5 — *The Operator's Library*
**Statut** : draft (squelette minimal)

---

## 1. Thèse du livre (en une phrase)

We are moving from software that executes instructions to systems that can interpret objectives and take actions — ce qui ouvre une nouvelle classe de problèmes : identité, permissions, secrets, traçabilité, gouvernance, hallucination, autonomie, AI-to-AI.

## 2. Promesse au lecteur

En refermant ce livre, vous saurez identifier les nouveaux risques engendrés par l'agent IA en production, et les **conditions de confiance** nécessaires (identité, audit, gouvernance) pour le laisser agir sans en perdre le contrôle.

## 3. Progression interne (les 4 parties)

| Part | Titre | Rôle dans l'arc |
|------|-------|-----------------|
| I | The Shift | Le changement d'échelle : du logiciel qui exécute au système qui interprète et agit. |
| II | The New Attack Surface | Identifiants, propriété, prompt injection, portée sur la production, supply chain. |
| III | Trust | Confiance à accorder, identité des non-humains, accès éphémères, auditabilité, approval humain. |
| IV | The New IT | Opérations AI-natives, sécurité par délégation, control plane, lignes rouges non délégables. |

## 4. Liste des chapitres (20 chapitres — squelette à détailler)

> Squelette minimal. Pour chaque chapitre, renseigner avant verrouillage : **idée centrale**, **phrase mémorable cible**, **concept DailyOps introduit** (ou « aucun »), **incident(s)** (`case-library.md`).

### Part I — The Shift (5)
1. The Age of Operational AI
2. From Software to Agents
3. The Operator Gets a Copilot
4. When AI Starts Taking Actions
5. The End of Manual Operations?

### Part II — The New Attack Surface (5)
6. The AI Has Credentials
7. Who Owns an AI Agent?
8. Prompt Injection Is Not the Whole Problem
9. When Agents Can Reach Production
10. The AI Supply Chain

### Part III — Trust (5)
11. Can We Trust an Autonomous Operator?
12. Identity for Non-Human Actors
13. Ephemeral Access
14. Auditing the Machine That Acts
15. Human Approval in an Autonomous World

### Part IV — The New IT (5)
16. AI-Native Operations
17. Security by Delegation
18. Designing the AI Control Plane
19. What Humans Should Never Delegate
20. The Organization of Tomorrow

## 5. Incidents réels à intégrer

> *À remplir chapitre par chapitre au moment de la rédaction. Voir `case-library.md` — un incident doit être ajouté avant le chapitre qui l'utilise.*

| Chapitre | Incident (code) | Contexte | Décision | Hypothèse cachée | Conséquence | Leçon |
|----------|-----------------|----------|----------|------------------|-------------|-------|
| _à compléter_ | _à compléter_ | _à compléter_ | _à compléter_ | _à compléter_ | _à compléter_ | _à compléter_ |

## 6. Concepts de la taxonomie introduits dans ce livre

Concepts officiellement introduits dans ce livre (cf. `series-bible.md` §9.1) :
- **AI Operational Trust**
- **Trust Boundary Erosion**

> *Chapitres d'introduction à préciser avant verrouillage. Concepts déjà introduits aux livres 1-3 et réutilisés sans redéfinition : Human SPOF, Complexity Budget, Trust Debt, Cognitive Load Debt, Automation Paradox.*

## 7. Liens avec les autres livres

S'inscrit dans la continuité du livre 3 : la complexité déléguée à l'IA est de la complexité **déplacée**, pas effacée. Prépare le livre 5 : si l'IA devient copilote puis opérateur, que reste-t-il à l'humain ?

## Notes

- Changement de registre : les livres 1-3 parlaient du monde que nous connaissons ; celui-ci parle du monde qui arrive.
- OpsGate et OpsVault entrent naturellement comme **études de cas** (contrôle des accès et gestion des secrets dédiés aux agents) — sans transformer le livre en publicité (même test de la phrase produit que les autres livres).

---

## Check-list de verrouillage

- [ ] Section 4 remplie (idée centrale, phrase mémorable, concept, incident pour chaque chapitre)
- [ ] Section 5 remplie (au moins un incident référencé par chapitre)
- [ ] Concepts de la section 6 confirmés (chapitre exact d'introduction verrouillé)
- [ ] Aucun produit DailyOps mentionné comme argument de vente
- [ ] Cohérence inter-livres validée avec la Series Bible
