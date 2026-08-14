# Book Blueprint — Beyond the Firewall

**Titre** : Beyond the Firewall
**Sous-titre** : The Reality of Modern IT Operations
**Livre** : 1 / 5 — *The Operator's Library*

---

## 1. Thèse du livre (en une phrase)

Une infrastructure sécurisée n'est pas nécessairement fiable, et un système fiable n'est pas nécessairement résilient. La véritable performance opérationnelle se joue derrière le firewall : dans les personnes, les procédures, les dépendances et les décisions invisibles.

> *Validation : cette formulation te convient-elle ? Souhaites-tu la rendre plus directe ou plus provocante ?*

---

## 2. Promesse au lecteur

En refermant ce livre, vous ne regarderez plus jamais une infrastructure de la même manière. Vous saurez identifier les fragilités invisibles qui, un jour, feront tomber ce qui semblait solide.

> *Question : cette promesse est-elle alignée avec ce que tu veux que le lecteur retire du livre ?*

---

## 3. Progression interne (les 4 parties)

- **Part I — The System We See** (6 chapitres) : on part du concret le plus choquant (l'exception devenue permanente, les dashboards verts, le monitoring comme doudou, Working ≠ Reliable) pour aboutir à la synthèse : Availability ≠ Resilience.
- **Part II — The System We Don't See** (4 chapitres) : les rollbacks non éprouvés, les sauvegardes jamais testées, la dépendance invisible, le temporaire devenu architecture.
- **Part III — Operating Reality** (5 chapitres) : la décision sous pression en incident, le tribal knowledge, la documentation qui échoue, l'erreur de configuration humaine, la conception pour survivre à l'absence des créateurs.
- **Part IV — Beyond Operations** (3 chapitres) : passage à la pensée systémique, la résilience pratiquée, le mindset de l'opérateur moderne.

*Cette progression emmène le lecteur du visible vers l'invisible, puis du technique vers l'organisationnel.*

---

## 4. Liste des chapitres (18 chapitres)

### Part I — The System We See (6 chapitres)

> **Note** : la Part I commence par le concret (l'exception devenue permanente, les dashboards verts) avant la synthèse théorique (Working ≠ Reliable, Availability ≠ Resilience). Le chapitre 2 actuel (The Temporary Rule) reste en place par décision de l'auteur.

#### Chapitre 1 — Beyond the Firewall
- **Idée centrale** : Le firewall est une métaphore de la frontière visible de l'IT. Derrière cette frontière se cachent les vrais facteurs de réussite ou d'échec.
- **Phrase mémorable cible** : *The firewall was working. The business wasn't.*
- **Concept introduit** : aucun (chapitre d'ouverture).
- **Statut** : draft.

#### Chapitre 2 — The Temporary Rule That Became Permanent
- **Idée centrale** : Les exceptions temporaires deviennent des architectures permanentes par absence de mécanisme d'expiration.
- **Phrase mémorable cible** : *A temporary exception without an expiration date is a future security incident.*
- **Concept introduit** : Permanent Temporary.
- **Statut** : draft (reste en position 2).

#### Chapitre 3 — Everything Was Green. Everything Was Broken.
- **Idée centrale** : Les dashboards verts ne reflètent pas la santé réelle d'un système. Le monitoring peut créer une illusion de contrôle.
- **Phrase mémorable cible** : *A green dashboard is not proof of a healthy system.*
- **Concept introduit** : Monitoring Illusion.

#### Chapitre 4 — When Monitoring Becomes a Comfort Blanket
- **Idée centrale** : Le monitoring peut basculer d'alarme en système de réassurance : quand il ne confirme que ce que l'équipe croit déjà, il devient une couverture de confort, chaude, familière et aveugle.
- **Phrase mémorable cible** : *If your monitoring only ever tells you things are fine, it's not monitoring — it's a comfort blanket.*
- **Concept introduit** : aucun (approfondit Monitoring Illusion, introduit au ch. 3).

#### Chapitre 5 — The Difference Between Working and Being Reliable
- **Idée centrale** : Working est un événement observé dans le passé ; reliability est une propriété raisonnable pour le futur. Les échecs de l'industrie vivent dans cet écart.
- **Phrase mémorable cible** : *Working is an event. Reliability is a property.*
- **Concept introduit** : aucun (chapitre de pont vers le ch. 6).

#### Chapitre 6 — Availability Is Not Resilience
- **Idée centrale** : Un système qui fonctionne aujourd'hui n'est pas forcément fiable (Working ≠ Reliable). La disponibilité mesure le temps de fonctionnement, mais pas la capacité à se remettre d'une panne. La résilience est une propriété plus profonde.
- **Phrase mémorable cible** : *Working is an event. Reliability is a property. A system that never fails has never been tested.*
- **Concept introduit** : aucun (synthèse de la Part I).

### Part II — The System We Don't See (4 chapitres)

#### Chapitre 7 — Hope Is Not a Rollback Strategy
- **Idée centrale** : Les plans de retour arrière non testés reposent sur l'espoir, pas sur l'ingénierie.
- **Phrase mémorable cible** : *A rollback plan you haven't tested is a wish, not a strategy.*
- **Concept introduit** : aucun (ou Runbook Rot).

#### Chapitre 8 — The Backup Nobody Tested
- **Idée centrale** : Une sauvegarde non restaurée est une hypothèse, pas une stratégie de récupération.
- **Phrase mémorable cible** : *A backup you never restored is an assumption, not a recovery strategy.*
- **Concept introduit** : aucun.

#### Chapitre 9 — The Dependency Nobody Documented
- **Idée centrale** : Les dépendances invisibles forment une architecture parallèle que personne ne maîtrise.
- **Phrase mémorable cible** : *The most dangerous dependency is the one you don't know exists.*
- **Concept introduit** : Shadow Operations.

#### Chapitre 10 — When Temporary Becomes Architecture
- **Idée centrale** : Tout correctif d'urgence laissé en place devient de l'architecture par défaut. L'architecture, c'est ce qui reste après les urgences — décidé ou non.
- **Phrase mémorable cible** : *There is nothing more permanent than a temporary fix that works.*
- **Concept introduit** : Permanent Temporary (approfondi — introduit au ch. 2).

### Part III — Operating Reality (5 chapitres)

#### Chapitre 11 — Incident Response Is Decision Making Under Pressure
- **Idée centrale** : En situation d'incident, la qualité de la décision compte plus que la compétence technique pure.
- **Phrase mémorable cible** : *In an incident, judgment matters more than knowledge.*
- **Concept introduit** : aucun.

#### Chapitre 12 — The Cost of Tribal Knowledge
- **Idée centrale** : La connaissance qui n'existe que dans la tête d'une personne n'est pas une connaissance organisationnelle.
- **Phrase mémorable cible** : *Knowledge that exists only in someone's head is not organizational knowledge.*
- **Concept introduit** : Human SPOF.

#### Chapitre 13 — Why Documentation Fails
- **Idée centrale** : La documentation échoue non pas parce qu'elle est mal écrite, mais parce qu'elle n'est pas intégrée au flux opérationnel.
- **Phrase mémorable cible** : *Documentation is not a project. It's a byproduct of operation.*
- **Concept introduit** : Runbook Rot (ou Institutional Capability).

#### Chapitre 14 — The Human Configuration Error
- **Idée centrale** : Une erreur de configuration humaine est le symptôme visible d'une lacune de conception invisible : absence de garde-fous, de validation, de révision. L'humain n'est pas la panne, il est le détecteur.
- **Phrase mémorable cible** : *A human configuration error is the visible symptom of an invisible design gap.*
- **Concept introduit** : aucun (famille de Human SPOF, ch. 12 — terme taxonomique possible : Human Config Error).

#### Chapitre 15 — Designing for the Day You Are Not There
- **Idée centrale** : Un système opérationnel doit survivre à l'absence de ses créateurs.
- **Phrase mémorable cible** : *The best system is the one that doesn't need you.*
- **Concept introduit** : Institutional Capability (ou Trust Debt).

### Part IV — Beyond Operations (3 chapitres)

#### Chapitre 16 — From Infrastructure to Systems Thinking
- **Idée centrale** : Passer d'une vision par composants à une vision systémique est le premier pas vers la résilience.
- **Phrase mémorable cible** : *You can't fix a system by fixing its parts.*
- **Concept introduit** : aucun.

#### Chapitre 17 — Building Operational Resilience
- **Idée centrale** : La résilience ne s'installe pas, elle se pratique : exercices, failovers, restaurations, chaos maîtrisé. Tout le livre converge ici.
- **Phrase mémorable cible** : *Resilience is not a feature you buy. It is a practice you exercise.*
- **Concept introduit** : aucun (chapitre de synthèse de la Part IV).

#### Chapitre 18 — The Operator's Mindset
- **Idée centrale** : L'état d'esprit de l'opérateur moderne : curiosité, humilité, et capacité à voir l'invisible.
- **Phrase mémorable cible** : *The operator's real job is not to run the system. It's to understand it.*
- **Concept introduit** : Operational Drift (si pas introduit avant).

---

## 5. Incidents réels à intégrer

> *Voir `case-library.md` pour le détail complet de chaque incident.*

| Chapitre | Incident (titre de code) | Contexte technique | Décision prise | Erreur / hypothèse | Conséquence | Leçon |
|----------|--------------------------|--------------------|----------------|--------------------|-------------|-------|
| 1 | Firewall_Green_Business_Down | E-commerce derrière un firewall d'état de l'art | Tout investir dans la sécurité du périmètre | Un périmètre solide protège le business | Checkout down 4h, la sécurité reste verte | A secure perimeter does not protect you from failures behind it |
| 2 | Firewall_Temp_Rule | Règle firewall temporaire | Ajout pour urgence | Pas de date d'expiration | Vulnérabilité découverte deux ans plus tard | Every exception needs an expiration mechanism |
| 3 | Office365_Dashboard | Migration cloud | Faire confiance aux métriques sans vérifier l'expérience utilisateur | Le vert ne signifie pas que ça marche | Dégradation silencieuse | Le monitoring doit mesurer ce qui compte, pas ce qui est facile |
| 4 | — (candidats : Office365_Dashboard partagé, Firewall_Green partagé, ou nouvel incident à créer) | — | — | — | — | Comfort is the enemy of detection |
| 5 | — (candidats : FiveNines partagé, ou nouvel incident à créer) | — | — | — | — | Working is an event. Reliability is a property |
| 6 | FiveNines_First_Failover | Paire active/passive jamais exercée | Promettre 99,99 % sans tester le failover | La redondance = la résilience | Premier failover réel : 6h | A system that never fails has never been tested |
| 7 | Rollback_That_Never_Ran | Migration de base de données | Faire confiance au plan de rollback sans le tester | "Le rollback marchera car il est simple" | Rollback en échec, outage long | A rollback plan you haven't tested is a wish |
| 8 | Backup_Job_Silently_Failing | Sauvegarde nocturne sur NAS | Se fier aux logs SUCCESS | Le log dit OK donc la restauration marchera | Ransomware : restauration impossible | A backup you never restored is an assumption |
| 9 | Phantom_Cron_Production | Script cron ERP non documenté | Rebuild du serveur sans inventaire des dépendances | Si c'est important, ce serait documenté | Facturation erronée pendant 3 semaines | The most dangerous dependency is the one you don't know exists |
| 10 | Firewall_Temp_Rule (partagé avec ch. 2 — cycle de vie de la même règle) | Règle firewall temporaire | La règle reste en place après la crise | Un correctif temporaire ne compte pas dans l'architecture | La règle fait partie de l'architecture par défaut | A temporary solution that works becomes architecture by default |
| 11 | Autopilot_Restart_Disaster | API bancaire en surcharge | Exécuter la procédure sans lire les signaux | La première étape du runbook est la bonne | Latence transformée en outage de 3h | In an incident, judgment matters more than knowledge |
| 12 | Solo_Engineer_Blackout | Déploiement concentré sur une seule personne | Jamais de binôme, jamais de documentation | Il sera toujours là | Patch de sécurité bloqué 9 jours | Knowledge in one head is not organizational knowledge |
| 13 | Runbook_Rot_Blindspot | Runbook critique vieux de 18 mois | Traiter la doc comme "écrite pour toujours" | Si le runbook existe, tout est sous contrôle | 90 min perdues sur un load balancer renommé | Documentation is a byproduct of operation |
| 14 | — (candidats : Autopilot_Disaster partagé, ou nouvel incident à créer) | — | — | — | — | A human configuration error reveals the design gap, not the typo |
| 15 | Creator_Exit_System_Blackout | Système bâti par un architecte parti | Garder le système "as is" | Un système qui marche n'a besoin de personne | Renouvellement de certificat impossible | The best system is the one that doesn't need you |
| 16 | Upgraded_Part_Still_Red | Portail lent, 3 équipes se renvoient la faute | Upgrader les composants un par un | Fixer les parties fixe le système | 3 upgrades coûteux, toujours lent | You can't fix a system by fixing its parts |
| 17 | — (candidats : FiveNines / Backup_Job partagés, ou nouvel incident à créer) | — | — | — | — | Resilience is demonstrated in rehearsal, not claimed in diagrams |
| 18 | Silent_Config_Drift | Élément réseau avec config dérivée | Se fier au document "golden config" | La config gérée est la config qui tourne | Cascade de failovers inexplicables | The operator's real job is to understand the system |

---

## 6. Concepts de la taxonomie introduits dans ce livre

Concepts introduits officiellement dans *Beyond the Firewall* :

- **Monitoring Illusion** (chap. 3)
- **Permanent Temporary** (chap. 2, approfondi chap. 10)
- **Shadow Operations** (chap. 9)
- **Human SPOF** (chap. 12)
- **Runbook Rot** (chap. 13, optionnel)
- **Institutional Capability** (chap. 15, optionnel)
- **Operational Drift** (chap. 18, si pas introduit avant)

Les autres concepts de la taxonomie (13 termes) sont réservés pour les livres suivants, afin de préserver la progression.
