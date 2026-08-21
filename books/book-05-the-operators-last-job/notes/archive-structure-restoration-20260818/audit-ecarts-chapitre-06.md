# Audit des écarts — Chapitre 6 et pipeline du livre 5

## Méthode

Cette comparaison confronte le brouillon récent du chapitre 6 aux référentiels déjà verrouillés : `REFERENCE-DE-PRODUCTION.md`, `notes/03-structure-de-chapitre.md`, `STRUCTURE-PREMIUM-DU-LIVRE.md`, `notes/00-suivi-chapitres.md`, `SYSTEME-CALLOUTS-HARMONISE.md`, `CORRESPONDANCE-COMPOSANTS-FINALE.md`, `config/callouts.lua`, `config/pandoc.yaml` et `scripts/build-book.sh`.

## Écarts constatés

| Domaine | État du brouillon / des changements récents | Exigence verrouillée | Correction requise |
|---|---|---|---|
| Incident d’ancrage | Le chapitre utilise l’incident Google Home et des citations externes. | Le registre des chapitres réserve `Office365_Dashboard` au chapitre 6. | Réécrire la scène d’ancrage autour de la dégradation silencieuse Microsoft 365 et de la lecture erronée du dashboard vert. |
| Accroche du chapitre | Le chapitre commence directement par un titre et une épigraphe. | La cadence installée dans la partie II passe par une scène d’ouverture fonctionnelle avant l’explication ; le chapitre 5 illustre le format `impact-opener` puis guide interne. | Ouvrir par une scène concise du cas d’ancrage, sans décor cinématographique. |
| `In This Chapter` | Le brouillon affiche six éléments, dont plusieurs ne correspondent pas au référentiel. | La structure premium verrouille quatre lignes : *From alerts to explanations* ; *Pattern recognition and its blind spots* ; *The diagnosis that narrows the room* ; *When confidence arrives before context*. | Restaurer exactement les quatre entrées et leurs liens d’ancrage. |
| Mouvements narratifs | Le brouillon porte six intertitres mais ne matérialise pas la séquence complète. | **Scene → Work → Automation → Loss → Contradiction → Principle → Uneasy Question**, avec **Decision Ledger** après la scène et **Vanishing Point** entre Automation et Loss. | Recomposer les sections pour porter les sept mouvements, sans nécessairement afficher un sous-titre pour chacun. |
| Travail humain | Le brouillon décrit le rôle de l’opérateur, mais après un cas non réservé et sans registre explicite de décision. | Le travail réel doit être révélé avant la couche automatisée : attendre, interpréter, comparer, appeler, assumer l’incertitude. | Utiliser le cas Office365 pour montrer l’enquête de l’opérateur avant le mécanisme de corrélation et de recommandation. |
| Callouts | `boundary-condition` est utilisé, et le `field-note` contient une longue scène composite hors IT. | Les composants validés doivent être conformes au système harmonisé et au filtre actif. `Field Note` est une trace mono, courte ; tout nouveau style exige une mise à jour de la correspondance finale. | Remplacer les composants non confirmés par `decision-ledger`, `case-signal`, `distinction`, `operator-note`, `the-question`, `memorable-phrase` ou `next-chapter`, selon leur fonction. |
| Composants actifs | Le patch récent a été appliqué à `templates/render/callouts.lua`. | Le script sélectionne prioritairement `books/book-05-the-operators-last-job/config/callouts.lua`. | Annuler le patch hors périmètre ; ne modifier le filtre local que si la correspondance officielle est mise à jour en même temps. |
| Bibliographie | Une bibliographie `19-selected-bibliography.md` a été ajoutée au répertoire compilé et à `manuscript-files.txt`. | La configuration existante pointe déjà vers `references/references.bib`, et le script compile tous les `.md` du dossier `manuscript` sans lire `manuscript-files.txt`. | Retirer le fichier ajouté du répertoire de compilation ; traiter la bibliographie dans le pipeline bibliographique existant avant toute nouvelle intégration de back matter. |
| Sauvegardes | Plusieurs fichiers `06-*.bak.md` ont été créés dans `manuscript`. | Le script inclut tous les fichiers Markdown non `scaffold`. | Déplacer les sauvegardes hors de `manuscript` vers une archive, afin qu’elles ne créent pas de chapitres dupliqués au PDF. |
| Conventions parallèles | Une charte et un système de scènes additionnels ont été ajoutés alors que des référentiels équivalents étaient déjà verrouillés. | Le référentiel de production prévaut ; la correspondance des composants interdit l’ajout de nouveaux styles sans mise à jour explicite. | Archiver ces documents de travail, puis utiliser uniquement les référentiels verrouillés comme source de production. |

## Décision de correction

Les corrections à appliquer sont de nature **restaurative** : elles doivent supprimer les conventions parallèles, préserver les sauvegardes hors du manuscrit compilé, restaurer l’ancrage Office365, remettre le chapitre 6 dans la cadence validée, et utiliser exclusivement les composants compatibles avec le pipeline actif.

Aucune nouvelle couleur, police, famille de callout ou architecture bibliographique ne sera ajoutée avant que le système existant ne l’exige et ne l’intègre explicitement.
