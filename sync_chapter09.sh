#!/usr/bin/env bash
set -euo pipefail
ROOT='/mnt/c/Users/Utilisateur/Operator-library/books/book-04-the-age-of-operational-ai'
mkdir -p "$ROOT/manuscript/chapters"
curl -fsSL 'https://files.manuscdn.com/user_upload_by_module/session_file/310519663085699459/QhWEHDhYVlnWeDNG.md' -o "$ROOT/manuscript/chapters/chapter-09-body-v4.md"
curl -fsSL 'https://files.manuscdn.com/user_upload_by_module/session_file/310519663085699459/UKAanXBLpeLDRHny.tex' -o "$ROOT/config/chapter-09-proof.tex"
curl -fsSL 'https://files.manuscdn.com/user_upload_by_module/session_file/310519663085699459/hQcfJzTDQeChoyES.tex' -o "$ROOT/config/book4-complete-through-chapter-09.tex"
curl -fsSL 'https://files.manuscdn.com/user_upload_by_module/session_file/310519663085699459/awUaflqOcbNWItGn.md' -o "$ROOT/config/standard-sources-bibliographie-transitions-v4.md"
ls -lh "$ROOT/manuscript/chapters/chapter-09-body-v4.md" "$ROOT/config/chapter-09-proof.tex" "$ROOT/config/book4-complete-through-chapter-09.tex"
