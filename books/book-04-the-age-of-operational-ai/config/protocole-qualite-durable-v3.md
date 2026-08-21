# Protocole de qualité durable — *The Age of Operational AI*

**Statut :** obligatoire à compter du chapitre 6, applicable progressivement aux chapitres 1 à 5 lors de chaque révision.

## 1. Ambition éditoriale

Le livre doit être contemporain sans devenir prisonnier de l’actualité. Il doit expliquer les mécanismes qui survivront aux produits, aux modèles, aux interfaces et aux slogans du cycle technologique actuel. Les faits récents servent de preuves. Ils ne doivent jamais devenir l’argument entier.

> **Règle maîtresse :** l’ouvrage décrit des relations durables entre capacité, autorité, identité, preuve, conséquence et responsabilité. Les outils actuels illustrent ces relations ; ils ne les définissent pas.

## 2. Politique de fraîcheur des sources

Les sources destinées à décrire l’état actuel de l’IA opérationnelle doivent, par défaut, être publiées ou mises à jour en **2025 ou 2026**. Toute exception doit être justifiée dans le dossier d’évidence du chapitre.

| Usage de la source | Exigence de date | Traitement dans le manuscrit |
|---|---:|---|
| Incidents, capacités produit, vulnérabilités, normes en évolution, régulation, adoption | 2025–2026, sauf événement plus ancien indispensable | Date explicite et note de source vérifiable. |
| Référentiels institutionnels | Version active la plus récente | Citer l’édition, la date de mise à jour et l’organisation émettrice. |
| Recherche académique ou expérimentale | Priorité 2024–2026 | Autoriser une source plus ancienne seulement si elle fonde un concept durable. |
| Décision de justice ou incident historique | Sans limite d’âge si la décision est primaire et le mécanisme reste pertinent | Indiquer le contexte et ne pas la présenter comme une tendance récente. |
| Prévision de marché ou opinion experte | Maximum dix-huit mois | Ne jamais l’utiliser comme fait ; indiquer l’auteur, le périmètre et l’incertitude. |

Une source de 2025–2026 ne devient pas automatiquement bonne. La fraîcheur ne remplace ni l’indépendance, ni la méthode, ni la traçabilité.

## 3. Hiérarchie de fiabilité

Chaque fait conséquent doit être rangé dans une catégorie avant d’entrer dans le texte. La meilleure source disponible doit être retenue, non la plus commode.

| Rang | Type de source | Exemples acceptables | Règle d’usage |
|---|---|---|---|
| A | Source primaire ou autorité compétente | Décision officielle, postmortem publié, régulateur, NIST, CISA, ENISA, AISI, CAISI, document technique d’origine | Source préférée pour les incidents, exigences et constats factuels. |
| B | Recherche indépendante, publication évaluée ou institut reconnu | Papier académique, rapport méthodologique transparent, laboratoire public | Utilisable pour expliquer un mécanisme ou nuancer une tendance. |
| C | Presse spécialisée à réputation établie | Enquête qui attribue ses sources et distingue le fait du commentaire | Utilisable pour recouper ou contextualiser, jamais seule si la source primaire existe. |
| D | Analyse d’un fournisseur ou avis professionnel | Blog de sécurité, rapport d’éditeur, cabinet, plateforme | Utilisable pour une perspective ou une analyse ; divulguer implicitement son rôle commercial. |
| E | Réseau social, billet anonyme, forum, agrégateur | Post de fondateur, thread, dépêche non sourcée | Utilisable uniquement comme témoignage attribué, puis recoupé. Jamais comme fait établi isolé. |

Tout cas d’incident doit viser **au moins une source A ou B**, complétée si nécessaire par une source C. Lorsqu’un témoignage E est indispensable, le texte doit employer une formulation limitée : *“the founder publicly reported”*, *“according to contemporaneous reporting”* ou *“the available public record indicates.”*

## 4. Test de pérennité du langage

Avant de retenir un terme, poser la question : **le lecteur comprendra-t-il ce mot et son utilité en 2031, même si les plateformes actuelles ont disparu ?**

| À privilégier | À limiter ou qualifier |
|---|---|
| authority, boundary, evidence, policy, owner, consequence, recovery, identity, permission, delegation, exception | rogue, magic, revolution, sentient, unstoppable, silver bullet, “will replace”, “solves everything” |
| model, system, tool, environment, action, record, assurance | nom de modèle, version d’interface, acronyme marketing, slogan d’éditeur |
| observed, reported, bounded, reversible, attributable | always, never, inevitable, obviously, everyone is doing this |

Les noms de produits, de modèles et de protocoles sont admis lorsqu’ils apportent un fait indispensable. Ils doivent alors être datés et relégués autant que possible aux **Source Notes**. Le corps du texte doit conserver la formulation structurelle : un agent, une identité, un outil, une autorisation, une frontière, une preuve.

Les anticipations ne doivent pas prendre la forme de prédictions décoratives. Elles doivent suivre la structure : **force observée → capacité plausible → condition de sécurité → conséquence si la condition n’est pas remplie**. Ainsi, le livre anticipe sans prétendre connaître l’avenir.

## 5. Contrôle des répétitions et registre des faits

Chaque chapitre doit posséder une **case card** avant rédaction. Une case card comprend le cas retenu, son rôle, son type, sa période, ses sources, son niveau de preuve et les chapitres dans lesquels il est interdit de servir de scène centrale.

| Élément contrôlé | Règle |
|---|---|
| Incident central | Exclusif à un chapitre. Il ne peut réapparaître ailleurs qu’en référence brève et explicitement reliée à une nouvelle idée. |
| Incident de soutien | Peut réapparaître une seule fois si sa fonction analytique diffère clairement. |
| Fait chiffré | Une seule source de vérité, datée, avec période et périmètre. |
| Concept introduit | Définition pleine une seule fois ; rappel bref ensuite. |
| Phrase mémorable | Ne pas recycler une formule de coda, de callout ou de sous-titre. |
| Exemple produit | Ne jamais faire porter à lui seul un argument général. |

Avant compilation, le chapitre passe un **Fact and Distinctiveness Check** : inventaire des faits, recherche de chaque incident dans les chapitres précédents, confirmation des dates et revue du rang de chaque source.

## 6. Règles de style de lecture

La prose doit être continue, respirable et nette. Les paragraphes ne commencent jamais par un alinéa ou une tabulation. La séparation s’obtient par un espace vertical discret entre les paragraphes et non par un retrait de première ligne.

| Règle | Application |
|---|---|
| Alinéa | `0 pt` dans les exports LaTeX. |
| Séparation des paragraphes | Espace vertical léger et constant, sans ligne vide excessive. |
| Longueur de paragraphe | Généralement 45 à 110 mots ; exception seulement si un raisonnement exige une continuité. |
| Callouts | Deux à trois par chapitre, chacun ayant une fonction unique : evidence, control question ou human remainder. |
| Chiffres et sigles | Définir à la première occurrence ; supprimer s’ils ne font pas avancer la décision du lecteur. |
| Titres | Décrire une tension ou une décision, jamais remplir une fonction purement technique. |

## 7. Checklist obligatoire avant chaque export

1. Le chapitre répond-il à une décision durable, et non à une tendance de la semaine ?
2. Son incident central est-il distinct des chapitres précédents ?
3. Chaque fait conséquent possède-t-il une source classée A, B ou C et datée ?
4. Les termes volatils sont-ils datés, définis ou déplacés vers les notes ?
5. Les anticipations sont-elles conditionnelles plutôt que prophétiques ?
6. Chaque callout apporte-t-il une respiration et une décision, plutôt qu’une répétition ?
7. Les paragraphes démarrent-ils sans alinéa et avec un espacement visuellement cohérent ?
8. Les Source Notes distinguent-elles clairement fait primaire, analyse et témoignage rapporté ?
9. Le lecteur peut-il retenir une idée sans dépendre d’un nom de produit actuel ?
10. Le PDF WSL s’ouvre-t-il, est-il contrôlé visuellement, puis déposé dans `exports/` ?

## 8. Application immédiate

Le chapitre 6 appliquera ce protocole intégralement. Les chapitres 1 à 5 seront repris selon une revue de consolidation après la première version de la Partie II : correction des retraits, vérification de fraîcheur et de réputation des sources, harmonisation des Source Notes et contrôle du registre d’incidents.
