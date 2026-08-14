# Design System — The Operator's Library

> **Collection éditoriale DailyOps Books**
> **Direction** : Technical Editorial / Dark Precision
> **Version** : avec callouts / encadrés standardisés (mise à jour)

---

## 1. Vision et positionnement

Cinq ouvrages sur les réalités invisibles des systèmes : personnes, organisations, complexité, IA, rôle humain. La rigueur, la profondeur, l'intemporalité, la continuité DailyOps. Règle fondatrice : structures abstraites, jamais d'ordinateurs, cadenas ou serveurs.

---

## 2. Palette de couleurs

**Base** : Off-white `#F7F5F0`, Deep Navy `#0A1A2F`, Noir profond `#111111`, Gris acier `#5A6B7A`.
**Accent DailyOps** : Turquoise `#1CB5A0` (signature rare, jamais dominante).
**Accents par livre** : `#2C5F8A` / `#C76B2B` / `#5B3E7D` / `#1F7A5A` / `#A83A3A`.

---

## 3. Typographie

**Sora** (titres, couvertures, encadrés), **Source Serif Pro** (corps, citations), **IBM Plex Mono** (code). Deux familles principales + monospace maximum.

---

## 4. Système de couverture : le motif de la frontière

Gabarit 6" × 9" (152 × 229 mm). Même structure verticale : marque → titre/sous-titre → zone frontière → auteur + signature. Chaque livre a sa propre manifestation conceptuelle de la frontière (ligne interrompue, réseau critique, densité croissante, transition humain-système-agent, passage de contrôle).

---

## 5. Éléments de rythme et d'attention (callouts / encadrés)

### Callouts style site web (alignés sur DailyOps.tech)

Le système de callouts reprend la convention du site (Note / Tip / Warning / Important / Caution) : chaque bloc a un **label en petites capitales + filet fin + fond teinté + barre latérale** de sa couleur sémantique. Le texte reste court (1–3 phrases, orienté action).

| Type | Usage | Couleur sémantique | Filtre Pandoc |
|------|-------|--------------------|---------------|
| **Note** | Information contextuelle | Gris acier `#5A6B7A` | `::: note` |
| **Tip** | Conseil pratique | Turquoise `#1CB5A0` | `::: tip` |
| **Important** | À ne pas manquer | Deep Navy `#0A1A2F` | `::: important` |
| **Warning** | Mise en garde | Rouge brique `#A83A3A` | `::: warning` |
| **Caution** | Procéder prudemment | Ambre `#C76B2B` | `::: caution` |

### Blocs spécifiques au livre

| Type | Usage | Traitement | Filtre Pandoc |
|------|-------|------------|---------------|
| **DAILYOPS CONCEPT** | Taxonomie propriétaire | Filets haut/bas, label petites capitales, nom gras 16 pt `#0E7C7B`, définition serif | `::: concept` |
| **FIELD NOTE** | Incident anonymisé | **Fond noir `#1E2229` pleine page**, texte blanc, 5 champs structurés (Contexte / Ce qu'on attendait / Ce qui s'est passé / Ce qu'on a raté / Ce que ça nous a appris) | `::: field-note` |
| **OPERATOR'S RULE** | Règles actionnables numérotées | Cadre gris, fond blanc, label accent du livre, chiffres en gras accent | `::: operator-rule` |
| **IMPACT QUOTE** | Citation pleine page (respiration) | Fond `#F9FAFC`, citation centrée 40–52 pt serif italic, filet décoratif, **pas de folio** | `::: impact-quote` |
| **IMPACT OPENER** | Page d'ouverture noire (verso) | Fond `#1E2229`, grand numéro chapitre blanc opacité 15 %, titre du livre bas-droite | `::: impact-opener` |
| **KEY TAKEAWAYS** | Synthèse fin de chapitre | Titre accent du livre, liste 3–5 points à puces turquoise | `::: keytakeaways` |
| **REMEMBER** | Phrase à retenir | Fond gris clair, barre acier | `::: remember` |
| **LESSON** | Leçon clé | Double barre turquoise | `::: lesson` |
| **DIAGRAM** | Schéma conceptuel | Centré, légendé `Fig. N` | `::: diagram` |

### Notes en marge (margin notes)

Petites annotations en marge extérieure (3,5 cm), corps 8–9 pt. Une ou deux par chapitre maximum.

### Rythme éditorial d'un chapitre (10 pages)

Le rythme alterne densité et respiration pour faciliter la lecture et la mémorisation :

| Page | Contenu | Densité | Fonction |
|------|---------|---------|----------|
| 1–2 | Ouverture noire + page d'impact | 0 % texte | Pose la thèse par le choc visuel |
| 3 | Récit court + TIP flottant | 40 % texte / 20 % bloc | Accroche + conseil pratique immédiat |
| 4 | Récit + CONCEPT pleine largeur | 30 % texte / 30 % bloc | Définit le vocabulaire propriétaire |
| 5 | Leurre + WARNING | 30 % texte / 25 % bloc | Met en garde contre le piège |
| 6 | Analyse + TIP flottant | 30 % texte / 20 % bloc | Décortique sans être académique |
| 7 | Page d'impact (citation) | 0 % texte | Respiration / mémorisation |
| 8 | OPERATOR'S RULE | 10 % texte / 40 % bloc | Livre le mode d'emploi |
| 9 | FIELD NOTE (fond noir) | 0 % texte hors bloc | Synthèse terrain, signature éditoriale |
| 10 | Transition courte | 15 % texte | Lance le chapitre suivant |

**Règles** : pas plus d'un encadré par page (sauf exception) ; les pages d'impact (1, 2, 7, 9) n'ont **pas de folio** ; alternance texte/bloc toutes les 2–3 pages ; un seul IMPACT QUOTE et un seul FIELD NOTE par chapitre.

---

## 6. Grille éditoriale intérieure

Format 6" × 9". Marges : intérieur 2,2 cm, extérieur 1,8 cm (3,5 cm si notes en marge), haut 2,5 cm, bas 2,0 cm. Ligne de base 12 pt.

### Styles de titres

- **Part** : page séparée, numéro Sora bold 24 pt turquoise, titre 20 pt Deep Navy, phrase d'introduction Source Serif Pro italic 12 pt gris acier.
- **Chapitre** : numéro 36 pt turquoise/gris acier, titre 24 pt Deep Navy, phrase d'ouverture 13 pt gris acier.
- **Sous-titres** : Sora medium 13 pt capitales Deep Navy.

### En-tête / pied

En-tête gauche : titre du livre Sora light 8 pt gris acier. Droite : numéro de page. Pied gauche : nom auteur. Centre : carré turquoise discret optionnel.

---

## 7. Diagrammes conceptuels

Trait fin (1 pt), style blueprint. Gris acier + turquoise ou couleur du livre. Pas de flèches épaisses, pas d'ombres, pas de dégradés. Légende Source Serif Pro 10 pt gris acier.

**Règles de production** :

- Fichiers : `design/diagrammes/` , un SVG par diagramme, nom `slug-du-concept.svg`.
- Dimensions : `viewBox="0 0 800 400"` (ratio 2:1), trait `stroke-width="1.5"` (équivalent 1 pt), pointes de flèches polygonales fines.
- Palette : gris acier `#5A6B7A` (structure), bleu acier `#2C5F8A` (concept principal), carré turquoise `#1CB5A0` (marqueur de rupture, jamais grande surface), rouge brique `#A83A3A` (danger limité).
- Texte : titres et labels Sora, légende `Fig. N — ...` Source Serif Pro 10.5 pt, numéro correspondant au chapitre d'usage.
- Intégration : référencés depuis un chapitre via Markdown `![Fig. N — ...](../../design/diagrammes/slug.svg)`. Le template LaTeX doit charger le package `svg` (ou conversion préalable en PDF) pour le rendu PDF.

**Catalogue (livre 1)** — voir `design/diagrammes/README.md` :

| Fichier | Concept | Chapitre |
|---------|---------|----------|
| `operational-drift.svg` | Expected State → DRIFT → Impact | 13 |
| `monitoring-illusion.svg` | La métrique verte vs l'expérience réelle | 5 |
| `permanent-temporary.svg` | L'exception temporaire devenue architecture | 2 |
| `human-spof.svg` | Le réseau de compétences dans une seule tête | 4 |
| `availability-resilience.svg` | Working ≠ Reliable | 6 |
| `shadow-operations.svg` | L'architecture parallèle non documentée | 3 |

---

## 8. Règles d'usage de la marque

- **Couverture livre 1** : `DAILYOPS` discret. Pas `THE OPERATOR'S LIBRARY`.
- **Après livre 2 ou 3** : introduire progressivement `THE OPERATOR'S LIBRARY`.
- **Turquoise** : signature uniquement. Jamais en grande surface.
- **Couleurs d'accent par livre** : uniquement éléments structurels (frontière, encadrés, numéros).
- **Photographies** : interdites. Uniquement graphiques vectoriels abstraits.

---

## 9. Règles d'utilisation pour la fluidité

- Un encadré par page max (sauf exception).
- Varier les types : ne pas enchaîner deux `FIELD NOTE` sans texte.
- Réserver `pull quotes` et `LESSON` aux moments clés (fin de section, après incident majeur).
- Notes en marge : 1–2 par chapitre max.
- Key Takeaways systématiques en fin de chapitre.
- Alternance texte / visuel toutes les 2–3 pages.
- Hiérarchie : `CONCEPT` et `FIELD NOTE` plus visibles que notes marginales.

---

## 10. Prototype à produire

Avant production complète :

1. Couverture `Beyond the Firewall` (selon Direction 2 modifiée).
2. Trois pages intérieures : ouverture de chapitre, page `FIELD NOTE` + `DAILYOPS CONCEPT`, page `pull quote` + `LESSON`.
3. Un diagramme conceptuel.
4. Un `Key Takeaways` en fin de chapitre.

---

## 11. Résumé exécutif

Ambiance : Technical Editorial / Dark Precision. Couleurs : Off-white, Deep Navy, Noir profond, Gris acier, Turquoise rare. Polices : Sora, Source Serif Pro, IBM Plex Mono. Couverture : gabarit unique + symbole conceptuel par livre. Intérieur : encadrés standardisés (`CONCEPT`, `FIELD NOTE`, `LESSON`, `WARNING`, `REMEMBER`), pull quotes, notes en marge, key takeaways, diagrammes trait fin. Alternance texte/visuel, pas de surcharge. Interdits : cadenas, circuits imprimés, code décoratif, hackers, cyberpunk.
