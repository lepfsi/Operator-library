# Audit de callouts — Partie III avant le chapitre 12

## Diagnostic

Les chapitres 9 à 11 ne doivent pas perdre leurs respirations éditoriales. Chacun a été conçu avec **sept callouts substantiels**, hors impact opener, navigation de chapitre et bibliographie. La variation porte sur la **famille** et la **position** des blocs, non sur leur suppression.

Un défaut concret a toutefois été identifié dans le chapitre 11 : la classe Markdown `process-output` n’était pas reconnue par le filtre actif `config/callouts.lua`. Le contenu pouvait donc ne pas être rendu avec son enveloppe premium attendue. Le chapitre utilise désormais la classe reconnue `system-statement`, qui produit le composant titré **Process Output** du thème. Cette correction doit être synchronisée avec la prochaine compilation.

| Chapitre | Callouts substantiels prévus | Fonction dominante | État |
|---|---:|---|---|
| 09 — *Judgment* | System Statement, Case Signal, Decision Ledger, Assumption Check, Operator’s Note, The Question, Memorable Phrase | Distinguer prévision et jugement. | Conforme. |
| 10 — *Responsibility* | Field Note, Traceback, Dissent Record, Operator’s Note, Boundary Condition, The Question, Memorable Phrase | Reconstruire une action et la capacité de réparation. | Conforme. |
| 11 — *Context* | Field Note, Process Output, Assumption Check, Boundary Condition, Handoff Note, The Question, Memorable Phrase | Rendre visible le fait qui change la signification d’une action. | Corrigé : Process Output doit passer par `system-statement`. |

## Règle active de cadence

> Chaque chapitre rédigé contient **5 à 7 callouts substantiels**. L’objectif n’est pas l’uniformité, mais une respiration lisible, une mémorisation réelle et une progression visuelle qui ne se laisse pas anticiper mécaniquement.

| Fonction nécessaire | Formes possibles | Règle |
|---|---|---|
| **Entrée située** | Field Note ou Process Output | Une seule forme d’entrée, selon la nature de l’incident. |
| **Signal de risque ou de contradiction** | Case Signal, Assumption Check, Traceback, Dissent Record | Au moins une par chapitre. |
| **Limite d’action ou d’autorité** | Boundary Condition, Decision Ledger, Operational Question | Au moins une par chapitre. |
| **Voix humaine, engagement ou passage de témoin** | Operator’s Note, Handoff Note, Human Exchange | Utiliser lorsqu’elle rend le coût humain plus visible, non comme ornement. |
| **Question et rémanence** | The Question, Memorable Phrase | Préserver une question utile et une phrase mémorable distincte de l’ouverture. |

## Rotation, non disparition

Aucun des concepts visuels importants ne doit rester absent plus de deux chapitres consécutifs sans raison narrative claire. En pratique, la Partie III doit continuer à faire revenir régulièrement **Case Signal**, **Operator’s Note**, **Decision Ledger**, **The Question** et les formes de trace ou de passage de témoin. Le chapitre 12 doit donc réintroduire des formes qui n’étaient pas centrales dans le chapitre 11, sans reproduire sa séquence.

## Vérification obligatoire avant compilation

1. Confirmer que toutes les classes Markdown employées sont présentes dans `config/callouts.lua`.
2. Compter les callouts substantiels et vérifier le plafond de 5 à 7.
3. Contrôler qu’au moins une forme de risque, une limite d’action, une voix humaine ou un handoff, et une phrase mémorable sont visibles.
4. Vérifier dans le PDF que le titre du composant et son cadre sont rendus, particulièrement pour Process Output, Traceback, Dissent Record et Handoff Note.
