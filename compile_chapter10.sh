#!/usr/bin/env bash
set -euo pipefail
ROOT='/mnt/c/Users/Utilisateur/Operator-library/books/book-04-the-age-of-operational-ai'
BASE='https://files.manuscdn.com/user_upload_by_module/session_file/310519663085699459'
curl -fsSL "$BASE/EbHhcbSjwsGbLqqR.md" -o "$ROOT/manuscript/chapters/chapter-10-the-ai-supply-chain-draft-v1.md"
curl -fsSL "$BASE/fKFrXqMamNNNfVzi.md" -o "$ROOT/manuscript/chapters/chapter-10-body-book-v4.md"
curl -fsSL "$BASE/KWhAHwfYAZcZVXyB.tex" -o "$ROOT/config/chapter-10-proof.tex"
curl -fsSL "$BASE/bsLtwLDGpoNiSreU.tex" -o "$ROOT/config/book4-complete-through-chapter-10.tex"
cd "$ROOT"
pandoc -f markdown -t latex manuscript/chapters/chapter-10-the-ai-supply-chain-draft-v1.md -o chapter-10-body-v4.tex
pandoc -f markdown -t latex manuscript/chapters/chapter-10-body-book-v4.md -o chapter-10-body-book-v4.tex
cd "$ROOT/config"
xelatex -interaction=nonstopmode -halt-on-error -output-directory=../exports chapter-10-proof.tex >/tmp/book4-ch10.log
xelatex -interaction=nonstopmode -halt-on-error -output-directory=../exports chapter-10-proof.tex >>/tmp/book4-ch10.log
mv -f ../exports/chapter-10-proof.pdf ../exports/chapter-10-the-ai-supply-chain-editorial-proof.pdf
xelatex -interaction=nonstopmode -halt-on-error -output-directory=../exports book4-complete-through-chapter-10.tex >/tmp/book4-full10.log
xelatex -interaction=nonstopmode -halt-on-error -output-directory=../exports book4-complete-through-chapter-10.tex >>/tmp/book4-full10.log
mv -f ../exports/book4-complete-through-chapter-10.pdf ../exports/book-04-complete-editorial-proof-through-chapter-10.pdf
ls -lh ../exports/chapter-10-the-ai-supply-chain-editorial-proof.pdf ../exports/book-04-complete-editorial-proof-through-chapter-10.pdf
