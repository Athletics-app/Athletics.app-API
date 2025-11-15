#!/usr/bin/env bash
set -e

DOCS_DIR="docs"

# Function to recursively replace "Path:..." fields inside JSON
process_json_file() {
    local jsonfile="$1"
    
    if [ ! -f "$jsonfile" ]; then
        echo "⚠️  JSON file not found: $jsonfile" >&2
        echo "null"
        return
    fi
    
    # Read and format JSON
    local content
    content=$(jq . "$jsonfile" 2>/dev/null || echo "null")
    
    # Recursively replace "Path:..." values (max 10 levels to prevent infinite loops)
    local max_iterations=10
    local iteration=0
    
    while echo "$content" | grep -q '"Path:' && [ $iteration -lt $max_iterations ]; do
        content=$(echo "$content" | perl -0777 -pe '
            use strict;
            use warnings;
            
            s/"Path:\s*([^"]+)"/do {
                my $path = $1;
                $path =~ s|^\s+||;  # trim leading whitespace
                $path =~ s|\s+$||;  # trim trailing whitespace
                
                if (-f $path) {
                    # Read the nested JSON file
                    my $nested = `jq -c . "$path" 2>\/dev\/null || echo "null"`;
                    chomp $nested;
                    $nested;
                } else {
                    warn "⚠️  Nested JSON file not found: $path\n";
                    "null";
                }
            }/ge;
        ')
        ((iteration++))
    done
    
    # Pretty-print the final result
    echo "$content" | jq . 2>/dev/null || echo "$content"
}

# Export function so it can be used in subshells
export -f process_json_file

echo "🔄 Processing Markdown files in $DOCS_DIR..."
echo ""

# Loop through all Markdown files in docs/
find "$DOCS_DIR" -name "*.md" | while read -r mdfile; do
    echo "📄 Processing: $mdfile"
    TMP="$mdfile.tmp"
    cp "$mdfile" "$TMP"
    
    # Use Perl to process the file
    perl -i -0777 -pe '
        use strict;
        use warnings;
        
        my $updated = 0;
        
        # 1) Replace <!-- JSON: path --> markers (new conversions)
        while (/<!-- JSON:\s*([^\s]+)\s*-->/g) {
            my $jsonfile = $1;
            
            if (-f $jsonfile) {
                # Get processed JSON with nesting
                my $content = `bash -c '\''process_json_file "$jsonfile"'\''`;
                chomp $content;
                
                # Replace marker with code block
                my $block = "Path: $jsonfile\n\`\`\`json\n$content\n\`\`\`";
                s/<!-- JSON:\s*\Q$jsonfile\E\s*-->/$block/g;
                
                print STDERR "  ✓ Converted marker: $jsonfile\n";
                $updated = 1;
            } else {
                warn "  ⚠️  JSON file not found: $jsonfile\n";
            }
        }
        
        # 2) Update existing Path: ... blocks
        while (/Path:\s*([^\n]+)\n\`\`\`json\n(.*?)\n\`\`\`/sg) {
            my $jsonfile = $1;
            my $oldcontent = $2;
            
            # Trim whitespace from path
            $jsonfile =~ s/^\s+|\s+$//g;
            
            if (-f $jsonfile) {
                # Get processed JSON with nesting
                my $newcontent = `bash -c '\''process_json_file "$jsonfile"'\''`;
                chomp $newcontent;
                
                # Only replace if content actually changed
                if ($oldcontent ne $newcontent) {
                    # Escape special regex characters in old content for safe replacement
                    my $escaped_old = quotemeta($oldcontent);
                    s/(Path:\s*\Q$jsonfile\E\n\`\`\`json\n)$escaped_old(\n\`\`\`)/$1$newcontent$2/s;
                    
                    print STDERR "  ✓ Updated block: $jsonfile\n";
                    $updated = 1;
                }
            } else {
                warn "  ⚠️  JSON file not found: $jsonfile\n";
            }
        }
        
        if (!$updated) {
            print STDERR "  → No changes needed\n";
        }
    ' "$TMP" 2>&1
    
    # Only overwrite if file changed
    if ! cmp -s "$mdfile" "$TMP"; then
        mv "$TMP" "$mdfile"
    else
        rm "$TMP"
    fi
    
    echo ""
done

echo "✅ All Markdown files processed!"