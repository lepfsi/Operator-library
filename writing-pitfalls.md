# Pièges à éviter pendant la rédaction

> **Rappel permanent** : à consulter avant et pendant l'écriture de chaque chapitre.
> S'applique à tous les livres de *The Operator's Library*.

---

## 1. Ne transforme pas un chapitre en liste

« Le monitoring, le backup, la sécurité, la dette technique » n'est **pas** un chapitre.

**Règle** : un chapitre = **un incident + une idée**.

Si tu peux résumer un chapitre en trois mots-clés séparés par des virgules, c'est probablement trois chapitres manqués.

---

## 2. Ne mets pas tout dans le livre 1

Certaines idées appartiennent aux livres 2, 3 ou 4. Les forcer dans *Beyond the Firewall* dilue la thèse et casse la progression.

**Règle** : si une idée sert mieux la thèse d'un livre futur, **note-la dans `notes/` et passe à autre chose**. Tu y reviendras au bon moment.

---

## 3. Ne rédige pas les cinq livres en même temps

**Règle** : verrouille le livre 1, écris-le, publie-le, **puis** passe au suivant.

La Série Bible et les blueprints existent précisément pour empêcher la dispersion. Si tu écris le chapitre 4 du livre 1 et que tu penses à une idée du livre 4, écris-la dans `notes/` du livre 4, pas dans le manuscrit en cours.

---

## 4. Ne cache pas tes erreurs

Les erreurs — les tiennes, celles des autres, celles des organisations que tu décris — sont ce qui rendra le livre crédible.

**Règle** : un chapitre sans erreur visible est suspect. Le lecteur doit voir le mécanisme, pas seulement le résultat propre.

---

## 5. Ne transforme pas DailyOps en catalogue

Les produits (OpsDoc, OpsRun, OpsVault, OpsGate…) doivent apparaître **naturellement**, comme des réponses aux problèmes décrits.

**Règle** : un produit ne doit jamais apparaître comme argument de vente. S'il ne résout pas directement un problème exposé dans le chapitre, il n'a rien à faire là.

Test simple : efface la marque du produit dans ta prose. Si la phrase fonctionne toujours, le produit est probablement décoratif. Retire-le.

---

## Anti-patterns récurrents à surveiller

| Anti-pattern | Symptôme | Correction |
|--------------|----------|------------|
| Chapitre-fourre | 5 sujets distincts dans 1 chapitre | Découper en chapitres séparés |
| Catalogue de features | Liste de produits ou de fonctionnalités | Remplacer par un incident + une leçon |
| Expertise distante | Phrases qui cherchent à impressionner | Réécrire en plus simple, plus direct |
| Théorie sans ancrage | Principe abstrait sans exemple terrain | Ajouter une preuve issue de `case-library.md` |
| Citation décorative | Référence citée sans être intégrée à l'analyse | Soit la citation sert l'argument, soit on la retire |
| Conclusion molle | Chapitre qui finit en « il faut faire attention » | Finir sur une phrase mémorable ou une question forte |

---

## Quand tu doutes

Pose-toi ces trois questions avant de soumettre un chapitre :

1. **Est-ce que je raconte un incident, ou est-ce que je fais une liste ?**
2. **Est-ce que cette idée appartient vraiment à ce livre ?**
3. **Est-ce que le lecteur voit une erreur réelle, ou est-ce que je le ménage ?**

Si une des trois réponses est insatisfaisante, le chapitre n'est pas prêt.
