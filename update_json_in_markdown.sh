#!/usr/bin/env bash

set -e

DOCS_DIR="docs"

# Loop door alle Markdown-bestanden in docs/
find "$DOCS_DIR" -name "*.md" | while read -r mdfile; do
  TMP="$mdfile.tmp"
  cp "$mdfile" "$TMP"

  # Zoek alle JSON markers
  grep -o '<!-- JSON: [^ ]* -->' "$mdfile" | while read -r marker; do
    jsonfile=$(echo "$marker" | sed -E 's/<!-- JSON: (.*) -->/\1/')
    if [ -f "$jsonfile" ]; then
      echo "Injecting $jsonfile into $mdfile ..."
      content=$(jq . "$jsonfile")  # mooi geformatteerd
      content_block="\`\`\`json\n${content}\n\`\`\`"
      sed -i "s|$marker|$content_block|" "$TMP"
    else
      echo "⚠️ JSON file niet gevonden: $jsonfile"
    fi
  done

  mv "$TMP" "$mdfile"
done

echo "✅ Alle Markdown-bestanden geüpdatet!"
