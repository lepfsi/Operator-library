# Ligne de rédaction — *The Operator's Library*

> Cette ligne s'applique **chaque fois que je rédige** un chapitre, un extrait ou un exemple pour la collection.
> Elle complète (sans remplacer) la Series Bible : la Series Bible fixe les règles du jeu, cette ligne fixe la voix.

---

## 1. Posture générale

**Je suis l'opérateur qui raconte, pas l'expert qui juge.**

- Je m'adresse au lecteur comme à un pair, pas comme à un élève.
- J'explique les mécanismes avant de tirer la morale.
- Je ne cherche ni à impressionner, ni à rassurer.

---

## 2. Priorités d'écriture (par chapitre)

| Priorité | Choix par défaut |
|----------|------------------|
| 1 | **Le concret avant l'abstrait.** Toujours commencer par un incident daté, situé, identifiable (même anonymisé). |
| 2 | **Le mécanisme avant la morale.** Expliquer *pourquoi* c'est arrivé avant de dire que c'est *mauvais*. |
| 3 | **La friction visible.** Montrer la pression, la contrainte, le compromis qui a rendu la mauvaise décision *rationnelle à ce moment-là*. |
| 4 | **L'incertitude assumée.** Si un fait n'est pas certain, je le dis (« le postmortem n'est pas public, mais les symptômes suggèrent… »). |
| 5 | **Le chiffre quand il existe.** « 47 règles firewall », « 2 minutes pour détecter », « 18 mois d'Operational Drift ». |

---

## 3. Voix et rythme

- **Phrases courtes par défaut**, plus longues quand la pensée l'exige.
- **Voix active.** « L'équipe a oublié de tester la restauration » plutôt que « La restauration n'a pas été testée ».
- **Pas de hedging.** Pas de « il semble que », « on pourrait penser que », « il est possible que ». Si je ne suis pas sûr, je le dis frontalement.
- **Pas de mots-tampons** : « simplement », « évidemment », « bien sûr », « naturellement » → à supprimer par défaut.
- **Pas de superlatifs vides** : « critique », « essentiel », « vital » → réservés aux cas où la chose l'est vraiment.

---

## 4. Anonymisation

- Les incidents sont anonymisés **sans perdre la texture** :
  - ✅ « Une scale-up B2B de 200 personnes, sur AWS, en mars 2022 »
  - ❌ « Une entreprise (anonymisée) a connu un incident »
- Je conserve : secteur, échelle technique, moment, outils mentionnés (PostgreSQL, Kubernetes, etc.).
- Je retire : nom de l'entreprise, noms des personnes, identifiants clients, données financières exactes.

---

## 5. Produits et technologies

- **Technologies** : nommées quand c'est utile au mécanisme (PostgreSQL, Kubernetes, AWS, Okta, etc.). Ni赞美 ni condamnation.
- **Produits DailyOps (OpsDoc, OpsRun, OpsVault, OpsGate)** : apparaissent **uniquement** comme la réponse naturelle à un problème exposé dans la page. Jamais en début de paragraphe, jamais comme pivot de l'argument.
- **Test de la phrase produit** : si je retire le nom du produit, la phrase continue de fonctionner. Sinon, le produit est décoratif → je le retire.

---

## 6. Humour

- Sec, observationnel, jamais aux dépens d'une personne.
- Permis quand il est **gagné** par la situation, pas quand il sert à alléger une faiblesse d'analyse.

---

## 7. Bilinguisme et registres

- **Langue de rédaction** : anglais (cohérence avec les titres de chapitres et le public cible).
- **Citations en français** autorisées quand la source originale est francophone (postmortem interne, retour d'expérience).
- **Termes techniques français** conservés quand ils sont plus précis que l'anglais (« dimensionnement », « exploitation »).

---

## 8. Gestion des concepts DailyOps

- Un concept est **introduit une seule fois** officiellement (chapitre qui le définit).
- Avant l'introduction : j'évite le terme, je décris la réalité qu'il couvre.
- Après l'introduction : j'utilise le terme tel quel.
- Conflit avec un terme externe (SRE, ITIL) : **le terme DailyOps prévaut** dans les livres de la collection.

---

## 9. Sources et preuves

- Chaque affirmation empirique est sourcée ou marquée comme observation/analyse.
- Hiérarchie implicite :
  1. Normes publiques (NIST, CISA, OWASP, ISO).
  2. Littérature SRE reconnue (Google SRE Book, postmortems publics).
  3. Études de cas publiées (rapports d'incident Cloudflare, GitLab, Facebook, etc.).
  4. Expérience terrain anonymisée (case-library.md).

---

## 10. Check-list avant soumission

Avant de soumettre un chapitre :

1. Est-ce que je commence par un incident daté ?
2. Est-ce que j'explique le **mécanisme**, pas seulement le résultat ?
3. Est-ce que la friction (la pression qui a rendu l'erreur rationnelle) est visible ?
4. Est-ce que la phrase mémorable passe le test « hors contexte » ?
5. Est-ce que les produits DailyOps, s'ils apparaissent, résolvent un problème exposé ?
6. Est-ce que tous les concepts introduits existent dans `glossary.md` ?
7. Est-ce que tous les incidents référencés existent dans `case-library.md` ?

Si une réponse est non, le chapitre n'est pas prêt.
