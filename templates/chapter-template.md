# Chapter Template — The Operator's Library

> **Usage** : copier ce fichier, renommer en `NN-titre-du-chapitre.md`, remplir chaque section.
> **Cible** : ~2 500 à 4 000 mots par chapitre.
> **Structure** : 8 sections fixes, dans l'ordre. Aucune section ne doit être vide dans la version finale.
> **Langue** : anglais (les titres de sections ci-dessous sont en français pour la rédaction, mais le contenu final est en anglais).

---

## En-tête YAML (à compléter)

```yaml
---
title: "Titre du chapitre"
part: "Part I — The System We See"
book: "Beyond the Firewall"
book_number: 1
chapter_number: 1
author: "Ba-Ndouwe Steve"
date: "YYYY-MM-DD"
status: "scaffold"  # scaffold | draft | review | final
memorable_phrase: "Phrase mémorable cible (à utiliser telle quelle dans la section dédiée)"
concepts_introduced:
  - "Concept 1 (doit exister dans glossary.md)"
incidents_referenced:
  - "Code incident 1 (doit exister dans case-library.md)"
---
```

> **Statut** :
> - `scaffold` = placeholder vide (exclu de la compilation par défaut).
> - `draft` = en cours de rédaction (inclus dans `--include-drafts`).
> - `review` = rédaction terminée, en relecture.
> - `final` = validé pour publication.

---

## Callouts typés (syntaxe des fenced divs Pandoc)

Les callouts standardisés (`FIELD NOTE`, `DAILYOPS CONCEPT`, `LESSON`,
`WARNING`, `REMEMBER`, `pull quote`, `KEY TAKEAWAYS`, `diagram`) utilisent la
syntaxe des **fenced divs** Pandoc. Le rendu Python LaTeX/EPUB/DOCX est géré
par `templates/render/template.latex`, `epub.css` et `reference-docx-guide.md`.

### FIELD NOTE

```
::: field-note
**Context:** Description du contexte technique.

**What We Expected:** Ce que l'on croyait.

**What Happened:** Ce qui s'est réellement passé.

**Why It Happened:** Le mécanisme de l'échec.

**What It Taught Us:** La leçon, en une phrase.
:::
```

### DAILYOPS CONCEPT

```
::: concept
**PERMANENT TEMPORARY**

*A temporary exception that becomes permanent operational architecture,
without a mechanism for review or removal.*
:::
```

> Convention : première ligne = nom du concept en MAJUSCULES (deviendra le
> titre du bloc en Sora bold). Ligne suivante = définition en *italique*
> (Source Serif Pro italic dans le rendu).

### LESSON

```
::: lesson
Une phrase percutante qui résume la leçon clé de la section.
:::
```

### WARNING / PITFALL

```
::: warning
Erreur courante ou faux raccourci à éviter.
:::
```

### REMEMBER

```
::: remember
Phrase à retenir absolument de ce chapitre.
:::
```

### Pull quote

```
::: pullquote
Une phraseExtraite du texte, mise en évidence.
:::
```

### KEY TAKEAWAYS (en fin de chapitre)

```
::: keytakeaways
- Point clé 1.
- Point clé 2.
- Point clé 3.
:::
```

### Diagramme conceptuel (ASCII / trait fin)

```
::: diagram
Expected State
      │
      ▼
Actual State
      │
      ▼
DRIFT
:::
```

---

## 1. Hook / Incident

> Une scène réelle, anonymisée. Une situation concrète, située dans le temps et dans un contexte technique précis.
> Le lecteur doit voir le moment, pas seulement le comprendre.
>
> _Longueur cible : 150–300 mots._
>
> **Exemple (chap. 2)** : _Le mardi 14 mars, à 23 h 47, une règle de firewall a été ajoutée pour laisser passer un sous-traitant qui devait livrer un correctif en urgence. Deux ans plus tard, elle était toujours là._

---

## 2. Mauvaise croyance

> Ce que l'on croit à tort, généralement avant l'incident. Formuler comme une phrase d'opinion simple, facile à reconnaître.
>
> _Longueur cible : 1 phrase à 1 paragraphe._
>
> **Formulations types** :
> - "Temporary exceptions are harmless."
> - "If the dashboard is green, the system is healthy."
> - "We've always done it this way, so it must be right."
>
> **Phrase retenue (à réutiliser au chap. 2)** : _Temporary exceptions are harmless._

---

## 3. Principe

> La leçon, en une phrase. Doit être vraie indépendamment du contexte de l'incident.
> Cette phrase est le cœur du chapitre. Tout le reste la démontre.
>
> _Longueur cible : 1 phrase._
>
> **Exemple (chap. 2)** : _Every exception needs an expiration mechanism._

---

## 4. Preuve / Histoire

> Le déroulé de l'incident, avec :
> - le **contexte technique** (système, environnement, échelle)
> - la **décision prise** (par qui, quand, sous quelle pression)
> - l'**erreur ou l'hypothèse implicite** qui a rendu la décision possible
> - la **conséquence** (court terme, long terme)
>
> Référencer l'incident par son code (cf. `case-library.md`). Ne pas inventer : si l'incident n'existe pas encore dans la library, l'ajouter d'abord.
>
> _Longueur cible : 600–1 200 mots._
>
> **Exemple de structure** :
> - **Contexte** : _
> - **Décision** : _
> - **Hypothèse implicite** : _
> - **Conséquence immédiate** : _
> - **Conséquence retardée** : _

---

## 5. Analyse

> Pourquoi c'est arrivé. Le mécanisme derrière l'incident, au-delà de la surface.
> Identifier la dynamique systémique, psychologique ou organisationnelle qui a rendu l'erreur probable, voire inévitable.
>
> Cette section distingue l'anecdote de la leçon. C'est ici que le livre devient utile au lecteur.
>
> _Longueur cible : 400–800 mots._
>
> **Questions guides** :
> - Quelle pression a rendu la mauvaise décision rationnelle à ce moment-là ?
> - Quel mécanisme d'absence (pas de revue, pas d'alerte, pas de date d'expiration) a permis la persistance ?
> - Qui aurait pu dire non ? Pourquoi ne l'a-t-il pas fait ?
> - Qu'est-ce que ce cas révèle sur la conception du système ?

---

## 6. Application

> Comment éviter ou gérer ce type de situation. Avec des exemples concrets tirés de contextes variés (firewall, IAM, cloud, API, comptes temporaires, etc.).
>
> Doit contenir au moins **2 exemples** dans des domaines différents pour montrer que le principe est général.
>
> _Longueur cible : 400–800 mots._
>
> **Format suggéré** :
> - **Domaine 1 — ex. firewall** : _
> - **Domaine 2 — ex. IAM** : _
> - **Domaine 3 — ex. cloud / comptes temporaires** (optionnel) : _

---

## 7. Phrase mémorable

> Une phrase qui peut vivre seule, hors du livre, sur LinkedIn, X, DailyOps.Tech.
> Doit être courte (≤ 15 mots), affirmative, sans jargon.
>
> _Longueur cible : 1 phrase._
>
> **Critères** :
> - Compréhensible sans contexte
> - Difficile à oublier
> - Suffisamment générique pour s'appliquer ailleurs
>
> **Phrase retenue (chap. 2)** : _A temporary exception without an expiration date is a future security incident._

---

## 8. Transition

> Une ouverture vers le chapitre suivant. Une question, une image, ou un constat qui justifie la suite.
> Pas un résumé du chapitre qui vient de finir.
>
> _Longueur cible : 50–150 mots._
>
> **Exemple (fin du chap. 2, vers le chap. 3)** : _Si une exception sans date d'expiration devient une vulnérabilité silencieuse, qu'en est-il des dépendances que personne n'a documentées ?_

---

## Check-list de sortie de chapitre

Avant de marquer un chapitre `status: final`, vérifier :

- [ ] Chaque section contient au moins une phrase (aucune section vide).
- [ ] La phrase mémorable est identique entre l'en-tête YAML et la section 7.
- [ ] Tous les concepts introduits existent dans `glossary.md`.
- [ ] Tous les incidents référencés existent dans `case-library.md` (ou y sont ajoutés).
- [ ] Au moins une source crédible est citée (NIST, CISA, postmortem public, SRE literature).
- [ ] Aucun produit DailyOps n'est mentionné comme argument de vente.
- [ ] Le ton est direct, sans jargon académique inutile.
- [ ] Relecture orthographe et grammaire effectuée.
