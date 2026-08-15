# Architecture éditoriale v2 — *The Operator’s Last Job*

> **Statut :** recommandation de travail à valider avant la rédaction continue.
>
> **Décision structurante :** conserver 18 chapitres et l’arc en quatre parties, mais resserrer les titres abstraits, supprimer les doublons de promesse et faire progresser le livre d’une question opérationnelle vers une pratique de gouvernement des systèmes.

## 1. Diagnostic de cohérence

Le blueprint actuel a une excellente colonne vertébrale : il refuse le débat banal du remplacement des ingénieurs et pose la bonne question — *What happens when execution becomes cheap but judgment remains scarce?* Son risque n’est donc pas conceptuel, mais dramatique. Plusieurs titres de la troisième partie sont de simples noms abstraits, les chapitres 1 et 18 répètent presque la promesse du titre, et la dernière partie introduit le rôle de gouverneur avant d’avoir démontré pourquoi le « human in the loop » est insuffisant.

La révision conserve l’économie du livre : **4 / 4 / 5 / 5**. Elle ne cherche pas plus de chapitres ; elle cherche une meilleure poussée narrative. Chaque partie doit changer l’objet de la question : d’abord le travail réel, puis l’extension de l’action automatisée, puis les conditions humaines de la légitimité, enfin les artefacts et institutions qui rendent l’autonomie gouvernable.

| Partie | Question portée | Mouvement narratif | Fin attendue |
|---|---|---|---|
| **I — The Operator** | Quel travail disparaît réellement, et quel travail était invisible ? | Dévoiler le jugement déjà caché dans l’opérationnel. | Le lecteur voit que le terminal n’a jamais été le cœur du métier. |
| **II — The Automation Curve** | Que change l’automatisation lorsqu’elle passe de l’exécution à l’action ? | Monter de la routine à l’agent capable de décider. | Le lecteur comprend où commence le dernier kilomètre de l’automatisation. |
| **III — What Remains Human** | Qu’est-ce qui demeure non délégable, même dans une excellente machine ? | Définir jugement, responsabilité, contexte, permission et retenue. | Le lecteur comprend que l’humain n’est pas un bouton d’approbation. |
| **IV — The New Engineer** | Quel métier faut-il désormais concevoir ? | Passer de l’opération à la conception de frontières et de mémoire. | Le lecteur dispose d’une doctrine de gouvernance, pas d’un slogan. |

## 2. Décision sur la liste des chapitres

La recommandation est de **garder les 18 emplacements**, mais de réviser 10 titres et l’ordre de trois chapitres de la dernière partie. Les nouveaux titres ne changent pas l’idée initiale ; ils donnent à chaque chapitre une thèse et une tension propres.

| # | Titre du blueprint initial | Décision | Titre retenu | Raison éditoriale |
|---:|---|---|---|---|
| 1 | *The Operator’s Last Job* | Remplacer | **When the System Acts First** | Le livre porte déjà ce titre ; le premier chapitre doit ouvrir une scène et non répéter la couverture. |
| 2 | *What Engineers Actually Do* | Conserver | **What Engineers Actually Do** | Bonne promesse corrective ; indispensable pour rendre visible le travail non mesuré. |
| 3 | *The Work We Thought Was Technical* | Resserrer | **The Work We Mistook for Technical** | Rend le malentendu plus actif et prépare le jugement comme travail. |
| 4 | *When Expertise Becomes Data* | Remplacer | **When Expertise Leaves the Room** | Plus humain et plus mémorable : la question devient ce qui se perd quand l’expertise est capturée. |
| 5 | *First We Automated the Routine* | Conserver | **First We Automated the Routine** | Premier palier clair de la courbe d’automatisation. |
| 6 | *Then We Automated the Diagnosis* | Conserver | **Then We Automated the Diagnosis** | Deuxième palier ; doit distinguer corrélation et compréhension. |
| 7 | *Then We Let Machines Act* | Conserver | **Then We Let Machines Act** | Bascule morale et opérationnelle du livre. |
| 8 | *The Day the Runbook Became an Agent* | Resserrer | **When the Runbook Learned to Decide** | Moins daté, plus précis sur la délégation de choix ; chapitre d’introduction de *The Last Mile of Automation*. |
| 9 | *Judgment* | Remplacer | **Judgment Is Not a Prediction** | Évite l’abstraction et oppose clairement discernement et probabilité. |
| 10 | *Responsibility* | Remplacer | **Responsibility Has a Name** | Replace une action automatisée dans une chaîne de responsabilité concrète. |
| 11 | *Context* | Remplacer | **Context Is the Missing Interface** | Le contexte est présenté comme une information non exposée au système. |
| 12 | *Trust* | Remplacer | **Trust Is a Permission** | Transforme la confiance en décision explicite, réversible et bornée. |
| 13 | *Knowing When Not to Act* | Resserrer | **The Decision Not to Act** | Plus net, plus actif ; fait de la retenue une compétence opérationnelle. |
| 14 | *From Operator to System Designer* | Conserver | **From Operator to System Designer** | Pont nécessaire vers les métiers de conception. |
| 15 | *The Engineer as Governor* | Déplacer après 16 | **The Engineer as Governor** | Réponse positive ; elle doit suivre la démonstration que le HITL est insuffisant. |
| 16 | *The Human in the Loop Is Not Enough* | Déplacer avant 15 | **The Human in the Loop Is Not Enough** | Détruit le faux correctif avant de proposer la gouvernance. |
| 17 | *Building Systems Worth Trusting* | Remplacer | **Systems That Remember Why They Acted** | Introduit *Incident Amnesia* et rend la confiance auditable. |
| 18 | *The Last Job Was Never About Typing Commands* | Conserver | **The Last Job Was Never About Typing Commands** | Conclusion juste : elle boucle le livre sans refaire l’ouverture. |

## 3. Table des matières éditoriale déployée

### Part I — The Operator

> **Fonction de partie :** montrer que l’opérationnel a toujours été un travail de lecture, de décision et de coordination, même lorsqu’il prenait la forme d’une commande.

| # | Chapitre | Question précise | Incident d’ancrage recommandé | Sortie intellectuelle |
|---:|---|---|---|---|
| 1 | **When the System Acts First** | Que se passe-t-il lorsque la machine intervient avant que l’ingénieur ait lu l’alerte ? | `Autopilot_Restart_Disaster` | La vitesse n’est pas encore une autorité. |
| 2 | **What Engineers Actually Do** | Que font les ingénieurs pendant les moments que les outils ne mesurent pas ? | `Solo_Engineer_Blackout` | Le travail réel est une réduction d’incertitude sous contrainte. |
| 3 | **The Work We Mistook for Technical** | Pourquoi une action techniquement valide peut-elle être opérationnellement mauvaise ? | `Production_Target_Mixup` | Le travail est aussi politique, relationnel et temporel. |
| 4 | **When Expertise Leaves the Room** | Que perd une organisation lorsque le savoir devient une donnée, un runbook ou un modèle ? | `Creator_Exit_System_Blackout` | Capturer une réponse ne capture pas la raison de la réponse. |

### Part II — The Automation Curve

> **Fonction de partie :** faire monter la délégation : répétition, interprétation, action, puis choix composé. Le lecteur doit sentir que le changement est graduel mais irréversible.

| # | Chapitre | Question précise | Incident d’ancrage recommandé | Sortie intellectuelle |
|---:|---|---|---|---|
| 5 | **First We Automated the Routine** | Quelles tâches auraient dû quitter les humains depuis longtemps ? | `Phantom_Cron_Production` | Éliminer le toil n’est pas déléguer le jugement. |
| 6 | **Then We Automated the Diagnosis** | Que sait une machine qui corrèle mille signaux, et que ne sait-elle toujours pas ? | `Office365_Dashboard` | Le diagnostic automatisé produit une hypothèse, pas une compréhension. |
| 7 | **Then We Let Machines Act** | À quel moment l’automatisation cesse-t-elle d’assister et commence-t-elle à engager l’organisation ? | `Autopilot_Restart_Disaster` | Toute action autonome doit avoir une frontière d’autorité. |
| 8 | **When the Runbook Learned to Decide** | Que devient un runbook lorsqu’il choisit l’action, la séquence et le seuil de confiance ? | `Runbook_Rot_Blindspot` | **Concept introduit : The Last Mile of Automation.** |

### Part III — What Remains Human

> **Fonction de partie :** ne pas « sauver l’humain » par principe, mais isoler les capacités qu’une organisation doit conserver parce qu’elles répondent de l’incertitude, des conséquences et des personnes affectées.

| # | Chapitre | Question précise | Incident d’ancrage recommandé | Sortie intellectuelle |
|---:|---|---|---|---|
| 9 | **Judgment Is Not a Prediction** | Qu’ajoute le jugement à un système qui prédit correctement ? | `Rollback_That_Never_Ran` | Le jugement pondère l’irréversibilité, le moment et l’inconnu. |
| 10 | **Responsibility Has a Name** | Qui répond d’une action lorsque la recommandation est algorithmique mais la conséquence humaine ? | `Identity_Workaround_Ghost` | La responsabilité ne peut pas être déléguée à un journal d’événements. |
| 11 | **Context Is the Missing Interface** | Quelles informations décisives restent hors des tableaux, tickets et modèles ? | `FiveNines_First_Failover` | Le contexte est une interface qu’il faut concevoir, pas un secret à espérer. |
| 12 | **Trust Is a Permission** | Quand un système mérite-t-il le droit d’agir sans demander ? | `Silent_Config_Drift` | La confiance est une permission limitée, observable et révocable. |
| 13 | **The Decision Not to Act** | Comment reconnaître que l’inaction est le choix le plus responsable ? | `Rollback_That_Never_Ran` | La retenue est une compétence, non une absence de compétence. |

### Part IV — The New Engineer

> **Fonction de partie :** déplacer l’identité professionnelle : de la personne qui exécute à celle qui dessine des pouvoirs, des exceptions, de la mémoire et des mécanismes de contestation.

| # | Chapitre | Question précise | Incident d’ancrage recommandé | Sortie intellectuelle |
|---:|---|---|---|---|
| 14 | **From Operator to System Designer** | Quels artefacts faut-il concevoir quand l’action est distribuée entre humains et agents ? | `Firewall_Temp_Rule` | Le nouveau métier dessine des frontières de décision. |
| 15 | **The Human in the Loop Is Not Enough** | Pourquoi un clic d’approbation tardif ne suffit-il pas à rendre une action responsable ? | `Autopilot_Restart_Disaster` | Un humain sans contexte, temps ni droit de refus n’est pas un contrôle. |
| 16 | **The Engineer as Governor** | Comment gouverner les permissions, seuils, exceptions et réversibilités ? | `Production_Target_Mixup` | Gouverner signifie rendre les pouvoirs explicites et contestables. |
| 17 | **Systems That Remember Why They Acted** | Comment empêcher qu’une automatisation réussie efface les raisons, incidents et limites qui l’ont rendue possible ? | `Runbook_Rot_Blindspot` | **Concept introduit : Incident Amnesia.** |
| 18 | **The Last Job Was Never About Typing Commands** | Que garde l’ingénieur lorsque la commande se produit seule ? | `Creator_Exit_System_Blackout` | Le dernier travail est de décider quelle autonomie une organisation peut défendre. |

## 4. Règles de rythme pour la table des matières

Chaque partie contient un chapitre de bascule : le 4 rend visible la perte d’expertise, le 8 fait basculer le runbook vers l’agent, le 13 institue l’inaction comme décision et le 17 transforme la mémoire en exigence de système. Ces chapitres doivent être plus courts, plus tranchants et finir sur une question ouverte qui propulse la partie suivante.

Les titres restent en anglais parce que le livre est publié comme essai international. Les paragraphes, exemples et incidents ne doivent cependant jamais dépendre d’un vocabulaire de fournisseur. Si un terme d’agent, de modèle ou d’outil devient daté, le chapitre doit encore fonctionner grâce à l’incident et au dilemme qu’il expose.

> **Critère de validation de la table des matières :** aucun chapitre ne doit pouvoir être déplacé sans casser la montée de la délégation ou la réponse au chapitre précédent.
