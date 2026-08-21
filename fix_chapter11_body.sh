#!/usr/bin/env bash
set -euo pipefail
ROOT='/mnt/c/Users/Utilisateur/Operator-library/books/book-04-the-age-of-operational-ai'
URL='https://files.manuscdn.com/user_upload_by_module/session_file/310519663085699459/WyvBCRKSPoynzYjJ.md'
curl -fsSL "$URL" -o "$ROOT/chapter-11-body-v4.md"
cd "$ROOT"
pandoc -f markdown -t latex chapter-11-body-v4.md -o chapter-11-body-v4.tex
cd "$ROOT/config"
xelatex -interaction=nonstopmode -halt-on-error -output-directory=../exports chapter-11-proof.tex >/tmp/book4-ch11-fix.log
xelatex -interaction=nonstopmode -halt-on-error -output-directory=../exports chapter-11-proof.tex >>/tmp/book4-ch11-fix.log
mv -f ../exports/chapter-11-proof.pdf ../exports/chapter-11-can-we-trust-an-autonomous-operator-editorial-proof.pdf
xelatex -interaction=nonstopmode -halt-on-error -output-directory=../exports book4-complete-through-chapter-11.tex >/tmp/book4-full11-fix.log
xelatex -interaction=nonstopmode -halt-on-error -output-directory=../exports book4-complete-through-chapter-11.tex >>/tmp/book4-full11-fix.log
mv -f ../exports/book4-complete-through-chapter-11.pdf ../exports/book-04-complete-editorial-proof-through-chapter-11.pdf
ls -lh ../exports/chapter-11-can-we-trust-an-autonomous-operator-editorial-proof.pdf ../exports/book-04-complete-editorial-proof-through-chapter-11.pdf
