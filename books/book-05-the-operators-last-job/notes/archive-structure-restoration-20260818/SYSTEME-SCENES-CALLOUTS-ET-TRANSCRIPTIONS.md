# Système de scènes, callouts et transcriptions — *The Operator’s Last Job*

## Principe directeur

Les callouts ne sont pas des jalons obligatoires que le lecteur apprend à prévoir. Ils sont des **changements de mode de lecture**. Leur place et leur forme dépendent de la fonction narrative du chapitre : preuve, hésitation, trace, dissidence, règle, exception ou passage de relais.

> Un lecteur ne doit jamais pouvoir deviner le paragraphe suivant à partir de la couleur du bloc précédent.

La variation ne doit toutefois pas devenir arbitraire. Chaque traitement visuel a un contrat sémantique précis. La forme aide le lecteur à reconnaître *ce qu’il lit*, non à anticiper *ce que le livre va démontrer*.

## 1. Rotation des callouts

Un chapitre utilise normalement deux à quatre callouts de contenu, en plus du `chapter-guide` et du `next-chapter`. Il n’existe aucun ordre fixe. La sélection dépend du type de mouvement demandé par le chapitre.

| Famille narrative | Callouts privilégiés | Fonction | À alterner avec |
|---|---|---|---|
| Scène d’incident | `case-signal`, `system-trace`, `operator-dialogue` | Rendre la situation concrète et permettre au lecteur d’entrer dans la salle. | `field-note`, `dissent-record` |
| Diagnostic et enquête | `the-question`, `assumption-check`, `four-questions`, `process-log` | Montrer les hypothèses plutôt que livrer une conclusion immédiate. | `case-signal`, `boundary-condition` |
| Limites et responsabilité | `boundary-condition`, `exception-register`, `dissent-record`, `decision-ledger` | Nommer ce qui ne peut pas être réduit à un score ou à un runbook. | `operator-note`, `memorable-phrase` |
| Travail réel de l’opérateur | `operator-note`, `field-note`, `routine-map`, `operating-fact` | Montrer les gestes, habitudes et connaissances souvent invisibles. | `case-signal`, `the-shift` |
| Bascule conceptuelle | `the-shift`, `memorable-phrase`, `pullquote`, `hookphrase` | Laisser au lecteur une idée durable sans interrompre le raisonnement. | `the-question`, `decision-ledger` |
| Passage au chapitre suivant | `next-chapter`, très bref. | Faire de la suite une conséquence logique. | Aucun : ce callout est réservé à la sortie. |

### Matrice de variation par partie

| Partie | Signature dominante | Restrictions de variation |
|---|---|---|
| I — *The Operator* | `operator-note`, `routine-map`, `field-note`, `case-signal` | Montrer d’abord le réel. Éviter les callouts de mise en garde trop fréquents. |
| II — *The Automation Curve* | `system-trace`, `the-question`, `assumption-check`, `boundary-condition` | Les preuves et les zones d’incertitude se resserrent à mesure que l’automatisation progresse. |
| III — *What Remains Human* | `dissent-record`, `decision-ledger`, `exception-register`, `operator-note` | Rendre le jugement et la responsabilité tangibles, sans lyrisme abstrait. |
| IV — *The New Engineer* | `design-principle` via `operator-rule`, `four-questions`, `routine-map`, `handoff-note` | Donner au lecteur des cadres de conception et de gouvernance, non des conseils génériques. |

Aucun même callout de contenu ne doit apparaître au même emplacement relatif dans plus de deux chapitres consécutifs. Un chapitre peut ne comporter aucun `case-signal` s’il n’ajoute aucune preuve pertinente ; il ne doit jamais créer un cas pour satisfaire une cadence graphique.

## 2. Langage visuel des scènes

La page doit signaler la nature d’une scène avant même que le lecteur en interprète chaque mot. La typographie n’est jamais un décor : elle indique si l’on lit un dialogue, une trace système, une règle de processus ou une réflexion narrative.

| Nature du passage | Marque Markdown | Traitement PDF | Usage |
|---|---|---|---|
| Dialogue vécu en incident | `::: {.operator-dialogue}` | Sans sérif compacte, liseré latéral et noms de rôle visibles. | 2 à 5 prises de parole qui déplacent réellement la décision. |
| Extrait de log, alerte, console ou trace | `::: {.system-trace}` | Chasse fixe, fond discret, indentation stable. | Données, messages, alertes ou traces présentés comme artefact technique. |
| Étapes d’un processus automatisé | `::: {.process-log}` | Chasse fixe et structure de bloc. | Exécution de runbook, pipeline, succession de contrôles ou étapes agentiques. |
| Désaccord explicite | `::: {.dissent-record}` | Bloc de registre décisionnel. | Une objection, son fondement et la décision conservée. |
| Arbitrage ou autorisation | `::: {.decision-ledger}` | Bloc de décision : hypothèse, risque, autorité, condition de retour. | Moment où une action devient assumée. |
| Commentaire de terrain | `::: {.operator-note}` ou `::: {.field-note}` | Note latérale sobre, en sans sérif. | Contexte humain, exception, miroir hors IT ou observation d’exploitation. |

### Dialogue d’opérateur : norme de rédaction

Le dialogue ne doit pas être mis en italique et abandonné au milieu d’un paragraphe. Il doit rendre visible une situation de travail et permettre au lecteur de comprendre la décision en cours. Chaque intervention doit produire une information, une objection, une contrainte ou un choix ; elle ne sert jamais à créer un effet de théâtre.

```markdown
::: {.operator-dialogue}
**MAYA — Incident Commander:** The recommendation is to fail traffic away from the region.

**LEON — Platform Operator:** It may be right. But the replica is still six minutes behind.

**MAYA:** What changes if we wait?

**LEON:** We lose less traffic now. We may lose the only clean rollback path later.
:::
```

Règles : annoncer le rôle lors de la première intervention ; préférer les verbes et les détails opérationnels à l’exposition ; limiter le dialogue à ce que des voix font mieux qu’une analyse ; réintégrer immédiatement la scène dans la narration. Éviter toute description d’ambiance, tout monologue intérieur et toute mise en tension artificielle. Une scène de dialogue ne peut pas exister uniquement pour dramatiser un point déjà démontré.

### Extrait système : norme de rédaction

Un log, une commande ou une sortie de processus est une **trace**, pas un décor code. Il doit donc garder un horodatage, un état, une source ou une conséquence reconnaissable. Lorsqu’il est composite, il est étiqueté comme tel dans la phrase qui précède ou le suit.

```markdown
::: {.system-trace}
[02:13:08] agent/triage  hypothesis=database_lock  confidence=0.84
[02:13:12] deploy/history  payment-api@14:09  connection_pool=48→96
[02:13:15] guardrail      rollback=blocked  reason="regulated migration window"
[02:13:18] operator       context_required=true
:::
```

Le bloc doit rester entre trois et huit lignes. Il ne doit jamais contenir de fausse précision technique présentée comme un fait documenté. Quand le bloc est écrit pour une scène, il est qualifié de « composite opérationnel » ; quand il provient d’un incident attesté, sa provenance est citée.

### Processus et runbooks

Un système qui exécute des étapes ne parle pas comme un humain. Le passage doit refléter une séquence de conditions et non une prose habillée en code.

```markdown
::: {.process-log}
01  observe      latency > SLO for 5m
02  correlate    deployment + dependency-health + prior incidents
03  recommend    rollback candidate / confidence 0.84
04  pause        approval required: business-impact unresolved
:::
```

## 3. Accessibilité et retenue

La couleur ou la police ne doit jamais être le seul vecteur de sens. Chaque bloc porte un intitulé explicite : *Field Note*, *Operational Composite*, *Decision Ledger*, *System Trace* ou *Dissent Record*. Les lignes en chasse fixe conservent un contraste et une taille suffisants à l’impression. Les callouts ne servent pas à compenser une prose faible ; si le passage n’a pas besoin d’un changement de mode, il reste dans le texte courant. La variété formelle ne doit jamais se transformer en mise en scène cinématographique : l’objectif est la clarté opérationnelle, non le suspense.

## 4. Conversion PDF

La chaîne de conversion prend désormais en charge `operator-dialogue`, `system-trace` et `process-log`, ainsi que les formes éditoriales déjà présentes dans le thème : `case-signal`, `the-question`, `boundary-condition`, `dissent-record`, `decision-ledger`, `exception-register`, `handoff-note` et `routine-map`.

Avant de publier une nouvelle famille de callouts, le chapitre qui l’introduit doit être compilé et vérifié sur PDF. Il faut contrôler l’interligne, la coupure de page, la lisibilité en impression et la cohérence du bloc avec son rôle narratif.

