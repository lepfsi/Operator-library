# Contrat lecteur intersectoriel — *The Age of Operational AI*

**Statut :** obligatoire à compter du chapitre 7 ; applicable lors des révisions de consolidation des chapitres antérieurs.

## Positionnement

Le livre conserve l’IT et les opérations techniques comme terrain principal. C’est là que les agents, les identités, les secrets, les permissions et les effets de production sont les plus visibles. Toutefois, la question centrale du livre n’est pas propre à l’IT : **que se passe-t-il lorsqu’une organisation donne à un système la capacité d’interpréter, décider et agir en son nom ?**

Cette question existe aussi en santé, dans les services publics, la finance, la relation client, les ressources humaines, la logistique et les opérations métier. Ces secteurs ne doivent pas apparaître comme une liste d’exemples décoratifs. Ils doivent aider un lecteur non spécialiste à reconnaître le même mécanisme sous une forme familière.

> **Règle directrice :** l’IT fournit la précision opérationnelle ; les autres secteurs fournissent la portée humaine et organisationnelle.

## Règle des deux couches

Chaque idée importante doit être compréhensible à deux niveaux.

| Couche | Fonction | Exemple |
|---|---|---|
| Couche opérationnelle principale | Définir précisément l’enjeu avec une conséquence, une autorité et une preuve. | Un agent de déploiement utilise une identité de workload pour modifier un environnement de production. |
| Couche de translation intersectorielle | Montrer le même mécanisme dans un domaine non IT, sans changer la thèse ni ajouter de jargon. | Un système de prise de rendez-vous utilise une identité pour modifier un créneau ou envoyer une instruction à un patient. |

La couche de translation doit rester brève. Elle n’ouvre pas un second livre. Elle doit aider le lecteur à répondre : *“Je vois ce que cela signifie dans mon organisation.”*

## Règles de vocabulaire

Le premier usage d’un terme IT doit comporter une définition intégrée à la phrase, sans parenthèse lourde ni digression. Les termes courants mais opaques à un lecteur non IT doivent être traduits par leur effet opérationnel.

| Préférer | Éviter sans explication |
|---|---|
| identity: the proof another system uses to recognize an actor | workload identity, service principal, principal |
| credential: a token, key or approval another system accepts | secret material, bearer artefact |
| permission: what an identity is allowed to read, change or send | entitlement graph, IAM policy object |
| production: the live environment where an action affects real users, records or services | prod, live stack |
| audit trail: a record of who acted, when and with what result | telemetry pipeline, observability fabric |

La précision technique reste possible dans les **Source Notes**, les figures ou un callout. Le corps du texte doit toujours commencer par le mécanisme humain et organisationnel : qui agit, sur quoi, avec quelle autorité et quelles conséquences.

## Usage des secteurs non IT

Les exemples hors IT doivent être réels, génériques ou clairement hypothétiques. Ils ne doivent pas produire de conseil médical, financier, juridique ou réglementaire. Lorsqu’un secteur sensible est mentionné, le texte discute de gouvernance et de contrôle, non de décision professionnelle spécifique.

| Secteur | Mécanisme mobilisable | Bon usage éditorial |
|---|---|---|
| Santé | Accès à un dossier, routage d’un message, organisation d’un rendez-vous | Expliquer pourquoi une identité et un périmètre comptent lorsque des informations sensibles ou des rendez-vous sont concernés. |
| Finance | Préparation d’un paiement, tri d’une exception, alerte de fraude | Montrer la différence entre recommandation, approbation et exécution. |
| Services publics | Vérification d’un dossier, orientation d’une demande, communication d’un statut | Montrer que l’automatisation d’un canal ne retire pas l’obligation de correction et d’explication. |
| Relation client | Message, promesse commerciale, geste de service | Expliquer l’ownership d’une décision prise dans un canal automatisé. |
| Logistique | Replanification, commande, allocation de ressources | Illustrer l’action réversible, le stop condition et la récupération. |

## Dose éditoriale

Chaque chapitre conserve un arc unique. Il ne doit pas courir après cinq secteurs différents.

- L’exemple IT reste le cas central lorsqu’il concerne une question de sécurité, de production ou d’identité.
- Un seul exemple de translation intersectorielle est autorisé par section majeure, et seulement s’il éclaire une décision.
- Un chapitre peut contenir un callout **Across Operations** lorsque la translation mérite une pause explicite.
- Aucun exemple ne doit être inventé comme fait. Les exemples hypothétiques sont étiquetés : *“Imagine a scheduling system…”*.
- Les exemples sensibles ne doivent pas être utilisés pour dramatiser. Ils servent à clarifier l’impact humain d’un périmètre, d’une exception ou d’une décision mal attribuée.

## Test anti-profane

Avant l’export, le chapitre doit passer ce test : un responsable métier, un cadre de santé, un responsable de service client ou un dirigeant non technique peut-il comprendre la proposition centrale sans demander une définition externe ? Si la réponse est non, le texte doit ajouter une phrase de translation, pas supprimer la précision.

## Application au chapitre 7

Le chapitre 7, **“Who Owns an AI Agent?”**, conservera une enquête opérationnelle comme cas central. Il utilisera ensuite un exemple de translation dans un contexte de service ou de santé pour montrer que l’ownership n’est pas une question de plateforme. C’est la question de savoir qui répond du système lorsqu’il affecte une personne, un droit, un dossier ou une ressource.
