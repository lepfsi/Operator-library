# Référentiel de production — *The Operator’s Last Job*

> **Statut :** référence de rédaction, de mise en page et de conception pour tout le volume. En cas de conflit entre un chapitre isolé et ce document, ce référentiel prévaut.

## 1. Promesse du livre

*The Operator’s Last Job* est un essai technique international sur ce qui arrive au travail humain lorsque l’action devient facile à automatiser. Il n’oppose pas naïvement l’humain à la machine. Il rend visible une dépossession graduelle : routine, diagnostic, action, début de décision, puis redéfinition de l’identité professionnelle.

> **Ne pas expliquer le futur de l’IT. Montrer l’opérateur en train de le vivre.**

La thèse reste : **What happens when execution becomes cheap but judgment remains scarce?** La peur du lecteur doit être obtenue par l’observation d’une capacité qui cesse de réclamer son intervention, jamais par un slogan sur la destruction des emplois.

## 2. Doctrine de chapitre

Chaque chapitre suit la formule :

> **Scene → Work → Automation → Loss → Contradiction → Principle → Uneasy Question.**

| Mouvement | Ce qu’il doit faire | Dispositif associé |
|---|---|---|
| **Scene** | Commencer dans une décision et non une définition. | Incident principal, heure, signal, conséquence. |
| **Work** | Montrer le travail humain réellement accompli. | Attendre, interpréter, comparer, appeler, assumer l’incertitude. |
| **Automation** | Montrer la couche devenue exécutable sans l’humain. | Mécanisme technique précis, sans inventaire IA générique. |
| **Loss** | Nommer le **Vanishing Point**, la capacité qui ne demande plus l’opérateur. | Petite disparition observable. |
| **Contradiction** | Garder la machine compétente tout en montrant sa limite pour la décision. | *The machine was correct. The decision was still wrong.* |
| **Principle** | Introduire le concept seulement après l’expérience. | Judgment, responsibility, context, trust, restraint, memory. |
| **Uneasy Question** | Terminer sur une inquiétude qui rend le chapitre suivant nécessaire. | Pas de checklist, pas de conclusion consultant. |

Le **Decision Ledger** intervient après la scène : action, autorité, hypothèse cachée, coût d’erreur. Aucun chapitre ne passe en `draft` sans incident d’ancrage, Vanishing Point, contradiction et frontière de décision.

## 3. Charte intérieure

La couverture conserve sa composition validée. L’intérieur utilise une palette institutionnelle et sobre qui traduit la différence entre système, signal et responsabilité.

| Rôle | Nom | Valeur | Règle sémantique |
|---|---|---:|---|
| Texte principal | **Ink** | `#111820` | Prose, titres, traits structurels. |
| Surface | **Paper** | `#F4F1EA` | Fond principal chaud ; jamais blanc pur. |
| Système | **System Blue** | `#3E6278` | Infrastructure, automation, telemetry, evidence et diagrammes. |
| Signal | **Signal Orange** | `#D96B27` | Alerte, action, transition, ligne de frontière, idée centrale. |
| Conséquence | **Consequence Red** | `#8E3B32` | Autorité, irréversibilité, responsabilité et human override ; emploi très rare. |
| Surface technique | **Quiet Grey** | `#E7E9E7` | Fonds ponctuels de logs, ledgers et éléments opérationnels. |

Le rouge ne signifie jamais simplement « erreur ». Une action techniquement réussie peut recevoir un accent rouge parce qu’elle engage une conséquence ou une autorité irréversible.

## 4. Typographie et matière

| Niveau | Famille de référence | Repli de compilation | Usage |
|---|---|---|---|
| Titres et questions | **Source Serif 4** | TeX Gyre Schola | Réflexion, tension, questions ouvertes, citations. |
| Prose, métadonnées, notes | **IBM Plex Sans** | TeX Gyre Heros | Matériau institutionnel, opérationnel et lisibilité internationale. |
| Logs et commandes | **IBM Plex Mono** | TeX Gyre Cursor | Timestamps, configuration, commandes et preuves machine. |

Deux familles seulement sont visibles à la fois : une serif pour le jugement humain et une sans/mono pour le système. Le livre évite le dark mode, les polices startup, les dégradés, les ombres et les cartes décoratives.

## 5. Langage de callouts

Les callouts font respirer un texte dense ; ils ne constituent jamais un second livre parallèle. Ils obéissent à une fonction unique et à une fréquence maximale.

| Composant | Fonction | Traitement | Fréquence cible |
|---|---|---|---|
| **Proposition** | Énoncer l’idée à retenir. | Ligne orange verticale fine, sans boîte, une phrase. | 1–2 par section. |
| **Question** | Créer une respiration philosophique. | Grande serif, espace blanc, orange seulement sur le marqueur. | 1 par grande section. |
| **Operator Note** | Donner une observation opérationnelle concrète. | Fond Quiet Grey, sans-serif, marge latérale ou pleine largeur. | 1 par chapitre. |
| **Case Signal** | Condenser un fragment d’incident réel. | Label System Blue, texte court. | 1–2 par chapitre. |
| **Distinction** | Séparer deux concepts fondamentaux. | Lignes espacées sans boîte. | 1 par chapitre. |
| **Mini-diagramme** | Montrer une relation plutôt que l’expliquer longuement. | Ink + System Blue, Orange au seuil de décision, Red sur la conséquence. | 1–2 par chapitre. |
| **Field Note** | Donner une texture de terrain ou de timestamp. | Mono, structure courte, très peu fréquent. | Occasionnel. |

Une ligne verticale Signal Orange, très fine, est le marqueur graphique récurrent. Elle représente une frontière : intervention, autorité, seuil ou bascule de décision.

## 6. Règles de diagrammes

Les diagrammes ne sont jamais des mini-tableaux de bord. Ils emploient des traits fins, de l’espace blanc et une logique causale claire.

```text
SYSTEM → EVIDENCE → DECISION → ACTION
                   │
              AUTHORITY
```

Les nœuds automatisés sont bleu/gris. Le point où la décision engage une responsabilité reçoit Orange ou Red. Aucun dégradé, aucune ombre, aucune icône décorative et aucune carte SaaS.

## 7. Copie de quatrième de couverture

La copie validée est conservée dans `design/quatrieme-couverture-copy.md`. Son point de départ est immuable :

> **THE SYSTEMS CAN ACT.**  
> **THE QUESTION IS WHETHER WE STILL KNOW WHAT AN ACTION MEANS.**

La ligne de tension retenue est :

> *When execution becomes cheap, the work does not simply disappear. It moves.*

## 8. Test de qualité internationale

Avant publication, chaque chapitre doit réussir quatre tests :

1. **Test de scène :** le lecteur entre-t-il dans une situation avant de recevoir une thèse ?
2. **Test de perte :** peut-il nommer la capacité qui a changé de propriétaire ?
3. **Test de contradiction :** la machine peut-elle être compétente sans que le chapitre devienne technophobe ?
4. **Test de mémoire :** reste-t-il une phrase, une image ou une question difficile après la dernière page ?

Le chapitre n’est pas international parce qu’il emploie des mots anglais. Il l’est parce qu’un opérateur, un responsable technique ou un ingénieur, dans n’importe quelle organisation, reconnaît la décision qu’il n’a pas encore eu à prendre.
