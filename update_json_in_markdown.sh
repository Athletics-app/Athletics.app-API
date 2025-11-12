#!/usr/bin/env bash
set -e

DOCS_DIR="docs"

# Loop through all Markdown files in docs/
find "$DOCS_DIR" -name "*.md" | while read -r mdfile; do
  TMP="$mdfile.tmp"
  cp "$mdfile" "$TMP"
  
  # Find all JSON markers
  grep -o '<!-- JSON: [^ ]* -->' "$mdfile" | while read -r marker; do
    jsonfile=$(echo "$marker" | sed -E 's/<!-- JSON: (.*) -->/\1/')
    
    if [ -f "$jsonfile" ]; then
      echo "Injecting $jsonfile into $mdfile ..."
      
      # Get JSON content and format it nicely
      content=$(jq . "$jsonfile")
      
      # Create content block with proper formatting
      content_block="\`\`\`json
${content}
\`\`\`"
      
      # Escape special characters for sed
      content_block_escaped=$(printf '%s\n' "$content_block" | sed -e 's/[\/&]/\\&/g')
      marker_escaped=$(printf '%s\n' "$marker" | sed -e 's/[\/&]/\\&/g')
      
      # Use perl for more reliable multiline replacement
      perl -i -pe "s|\Q$marker_escaped\E|$content_block_escaped|g" "$TMP"
    else
      echo "⚠️ JSON file niet gevonden: $jsonfile"
    fi
  done
  
  mv "$TMP" "$mdfile"
done

echo "✅ Alle Markdown-bestanden geüpdatet!"
