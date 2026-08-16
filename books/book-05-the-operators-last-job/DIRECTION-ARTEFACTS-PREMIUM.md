# The Threshold Ledger — Direction des artefacts premium

**Statut :** spécification de maquette pour le manuscrit pilote.  
**Intention :** une publication de terrain sérieuse, tactile et typographique ; ni interface SaaS, ni rapport de conseil, ni assemblage de cartes génériques.

> La hiérarchie ne doit pas provenir de boîtes successives. Elle doit naître du rythme, de l’alignement, de la règle, du blanc et de la différence entre une note, une question, une transition et une décision.

## Grammaire de lecture

| Objet | Fonction narrative | Traitement premium | Ce qui est interdit |
|---|---|---|---|
| **Field Note** | Placer une scène concrète dans le temps. | Un bandeau de marge compact : timestamp en mono, une ligne de règle, prose sur un second niveau. | Carte grise pleine largeur, icône, bordure sur quatre côtés. |
| **Case Signal** | Isoler le fait opérationnel qui change l’interprétation. | Une petite étiquette en capitale suivie d’un paragraphe de largeur réduite et d’un filet latéral fin. | Encadré promotionnel, couleur de fond saturée. |
| **The Question** | Suspendre la lecture au moment où une hypothèse cesse d’être sûre. | Titre fixé sur la règle supérieure ; question centrée dans un espace blanc large. | Le mot « THE QUESTION » noyé dans la même ligne que la question. |
| **The Shift** | Nommer le déplacement humain vers le système. | Marque latérale orange, titre verticalement séparé, phrase de bascule en serif large. | Citation encadrée standard. |
| **Decision Ledger** | Rendre une décision inspectable. | Bloc à en-tête « onglet » en retrait, grille à deux colonnes, libellés en mono, valeurs en serif ; une seule couleur d’accent. | Tableau Markdown apparent, liste à puces déguisée en tableau, carte générique. |
| **The Four Questions** | Donner au lecteur la boussole du livre. | Quatre bandes horizontales de hauteur égale, numérotées 01–04 ; terme en sans capitales à gauche, question en serif à droite. | Quatre paragraphes empilés ou une carte de questions générique. |
| **Operator’s Note** | Offrir une observation de métier, non un résumé. | Marque de marge compacte : titre sur la règle, texte plus étroit, sans fond. | Callout gris répétitif ou préfixe noyé dans la prose. |
| **Next** | Ouvrir le chapitre suivant. | Une ligne de sortie dans le flux, non encadrée, précédée d’un chevron discret. | Un second callout après une phrase mémorable. |

## Pages de partie

Une page de partie est un **seuil**, non un chapitre sans contenu. Elle utilise une page entière, mais seulement lorsqu’au moins un chapitre de la partie est inclus dans le PDF. Sa composition est volontairement asymétrique : indice de partie en mono, titre en serif, promesse brève, puis liste de chapitres numérotée. La liste devient cliquable uniquement pour les chapitres effectivement inclus au rendu.

La page doit rester sur une seule feuille. Elle n’utilise ni code LaTeX dans le Markdown ni callout coloré. La règle de placement est simple : le bloc supérieur commence à 18 mm du haut ; la liste commence à mi-page ; la phrase-seuil termine la page, sans tableau ni faux sommaire.

## Décision Ledger : composition de référence

```text
                        DECISION LEDGER
             [a record of the decision before the incident]

  ACTION                    Restart the core banking API service.
  AUTHORITY                 On-call engineer / recovery runbook.
  ASSUMPTION UNDER PRESSURE A familiar signature means a familiar remedy.
  WHAT THE SYSTEM MISSED    An unannounced deployment and a live commitment.
  COST OF BEING WRONG       Latency became a multi-hour outage.
```

Le titre dépasse légèrement de la grille comme une languette de dossier. Chaque ligne a son propre rythme vertical et les séparateurs sont gris très pâle. Le tableau devient ainsi un objet de lecture et non un tableau Markdown posé dans un PDF.

## Rythme du chapitre pilote

Le chapitre 1 ne doit jamais présenter deux callouts de même poids à la suite. Son rythme cible est :

> **impact opener → field note → narration → the question → case signal → the shift → narration → decision ledger → narration → four questions → operator’s note → plain next line**

Le chapitre peut conserver cinq sections dans *In This Chapter* parce que cette liste correspond à ses cinq mouvements, y compris la question de sortie. Elle est une promesse de lecture, pas un sommaire mécanique.

## Principes de contrôle

Le test final n’est pas « est-ce qu’il y a assez de callouts ? ». Il est : **chaque changement de forme est-il mérité par un changement de pensée ?** Si l’on retire l’artefact et que le sens ne perd rien, l’artefact doit disparaître.
