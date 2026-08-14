---
title: "The Complexity Trap"
subtitle: "Why Modern IT Keeps Getting Harder to Operate"
book_number: 3
collection: "The Operator's Library"
status: "draft"  # draft | locked
author: "Auteur"
date: "2026-08-13"
---

# Book Blueprint — The Complexity Trap

**Titre** : The Complexity Trap
**Sous-titre retenu** : Why Modern IT Keeps Getting Harder to Operate
**Livre** : 3 / 5 — *The Operator's Library*
**Statut** : draft (squelette minimal)

---

## 1. Thèse du livre (en une phrase)

L'IT moderne est paradoxale : des outils plus puissants que jamais, des environnements souvent plus difficiles à comprendre. Chaque élément résout un problème — l'ensemble crée un nouveau système de dépendances. Le problème n'est pas la technologie : c'est **la complexité émergente**.

## 2. Promesse au lecteur

En refermant ce livre, vous saurez identifier la complexité émergente (invisible par construction), l'accepter comme adversaire à part entière, et faire un usage délibéré d'un *complexity budget*.

## 3. Progression interne (les 4 parties)

| Part | Titre | Rôle dans l'arc |
|------|-------|-----------------|
| I | More Technology, More Complexity | Poser le paradoxe : plus d'outils, plus de dépendances, plus d'aveuglement. |
| II | Operational Complexity | La complexité vécue par les ops : consoles, monitoring, automatisation, exceptions. |
| III | Security Complexity | La sécurité comme source additionnelle de complexité — et de nouveaux angles morts. |
| IV | Escaping the Trap | Concevoir pour la simplicité, imposer un budget, pouvoir expliquer à 2 A.M. |

## 4. Liste des chapitres (19 chapitres — squelette à détailler)

> Squelette minimal. Pour chaque chapitre, renseigner avant verrouillage : **idée centrale**, **phrase mémorable cible**, **concept DailyOps introduit** (ou « aucun »), **incident(s)** (`case-library.md`).

### Part I — More Technology, More Complexity (5)
1. The Complexity Trap
2. When Better Tools Create Worse Systems
3. The Architecture Nobody Designed
4. Every Integration Has a Cost
5. Complexity Is a Dependency Graph

### Part II — Operational Complexity (5)
6. Too Many Consoles
7. The Monitoring Paradox
8. Automation Without Understanding
9. The Exception Factory
10. Technical Debt Is Not Just Code

### Part III — Security Complexity (4)
11. When Security Becomes the Complexity
12. The Policy Nobody Understands
13. More Controls, More Blind Spots
14. Complexity as an Attack Surface

### Part IV — Escaping the Trap (5)
15. Designing for Simplicity
16. The Power of Fewer Dependencies
17. Standardization Without Stagnation
18. Complexity Budgets
19. The Architecture You Can Explain at 2 A.M.

## 5. Incidents réels à intégrer

> *À remplir chapitre par chapitre au moment de la rédaction. Voir `case-library.md` — un incident doit être ajouté avant le chapitre qui l'utilise.*

| Chapitre | Incident (code) | Contexte | Décision | Hypothèse cachée | Conséquence | Leçon |
|----------|-----------------|----------|----------|------------------|-------------|-------|
| _à compléter_ | _à compléter_ | _à compléter_ | _à compléter_ | _à compléter_ | _à compléter_ | _à compléter_ |

## 6. Concepts de la taxonomie introduits dans ce livre

Concepts officiellement introduits dans ce livre (cf. `series-bible.md` §9.1) :
- **Exception Factory**
- **Complexity Budget**
- **Automation Paradox**
- **Cognitive Load Debt**

> *Chapitres d'introduction à préciser avant verrouillage (le titre « The Exception Factory » au ch. 9 et « Complexity Budgets » au ch. 18 sont des candidats naturels). Concepts déjà introduits au livre 1 et réutilisés sans redéfinition : Monitoring Illusion, Operational Drift.*

## 7. Liens avec les autres livres

S'appuie sur le **Human SPOF** (livre 2) : la complexité aggrave la dépendance à la personne qui « comprend encore ». Prépare le livre 4 : déléguer une partie de la complexité à l'IA ne l'efface pas — elle la déplace.

## Notes

- Le ch. 19 (« The Architecture You Can Explain at 2 A.M. ») est volontairement fort en clôture : un système réellement opérationnel doit pouvoir être **compris quand l'équipe est sous pression**, pas seulement en réunion de conception.

---

## Check-list de verrouillage

- [ ] Section 4 remplie (idée centrale, phrase mémorable, concept, incident pour chaque chapitre)
- [ ] Section 5 remplie (au moins un incident référencé par chapitre)
- [ ] Concepts de la section 6 confirmés (chapitre exact d'introduction verrouillé)
- [ ] Aucun produit DailyOps mentionné comme argument de vente
- [ ] Cohérence inter-livres validée avec la Series Bible
