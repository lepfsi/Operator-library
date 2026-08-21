# Layout Standard v2
## *The Age of Operational AI*

## Mission éditoriale

Le livre doit avoir l’autorité calme d’une non-fiction internationale de haut niveau. L’intérieur n’imite ni un rapport technique, ni un manuel scolaire, ni une interface SaaS. Il donne au lecteur un texte long et exigeant qui reste fluide, respirant et traçable.

## Système de pages

| Rôle | Standard |
|---|---|
| Surface intérieure | `Natural Paper` : `#FAF8F3` pour les proofs PDF, papier naturel non couché pour l’édition imprimée. Aucun aplat de couleur sur les pages de prose. |
| Texte | `Carbon` : `#202124`. |
| Navigation | `Warm Grey` : `#6C6A66`. |
| Règles et séparateurs | `Stone Rule` : `#B7B0A6`. |
| Accent rare | `Quiet Umber` : `#7B4B3A`, réservé aux signaux de partie, de callout ou de coda. |
| Bleu | Interdit comme accent structurel permanent. |

## Typographie de publication

La paire de publication est **Tiempos Text** pour le corps et **Söhne** pour la navigation et les titres, sous licence. Les proofs utilisent TeX Gyre Pagella et Latin Modern Sans tant que ces licences ne sont pas installées dans WSL.

Le corps est composé autour de 10.6 / 14 pt, justifié avec césure anglaise contrôlée, retrait de première ligne et sans espace systématique entre paragraphes. Les sous-titres ne sont jamais numérotés dans le livre publié.

## Architecture d’un chapitre

Une ouverture de chapitre commence sur un recto, sans header ni folio. Elle contient le numéro de chapitre discret, le titre, un deck de 35 à 50 mots et le nom de la partie. Le corps commence ensuite sur une nouvelle page.

Les pages de prose utilisent le titre du livre au verso, le titre du chapitre au recto et le folio à l’extérieur du pied de page. Les headers et folios sont retirés des pages de titre, d’ouverture, de coda, blanches et de notes.

## Dispositifs de respiration

| Dispositif | Limite | Rôle |
|---|---:|---|
| Evidence Note | 0–1 / chapitre | Donner une distinction, un incident ou un fait vérifiable. |
| Control Question | 1–2 / chapitre | Faire s’arrêter le lecteur sur une décision opérationnelle. |
| The Human Remainder | 1 / chapitre | Rappeler le jugement qui ne doit pas être délégué. |
| Chapter Coda | 1 / chapitre | Retenir trois idées et faire passer au chapitre suivant. |

Un callout n’est jamais ajouté pour décorer une page. Il doit soit poser une décision, soit fournir une preuve, soit désigner une limite humaine.

## Parties et éléments liminaires

Le livre publié comprend : half title, title page, copyright page, sommaire, Introduction, parties, chapitres, conclusion, Source Notes, Further Reading, acknowledgements et About the Author. Un Foreword est optionnel et ne sera ajouté que s’il est écrit par une voix indépendante qui apporte une valeur réelle.

Les ouvertures de partie reposent sur l’espace, le titre et une phrase de tension. Elles ne reposent pas sur un aplat sombre ou une couleur de couverture répétée.

## Sources et bibliographie

Le livre utilise le style Chicago Notes–Bibliography adapté en maison de style. Les appels de note soutiennent uniquement les affirmations vérifiables, incidents, chiffres et citations. Les **Source Notes** sont composées en fin de livre, groupées par chapitre. Une sélection de **Further Reading** curatée suit les notes. Les liens vivants et vérifications post-publication rejoignent un registre numérique versionné.

## Compilation obligatoire

Chaque chapitre final doit être compilé dans Ubuntu WSL avec XeLaTeX, contrôlé visuellement, puis déposé en PDF dans `exports/`. Les pages de proof et les indicateurs de statut sont réservés aux exports internes, jamais au livre de lecture final.
