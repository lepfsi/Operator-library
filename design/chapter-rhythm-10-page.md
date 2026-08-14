# Standard de chapitre — Rythme éditorial à dix pages

> **The Operator’s Library**
> Version 1.0 — standard de rédaction et de composition applicable à toute la collection.

---

## 1. Intention éditoriale

Chaque chapitre doit fonctionner comme un **outil de pensée** : il pose une thèse avec force, raconte un incident concret, expose un mécanisme invisible, puis livre une action vérifiable. L’objectif n’est pas de produire une narration continue ; le lecteur doit pouvoir s’arrêter, retrouver une idée et agir sans perdre le fil.

> **Principe de composition :** chaque bloc a une fonction unique — accrocher, définir, alerter, enseigner, synthétiser ou faire respirer.

La prose reste en anglais dans les manuscrits. Les conventions de production, les noms de styles et les règles de rendu sont rédigés ici en français afin de guider l’équipe éditoriale.

---

## 2. Jetons visuels communs

| Élément | Valeur | Rôle |
|---|---|---|
| Fond sombre | `#262626` | Ouvertures, Field Notes et repères de collection ; jamais noir absolu. |
| Fond clair | `#F2EDE3` | Surface Bone pour les pages de lecture et les respirations. |
| Texte courant | `#161616` | Corps de texte et titres principaux. |
| Gris de structure | `#948E84` | Métadonnées, filets, légendes et séparateurs. |
| Décision | `#F2A900` | Saffron pour numéros, règles et repères de passage. |
| Méthode | `#1C6B5A` | Forest pour concepts stables et actions de diagnostic. |
| Risque | `#D95332` | Warnings et pièges opérationnels. |
| Corps | Source Serif Pro, 10,5 pt / 17 pt | Lecture longue, dense et confortable. |
| Titres et labels | Sora, 7–18 pt | Hiérarchie, scannabilité et rythme. |
| Code | IBM Plex Mono | Commandes, identifiants et extraits techniques. |

Les titres de section utilisent une sans serif SemiBold 18 pt et le safran. Les labels de blocs utilisent des petites capitales avec un espacement de lettres généreux. Les citations d’impact sont en serif italique à 40–52 pt selon le format final.

---

## 3. Grammaire de rédaction

Un chapitre suit une progression en neuf mouvements : **thèse visuelle, situation, mécanisme, piège, analyse, respiration, actions, preuve terrain, transition**. La prose doit privilégier les verbes concrets, les mécanismes causaux et les conséquences pour l’utilisateur.

| À privilégier | À éviter |
|---|---|
| Une scène située : moment, système, friction, décision. | Une introduction abstraite ou encyclopédique. |
| Des paragraphes de deux à cinq phrases, avec une idée par paragraphe. | Des blocs continus qui mélangent incident, analyse et conseil. |
| Des verbes précis : map, trace, separate, expire, test, remove. | Des verbes flous : leverage, optimize, ensure, transform. |
| Une thèse formulée comme une opposition nette. | Une conclusion diluée ou une accumulation de réserves. |
| Des blocs d’action qui énoncent un propriétaire, une fréquence ou un critère. | Des recommandations sans condition d’exécution. |

Chaque chapitre doit contenir un incident anonymisé, un concept système ou une clarification de vocabulaire, un seul **Operator’s Rule** de trois actions maximum, un **Field Note**, et une transition de moins de 110 mots. La phrase mémorable doit être lisible hors contexte et tenir en 15 mots au plus.

---

## 4. Rythme de référence

| Séquence | Densité | Fonction | Marquage Markdown |
|---|---:|---|---|
| 1–2. Ouverture | 0 % | Poser le numéro et la thèse par contraste visuel. | `impact-opener`, puis `impact-quote` |
| 3. Récit | 40 % texte / 20 % bloc | Situer la panne et offrir un conseil immédiat. | `tip` |
| 4. Concept | 30 % texte / 30 % bloc | Nommer le mécanisme qui organise le chapitre. | `concept` |
| 5. Leurre | 30 % texte / 25 % bloc | Déconstruire la fausse croyance. | `warning` |
| 6. Analyse | 30 % texte / 20 % bloc | Expliquer pourquoi le problème persiste. | `tip` ou `important` |
| 7. Respiration | 0 % | Faire retenir une idée structurante. | `impact-quote` |
| 8. Action | 10 % texte / 40 % bloc | Rendre la leçon praticable dans la semaine. | `operator-rule` |
| 9. Preuve terrain | 0 % hors bloc | Synthétiser l’incident et la leçon. | `field-note` |
| 10. Transition | 15 % | Ouvrir une question vers le chapitre suivant. | texte bref + règle fine |

La pagination exacte dépend du volume du chapitre et du format de sortie. Le rythme est une **intention de composition** : un chapitre plus long répète les paires récit/analyse, mais conserve une seule ouverture, une seule respiration d’impact, un seul Operator’s Rule et un seul Field Note.

---

## 5. Blocs éditoriaux obligatoires

| Bloc | Mission | Contraintes rédactionnelles |
|---|---|---|
| `impact-opener` | Introduire le chapitre avec un numéro monumental. | Sans texte dans le manuscrit ; rendu automatisé. |
| `impact-quote` | Installer ou faire résonner la thèse. | Une à deux lignes, aucun commentaire. |
| `tip` | Débloquer une action de diagnostic. | Deux à quatre phrases ; commencer par un verbe. |
| `concept` | Définir un terme de la collection. | Label, nom en capitales, définition de 30–60 mots. |
| `warning` | Rendre visible une erreur de raisonnement. | Une conséquence claire, jamais alarmiste. |
| `operator-rule` | Donner trois actions opérationnelles. | Chaque ligne précise quoi faire et à quel rythme. |
| `field-note` | Fixer la preuve issue du terrain. | Cinq champs : Context, What We Expected, What Happened, What We Missed, What It Taught Us. |
| `keytakeaways` | Conserver les idées réutilisables. | Trois à cinq points ; une phrase par point. |

---

## 6. Règles de rendu et de contrôle

Les pages d’impact et de Field Note ne portent ni folio ni en-tête. Le Field Note utilise le fond `#262626`, du texte Chalk `#FBF7EF` et un filet discret ; le fond ne doit jamais être `#000000`. Les encadrés restent plats, sans ombre décorative ni angle arrondi marqué. Le texte principal ne contourne un bloc flottant que si le format de sortie le permet sans dégrader l’accessibilité EPUB.

Avant revue, vérifier que le chapitre alterne texte et bloc toutes les deux à trois pages, qu’aucune page standard ne contient plus d’un encadré, et que les recommandations sont spécifiques au mécanisme observé. Le lecteur doit pouvoir comprendre la thèse en lisant l’ouverture, le concept, la règle, le Field Note et la transition.

---

## 7. Ordre de rédaction recommandé

Rédiger d’abord le Field Note et la phrase mémorable. Écrire ensuite le récit d’ouverture en retirant tout ce qui ne sert pas la scène. Définir le concept, puis construire l’analyse autour de trois mécanismes au plus. Enfin, transformer les implications en trois actions mesurables et écrire une transition qui introduit une tension, plutôt qu’un résumé.

> **Critère de réussite :** le chapitre est dense, fonctionnel et scannable ; il ne ressemble ni à un roman ni à une note de consultant.
