# Référentiel éditorial de production, version 1.1

> **Collection** : *The Operator’s Library*
>
> **Livre pilote** : *Beyond the Firewall*
>
> **Auteur** : **Steve BA-NDOUWE**, Cybersecurity Engineer
> **Statut** : référence de production avant rédaction complète.

---

## 1. Position éditoriale à préserver

Le livre est une non-fiction d’idées opérationnelles. Il ne doit ni ressembler à un rapport d’entreprise, ni reprendre les codes d’une interface produit, ni expliquer des généralités sans terrain. Chaque chapitre doit faire progresser le lecteur d’un fait observable vers un mécanisme, puis vers une décision exploitable.

L’autorité de la collection repose sur l’expérience opérationnelle, les scènes d’incident, les `Field Notes`, les méthodes et les règles. Le manuscrit ne contient ni citations auteur-date, ni notes de bas de page, ni bibliographie de fin d’ouvrage. Les sources de recherche peuvent être conservées dans les dossiers de travail internes, mais ne sont jamais exportées au lecteur.

La direction **Bone / Ink / Saffron** est conservée. La couverture à métaphore de frontière rompue, les citations d’impact réellement nécessaires et les ouvertures noires de chapitre constituent les signatures fortes du livre. Elles ne doivent pas être multipliées jusqu’à devenir des effets de gabarit.

| Élément validé | Règle |
|---|---|
| Couverture | Titre dominant, métaphore unique, signature `STEVE BA-NDOUWE` et rôle `Cybersecurity Engineer`. |
| Couleurs | Bone pour la lecture, Ink pour l’autorité, Saffron pour la décision, Forest pour la méthode, Vermilion pour le risque. |
| Ouvertures noires de chapitre | Le panneau noir, le numéro monumental et le titre blanc constituent le modèle de tous les chapitres. |
| Citation d’impact | Aucune citation graphique n’est ajoutée pour remplir une page. Elle doit apporter un fait ou une bascule réelle, sinon elle est supprimée. |

---

## 2. Navigation générale et navigation locale

La navigation fonctionne à deux échelles. Le sommaire de collection donne accès aux quatre Parts et aux dix-huit chapitres. La navigation détaillée vit dans les cartes de partie et les guides de chapitre.

| Échelle | Contenu | Règle de lien |
|---|---|---|
| Sommaire général | Parts I à IV, puis chapitres 1 à 18. | Chaque titre pointe vers son ouverture de partie ou de chapitre. |
| Carte de partie | Question directrice, paragraphe d’orientation et liste de chapitres au format `Chapter 01 · Title`. | Chaque ligne est cliquable ; aucune puce ni tiret visible. |
| Guide de chapitre | Trois à sept jalons réellement présents, au format `01. Section title`. | Chaque ligne pointe vers la section correspondante, sans puce visible. |

Une carte de partie répond à une question que le lecteur peut se poser avant de commencer. Elle ne se limite jamais à une phrase vague suivie d’une liste. Elle indique le mouvement de pensée de la partie, puis donne des liens explicites du type `Chapter 01 · Beyond the Firewall` ou `Chapter 07 · Hope Is Not a Rollback Strategy`. Les tirets, les puces automatiques et les liens collés dans un paragraphe sont interdits.

---

## 3. Parties, chapitres et sections

Les pages de partie et les pages de chapitre remplissent des fonctions distinctes. Les mélanger réduit leur valeur éditoriale.

| Niveau | Composition de référence | Fonction |
|---|---|---|
| Partie | Page Charcoal complète, numéro Saffron, titre Chalk et filet court. | Marquer un changement de territoire de pensée. |
| Page suivante de partie | Carte de partie sur Bone, question en tête, arc narratif de deux ou trois phrases, liens cliquables. | Orienter sans détourner de la lecture. |
| Chapitre 1 | Ouverture noire `01 Beyond the Firewall`, puis page suivante de guide de chapitre. | Préserver la signature visuelle du livre. |
| Chapitres 2 à 18 | Même ouverture noire : numéro monumental, titre blanc et surface Charcoal, suivie d’une page distincte de guide. | Assurer une identité de collection forte et constante. |
| Section | Titre Saffron qui annonce une idée, un conflit ou une décision. | Guider l’argument sans découper mécaniquement le texte. |

Le guide de chapitre est une page séparée. Il ne doit jamais être collé sous le titre principal du chapitre. Une section ne porte pas un titre générique comme `Analysis`, `Application`, `Key Takeaways` ou `Transition` : elle formule l’idée qui suit.

---

## 4. Grille, mobilier et respiration

Le format de référence est **6 × 9 pouces** en recto-verso. La pagination est continue : une nouvelle partie ou un nouveau chapitre commence sur la page suivante disponible, sans page blanche ajoutée uniquement pour respecter une alternance pair-impair. Les blancs de composition ne sont admis que lorsqu’ils servent une page d’ouverture réellement composée.

| Paramètre | Référence | Règle |
|---|---:|---|
| Marge intérieure | 22 mm | Protège la reliure et ne porte aucun repère de navigation. |
| Marge extérieure | 18 mm | Laisse une prise de lecture confortable. |
| Marge haute | 21 mm | Accueille le running head et une respiration avant le texte. |
| Marge basse | 22 mm | Sépare clairement le folio du dernier paragraphe. |
| Texte courant | 10,3 pt / 15,4 pt | Ne jamais réduire cette mesure pour gagner des pages. |
| Alinéa | 0 pt | Aucun retrait de première ligne ; l’espacement mesuré entre paragraphes structure une lecture peu dense. |

Les running heads sont absents de toute page de présentation, de toute ouverture de chapitre, des cartes de partie et des guides de chapitre. Sur les pages courantes, le verso porte le titre court du livre et le recto porte le titre du chapitre. Le folio seul apparaît au pied extérieur.

---

## 5. Typographie, prototype B

La paire visible dans le prototype B est **TeX Gyre Schola** pour la lecture et **Noto Sans** pour l’argument. Elle a été choisie pour tester une texture plus éditoriale, plus lisible à petite taille et moins mécanique que la combinaison précédente. Cette paire est considérée comme une option active de validation, pas comme un choix irréversible.

| Rôle | Prototype B | Usage |
|---|---|---|
| Lecture | TeX Gyre Schola | Texte courant, sous-titres, citations. |
| Argument | Noto Sans | Titres, labels, mobilier courant et numéros. |
| Donnée | TeX Gyre Cursor | Code, commandes, identifiants et tableaux techniques. |

Aucune quatrième famille ne doit être ajoutée. Les majuscules sont limitées aux labels et à la couverture. Les italiques servent une voix, une réserve ou une formule courte ; ils ne décorent pas la page. Les gras désignent un terme, une décision ou une action, jamais un paragraphe entier.

---

## 6. Grammaire des callouts

Les callouts sont des marges de pensée. Ils ne sont ni des cartes d’interface, ni des panneaux décoratifs. Tous sont **indivisibles** : un bloc qui ne tient pas sur le reste de la page passe entièrement à la page suivante.

| Bloc | Forme | Budget de contenu |
|---|---|---|
| `Field Method` | Fond Forest très pâle, filet gauche fin. | Une action ou méthode, 40 à 90 mots. |
| `Context` | Fond gris chaud léger, filet gauche fin. | Une condition de lecture, 40 à 90 mots. |
| `Key Decision` | Fond Ink très pâle, filet gauche fin. | Une décision ou un seuil, 40 à 90 mots. |
| `Risk` | Fond Vermilion très pâle, filet gauche fin. | Une conséquence concrète, 40 à 90 mots. |
| `System Concept` | Fond Bone et deux filets Forest horizontaux. | Un concept réutilisable, 50 à 110 mots. |
| `Operator’s Rule` | Fond Ink, barre Saffron haute, point repère et texte Chalk. | Trois actions observables, 60 à 120 mots ; c’est la signature de décision du chapitre. |
| `Field Note` | Fond Chalk clair, filet Ink gauche, cinq champs fixes. | Une preuve située, 110 à 180 mots. |
| `Memorable Phrase` | Fond Bone sans cartouche, filet Saffron gauche, texte serif gras sans label. | Une formulation originale de 20 à 45 mots, placée immédiatement avant le Field Note sans dominer la page. |
| `Pull Quote` | Citation intégrée au flux, sans fond ni cadre, entre guillemets et en italique. | Une conséquence ou une tension de 25 à 55 mots ; elle amplifie l’argument sans devenir un second callout. |
| `Key Takeaways` | Fond Bone et filet Saffron gauche. | Quatre à cinq enseignements actionnables, 60 à 120 mots au total. |

Le Field Note n’utilise plus de page noire pleine. Il reste sur le flux de lecture, utilise un fond clair et ne commence pas automatiquement une nouvelle page. Une page courante ne contient normalement qu’un callout. Aucun callout ne répète le paragraphe adjacent : il change le mode de lecture en apportant une méthode, un risque, une définition, une règle ou une preuve.

Chaque chapitre complet place la `Memorable Phrase` immédiatement avant le `Field Note`. La phrase annonce la preuve sans se transformer en affiche. Après le Field Note viennent une `Pull Quote` sobre, des `Key Takeaways`, puis la transition `Next Chapter`. La citation est une phrase standard entre guillemets et en italique ; elle ne porte ni fond, ni bordure, ni label visible.

---

## 7. Prose, ponctuation et anti-effet IA

L’écriture doit sembler nécessaire, située et assumée. Elle part d’un événement, d’une friction ou d’une décision précise, puis montre ce qui a été mal compris et ce qui doit changer. Elle ne cherche pas à imiter l’irrégularité ; elle refuse simplement les symétries mécaniques et les conclusions toutes faites.

| À faire | À éviter |
|---|---|
| Nommer une transaction, un seuil, un responsable ou un symptôme observable. | Les vérités générales sans contexte et les recommandations de consultant. |
| Alterner constat court, mécanisme développé et conséquence concrète. | Les paragraphes dont toutes les phrases ont la même longueur. |
| Conserver une ambiguïté réelle lorsqu’elle compte pour la décision. | Les récits trop propres où chaque incident produit une leçon parfaite. |
| Donner une action avec un propriétaire, un déclencheur ou une mesure de succès. | `Improve`, `optimize` ou `ensure` sans critère vérifiable. |
| Terminer une section sur une tension qui appelle la suivante. | Répéter l’introduction sous une autre forme. |

Le tiret long est interdit dans le manuscrit. Il est remplacé selon le sens par une phrase, une virgule, un point-virgule ou deux-points. Les séries de triplets, les oppositions artificielles et les connecteurs répétitifs comme `First`, `Second`, `Third`, `This is not` ou `The truth is` sont revus avant passage en révision.

---

## 8. Contrôle d’acceptation avant rédaction complète

Avant qu’un chapitre passe de `draft` à `review`, il doit satisfaire les exigences suivantes.

- L’ouverture de chapitre est identifiable sans lire le contenu de la page suivante.
- Le chapitre contient un guide local seulement si ses sections existent réellement.
- Les liens de la carte de partie et du guide de chapitre sont testés dans le PDF et dans l’EPUB.
- Le sommaire général contient les Parts puis les chapitres, sans sous-sections.
- Les cartes de partie utilisent exclusivement le format `Chapter NN · Title`, sans tiret ni puce visible.
- Les guides de chapitre utilisent exclusivement le format `NN. Section title`, sans tiret ni puce visible.
- Aucun callout n’est coupé entre deux pages ; son texte respecte le budget associé.
- Le Field Note demeure une preuve compacte sur fond clair.
- Chaque chapitre complet suit l’ordre `Memorable Phrase` → `Field Note` → `Pull Quote` → `Key Takeaways` → `Next Chapter`.
- Le manuscrit ne contient aucun tiret long.
- Le nom `Steve BA-NDOUWE` et la fonction `Cybersecurity Engineer` sont cohérents sur la couverture, la page de titre et les métadonnées.
- La paire typographique retenue est évaluée dans un PDF imprimé et dans une vignette avant verrouillage définitif.
- Le manuscrit, ses pages finales et ses annexes ne contiennent ni citations auteur-date, ni notes de bas de page, ni bibliographie. La crédibilité est apportée par des preuves situées, des méthodes et des règles testables.
