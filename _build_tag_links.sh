#!/usr/bin/env zsh
set -euo pipefail
BASE="$HOME/Projekte/TechAssist"
OUT="$BASE/00_Tags"
mkdir -p "$OUT"
TAGS=("Businessplan" "Deckblatt" "OnePager" "Appendix" "Hauptdokument" "Quelle"
      "Branding" "Guidelines" "Briefpapier" "Visitenkarte" "Umschlag" "Icons"
      "Praesentation" "Mappe" "MasterTemplate" "SocialMedia" "Vorlagen"
      "Finanzen" "Rechnung" "Archiv" "Backup" "EN" "TechAssist")
for t in "${TAGS[@]}"; do
  td="$OUT/$t"; rm -rf "$td"; mkdir -p "$td"
  while IFS= read -r -d '' f; do ln -sf "$f" "$td/$(basename "$f")"; done \
    < <(mdfind -0 -onlyin "$BASE" "kMDItemUserTags == '$t'")
done
echo "Links aktualisiert in $OUT"
