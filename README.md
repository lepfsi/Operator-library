# The Operator’s Library

> **Guide de modification, de compilation et de maintenance locale**
>
> **Édition pilote :** *Beyond the Firewall*
>
> **Auteur :** Steve BA-NDOUWE, Cybersecurity Engineer

## 1. Objectif du dépôt

Ce dépôt contient la collection **The Operator’s Library**, une série de livres pratiques sur les réalités techniques, humaines et organisationnelles de l’exploitation des systèmes informatiques. Les manuscrits sont écrits en **anglais**, versionnés avec Git et compilés localement en **PDF**, **EPUB** et **DOCX**.

Le livre pilote, *Beyond the Firewall*, est la référence de production. Son système visuel, sa voix et sa grammaire de blocs doivent guider les chapitres suivants et les autres livres de la collection.

> Le livre est un **manuel opérationnel**, non une thèse universitaire. Sa crédibilité vient de scènes d’incident, de méthodes, de règles et de `Field Notes`. Les sorties destinées au lecteur ne doivent contenir ni bibliographie, ni citations auteur-date, ni notes de bas de page.

| Livre | Titre | État |
|---:|---|---|
| 01 | *Beyond the Firewall* | Livre pilote ; préface, introduction et chapitres 1–2 rédigés |
| 02 | *The Human Single Point of Failure* | Planifié |
| 03 | *The Complexity Trap* | Planifié |
| 04 | *The Age of Operational AI* | Planifié |
| 05 | *The Operator’s Last Job* | Planifié |

---

## 2. Démarrage rapide

Clonez le dépôt, rendez les scripts exécutables, installez les dépendances puis compilez le livre pilote.

```bash
git clone https://github.com/lepfsi/Operator-library.git
cd Operator-library
chmod +x scripts/*.sh
./scripts/build-book.sh book-01-beyond-the-firewall pdf
```

Les fichiers générés apparaissent dans :

```text
books/book-01-beyond-the-firewall/exports/
```

| Fichier | Usage |
|---|---|
| `book.pdf` | Maquette fixe à relire, imprimer et contrôler visuellement |
| `book.epub` | Version liseuse, reflowable |
| `book.docx` | Version Word lorsque la commande DOCX est lancée |
| `cover.pdf` / `cover.png` | Ressources générées depuis la couverture vectorielle |

---

## 3. Prérequis locaux

### Indispensables

| Outil | Rôle | Vérification |
|---|---|---|
| Bash | Exécute les scripts | `bash --version` |
| Git | Versionnage et synchronisation | `git --version` |
| Pandoc 3 ou supérieur | Transforme Markdown en PDF, EPUB et DOCX | `pandoc --version` |
| XeLaTeX | Produit le PDF | `xelatex --version` |
| Fontconfig | Vérifie les familles installées | `fc-list | head` |
| `rsvg-convert` | Convertit les couvertures SVG pour XeLaTeX | `rsvg-convert --version` |

Sous **Ubuntu / Debian**, une base suffisante est la suivante :

```bash
sudo apt update
sudo apt install -y \
  git bash pandoc \
  texlive-xetex texlive-latex-extra texlive-fonts-recommended \
  librsvg2-bin fontconfig unzip poppler-utils
```

Sous **macOS**, installez Pandoc, MacTeX et librsvg via Homebrew ou leurs installateurs officiels. Sous **Windows**, l’option la plus fiable est d’utiliser **WSL 2** avec Ubuntu et les mêmes commandes que ci-dessus.

### Polices de production

Le prototype de rendu actuellement actif vérifie les polices suivantes :

| Rôle | Police active | Usage |
|---|---|---|
| Texte de lecture | TeX Gyre Schola | Paragraphes et texte long |
| Titres / labels | Noto Sans | Hiérarchie, en-têtes et callouts |
| Code | TeX Gyre Cursor | Commandes et extraits techniques |

Le script `scripts/install-fonts.sh` installe également des familles premium pour des essais typographiques futurs : Sora, Source Serif 4 et IBM Plex Mono.

```bash
# Installation pour l’utilisateur courant
./scripts/install-fonts.sh

# Installation système, si nécessaire
sudo ./scripts/install-fonts.sh --system

# Vérifier le cache de polices
fc-list | grep -iE 'noto sans|tex gyre schola|tex gyre cursor|sora|source serif|ibm plex'
```

> Une police absente ne bloque pas la compilation, mais peut modifier la pagination et l’équilibre typographique. Toujours contrôler le PDF après un changement de police.

---

## 4. Commandes de compilation

La syntaxe générale est :

```bash
./scripts/build-book.sh <book-slug> <pdf|epub|docx|all> [--include-drafts]
```

| Intention | Commande |
|---|---|
| Compiler le livre pilote dans tous les formats | `./scripts/build-book.sh` |
| Compiler le PDF du livre 1 | `./scripts/build-book.sh book-01-beyond-the-firewall pdf` |
| Compiler l’EPUB du livre 1 | `./scripts/build-book.sh book-01-beyond-the-firewall epub` |
| Compiler le DOCX du livre 1 | `./scripts/build-book.sh book-01-beyond-the-firewall docx` |
| Compiler tous les formats du livre 1 | `./scripts/build-book.sh book-01-beyond-the-firewall all` |
| Inclure aussi les fichiers de travail `scaffold` | `./scripts/build-book.sh book-01-beyond-the-firewall pdf --include-drafts` |

Par défaut, les fichiers ayant `status: "scaffold"` sont exclus. C’est le comportement recommandé : ces fichiers représentent des chapitres ou parties non rédigés et leur inclusion peut créer des pages de maquette incomplètes.

### Contrôles utiles avant un commit

```bash
# Vérifier les espaces de fin et les marqueurs de conflit
git diff --check

# Voir les fichiers modifiés
git status --short

# Contrôler la validité technique d’un EPUB
unzip -t books/book-01-beyond-the-firewall/exports/book.epub

# Lire le texte d’un PDF dans le terminal
pdftotext books/book-01-beyond-the-firewall/exports/book.pdf - | less
```

---

## 5. Architecture du projet

```text
Operator-library/
├── README.md                              # Ce guide
├── design/
│   ├── referentiel-editorial-v1.md        # Source de vérité éditoriale et visuelle
│   ├── couverture-livre-01.svg            # Couverture vectorielle du livre 1
│   ├── couverture-template.svg             # Base des couvertures suivantes
│   ├── chapter-rhythm-10-page.md          # Rythme de chapitre historique
│   └── diagrammes/                         # Schémas SVG de la collection
├── books/
│   └── book-01-beyond-the-firewall/
│       ├── book-blueprint.md               # Plan détaillé du livre et des chapitres
│       ├── config/pandoc.yaml              # Métadonnées, formats et variables
│       ├── manuscript/                     # Sources Markdown dans l’ordre de lecture
│       ├── notes/                          # Suivi de rédaction et idées de travail
│       └── exports/                        # Fichiers générés, non à modifier à la main
├── templates/
│   ├── chapter-template.md                 # Base pour un nouveau chapitre
│   ├── book-blueprint-template.md          # Base pour un nouveau livre
│   └── render/
│       ├── template.latex                  # Maquette PDF
│       ├── epub.css                        # Maquette EPUB
│       └── callouts.lua                    # Transformation des blocs Markdown
├── scripts/
│   ├── build-book.sh                       # Compilation PDF / EPUB / DOCX
│   ├── new-chapter.sh                      # Création d’un chapitre
│   └── install-fonts.sh                    # Installation de familles typographiques
└── references/                             # Sources internes de recherche ; non publiées
```

---

## 6. Où modifier quoi

| Objectif | Fichier prioritaire | Remarque |
|---|---|---|
| Rédiger ou corriger un chapitre | `books/book-01-beyond-the-firewall/manuscript/NN-slug.md` | Un fichier Markdown par chapitre |
| Modifier le titre, l’auteur, la couverture ou les métadonnées | `books/book-01-beyond-the-firewall/config/pandoc.yaml` | Ne pas modifier les exports directement |
| Modifier la couverture | `design/couverture-livre-01.svg` | Conserver le format 6 × 9 pouces |
| Modifier PDF : marges, pagination, header, footer, callouts | `templates/render/template.latex` | Recompiler immédiatement après toute modification |
| Modifier EPUB | `templates/render/epub.css` | Vérifier sur une liseuse ou application EPUB |
| Ajouter ou changer une classe de callout | `templates/render/callouts.lua` + `template.latex` + `epub.css` | Les trois couches doivent rester cohérentes |
| Vérifier la voix, les couleurs et les règles | `design/referentiel-editorial-v1.md` | Source de vérité de la collection |

> Ne modifiez jamais manuellement un fichier dans `exports/`. Il sera écrasé à la prochaine compilation.

---

## 7. Statut des manuscrits et ordre de lecture

Chaque source Markdown commence par un frontmatter YAML. Le champ `status` contrôle son inclusion à la compilation.

```yaml
---
title: "The Temporary Rule That Became Permanent"
chapter_number: 2
author: "Steve BA-NDOUWE"
status: "draft"
---
```

| Statut | Signification | Inclusion par défaut |
|---|---|---|
| `scaffold` | Fiche de travail ou chapitre non rédigé | Non |
| `draft` | Texte en cours de rédaction et de mise en page | Oui |
| `review` | Texte prêt à relire | Oui |
| `final` | Texte validé | Oui |

Les fichiers sont assemblés dans l’ordre alphabétique. Conservez donc le préfixe numérique : `00a-foreword.md`, `01-beyond-the-firewall.md`, `02-the-temporary-rule-that-became-permanent.md`, etc.

---

## 8. Grammaire éditoriale à respecter

La documentation complète est dans [`design/referentiel-editorial-v1.md`](design/referentiel-editorial-v1.md). Les règles essentielles sont résumées ici.

### Voix

Le manuscrit est en anglais, direct, concret et écrit depuis l’expérience d’un opérateur. Il part d’un incident, expose le mécanisme qui a été mal compris, puis donne une décision ou une action exploitable.

Évitez les généralisations sans scène, les formules de consultant et les phrases qui ressemblent à une validation académique. La crédibilité repose sur les cas anonymisés, les preuves situées et les conséquences opérationnelles.

| À faire | À éviter |
|---|---|
| Nommer un symptôme, une transaction, une dépendance ou un responsable. | Les conseils abstraits ou les définitions de dictionnaire. |
| Écrire des paragraphes courts, avec une idée par paragraphe. | Les blocs de texte continus ou les listes de slogans. |
| Utiliser un point, une virgule, un deux-points ou un point-virgule selon le sens. | Le tiret long `—`, interdit dans les manuscrits. |
| Terminer sur une tension qui ouvre la suite. | Répéter la thèse de début de chapitre. |

### Structures récurrentes

Un chapitre rédigé suit généralement cette progression : ouverture noire, guide local, incident, mécanisme, méthode, concept, analyse, `Operator’s Rule`, `Field Note` et transition.

| Composant | Rôle | Budget conseillé |
|---|---|---|
| `impact-opener` | Ouverture noire, numéro monumental et titre | Généré automatiquement |
| `chapter-guide` | Navigation locale cliquable | Trois à sept sections existantes |
| `tip` / `Field Method` | Action de diagnostic | 40 à 90 mots |
| `concept` / `System Concept` | Définition de collection | 50 à 110 mots |
| `warning` / `Risk` | Risque ou erreur de raisonnement | 40 à 90 mots |
| `operator-rule` | Trois décisions opératoires | 60 à 120 mots |
| `field-note` | Incident anonymisé et leçon terrain | 110 à 180 mots |
| `next-chapter` | Transition vers le chapitre suivant | 25 à 60 mots |
| `config-block` | Extrait de configuration ou fait technique | 3 à 8 lignes |

Les callouts sont indivisibles dans le PDF : s’ils ne tiennent pas sur le folio, ils passent entièrement au suivant. N’essayez pas de les raccourcir uniquement pour gagner une ligne ; réduisez le contenu avec intention ou déplacez le bloc.

### Exemples Markdown

```markdown
::: {.impact-opener #chapter-slug number="03" title="Everything Was Green. Everything Was Broken"}
:::

::: {.chapter-guide}
**Inside Chapter 03**

- [01. The first section](#the-first-section)
- [02. The second section](#the-second-section)
:::

::: warning
A green dashboard does not prove that the transaction still works.
:::

::: operator-rule
1. **Set a visible owner.** Name the person who decides whether the exception remains.

2. **Set an expiry date.** Require a review before the exception can continue.

3. **Record the reason.** Keep the problem, requester, and removal condition together.
:::

::: {.config-block}
rule 214 {\
  source:      any\
  destination: any\
  service:     tcp/22 (ssh)\
  action:      allow
}
:::
```

Les listes Markdown des cartes de partie et des guides deviennent des liens stylés dans le PDF. Ne remplacez pas leur syntaxe par des paragraphes ou des tirets tapés à la main.

---

## 9. Ajouter un chapitre

Utilisez le script prévu pour créer un fichier correctement nommé.

```bash
./scripts/new-chapter.sh \
  book-01-beyond-the-firewall \
  3 \
  everything-was-green-everything-was-broken
```

Le script crée un fichier du type :

```text
books/book-01-beyond-the-firewall/manuscript/03-everything-was-green-everything-was-broken.md
```

Ensuite :

1. remplissez le frontmatter YAML ;
2. définissez le `status: "draft"` lorsque le chapitre peut être compilé ;
3. ajoutez l’ouverture noire et un guide dont les liens correspondent à de vraies sections ;
4. conservez un seul `Operator’s Rule` et un seul `Field Note` ;
5. compilez le PDF et l’EPUB ;
6. vérifiez les liens, les coupures de callouts et la pagination.

---

## 10. Modifier la maquette sans casser le rendu

Le PDF est le résultat de trois couches qui fonctionnent ensemble.

| Couche | Fichier | Responsabilité |
|---|---|---|
| Source sémantique | Manuscrit Markdown | Texte, classes de blocs, liens et ordre narratif |
| Transformation | `templates/render/callouts.lua` | Convertit les classes Markdown en environnements LaTeX et gère les liens PDF |
| Présentation PDF | `templates/render/template.latex` | Marges, polices, pages noires, callouts, sommaire, headers et folios |

L’EPUB repose sur le même Markdown, avec `templates/render/epub.css` comme couche de présentation. Une nouvelle classe de callout doit être ajoutée dans les trois emplacements suivants :

1. la table `known_envs` de `callouts.lua` ;
2. l’environnement correspondant dans `template.latex` ;
3. la règle CSS associée dans `epub.css`.

Après une modification de maquette, effectuez toujours une compilation PDF puis vérifiez au minimum le sommaire, une page de partie, une ouverture de chapitre, un guide, un `Operator’s Rule`, un `Field Note` et la transition `Next Chapter`.

---

## 11. Git et publication

Avant de versionner vos changements :

```bash
git status --short
git diff --check
git diff
```

Créez ensuite un commit clair :

```bash
git add -A
git commit -m "Refine chapter 03 operational narrative"
git push origin main
```

Préférez des messages de commit en anglais, précis et orientés résultat. Ne poussez pas un export généré isolé : versionnez toujours les sources, le style et la documentation qui permettent de le reproduire.

---

## 12. État actuel du livre pilote

À la date de ce README, l’édition active comprend :

| Élément | État |
|---|---|
| Couverture | Direction Bone / Ink / Saffron, source vectorielle disponible |
| Préface | Rédigée en anglais |
| Introduction | Rédigée en anglais |
| Partie I | Carte de partie et navigation cliquable disponibles |
| Chapitre 1 | Rédigé et mis en page |
| Chapitre 2 | Rédigé et mis en page ; inclut l’extrait de configuration `rule 214` |
| Chapitres 3 à 18 | `scaffold`, exclus de l’édition de production par défaut |
| Bibliographie publique | Désactivée par choix éditorial |

Pour retrouver les décisions visuelles ou éditoriales prises pendant la production, consultez :

```text
design/referentiel-editorial-v1.md
design/finish-audit-notes-2026-08-14.md
books/book-01-beyond-the-firewall/book-blueprint.md
```

---

## 13. Dépannage rapide

| Symptôme | Cause probable | Action |
|---|---|---|
| `pandoc is not installed` | Pandoc absent du `PATH` | Installez Pandoc puis ouvrez un nouveau terminal |
| `xelatex` absent | Distribution LaTeX incomplète | Installez TeX Live XeLaTeX ou MacTeX |
| Couverture SVG absente du PDF | `rsvg-convert` absent | Installez `librsvg2-bin` ou Inkscape |
| Pagination différente | Police de remplacement ou texte modifié | Vérifiez les polices avec `fc-list`, puis recompilez |
| Pages de maquette non désirées | Des fichiers `scaffold` sont inclus | Retirez `--include-drafts` ou vérifiez le statut YAML |
| Callout coupé ou déplacé | Bloc trop long pour le folio | Réduisez son texte ou déplacez-le ; ne forcez pas une coupure |
| Liens de guide inactifs | Ancre ou titre de section absent | Vérifiez le fragment `#slug` et recompilez le PDF |
| Erreur `Shaded undefined` | Un code fence Markdown a été utilisé dans le PDF | Utilisez `config-block` pour les extraits de configuration |

---

## 14. Règle de sécurité éditoriale

Avant toute modification importante, créez une branche ou un commit de sauvegarde. Les exports sont reproductibles ; les décisions de voix, de structure et de maquette sont plus coûteuses à reconstruire.

```bash
git checkout -b edit/chapter-03
# … modifications …
git add -A && git commit -m "Draft chapter 03"
```

Ce README doit évoluer avec le projet. Lorsqu’un nouveau composant visuel, une police, une commande ou une règle de rédaction est validé, mettez également à jour ce document et le référentiel éditorial.
