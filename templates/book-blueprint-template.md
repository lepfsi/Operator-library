# Book Blueprint Template — *The Operator's Library*

> **Usage** : copier ce fichier à la racine d'un livre (`books/book-NN-.../book-blueprint.md`), puis remplir chaque section.
> Le blueprint doit être **verrouillé avant** de commencer la rédaction du premier chapitre.

---

## En-tête

```yaml
---
title: "Titre du livre"
subtitle: "Sous-titre"
book_number: 1
collection: "The Operator's Library"
status: "draft"  # draft | locked
author: "Auteur"
date: "YYYY-MM-DD"
---
```

---

## 1. Thèse du livre (en une phrase)

_Une phrase affirmative, qui tient sur une ligne, qui dit ce que le lecteur doit croire après avoir lu le livre._

> **Validation** : cette formulation te convient-elle ? Souhaites-tu la rendre plus directe ou plus provocante ?

---

## 2. Promesse au lecteur

_La transformation intellectuelle ou pratique que le lecteur doit vivre._

> **Question** : cette promesse est-elle alignée avec ce que tu veux que le lecteur retire du livre ?

---

## 3. Public cible

_Listes de personas, du plus central au plus périphérique._

> **Note** : livres 4 et 5 (IA) élargissent ce public vers architectes IA, gouvernance des données, etc. Le cœur reste l'opérateur moderne.

---

## 4. Progression interne (les parties)

_Nommer les parties et résumer en une phrase ce que chacune fait._

| Part | Titre | Rôle dans l'arc |
|------|-------|-----------------|
| I | _titre_ | _ce que cette partie accomplit_ |
| II | _titre_ | |
| III | _titre_ | |
| IV | _titre_ | |

_Cette progression emmène le lecteur de [départ] vers [arrivée]._

---

## 5. Liste des chapitres

_Une section par chapitre, avec :_
- _Idée centrale_
- _Phrase mémorable cible_
- _Concept introduit (ou « aucun »)_
- _Incident(s) à utiliser_

### Part I — _titre_ (_X_ chapitres)

#### Chapitre 1 — _titre_
- **Idée centrale** : _
- **Phrase mémorable cible** : _"…"_ 
- **Concept introduit** : _
- **Incident(s)** : _

#### Chapitre 2 — _titre_
- **Idée centrale** : _
- **Phrase mémorable cible** : _"…"_
- **Concept introduit** : _
- **Incident(s)** : _

_(répéter)_

---

## 6. Incidents réels à intégrer

_Tableau récapitulatif des incidents (voir aussi `case-library.md`)._

| Chapitre | Incident (code) | Contexte | Décision | Hypothèse cachée | Conséquence | Leçon |
|----------|-----------------|----------|----------|------------------|-------------|-------|
| _ | _ | _ | _ | _ | _ | _ |

---

## 7. Concepts de la taxonomie introduits dans ce livre

_Listes des concepts officiels DailyOps introduits dans ce livre._

- **Concept 1** (chap. X)
- **Concept 2** (chap. Y)
- _etc._

_Les autres concepts sont réservés aux livres suivants._

---

## 8. Liens avec les autres livres

_Décrire en 2–3 phrases comment ce livre prépare le suivant et s'appuie sur le précédent._

---

## Check-list de verrouillage

Avant de passer le blueprint à `status: locked` :

- [ ] La thèse tient en une phrase affirmative.
- [ ] La promesse est claire et différenciante.
- [ ] Les parties sont nommées et leur rôle est explicité.
- [ ] Chaque chapitre a : idée centrale, phrase mémorable, concept (ou « aucun »), incident(s).
- [ ] Le total de concepts introduits est conforme à la progression prévue dans la Series Bible.
- [ ] Aucun produit DailyOps n'apparaît dans le blueprint.
- [ ] Au moins un incident est identifié par chapitre (ou justification explicite).
