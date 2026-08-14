# Rendu premium — Standards visuels de la collection

> **Collection** : The Operator's Library (5 livres)
> **Direction** : Technical Editorial / Dark Precision
> **Référence de mise en œuvre** : ce document consolide les standards visuels
> internationaux appliqués aux couvertures, symboles et gabarits.

---

## 1. Système de couverture

Gabarit vertical identique pour les 5 livres (`design/couverture-template.svg`),
paramétrable par couleur d'accent et symbole manifeste. Chaque livre reçoit une
couverture full-bleed dédiée (`design/couverture-livre-NN.svg`).

### Structure verticale (152 × 229 mm)

1. **Bandeau marque** (haut, Deep Navy) : `DAILYOPS` à gauche (turquoise, petites
   capitales), `THE OPERATOR'S LIBRARY — BOOK NN` à droite (gris acier).
2. **Bloc titre** (asymétrique gauche, Deep Navy) : ligne fine turquoise en haut
   (signature de collection), titre Sora extra-bold blanc, article/operateur en
   couleur d'accent du livre, taille 22–30 pt.
3. **Sous-titre** : Source Serif Pro italic, gris acier, 10.5 pt.
4. **Symbole manifeste** : motif conceptuel du livre, trait fin, couleur d'accent
   + marqueur turquoise (seuil / rupture).
5. **Bloc auteur** (bas gauche) : nom en Sora petites capitales, fonction italic.
6. **Signature DailyOps** (bas droite) : carré turquoise + label.

### Fichiers

| Fichier | Rôle |
|---------|------|
| `couverture-template.svg` | Gabarit réutilisable (placeholders `TITLE-L1`, `ACCENT`, etc.) |
| `couverture-livre-01.svg` | Beyond the Firewall — frontière traversée (bleu acier `#2C5F8A`) |
| `couverture-livre-02.svg` | The Human SPOF — nœud critique (ambre `#C76B2B`) |
| `couverture-livre-03.svg` | The Complexity Trap — graphe densifiant (violet `#5B3E7D`) |
| `couverture-livre-04.svg` | The Age of Operational AI — transition humain→agent (vert `#1F7A5A`) |
| `couverture-livre-05.svg` | The Operator's Last Job — opérateur relayé (rouge brique `#A83A3A`) |

---

## 2. Symboles conceptuels

Versions isolées et agrandies des motifs de couverture, `viewBox` 2:1
(`0 0 200 100`), fond transparent. Voir `design/symboles/`.

Usage : page de partie (Part I/II/III/IV), exergue de section, ou illustration
d'ouverture de chapitre pilier.

---

## 3. Cohérence couleur par livre

L'accent de chaque livre se propage automatiquement dans le PDF via
`templates/render/template.latex` : il consomme `book-accent` du `config/pandoc.yaml`
(hex sans `#`) et définit la couleur `accent`. Cette couleur pilote :

- les barres des callouts `FIELD NOTE` et `KEY TAKEAWAYS`,
- les numéros de chapitre (turquoise) et les barres d'accent,
- le label des en-têtes de partie.

| Livre | `book-accent` | Hex |
|-------|---------------|-----|
| 1 | `2C5F8A` | Bleu acier |
| 2 | `C76B2B` | Ambre brûlé |
| 3 | `5B3E7D` | Violet sombre |
| 4 | `1F7A5A` | Vert émeraude |
| 5 | `A83A3A` | Rouge brique |

Repli : si `book-accent` est absent, l'accent par défaut est le bleu acier (livre 1).

---

## 4. Palette Adobe

`design/couleurs.ase` — fichier ASE binaire valide (signature `ASEF`, 10 swatches
RGB) importable directement dans Illustrator, Photoshop et InDesign.

Contient : Deep Navy, Off-white, Noir profond, Gris acier, Turquoise DailyOps,
et les 5 accents par livre.

---

## 5. Standards internationaux respectés

- **ISO 5767** (titre sens lecture) : gabarit vertical, hiérarchie titre > sous-titre > auteur.
- **ISBN/EAN** (zone code-barres) : réserver 35 × 25 mm en bas du quatrième de couverture
  (à ajouter sur le dos + arrière en production finale).
- **Bleed** : 3 mm minimum recommandés en production imprimée (les SVG sont au format
  net ; le bleed est ajouté à l'export par le prépresseur).
- **Marges de sécurité** : éléments critiques à ≥ 6 mm du bord rogné.
- **Contraste** : titres blancs sur Deep Navy = ratio > 12:1 (WCAG AAA, hors contexte
  print, utile pour les déclinaisons numériques EPUB/cover web).
