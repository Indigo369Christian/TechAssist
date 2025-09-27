#!/usr/bin/env zsh
set -euo pipefail
BASE="$HOME/Projekte/TechAssist"
echo "### Versionsübersicht (neueste zuerst)"
for d in "$BASE/01_Businessplan/Plan" "$BASE/01_Businessplan/OnePager" "$BASE/01_Businessplan/Deckblatt"; do
  echo "\n== $(basename "$d") =="
  ls -lt "$d"/*.pdf 2>/dev/null | awk '{print $6,$7,$8,$9}'
done
echo "\n### Inhaltliche Dubletten (SHA256):"
find "$BASE" -type f -name '*.pdf' -print0 | xargs -0 shasum -a 256 | sort | awk '{
  if($1==prev){ print "DUP\t" $0 ORS "\t" prev_line }
  prev=$1; prev_line=$0
}'
