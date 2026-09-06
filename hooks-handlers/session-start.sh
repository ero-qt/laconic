#!/usr/bin/env bash
# Emit the laconic style (minus its frontmatter) as SessionStart additionalContext.
# Pure awk: no python, jq, or node required.
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
BODY="$(awk '
  BEGIN { fm = 0; ORS = "" }
  /^---$/ { fm++; next }
  fm >= 2 {
    gsub(/[\\]/, "\\\\")
    gsub(/"/, "\\\"")
    gsub(/\t/, "\\t")
    gsub(/\r/, "")
    print $0 "\\n"
  }' "$ROOT/output-styles/laconic.md")"
printf '{"hookSpecificOutput":{"hookEventName":"SessionStart","additionalContext":"%s"}}\n' "$BODY"
exit 0
