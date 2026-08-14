# Maquette textuelle — Page intérieure type

> **Prototype visuel disponible** : `design/maquette-interieure-page.svg`
> (double page 6" × 9" avec rendu réel : ouverture de chapitre, DAILYOPS
> CONCEPT, FIELD NOTE, pull quote, KEY TAKEAWAYS, header/footer). Cette
> maquette textuelle reste la spécification détaillée ; le SVG en est le
> rendu visuel de référence.


> **Référence pour le graphiste / la mise en page**
> **Livre** : Beyond the Firewall (Livre 1) — **Chapitre 5** : Everything Was Green. Everything Was Broken.
> **Format** : 6" × 9" (152 × 229 mm)
> **Direction** : Technical Editorial / Dark Precision
> **Date** : 2026

---

## 1. Structure générale de la page

- **Format** : 6" × 9" (152 mm × 229 mm)
- **Marges** : intérieur 2,2 cm, extérieur 1,8 cm, haut 2,5 cm, bas 2,0 cm
- **Police de corps** : Source Serif Pro, 10,5 pt, interligne 1,5
- **Couleur du texte** : Noir profond `#111111`

---

## 2. Représentation textuelle

```
[Marge haute 2,5 cm]

           05
    ────────────────
    EVERYTHING WAS GREEN.
    EVERYTHING WAS BROKEN.

    There is a difference between seeing
    and understanding.

    [Premier paragraphe en Source Serif Pro, 10,5 pt]
    Le tableau de bord affichait des voyants verts depuis
    des semaines. Tous les indicateurs étaient au vert.
    Pourtant, les utilisateurs signalaient des lenteurs,
    des erreurs intermittentes, et des synchronisations
    qui échouaient sans explication. L'équipe regardait
    les métriques et se disait : tout va bien.

    [Saut de ligne]

    ┌─────────────────────────────────────────────────────────┐
    │ DAILYOPS CONCEPT                                      │
    │                                                       │
    │ MONITORING ILLUSION                                   │
    │                                                       │
    │ A false sense of control created by visibility        │
    │ without sufficient context.                           │
    └─────────────────────────────────────────────────────────┘
    [Encadré : bordure 1 pt Gris acier #5A6B7A, fond Off-white #F7F5F0]
    [Label "DAILYOPS CONCEPT" en Sora bold 9 pt, gris acier]
    [Nom du concept en Sora bold 16 pt, Deep Navy]
    [Définition en Source Serif Pro italic 12 pt, Noir profond]

    [Saut de ligne]

    Le monitoring mesurait ce qui était facile à mesurer,
    pas ce qui comptait réellement pour l'utilisateur.
    La disponibilité du serveur était excellente, mais
    l'expérience utilisateur se dégradait.

    [Page suivante ou bloc isolé :]

    ─────────────────────────────────────────────────────────

        A green dashboard is not proof of a healthy system.

    ─────────────────────────────────────────────────────────
    [Citation mémorable isolée sur une page ou dans un bloc centré]
    [Sora bold ou Source Serif Pro italic, 18–20 pt, Deep Navy]
    [Avec ou sans fine ligne turquoise #1CB5A0 au-dessus et en dessous]

    [Retour au texte, page suivante :]

    L'incident qui a révélé le problème a commencé un mardi matin.

    ┌─────────────────────────────────────────────────────────┐
    │ FIELD NOTE                                             │
    │                                                       │
    │ Context: Une entreprise de e-commerce utilisait un     │
    │          dashboard de supervision centralisé.          │
    │ What We Expected: Des métriques vertes signifiaient    │
    │          que le système fonctionnait correctement.     │
    │ What Happened: Les utilisateurs ont subi des lenteurs  │
    │          et des échecs de paiement pendant 3 jours     │
    │          sans alerte.                                  │
    │ Why It Happened: Le dashboard ne surveillait que la    │
    │          disponibilité des serveurs, pas les temps de  │
    │          réponse applicatifs ni le taux d'erreurs      │
    │          fonctionnelles.                               │
    │ What It Taught Us: La visibilité partielle crée une   │
    │          illusion de contrôle plus dangereuse que      │
    │          l'absence de visibilité.                      │
    └─────────────────────────────────────────────────────────┘
    [Encadré FIELD NOTE : bordure 1 pt Bleu acier #2C5F8A, fond blanc]
    [Label "FIELD NOTE" en Sora bold 9 pt, couleur Bleu acier]
    [Champs en Sora bold 10 pt pour les intitulés, Source Serif Pro 10,5 pt pour le contenu]

    [Suite du texte]

    L'équipe a découvert que le monitoring mesurait des
    signaux de vie, pas des signaux de santé.

[Marge basse 2 cm]
```

---

## 3. Annotations pour le designer

### Titre de chapitre

- **Numéro** (`05`) : Sora bold, capitales, 36 pt, couleur turquoise `#1CB5A0`.
- **Titre** (`EVERYTHING WAS GREEN. EVERYTHING WAS BROKEN.`) : Sora bold, capitales, 24 pt, Deep Navy `#0A1A2F`.
- **Phrase d'ouverture** (`There is a difference between seeing and understanding.`) : Source Serif Pro italic, 13 pt, Gris acier `#5A6B7A`.

### Encadré `DAILYOPS CONCEPT`

- Bordure : 1 pt, Gris acier `#5A6B7A`.
- Fond : Off-white `#F7F5F0`.
- Marge intérieure : 0,8 cm.
- Label (`DAILYOPS CONCEPT`) : Sora bold, petites capitales, espacement large, corps 9 pt, gris acier.
- Nom du concept (`MONITORING ILLUSION`) : Sora bold, capitales, 16 pt, Deep Navy.
- Définition : Source Serif Pro italic, 12 pt, Noir profond.

### Citation mémorable

- Centrée sur une page séparée ou dans un bloc centré avec beaucoup d'espace blanc.
- Typo : Sora bold ou Source Serif Pro italic, 18–20 pt, Deep Navy.
- Éventuellement : fine ligne turquoise `#1CB5A0` (1 pt) au-dessus et en dessous.

### Encadré `FIELD NOTE`

- Bordure : 1 pt, Bleu acier `#2C5F8A` (couleur d'accent du livre 1).
- Fond : blanc.
- Label (`FIELD NOTE`) : Sora bold, petites capitales, corps 9 pt, couleur Bleu acier.
- Intitulés (`Context`, `What We Expected`, etc.) : Sora bold, 10 pt.
- Contenu : Source Serif Pro regular, 10,5 pt.

### Texte courant

- Justifié.
- Alinéa : 0,5 cm au début de chaque paragraphe, **ou** sans alinéa avec espacement de 6 pt entre paragraphes (au choix du layout final).
- Ligne de base alignée sur 12 pt.

---

## 4. Diagramme conceptuel associé (optionnel)

Pour ce chapitre (Monitoring Illusion → Operational Drift), un diagramme simple :

```
        Expected State
             │
             ▼
        Actual State
             │
             ▼
        OPERATIONAL DRIFT
             │
             ▼
        Operational Impact
```

**Spécifications du diagramme** :

- Lignes : 1 pt, Gris acier `#5A6B7A`.
- Éléments clés : turquoise `#1CB5A0` (ou couleur d'accent du livre : Bleu acier `#2C5F8A` pour le livre 1).
- Légende : Source Serif Pro, 10 pt, Gris acier.
- Style : trait fin, blueprint, sans effets.

---

## 5. Utilisation

Cette maquette textuelle est directement utilisable par un graphiste pour créer la mise en page réelle dans **InDesign**, **Affinity Publisher**, **LaTeX** ou tout autre outil. Elle sert de validation avant la production visuelle complète et garantit que la hiérarchie, les espacements et les traitements graphiques sont cohérents avec la charte graphique (`charte-graphique.md`) et le design system (`design/prototype-couverture-livre-01.svg`).
