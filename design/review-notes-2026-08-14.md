# Notes de revue visuelle — 14 août 2026

## Source examinée

- PDF : `books/book-01-beyond-the-firewall/exports/book.pdf`
- Pages vues : 1 à 5

## Constats principaux

| Élément | Observation | Statut |
|---|---|---|
| Couverture | La couverture SVG existante est bien intégrée ; elle n’a pas encore été refondue dans cette passe. | Conforme au dépôt actuel |
| Pages liminaires | Les pages de faux-titre et copyright sont propres, sobres et cohérentes. | Correct |
| Sommaire | Le sommaire affiche un artefact LaTeX littéral `itlerule*[8pt].` dans plusieurs entrées de chapitre. | À corriger |
| Pagination globale | Le PDF compile correctement et totalise 48 pages. | Correct |
| Validation de compilation | Le nouveau gabarit PDF fonctionne avec le repli typographique TeX Gyre. | Correct |

## Hypothèses à vérifier ensuite

1. Le nouveau chapitre 1 doit être inspecté visuellement sur ses pages d’ouverture, ses citations d’impact, son bloc `operator-rule` et son `field-note`.
2. Le sommaire doit être nettoyé pour supprimer l’artefact de composition.
3. La couverture pourra faire l’objet d’une passe séparée si une refonte des SVG est souhaitée.

## Constats sur le chapitre 1 refondu

### Source

- PDF : `books/book-01-beyond-the-firewall/exports/book.pdf`
- Pages vues : 11 à 15

### Observations

| Page PDF | Élément principal | Observation | Statut |
|---|---|---|---|
| 11 | `impact-opener` | L’ouverture sombre fonctionne bien : grand numéro, contraste fort, titre bien placé en bas. | Très bon |
| 12 | `impact-quote` d’ouverture | La citation d’impact est lisible, ample et conforme à l’effet de respiration recherché. | Très bon |
| 13 | Récit + `tip` | Le rythme texte puis conseil est cohérent ; le bloc tip reste lisible mais le label paraît légèrement discret avec les polices de repli. | Bon |
| 14 | `concept` + `warning` + section suivante | Le bloc concept est convaincant ; le warning fonctionne visuellement, mais la page est assez dense en bas. | Bon |
| 15 | Analyse + second `tip` | La continuité éditoriale est nette ; la seconde astuce est bien isolée. | Bon |

### Point d’attention

Le rendu actuel valide la composition, mais la substitution typographique TeX Gyre rend certains labels plus fins que prévu. Pour une finition premium, il faudra installer les versions statiques de **Sora**, **Source Serif Pro** et **IBM Plex Mono** avant la version finale d’impression.

### Observations complémentaires

| Page PDF | Élément principal | Observation | Statut |
|---|---|---|---|
| 16 | `impact-quote` intermédiaire | La respiration fonctionne bien et mémorise la thèse secondaire du chapitre. | Très bon |
| 17 | `operator-rule` | Le cadre et la hiérarchie des trois actions sont clairs ; le bloc remplit bien sa fonction opérationnelle. | Très bon |
| 18 | `field-note` | Le fond sombre non absolu et le texte blanc donnent une vraie signature de collection. | Très bon |
| 19 | Transition | La fermeture est courte, nette et bien orientée vers le chapitre suivant. | Très bon |
| 20 | Chapitre 2 existant | Le chapitre suivant n’a pas encore été refondu selon le nouveau rythme ; il conserve l’ancien système. | À planifier pour une passe étendue |

### Conclusion de la revue

Le prototype du chapitre 1 valide la nouvelle direction : ouverture à fort contraste, citation d’impact, alternance récit/bloc, règle opératoire, page Field Note sombre et transition courte. Le système fonctionne dans le PDF compilé et peut servir de base de généralisation au reste du livre.
