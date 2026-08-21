#!/usr/bin/env bash
set -euo pipefail
ROOT='/mnt/c/Users/Utilisateur/Operator-library/books/book-04-the-age-of-operational-ai'
BASE='https://files.manuscdn.com/user_upload_by_module/session_file/310519663085699459'
curl -fsSL "$BASE/jzoIVZFvMPckvrud.md" -o "$ROOT/manuscript/chapters/chapter-11-can-we-trust-an-autonomous-operator-draft-v1.md"
curl -fsSL "$BASE/XYXUGItKxjaykTos.md" -o "$ROOT/manuscript/chapters/chapter-11-body-book-v4.md"
curl -fsSL "$BASE/nTmruvQRkFxDKwDo.tex" -o "$ROOT/config/chapter-11-proof.tex"
curl -fsSL "$BASE/OmtXxXdaqHsotJvd.tex" -o "$ROOT/config/book4-complete-through-chapter-11.tex"
cd "$ROOT"
pandoc -f markdown -t latex manuscript/chapters/chapter-11-can-we-trust-an-autonomous-operator-draft-v1.md -o chapter-11-body-v4.tex
pandoc -f markdown -t latex manuscript/chapters/chapter-11-body-book-v4.md -o chapter-11-body-book-v4.tex
cd "$ROOT/config"
xelatex -interaction=nonstopmode -halt-on-error -output-directory=../exports chapter-11-proof.tex >/tmp/book4-ch11.log
xelatex -interaction=nonstopmode -halt-on-error -output-directory=../exports chapter-11-proof.tex >>/tmp/book4-ch11.log
mv -f ../exports/chapter-11-proof.pdf ../exports/chapter-11-can-we-trust-an-autonomous-operator-editorial-proof.pdf
xelatex -interaction=nonstopmode -halt-on-error -output-directory=../exports book4-complete-through-chapter-11.tex >/tmp/book4-full11.log
xelatex -interaction=nonstopmode -halt-on-error -output-directory=../exports book4-complete-through-chapter-11.tex >>/tmp/book4-full11.log
mv -f ../exports/book4-complete-through-chapter-11.pdf ../exports/book-04-complete-editorial-proof-through-chapter-11.pdf
ls -lh ../exports/chapter-11-can-we-trust-an-autonomous-operator-editorial-proof.pdf ../exports/book-04-complete-editorial-proof-through-chapter-11.pdf
