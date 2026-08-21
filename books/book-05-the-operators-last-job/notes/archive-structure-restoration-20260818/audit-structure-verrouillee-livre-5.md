# Audit de structure verrouillée — Livre 5

## Statut de l’audit

Ce document consigne les règles retrouvées avant toute correction. Il ne modifie pas le manuscrit. En cas de conflit, le **Référentiel de production** prévaut explicitement sur un chapitre isolé.

## Hiérarchie des sources de vérité

| Priorité | Artefact | Rôle verrouillé |
|---:|---|---|
| 1 | `REFERENCE-DE-PRODUCTION.md` | Référence de rédaction, de mise en page et de conception ; elle prévaut en cas de conflit. |
| 2 | `notes/03-structure-de-chapitre.md` | Doctrine narrative en sept mouvements et test de non-généricité. |
| 3 | `STRUCTURE-PREMIUM-DU-LIVRE.md` | Promesses de parties, éléments `In This Chapter`, ordre de lecture et rythme par chapitre. |
| 4 | `notes/04-architecture-finale.md` | Progression émotionnelle calme : de la routine au diagnostic, à l’action puis au début de décision. |
| 5 | `notes/00-suivi-chapitres.md` | Registre des incidents d’ancrage et des titres verrouillés. |
| 6 | `REGLES-FINALES-TEMPLATE.md`, `SYSTEME-CALLOUTS-HARMONISE.md`, `IDENTITE-DOCUMENTAIRE.md`, `CORRESPONDANCE-COMPOSANTS-FINALE.md` | Inventaire des composants, limites de fréquence et traitement visuel. |
| 7 | `scripts/build-book.sh`, `config/pandoc.yaml`, `config/callouts.lua` | Pipeline effectif, ordre de compilation, template actif et composants convertis. |

## Cadence narrative obligatoire

La grammaire de chapitre est :

> **Scene → Work → Automation → Loss → Contradiction → Principle → Uneasy Question.**

Un chapitre doit s’ouvrir dans une décision concrète avant toute définition, montrer le travail humain avant l’automatisation, nommer un **Vanishing Point**, faire apparaître une contradiction où la machine reste compétente mais insuffisante pour la décision, puis terminer sur une question qui rend le chapitre suivant nécessaire.

Le rythme visuel fixe est :

> **scene → reflection → visual pause → operational artefact → consequence → next question**

Il s’agit d’un essai de terrain sobre, non d’un magazine, d’une présentation de conseil ou d’un thriller cinématographique.

## Contraintes particulières du chapitre 6

| Élément | Valeur verrouillée |
|---|---|
| Titre | *Then We Automated the Diagnosis* |
| Place | Partie II — *The Automation Curve* |
| Déplacement | De l’exécution vers l’interprétation ; la couche de diagnostic cesse de dépendre de l’humain. |
| Incident d’ancrage | `Office365_Dashboard` |
| Promesse `In This Chapter` | 1. From alerts to explanations. 2. Pattern recognition and its blind spots. 3. The diagnosis that narrows the room. 4. When confidence arrives before context. |
| Transition attendue | Le diagnostic prépare le chapitre 7 : la recommandation reçoit une permission et devient action. |

## Balisage et composants verrouillés

Chaque chapitre contient, dans cet ordre de lisibilité : titre, `In This Chapter` de **quatre lignes**, quatre à six intertitres, deux à quatre respirations éditoriales, puis passage explicite au chapitre suivant. Les callouts sont des interruptions rares : entre cinq et huit interventions graphiques maximum par chapitre ; aucune succession de deux callouts ne clôt un chapitre.

Le filtre Lua actif du livre est `config/callouts.lua`. Il reconnaît : `front-piece`, `field-note`, `case-signal`, `proposition`, `operator-note`, `distinction`, `decision-ledger`, `memorable-phrase`, `next-chapter`, `part-map`, `part-page`, `chapter-guide`, `the-question`, `the-shift` et `four-questions`. Toute autre classe n’est pas convertie par le pipeline courant tant que le filtre et la correspondance des composants ne sont pas mis à jour ensemble.

## Pipeline réellement utilisé

Le script `scripts/build-book.sh` collecte les fichiers `manuscript/*.md` par ordre alphabétique, exclut uniquement les fichiers ayant `status: scaffold` par défaut, sélectionne en priorité le filtre `books/book-05-the-operators-last-job/config/callouts.lua`, puis emploie le template `config/operator-last-job.latex`. Il n’utilise pas `manuscript-files.txt` pour constituer le PDF.

La bibliographie est déjà câblée dans `config/pandoc.yaml` via `../../../references/references.bib`. Toute évolution bibliographique doit d’abord respecter ce mécanisme plutôt que créer une structure parallèle non intégrée au pipeline.

## Écarts à examiner ensuite

L’étape suivante doit comparer le chapitre 6 et les fichiers ajoutés aux règles ci-dessus : incident d’ancrage, quatre intertitres promis, inventaire de callouts, format de notes/références, fichier de filtre modifié, ordre de compilation et ajout de fichiers au manuscrit.
