#!/usr/bin/env bash
set -euo pipefail
ROOT='/mnt/c/Users/Utilisateur/Operator-library/books/book-04-the-age-of-operational-ai'
curl -fsSL 'https://files.manuscdn.com/user_upload_by_module/session_file/310519663085699459/nHjeBnqgQBRmpgzn.md' -o "$ROOT/manuscript/chapters/chapter-09-body-book-v4.md"
curl -fsSL 'https://files.manuscdn.com/user_upload_by_module/session_file/310519663085699459/cEtmSteXswOVGYiG.tex' -o "$ROOT/config/book4-complete-through-chapter-09.tex"
cd "$ROOT"
pandoc -f markdown -t latex manuscript/chapters/chapter-09-body-book-v4.md -o chapter-09-body-book-v4.tex
cd "$ROOT/config"
xelatex -interaction=nonstopmode -halt-on-error -output-directory=../exports book4-complete-through-chapter-09.tex >/tmp/book4-full9-fixed.log
xelatex -interaction=nonstopmode -halt-on-error -output-directory=../exports book4-complete-through-chapter-09.tex >>/tmp/book4-full9-fixed.log
mv -f ../exports/book4-complete-through-chapter-09.pdf ../exports/book-04-complete-editorial-proof-through-chapter-09.pdf
ls -lh ../exports/book-04-complete-editorial-proof-through-chapter-09.pdf
