#!/usr/bin/env bash
set -e

DOCS_DIR="docs"

# Loop through all Markdown files in docs/
find "$DOCS_DIR" -name "*.md" | while read -r mdfile; do
  TMP="$mdfile.tmp"
  cp "$mdfile" "$TMP"
  
  # Find all JSON markers
  grep -o '<!-- JSON: [^ ]* -->' "$mdfile" | while read -r marker; do
    # Extract jsonfile using bash parameter expansion (no sed!)
    jsonfile="${marker#<!-- JSON: }"
    jsonfile="${jsonfile% -->}"
    
    if [ -f "$jsonfile" ]; then
      echo "Injecting $jsonfile into $mdfile ..."
      
      # Get JSON content and format it nicely
      content=$(jq . "$jsonfile")
      
      # Create a temporary perl script to avoid command line length issues
      perl_script=$(mktemp)
      cat > "$perl_script" << 'PERLEOF'
use strict;
use warnings;

my $marker = $ARGV[0];
my $content = $ARGV[1];

# Read the file
my $file = $ARGV[2];
open my $fh, '<', $file or die "Cannot open $file: $!";
my $data = do { local $/; <$fh> };
close $fh;

# Replace marker with content block
my $content_block = "```json\n$content\n```";
$data =~ s/\Q$marker\E/$content_block/g;

# Write back
open $fh, '>', $file or die "Cannot write $file: $!";
print $fh $data;
close $fh;
PERLEOF
      
      perl "$perl_script" "$marker" "$content" "$TMP"
      rm "$perl_script"
    else
      echo "⚠️ JSON file niet gevonden: $jsonfile"
    fi
  done
  
  mv "$TMP" "$mdfile"
done

echo "✅ Alle Markdown-bestanden geüpdatet!"
