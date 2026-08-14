# Beyond the Firewall — Roadmap de révision terrain v0.1

> **Objectif** : réduire la répétition éditoriale sans affaiblir les principes forts du livre, puis transformer les meilleurs chapitres en outils plus directement utilisables.
>
> **Méthode** : un seul problème éditorial par lot, un maximum de deux chapitres modifiés par lot, compilation et inspection visuelle avant chaque publication.

## Diagnostic de départ

Le retour de terrain confirme que le livre possède une voix crédible, des Field Notes efficaces, des concepts mémorisables et une conclusion solide. La faiblesse principale n’est pas le manque de substance. C’est la répétition du même mouvement : un écran rassurant, un parcours utilisateur dégradé, puis l’invitation à regarder au-delà du signal.

Le diagnostic local confirme la zone la plus dense. Les chapitres 3 et 4 emploient ensemble `green` ou `dashboard` 66 fois. Ils sont utiles, mais leurs mécanismes se recouvrent : le chapitre 3 doit rester le diagnostic technique de la preuve insuffisante ; le chapitre 4 doit devenir l’étude de la décision humaine quand une preuve familière contredit un signal inconfortable.

| Priorité | Problème à traiter | Décision de révision | Lot de publication |
|---|---|---|---|
| **P0** | Répétition du schéma « green is not healthy » | Distinguer le rôle technique, psychologique, de fiabilité et de récupération des chapitres 3 à 6. | Lots 1 et 2 |
| **P1** | Manque d’artefacts réutilisables | Ajouter Recovery Proof, Incident Bridge, Absence Drill et Assumption Review sans multiplier les encadrés décoratifs. | Lots 3 à 5 |
| **P2** | Chapitres qui reprennent un mécanisme déjà acquis | Raccourcir et faire progresser les chapitres 10, 12 et 13 au lieu de répéter leurs prémisses. | Lots 3 et 4 |
| **P3** | Règles parfois générales | Réécrire les Operator’s Rules comme des actions faisables cette semaine, avec un périmètre et une preuve attendue. | Lot 6 transversal |
| **P4** | Field Notes trop semblables | Varier les preuves : signal rouge et mauvaise décision, bonne intention mal conçue, récupération réussie grâce à une pratique. | Lot 6 transversal |

## Contrat de révision

La navigation, les ouvertures noires, les Field Notes, les séquences de fin et l’identité Bone / Ink / Saffron sont conservées. Aucun chapitre n’est supprimé ou fusionné dans cette première révision. Le livre garde donc ses dix-huit chapitres et sa progression existante, mais chaque chapitre acquiert un territoire intellectuel plus net.

Chaque lot respecte les règles suivantes : aucun tiret long dans le manuscrit, un maximum de deux Operating Facts par chapitre, une action vérifiable, puis compilation PDF et EPUB. Une publication n’intervient qu’après contrôle de la structure de fin, de la pagination des callouts et de la lisibilité des pages touchées.

## Lot 1 — Différencier le diagnostic et le biais de confiance

| Chapitre | Rôle révisé | Ce qui reste | Ce qui est retiré ou déplacé | Livrable opérationnel |
|---|---|---|---|---|
| **03. Everything Was Green. Everything Was Broken.** | Le chapitre de la **preuve technique insuffisante**. Il explique ce qu’un contrôle vérifie réellement, la différence entre disponibilité de composant et réussite de transaction, puis la conception d’un signal utile. | Deadlock, Monitoring Illusion, transaction synthétique. | Les développements sur le réconfort, la défense du tableau de bord et la psychologie d’incident. | Une méthode compacte de définition d’une transaction synthétique. |
| **04. When Monitoring Becomes a Comfort Blanket** | Le chapitre du **biais opérateur**. Il explique comment une preuve familière change l’ordre d’enquête, écarte un retour utilisateur et fait durer l’incident. | Comfort Blanket Monitoring, support queue, drill sans dashboard. | Les explications répétées sur les pings, ports, seuils et composants déjà couvertes par le chapitre 3. | Un protocole de réponse quand l’utilisateur contredit les signaux familiers. |

**Critère d’acceptation du lot 1** : après lecture des seuls titres de sections et callouts, un lecteur doit pouvoir dire que le chapitre 3 traite de la qualité d’une preuve technique et que le chapitre 4 traite de la manière dont une équipe se laisse rassurer par une preuve incomplète.

## Lot 2 — Construire un vrai pivot vers fiabilité et récupération

| Chapitre | Rôle révisé | Intervention |
|---|---|---|
| **05. The Difference Between Working and Being Reliable** | La définition de succès dans le temps et du point de vue utilisateur. | Resserrement autour des critères de service, de la variabilité et de l’issue attendue. Les règles deviennent des actions hebdomadaires fondées sur un parcours critique. |
| **06. Availability Is Not Resilience** | La capacité de récupération d’un parcours critique. | Préserver le cas read-only failure. Remplacer la généralité sur MTTR par un cas où un MTTR favorable masque une récupération catastrophique du parcours qui compte. |

**Critère d’acceptation du lot 2** : le lecteur rencontre quatre questions différentes, sans redite : *le signal répond-il à la bonne question ?*, *pourquoi l’équipe croit-elle trop vite ce signal ?*, *le résultat est-il fiable dans le temps ?*, *peut-on réellement récupérer l’issue critique ?*

## Lot 3 — Renforcer la Partie II par des preuves de récupération

| Chapitre | Intervention | Artefact concret |
|---|---|---|
| **07. Hope Is Not a Rollback Strategy** | Distinguer rollback applicatif, schéma ou données, et configuration. | **Recovery Proof** : champs minimaux à remplir dans un change ticket avant exécution. |
| **10. When Temporary Becomes Architecture** | Réduire d’environ un cinquième le récit de genèse déjà installé au chapitre 2. Ouvrir directement sur l’audit et les coûts organisationnels. | Audit de réversibilité d’une exception et décision de conservation, absorption ou retrait. |

## Lot 4 — Clarifier la capacité institutionnelle de la Partie III

| Chapitre | Rôle révisé | Intervention |
|---|---|---|
| **11. Incident Response Is Decision Making Under Pressure** | Outil de décision sous pression. | Formaliser l’Incident Decision Loop sous forme d’un **Incident Bridge** : observation, orientation, décision, action, propriétaire et preuve. |
| **12. The Cost of Tribal Knowledge** | Diagnostic du risque : où et pourquoi la connaissance tacite concentre le danger. | Éviter de répéter la prescription du chapitre 15. Raccourcir les passages qui réexpliquent la documentation. |
| **13. Why Documentation Fails** | Documentation produite dans le flux de travail. | Raccourcir la démonstration ; conserver Runbook Rot et renforcer la preuve d’usage. |
| **14. The Human Configuration Error** | Conception des garde-fous. | Ajouter des exemples concrets : identités séparées, aperçu de changement, confirmation ciblée, jeton de changement, double contrôle à fort impact. |
| **15. Designing for the Day You Are Not There** | Prescription de capacité collective. | Intégrer un **Absence Drill** qui vérifie qu’une équipe peut opérer un chemin critique sans son détenteur habituel. |

## Lot 5 — Ancrer la Partie IV dans la pratique

| Chapitre | Intervention | Artefact concret |
|---|---|---|
| **17. Building Operational Resilience** | Éviter de renommer une idée de rehearsal déjà acquise. Concentrer le chapitre sur le design d’un exercice utile. | Canevas de récupération : unité récupérable, perturbation, critère de succès, stop condition, preuve, correction et répétition. |
| **18. The Operator’s Mindset** | Convertir la conclusion de chapitre en cinq disciplines très nettes. | Une page d’**Assumption Review** : hypothèse, preuve fraîche, changement possible, vérification sûre, décision. |

La conclusion et ses cinq operating truths sont préservées.

## Lot 6 — Audit transversal final

Cet audit intervient seulement après les cinq lots précédents. Il ne sert pas à ouvrir une nouvelle réécriture. Il vérifie que les Operator’s Rules commencent par une action exécutable dans la semaine, que les Field Notes varient les types de preuve et que les chapitres 4, 10, 12 et 13 ont gagné en rythme sans perdre leur utilité.

| Contrôle | Seuil d’acceptation |
|---|---|
| Répétition | Aucun chapitre ne répète la thèse du chapitre précédent sans lui donner une fonction nouvelle. |
| Operator’s Rules | Chaque règle indique une action, un objet précis et une preuve attendue. |
| Field Notes | Les nouveaux cas couvrent au minimum une mauvaise décision malgré un signal rouge, une bonne intention mal conçue et une récupération réussie grâce à une pratique. |
| Rythme | Les chapitres signalés comme longs sont raccourcis ou segmentés sans réduire la taille typographique. |
| Visuel | Aucun callout n’est coupé ; chaque artefact ajouté reste un élément d’action, pas une carte décorative. |
| Publication | Chaque lot produit une release PDF et DOCX distincte, contrôlée avant le lot suivant. |

## Ordre d’exécution

1. **Lot 1** commence maintenant, uniquement sur les chapitres 3 et 4.
2. **Lot 2** ne commence qu’après validation et publication du lot 1.
3. Les lots 3 à 5 suivent dans cet ordre et conservent le même protocole de contrôle.
4. Le lot 6 clôture la révision par un audit transversal et une release finale.

Cette séquence privilégie la clarté du livre avant l’ajout d’outils. Elle évite de modifier plusieurs mécanismes interdépendants en même temps et rend chaque amélioration facile à relire, commenter ou annuler.
