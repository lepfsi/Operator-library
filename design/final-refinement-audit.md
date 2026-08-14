# Audit de clôture — Dernière refonte

> **Objet** : valider les derniers ajustements demandés après la v0.1.26 : rythme des actions, frontière entre preuve et fiabilité, concision, vocabulaire des artefacts et lissage des Field Notes.

## Résultats mesurés

| Critère | Résultat | Verdict |
|---|---:|---|
| Chapitres contrôlés | 18 | Validé |
| Séquences de fin complètes et ordonnées | 18 / 18 | Validé |
| Chapitres contenant « This week » | 12 / 18, soit 66,7 % | Validé |
| Tirets longs dans le manuscrit | 0 | Validé |
| Erreurs d’espacement dans le diff | 0 | Validé |
| Chapitre 4 | 1 381 mots, contre 1 518 | Validé |
| Chapitre 10 | 1 286 mots, contre 1 497 | Validé |
| Chapitre 12 | 1 357 mots, contre 1 691 | Validé |
| Chapitre 15 | 1 176 mots, contre 1 344 | Validé |

## Décisions finales

Le chapitre 3 répond désormais à une question étroite : **un chemin nommé peut-il compléter maintenant ?** Le chapitre 5 répond à une autre : **des tentatives comparables tiennent-elles une promesse pour une population, sous des conditions définies et pendant une fenêtre utile ?** Les déclencheurs « At the next monitoring review » et « During the next reliability review » matérialisent cette séparation.

Les termes **Escalation Contract**, **Exception Ledger**, **Capability Map** et **Continuity Review** sont normalisés dans leurs chapitres d’origine et rappelés une seule fois, de façon compacte, dans la conclusion. Ils désignent des enregistrements de travail, non une couche supplémentaire de processus.

Les Field Notes des chapitres 1, 3 et 6 ont été réécrites pour nommer les signaux réellement observés et le mécanisme d’échec propre à chaque incident. Le contrôle ne détecte plus de formulation « green » ou « healthy » dans une Field Note. L’unique formule « green signal » conservée dans le chapitre 18 appartient à la conclusion générale du livre et reste intentionnelle.

## Contrôle de clôture effectué avant publication

La compilation PDF et EPUB de clôture a confirmé l’intégration des Field Notes lissées et une pagination finale de 179 pages. Les trois Field Notes concernées ont été inspectées visuellement ; leurs blocs sont entiers, lisibles et portent des mécanismes distincts.

| Contrôle visuel, Field Note chapitre 1 | Les vues de périmètre, l’absence d’intrusion et la dépendance de base de données sont explicitement distinguées. Le cas ne repose plus sur une formule d’état générique. | Validé. |
| Contrôle visuel, Field Note chapitre 3 | Les réponses ordinaires des composants et le verrou de cache définissent un mécanisme précis. Le bloc est entier et lisible. | Validé. |

| Contrôle visuel, Field Note chapitre 6 | Les signaux de reachability, la protection read-only et l’absence de transaction synthétique sont nettement séparés. Le cas ne repose plus sur une opposition d’état abstraite. | Validé. |

La validation visuelle des Field Notes lissées est terminée. Les blocs sont entiers, non coupés et présentent trois mécanismes d’échec distincts.
