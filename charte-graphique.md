# Charte graphique — *The Operator’s Library*

> **Direction** : Operational Ideas
> **Positionnement** : non-fiction internationale sur les systèmes, les incidents et les décisions.
> **Principe** : une idée forte, une page claire, un contraste assumé.

---

## 1. Intention de collection

*The Operator’s Library* est une collection d’essais de non-fiction : elle ne reprend ni les codes visuels d’un produit SaaS, ni l’imagerie cyberpunk, ni l’esthétique de rapport d’entreprise. Chaque livre doit pouvoir se tenir seul dans une librairie internationale, une conférence, une boutique numérique ou une bibliothèque de dirigeant.

La direction **Operational Ideas** utilise une page ivoire chaude, une encre noire dense et un safran précis. Ce langage évite l’anonymat du minimalisme blanc tout en écartant l’excès visuel des couvertures technologiques. La couleur devient un outil de hiérarchie : elle signale une décision, une rupture ou un concept — jamais une décoration.

| Valeur | Traduction visuelle |
|---|---|
| Rigueur | Composition en grille, titres nets, alignements explicites. |
| Clarté | Grande typographie, contrastes durables, nombre limité de niveaux. |
| Autorité | Encre noire, blanc os, espaces généreux, absence de bruit de marque. |
| Action | Safran utilisé comme point de décision et repère de passage. |
| Humanité | Texte serif chaleureux, grain de papier et fond sombre réservé aux récits de terrain. |

---

## 2. Palette de collection

La palette s’applique à la couverture, au PDF, à l’EPUB et aux futurs supports de lancement. Les couleurs ne doivent pas être modifiées livre par livre, sauf pour l’accent secondaire du symbole de couverture.

| Rôle | Nom | Hex | Usage autorisé |
|---|---|---:|---|
| Surface principale | Bone | `#F2EDE3` | Fond de couverture, papier numérique, blocs très légers. |
| Encre | Ink | `#161616` | Titre, corps, filets principaux, fond des Field Notes. |
| Accent de décision | Saffron | `#F2A900` | Numéro, rupture, règle, repère de section, filet fort. |
| Signal de méthode | Forest | `#1C6B5A` | Tips, concepts, données vérifiées, marqueurs de système. |
| Alerte | Vermilion | `#D95332` | Warnings et pièges, sans usage décoratif. |
| Structure secondaire | Warm Grey | `#948E84` | Légendes, métadonnées, filets et pagination. |
| Surface inversée | Charcoal | `#262626` | Field Notes, pages de partie et citations d’impact. |
| Texte inversé | Chalk | `#FBF7EF` | Texte sur Charcoal. |

> **Règle de contraste** : une page claire emploie Ink pour le contenu, Warm Grey pour l’information secondaire et un seul accent de sens. Une page inversée emploie Chalk pour le texte et Saffron pour la structure. N’ajoutez pas d’effet néon, de bleu produit, de dégradé décoratif ni d’ombre portée.

---

## 3. Typographie

La collection associe une sans serif nette pour l’argument et une serif éditoriale pour la promesse, le récit ou la nuance. La typographie est l’image principale du livre ; les illustrations servent seulement la thèse.

| Usage | Police de production | Repli fiable | Traitement |
|---|---|---|---|
| Titres, numéros, métadonnées | Source Sans 3 SemiBold | TeX Gyre Heros | Majuscules contrôlées, approche légèrement resserrée, contraste fort. |
| Corps et sous-titre | Source Serif 4 | TeX Gyre Pagella | Lecture continue, interlignage généreux, italique réservé aux promesses. |
| Données et code | IBM Plex Mono | TeX Gyre Cursor | Petit, tabulaire, jamais utilisé comme police de titre. |

Le titre de couverture et les titres de chapitre reposent sur la sans serif. Les grandes citations peuvent utiliser la serif italique. Les mots entiers en capitales ne sont employés que pour les repères courts, tels que `PART`, `FIELD NOTE` ou les métadonnées.

---

## 4. Couverture

La couverture n’est pas une reproduction de l’intérieur. Elle introduit le livre par une seule métaphore graphique, une couleur de décision et un titre lisible à la taille d’une miniature.

Pour *Beyond the Firewall*, la métaphore est une **frontière rompue** : une masse d’encre verticale, bordée d’un safran irrégulier, est traversée par un repère de méthode. Ce symbole exprime l’idée que le système dépasse son périmètre sans recourir à des écrans, à des réseaux dessinés ou à une iconographie cyber.

| Élément | Règle |
|---|---|
| Fond | Bone, avec une structure de papier très discrète. |
| Titre | Ink, en deux ou trois masses lisibles ; il est l’objet principal. |
| Symbole | Une seule métaphore, sans illustration secondaire. |
| Accent | Saffron uniquement au point de rupture et aux filets de hiérarchie. |
| Sous-titre | Serif Ink, immédiatement lisible et placé sous le titre. |
| Auteur | Sans serif Ink, suffisamment visible pour construire la marque d’auteur. |
| Collection | `THE OPERATOR’S LIBRARY`, sobre, sans logo de produit. |

---

## 5. Page, navigation et hiérarchie

Le PDF et l’EPUB sont des prolongements de la couverture. La page de lecture est Bone, le texte est Ink et chaque niveau sert une fonction éditoriale identifiable.

| Niveau | Traitement | Fonction |
|---|---|---|
| Partie | Page Charcoal entière, numéro Saffron, titre Chalk. | Créer une pause et un nouveau territoire de lecture. |
| Chapitre | Numéro Saffron, titre Ink, surtitre Warm Grey. | Déclarer une idée qui peut être mémorisée. |
| Section | Sans serif Ink, filet Saffron discret. | Rendre l’argument navigable. |
| Citation d’impact | Serif italic Ink ou Chalk selon la page. | Faire respirer une thèse. |
| Texte courant | Serif Ink, paragraphes courts. | Porter le raisonnement. |
| Métadonnée | Sans serif Warm Grey en petites capitales. | Informer sans concurrencer le récit. |

Les en-têtes et pieds de page affichent le titre court du livre, l’auteur ou la page, sans marque DailyOps. Une petite règle Saffron peut indiquer la pagination mais ne doit jamais former un logo.

---

## 6. Grammaire des blocs

Les encadrés structurent le geste de lecture. Ils ne sont pas des widgets : chacun apporte une information différente et ne doit apparaître que lorsque la fonction le justifie.

| Bloc Markdown | Label affiché | Couleur de méthode | Fonction |
|---|---|---|---|
| `tip` | `FIELD METHOD` | Forest | Action de diagnostic immédiatement applicable. |
| `note` | `CONTEXT` | Warm Grey | Nuance, condition ou précision de lecture. |
| `important` | `KEY DECISION` | Ink | Décision ou seuil qui structure l’argument. |
| `warning` / `caution` | `RISK` | Vermilion | Faux confort, danger ou conséquence. |
| `concept` | `SYSTEM CONCEPT` | Forest | Notion stable et réutilisable. |
| `operator-rule` | `OPERATOR’S RULE` | Saffron | Trois actions observables à exécuter. |
| `field-note` | `FIELD NOTE` | Charcoal + Chalk | Incident condensé : contexte, attente, réalité, oubli, leçon. |
| `keytakeaways` | `IN BRIEF` | Saffron | Synthèse facultative d’un chapitre long. |

Une page ne comporte en principe qu’un bloc. Un Field Note n’est jamais immédiatement suivi d’un second encadré : il marque la sortie du chapitre.

---

## 7. Rythme éditorial

Un chapitre de référence utilise une séquence de mouvement : ouverture, phrase d’impact, scène, mécanisme, faux confort, analyse, méthode, règle, Field Note, transition. Les contenus doivent conserver ce rythme sans remplir des cases mécaniquement.

Le style rédactionnel est direct, international et précis. Il privilégie une scène observée, un mécanisme nommé, une conséquence concrète et une décision testable. Les adjectifs vagues, le jargon de consultant et les slogans de produit sont retirés.

---

## 8. Formats et contrôle qualité

| Format | Surface | Exigences |
|---|---|---|
| PDF 6 × 9 | Bone / Ink / Saffron | Contraste imprimable, titres lisibles à distance, pages de partie inversées. |
| EPUB | Bone / Ink / Saffron | Même hiérarchie sémantique, pas de largeur rigide, blocs adaptés au reflow. |
| Miniature numérique | Bone + Ink + Saffron | Titre lisible à 120 px de haut, symbole secondaire. |
| Extrait social | Bone ou Charcoal | Une phrase d’impact, un filet Saffron, jamais de faux écran ou de code décoratif. |

Avant publication, contrôler la lisibilité en miniature, la cohérence des labels de blocs, la présence d’un seul accent sémantique par page et le contraste de tout texte sur surface inversée.
