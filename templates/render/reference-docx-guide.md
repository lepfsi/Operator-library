# Guide de génération du `reference.docx` (Pandoc)

> P2-13 — Rendu DOCX premium pour *The Operator's Library*.
> Un `.docx` de référence ne peut pas être créé à la main : il faut le générer
> via Pandoc à partir d'un document stylo, puis ouvrir le résultat pour ajuster
> les styles dans Word/LibreOffice.

---

## Principe

Pandoc n'accepte pas un fichier `.css` pour le DOCX. À la place, il accepte un
**`reference.docx`** : un document Word minimal dont les styles nommés
(Title, Heading 1, Heading 2, Body Text, Quote, Source Code, etc.) définissent
la typographie, les couleurs et les marges. Pandoc applique ensuite ces styles
au contenu généré.

La stratégie en deux temps :

1. **Générer un `reference.docx`** de base (vide mais avec tous les styles
   Pandoc) via `pandoc --print-default-data-file reference.docx`.
2. **Ouvrir le fichier dans Word/LibreOffice** et ajuster chaque style selon la
   charte graphique ci-dessous. Sauvegarder comme `reference.docx` final.

---

## Étape 1 — Générer le squelette

```bash
pandoc --print-default-data-file reference.docx > templates/render/reference.docx
```

(À exécuter une fois Pandoc installé dans WSL.)

---

## Étape 2 — Ajuster les styles (dans Word ou LibreOffice)

Ouvrir `templates/render/reference.docx` et modifier chaque style via le panneau
des styles. Voici la table de correspondance à respecter :

### Polices

| Style Pandoc          | Police             | Taille | Gras | Couleur      |
|-----------------------|--------------------|--------|------|--------------|
| Title                 | Sora               | 36 pt  | Bold | Deep Navy `#0A1A2F` |
| Subtitle              | Source Serif Pro   | 16 pt  | Italic | Gris acier `#5A6B7A` |
| Heading 1 (chapter)   | Sora               | 22 pt  | Bold | Deep Navy |
| Heading 2 (section)   | Sora               | 16 pt  | Bold | Deep Navy |
| Heading 3             | Sora               | 13 pt  | Medium | Deep Navy |
| Body Text             | Source Serif Pro   | 10 pt  | Regular | Noir `#111111` |
| First Paragraph       | Source Serif Pro   | 10 pt  | Italic | Gris acier |
| Quote (pull quote)    | Source Serif Pro   | 14 pt  | Italic | Deep Navy |
| Block Text            | Source Serif Pro   | 10 pt  | Regular | Noir |
| Source Code            | IBM Plex Mono      | 9 pt   | Regular | Noir |
| Verbatim              | IBM Plex Mono      | 9 pt   | Regular | Noir |
| Author                | Sora               | 12 pt  | Regular | Deep Navy |
| Caption               | Source Serif Pro   | 8 pt   | Italic | Gris acier |
| TOC Heading           | Sora               | 14 pt  | Bold | Deep Navy |

### Marges (Format > Page > Marges)

- Intérieure : 2,2 cm
- Extérieure : 1,5 cm
- Haute : 2,0 cm
- Basse : 1,8 cm
- Format page : A5 (148 × 210 mm) ou 6″ × 9″ (152,4 × 228,6 mm)

### Interligne

- Body Text : 1,35
- Heading 1 : 1,2
- Quote : 1,3

### Espacement après paragraphe

- Body Text : 6 pt
- Heading 1/2 : 12 pt avant, 6 pt après

---

## Étape 3 — Callouts typés en DOCX

Pandoc ne supporte pas de styles nommés personnalisés pour les callouts
typés (FIELD NOTE, SYSTEM CONCEPT, etc.) directement. Trois approches :

### Approche A — Bloc de citation stylisé (recommandée)

Convertir les fenced divs `::: field-note` en **Block Text** style Word, avec
le label en premières lignes en gras + petites capitales.

Dans le `reference.docx`, créer un style personnalisé nommé
`CalloutFieldNote` basé sur `Block Text` :

- Police : Source Serif 4, 9,5 pt
- Bordure : 0,5 pt, couleur sémantique du bloc
- Fond : Bone `#F2EDE3`
- Espacement interne : 0,6 cm

Répéter pour : `CalloutConcept`, `CalloutLesson`, `CalloutWarning`,
`CalloutRemember`, `PullQuote`, `KeyTakeaways`.

### Approche B — Tableau à une cellule

Pandoc convertit les fenced divs en `<div>` qui deviennent des paragraphes en
DOCX. Pour forcer une bordure, un script Lua peut wrapper le callout dans un
tableau 1×1 et appliquer une bordure de la couleur d'accent.

### Approche C — Filtrage Lua (robuste, production)

Créer `filters/callouts.lua` qui intercepte les `Div` avec `class` =
`field-note`/`concept`/... et leur affecte un style Word personnalisé
(`pandoc.Div` + attribut `custom-style`). C'est l'approche la plus propre pour
une production reproductible.

---

## Étape 4 — Utilisation à la compilation

```bash
pandoc manuscript/*.md \
  -o exports/book.docx \
  --reference-doc=templates/render/reference.docx \
  --toc \
  --toc-depth=2
```

---

## Étape 5 — Vérifications

Ouvrir `exports/book.docx` dans Word/LibreOffice et vérifier :

- [ ] Police des titres = Sora
- [ ] Police du corps = Source Serif Pro
- [ ] Couleur des Heading 1 = Deep Navy
- [ ] Numéro de chapitre en turquoise (si style dédié)
- [ ] Bordures des callouts conformes à la charte
- [ ] Marges cohérentes avec A5/6×9
- [ ] Interligne 1,35 sur le corps
- [ ] Header (titre du livre) + footer (auteur + carré turquoise) si configuré

---

## Note

Le `.docx` final n'est pas utilisé pour la publication imprimée (le PDF LaTeX
fait foi). Il sert uniquement pour :

- **Relecture** par un éditeur/correcteur qui travaille en Word,
- **Partage** avec des contributeurs externes,
- **Annotation** et révisions marginales.
