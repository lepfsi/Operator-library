# Références bibliographiques — Workflow

> Ce fichier décrit le processus entre Zotero et le projet.

---

## Outils

- **Zotero** : gestion des sources (NIST, CISA, SRE Book, postmortems publics).
- **Better BibTeX** (plugin Zotero) : export au format `.bib` en UTF-8.
- **Pandoc** : citeproc intègre le `.bib` au moment de la compilation.

---

## Processus

1. Ajouter la source dans Zotero (avec tags : `serie`, `livre-01`, `incident`, `reference`).
2. Exporter la collection (ou la bibliothèque entière) via **Better BibTeX** vers `references/references.bib`.
3. Vérifier que le `.bib` est en UTF-8, sans BOM.
4. Citer dans le manuscrit avec la syntaxe Pandoc : `[@citationKey]`.
5. Référencer le `.bib` dans `books/book-.../config/pandoc.yaml` (déjà présent).
6. Pour le style APA : remplacer `references/apa.csl` par le fichier officiel (`citation-style-language/styles`) et décommenter `csl:` dans `pandoc.yaml`.

---

## Fichier de référence

Le `.bib` contient une première série de sources réelles (SRE Book, NIST CSF 2.0, SP 800-61, CISA, postmortems publics GitLab / Cloudflare / Fastly / AWS, Richard Cook). Il s'enrichit au fil des chapitres.

> **Statut 2026-08** : la série initiale est posée. Les citations dans les chapitres utilisent ces clés :
> `@beyer2016sre`, `@beyer2019workbook`, `@nist2024csf2`, `@nist2012sp80061r2`, `@cisa2023incidentresponse`, `@gitlab2017databaseoutage`, `@cloudflare2022juneoutage`, `@cloudflare2021novemberoutage`, `@fastly2021juneincident`, `@aws2020kinesisevent`, `@cook2000complex`.
