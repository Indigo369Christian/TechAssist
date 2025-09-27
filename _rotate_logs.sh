#!/usr/bin/env zsh
set -euo pipefail
LOGDIR="$HOME/Projekte/TechAssist/_logs"
ls -tp "$LOGDIR"/sort_log_*.csv 2>/dev/null | tail -n +11 | xargs -I{} rm -f "{}" 2>/dev/null || true
