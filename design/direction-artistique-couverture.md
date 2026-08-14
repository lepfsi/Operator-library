# Direction artistique de couverture — The Operator’s Library

> **Collection :** *The Operator’s Library*
>
> **Livre pilote :** *Beyond the Firewall*
>
> **Support :** couverture et quatrième de couverture, format 6 × 9 pouces
>
> **Statut :** référentiel de production

## 1. Intention

La couverture doit positionner le livre comme une **non-fiction opérationnelle premium**, à mi-chemin entre l’essai de systèmes, le manuel de terrain et l’ouvrage de décision. Elle ne doit pas ressembler à une interface de cybersécurité, à un livre académique, ni à une couverture de science-fiction.

La promesse visuelle est simple : le livre révèle les écarts entre ce que les systèmes affichent et ce qui se passe réellement. La composition traduit donc une idée de **frontière, de rupture et de passage**. L’image principale reste abstraite afin d’être comprise sur une miniature de librairie, sur une tablette et en impression.

> La couverture ne représente pas une machine. Elle représente le moment où une certitude opérationnelle se fissure.

## 2. Palette de collection

| Nom | Hexadécimal | Rôle | Utilisation |
|---|---:|---|---|
| **Bone** | `#F2EDE3` | Papier chaud, intelligent et durable | Fond de première et quatrième de couverture, pages de lecture |
| **Ink** | `#161616` | Autorité, contraste et gravité | Titres, frontière visuelle, texte principal |
| **Saffron** | `#F2A900` | Décision, rupture et énergie maîtrisée | Faille de frontière, repères, filets et accents rares |
| **Forest** | `#1C6B5A` | Méthode et diagnostic | Marqueur de cible, labels secondaires, concepts système |
| **Slate** | `#948E84` | Structure discrète | Métadonnées, grain, filets et informations secondaires |

La palette évite le bleu technologique conventionnel. **Bone** rend l’objet éditorial et accessible ; **Ink** lui donne une présence de livre sérieux ; **Saffron** ne sert jamais de décor gratuit, mais signale une décision, une anomalie ou une rupture ; **Forest** garde les éléments méthodologiques calmes et utiles.

## 3. Première de couverture

La première de couverture est structurée autour de trois masses : une surface Bone à gauche, une frontière Ink irrégulière à droite et une ligne Saffron qui marque la faille. Cette frontière est volontairement imparfaite : elle évoque un périmètre qui semble solide mais ne l’est pas complètement.

Le titre est traité comme l’objet visuel principal. Il utilise une sans serif lourde, en capitales, avec une rupture chromatique sur **THE**. Cette construction permet de reconnaître le titre en miniature. Le sous-titre en serif italique ralentit ensuite la lecture et donne une tenue éditoriale plus littéraire.

| Élément | Règle | Finalité |
|---|---|---|
| Collection | En haut, en petites capitales espacées | Ancrer le livre dans une série cohérente |
| Numéro de livre | Sur la masse Ink | Assurer la lisibilité de collection |
| Titre | Sans serif lourde, haut contraste | Créer la reconnaissance immédiate |
| Sous-titre | Serif italique, ton plus calme | Expliquer la promesse sans compétition avec le titre |
| Frontière | Masse Ink + couture Saffron irrégulière | Représenter le périmètre et sa faille |
| Cible | Cercle, axe et point Forest | Signaler l’observation, le diagnostic et l’écart |
| Auteur | Bas de couverture, ligne de séparation fine | Donner une signature stable sans surcharge |

## 4. Quatrième de couverture

La quatrième de couverture reprend les mêmes matériaux, mais inverse leur fonction. La frontière Ink devient une présence latérale plus discrète, afin de garder une zone Bone confortable pour le texte. Elle ne doit pas concurrencer le résumé ; elle prolonge le concept de périmètre traversé.

Le texte de quatrième doit répondre à trois questions : quel problème ce livre rend visible, comment il travaille, et pour qui il est utile. Il reste bref, concret et opérationnel. Il ne cite pas de sources académiques, ne promet pas d’outil miracle et ne répète pas les titres de chapitre.

| Zone | Contenu attendu |
|---|---|
| Registre de collection | `THE OPERATOR’S LIBRARY · BOOK 01` |
| Phrase de tension | Une affirmation courte sur les signaux qui paraissent sûrs |
| Résumé | Deux ou trois paragraphes de promesse de lecture |
| Public | Ingénieurs, opérateurs, responsables sécurité et équipes de fiabilité |
| Signature | Nom, fonction et marque `OPERATIONAL IDEAS` |

Un espace calme est volontairement réservé en bas de la quatrième de couverture. Il pourra accueillir un code-barres ou un ISBN lorsque ceux-ci seront attribués. Ne créez pas de faux code-barres ou de faux numéro ISBN dans le fichier source.

## 5. Typographie

La couverture source est vectorielle afin de conserver la précision des titres, des filets et des repères à toutes les tailles. Les familles déclarées dans le SVG sont des replis web pour la portabilité. Pour une production d’impression finale, remplacer les replis par les polices validées de la collection tout en préservant la hiérarchie ci-dessous.

| Fonction | Caractère recherché | Traitement |
|---|---|---|
| Titre | Sans serif forte, compacte, nette | Capitales, poids fort, faible interlettrage |
| Labels | Sans serif méthodique | Petites capitales, interlettrage généreux |
| Sous-titre et texte de quatrième | Serif de lecture | Interlignage généreux, contraste doux |
| Auteur et fonction | Sans serif puis serif italique | Signature ferme, sans emphase excessive |

## 6. Règles de cohérence pour les livres suivants

Les livres suivants peuvent changer de symbole, de faille ou de ligne de tension, mais doivent conserver les règles suivantes.

| À conserver | À éviter |
|---|---|
| Format 6 × 9 pouces, surfaces Bone et Ink, accent Saffron limité | Les dégradés technologiques, néons, cadenas, boucliers ou interfaces fictives |
| Un seul concept graphique lisible en miniature | Plusieurs métaphores concurrentes |
| Titre comme objet principal | Un titre faible perdu dans une illustration décorative |
| Structure de série et numéro du livre | Des couvertures indépendantes sans langage commun |
| Texte de quatrième court et utile | Le jargon, les citations académiques et les promesses vagues |

## 7. Fichiers de production

| Fichier | Usage |
|---|---|
| `design/couverture-livre-01.svg` | Première de couverture, source vectorielle principale |
| `design/quatrieme-couverture-livre-01.svg` | Quatrième de couverture, source vectorielle principale |
| `design/couverture-template.svg` | Gabarit de première de couverture pour les livres suivants |
| `books/book-01-beyond-the-firewall/config/pandoc.yaml` | Déclare les chemins de couverture utilisés à la compilation PDF |
| `templates/render/template.latex` | Place la première et la quatrième de couverture dans le PDF |

Avant toute modification de couverture, conservez un commit Git et générez un PDF de contrôle. Vérifiez au minimum le contraste du titre, l’équilibre de la frontière, la lisibilité de la quatrième et l’absence de recadrage à 6 × 9 pouces.
