# Checklist — Avant la première compilation

> À vérifier avant chaque `./scripts/build-book.sh`.

---

## Contenu

- [ ] Chaque chapitre (`manuscript/NN-...`) a son frontmatter YAML (titre, auteur, date, concepts introduits, incidents référencés).
- [ ] Tous les concepts introduits existent dans `glossary.md`.
- [ ] Tous les incidents référencés existent dans `case-library.md`.
- [ ] Aucune section du chapitre n'est vide (`Hook`, `Mauvaise croyance`, `Principe`, `Preuve`, `Analyse`, `Application`, `Phrase mémorable`, `Transition`).
- [ ] La phrase mémorable est identique dans le YAML et dans la section 7.
- [ ] Le ton respecte la `editorial-line.md` (pas de jargon académique, pas de produits DailyOps comme arguments de vente).
- [ ] Au moins une source crédible est citée (NIST, CISA, postmortem public, SRE literature) — même si la bibliographie est encore vide au démarrage.
- [ ] Aucun produit DailyOps n'est mentionné comme argument de vente (vérifié via `reading-pitfalls.md`).
- [ ] Le `config/pandoc.yaml` est présent et valide (`pandoc.yaml` testé).
- [ ] `references/references.bib` existe (même vide) et `references/apa.csl` est présent ou non référencé dans `pandoc.yaml` (sans `.csl` valide, Pandoc utilise son style par défaut — OK pour les premiers builds).

---

## Compilations

- [ ] Pandoc installé (`pandoc --version`).
- [ ] XeLaTeX disponible (`xelatex --version`) — nécessaire uniquement pour le PDF, pas pour EPUB/DOCX.
- [ ] Pour la couverture PDF pleine page : `rsvg-convert` ou `inkscape` installés (sinon le build saute la couverture avec un avertissement — pas bloquant).

### Polices premium (optionnel mais recommandé)

Le template utilise trois polices premium avec replis automatiques (`templates/render/template.latex` § Fonts) :

| Rôle | Police premium | Repli automatique (TeX Live) |
|------|----------------|------------------------------|
| Sans-serif (titres, callouts) | Sora | DejaVu Sans |
| Serif (corps) | Source Serif Pro | TeX Gyre Pagella |
| Monospace | IBM Plex Mono | DejaVu Sans Mono |

- Si les polices premium ne sont **pas** installées, le build PDF réussit quand même avec les polices de repli.
- Sur TeX Live 2025/Debian, `\IfFontExistsTF{Sora}` déclenche un bruit console `kpathsea: Running mktextfm Sora` — **avatars non-fatal**, kpathsea échoue, la branche de repli est prise.
- Pour éliminer ce bruit et activer le rendu premium attendu (Sora en titres, Source Serif Pro en corps, IBM Plex Mono en listings), installer les trois familles depuis Google Fonts dans `~/.fonts/` (ou `~/.local/share/fonts/`), puis `fc-cache -fv`.

> Les polices de repli ne proposent pas certaines variantes (ex. small caps sur DejaVu Sans) — les warnings `Font shape ... undefined` disparaîtront avec les polices premium.
- [ ] Commande testée : `./scripts/build-book.sh book-01-beyond-the-firewall all`.
- [ ] Vérifier le rendu visuel des exports (`exports/book.pdf`, `.epub`, `.docx`) : couverture en 1re page PDF, titre, sous-titre, chapitre 01, encadrés, citations.
- [ ] Vérifier que le `book-blueprint.md` est à jour avec la séquence finale des chapitres.
- [ ] Vérifier la correspondance `incidents_referenced` de chaque chapitre avec `case-library.md`.

---

## Après compilation

- [ ] Vérifier la cohérence visuelle avec `charte-graphique.md` et `maquette-page-interieure.md`.
- [ ] Vérifier que la couverture (`prototype-couverture-livre-01.svg`) reste lisible à 120 px.
- [ ] Vérifier la cohérence des 5 symboles conceptuels (`charte-graphique.md`, section 5).
- [ ] Si un changement de structure est fait (ex. fusion de chapitres), mettre à jour le `manuscript/`, le `book-blueprint.md`, et le `README.md`.
