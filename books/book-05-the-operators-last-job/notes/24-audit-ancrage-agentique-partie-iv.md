# Audit d’ancrage agentique — Partie IV, chapitres 14 à 16

## Critère de contrôle

La partie IV ne doit pas devenir un traité général de conception de systèmes, d’organisation ou de gouvernance. Elle doit démontrer une conséquence précise de l’évolution récente des IA agentiques : les systèmes ne se contentent plus d’exécuter une instruction stable. Ils observent, récupèrent du contexte, sélectionnent des outils, construisent des plans à étapes, déclenchent des actions, produisent des traces et transmettent des exceptions. Lorsque cette capacité rend l’exécution moins coûteuse et plus rapide, une part du travail humain se déplace vers la conception des conditions dans lesquelles l’exécution est autorisée, limitée, expliquée et réparée.

| Chapitre | Ancrage agentique déjà présent | Risque éditorial | Renforcement retenu |
|---|---|---|---|
| 14. *From Operator to System Designer* | Très solide. La scène démarre par un agent de restauration qui consulte des sources, appelle des outils, prépare un replay, produit une trace et remet une exception. Le chapitre relie contrats d’action, autorité et tests à cette capacité. | Le passage peut parfois être lu comme une conception de systèmes classique. | Ajouter une phrase de bascule explicite : ce travail devient central parce que les agents transforment en actions composées des intuitions qu’un opérateur portait auparavant seul. |
| 15. *The Engineer as Governor* | Solide mais plus diffus. Le broker agentique répartit une capacité de récupération à partir de signaux et d’une politique. La politique devient exécutable à vitesse machine. | Le milieu du chapitre peut être lu comme une gouvernance générique de priorité. | Distinguer explicitement le broker agentique d’une automatisation déterministe : il sélectionne et recompose des lots au fil de l’état courant, ce qui fait voyager l’autorité au runtime. |
| 16. *The Human in the Loop Is Not Enough* | Solide dans la scène. L’agent agrège des droits, simule une correction, cadre la demande, appelle une validation et propose un rollback. | La thèse sur l’approbation tardive peut sembler s’appliquer à tout workflow automatisé. | Ajouter une distinction explicite : les agents contemporains construisent le périmètre, les preuves et la proposition avant l’écran final, ce qui rend une supervision tardive plus faible qu’un contrôle sur une commande stable. |

## Décision éditoriale

Les trois chapitres appartiennent pleinement au livre. Ils répondent à la conséquence humaine de l’IA agentique, non à une évolution abstraite du métier. Les révisions seront **chirurgicales** : elles ne modifieront ni les incidents composites, ni les callouts, ni la progression des chapitres. Elles rendront seulement le lien causal plus lisible à trois endroits :

1. **Chapitre 14 :** agents capables de transformer des intuitions opérationnelles en actions outillées, donc nécessité de concevoir les conditions avant l’incident.
2. **Chapitre 15 :** agents capables de reclasser et de prioriser dynamiquement, donc nécessité de gouverner les objectifs et autorités que l’agent exécute.
3. **Chapitre 16 :** agents capables de composer une proposition et de compresser le contexte avant le bouton d’approbation, donc nécessité de mettre la supervision au bon endroit dans le workflow.

## Règle durable pour la partie IV

> Chaque chapitre de la partie IV doit pouvoir répondre à cette phrase : **« Cette forme nouvelle du travail de l’ingénieur existe parce que les agents peuvent désormais faire eux-mêmes une partie du travail qui était auparavant séparé entre recherche de contexte, planification, exécution et suivi. »**

Si le lien causal ne peut pas être formulé, le passage doit être révisé avant intégration.
