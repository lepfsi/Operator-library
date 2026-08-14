# Audit transversal de révision — Beyond the Firewall

> **Objet** : valider que la campagne de révision issue du retour terrain a diminué les répétitions, augmenté la part d’outils utilisables et conservé le rythme du manuel.
>
> **Portée** : les dix-huit chapitres publiés. Référentiel de départ : `design/roadmap-revision-terrain-v0.1.md`.

## Résultats des contrôles

| Contrôle | Résultat | Verdict |
|---|---:|---|
| Chapitres contrôlés | 18 | Validé |
| Séquence de clôture complète et ordonnée | 18 / 18 | Validé |
| Field Notes | 18 | Validé |
| Operator’s Rules | 18 | Validé |
| Repères Operating Fact | 18 | Validé |
| Chapitres avec action immédiate ou exercice explicite | 18 / 18 | Validé |
| Tirets longs dans le manuscrit | 0 | Validé |
| Erreurs d’espacement dans le diff | 0 | Validé |

## Réduction de la répétition

Le motif « signal vert, système en échec » a été recentré sur son rôle fondateur au chapitre 3 et sur sa réinterprétation finale au chapitre 18. Les six occurrences restantes incluent le titre du chapitre 3, une transition de navigation, et trois usages intentionnels dans la conclusion du chapitre 18. Elles ne servent plus de mécanisme narratif interchangeable dans les chapitres de fiabilité, de récupération ou de gouvernance.

Les chapitres 3 et 4 distinguent désormais la **validité d’une preuve technique** du **biais de confiance**. Les chapitres 5 et 6 séparent la promesse de fiabilité de la récupération réelle. Les chapitres 12, 13 et 15 séparent respectivement la capacité partagée, la documentation vivante et la continuité institutionnelle.

## Outils ajoutés ou renforcés

| Zone | Outil opérationnel | Fonction |
|---|---|---|
| Chapitre 3 | Transaction synthétique | Vérifier un résultat utilisateur, pas seulement un composant. |
| Chapitre 5 | Reliability Claim | Définir résultat, population, conditions et fenêtre de temps. |
| Chapitre 7 | Recovery Proof | Préparer une récupération vérifiable dans un change ticket. |
| Chapitre 10 | Exception Ledger | Auditer une exception vivante, sa réversibilité et son coût cognitif. |
| Chapitre 11 | Incident Bridge format | Rendre la décision d’incident courte, visible et révisable. |
| Chapitre 12 | Capability Map | Prouver qu’un second opérateur peut agir. |
| Chapitre 15 | Continuity Review | Gouverner la dépendance à une personne et la preuve de continuité. |
| Chapitre 16 | Causal Path Map | Visualiser un handoff et sa boucle de délai. |
| Chapitre 17 | Recovery Exercise Card | Exercer, observer, réparer puis effectuer un test de retour. |
| Chapitre 18 | Operator cadence | Ancrer les disciplines quotidiennes, hebdomadaires et mensuelles. |

## Contrôle visuel

Le schéma causal du chapitre 16 a été rendu de façon déterministe, inspecté dans le PDF puis ajusté en orientation et en échelle. Il est désormais inclus dans le PDF et l’EPUB sans légende automatique concurrente de la pagination. Les cartes `Recovery Exercise Card` et `Operator cadence` ont également été contrôlées visuellement : elles sont entières, lisibles et non coupées.

## Conclusion

La révision conserve l’autorité de praticien du livre, mais déplace son centre de gravité de l’affirmation vers la preuve, l’exercice et la décision. Chaque chapitre laisse désormais au lecteur un point d’action explicitement déclenchable ou un exercice borné.
