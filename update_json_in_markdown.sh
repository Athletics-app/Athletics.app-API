#!/usr/bin/env bash
set -e

DOCS_DIR="docs"

# Recursively process a JSON file and replace all "Path:..." references
process_json_file() {
    local jsonfile="$1"
    local depth="${2:-0}"
    local max_depth=10
    
    if [ ! -f "$jsonfile" ]; then
        echo "null"
        return
    fi
    
    if [ "$depth" -ge "$max_depth" ]; then
        echo "null"
        return
    fi
    
    local content
    content=$(cat "$jsonfile")
    
    # Find all "Path: xxx" strings and replace them
    while echo "$content" | grep -q '"Path:'; do
        # Extract the first Path: reference
        local path_ref
        path_ref=$(echo "$content" | grep -o '"Path:[^"]*"' | head -1 | sed 's/"Path://;s/"//' | xargs)
        
        if [ -z "$path_ref" ]; then
            break
        fi
        
        # Get the nested content
        local nested_content
        if [ -f "$path_ref" ]; then
            nested_content=$(process_json_file "$path_ref" $((depth + 1)))
            # Remove newlines for inline replacement
            nested_content=$(echo "$nested_content" | jq -c . 2>/dev/null || echo "null")
        else
            nested_content="null"
        fi
        
        # Replace in content (escape for sed)
        local search_pattern="\"Path: *${path_ref}\""
        content=$(echo "$content" | sed "s|\"Path: *${path_ref}\"|${nested_content}|")
    done
    
    # Pretty print the result
    echo "$content" | jq . 2>/dev/null || echo "$content"
}

export -f process_json_file

echo "🔄 Processing Markdown files in $DOCS_DIR..."
echo ""

# Process each markdown file
find "$DOCS_DIR" -name "*.md" | while read -r mdfile; do
    echo "📄 Processing: $mdfile"
    
    updated=0
    
    # Create temp file
    TMP="${mdfile}.tmp"
    
    # Process the file line by line, but handle multi-line blocks
    {
        in_json_block=0
        json_path=""
        json_content=""
        
        while IFS= read -r line || [ -n "$line" ]; do
            # Check for Path: line
            if [[ "$line" =~ ^Path:[[:space:]]*(.+)$ ]]; then
                json_path="${BASH_REMATCH[1]}"
                json_path=$(echo "$json_path" | xargs) # trim whitespace
                echo "$line"
                continue
            fi
            
            # Check for start of json block
            if [[ "$line" == '```json' ]] && [ -n "$json_path" ]; then
                in_json_block=1
                json_content=""
                echo "$line"
                continue
            fi
            
            # Check for end of json block
            if [[ "$line" == '```' ]] && [ "$in_json_block" -eq 1 ]; then
                in_json_block=0
                
                # Process the JSON file
                if [ -f "$json_path" ]; then
                    new_json=$(process_json_file "$json_path")
                    echo "$new_json"
                    echo "  ✓ Updated: $json_path" >&2
                    updated=1
                else
                    echo "$json_content"
                    echo "  ⚠️  Not found: $json_path" >&2
                fi
                
                echo "$line"
                json_path=""
                continue
            fi
            
            # If we're in a json block, collect but don't output yet
            if [ "$in_json_block" -eq 1 ]; then
                json_content="${json_content}${line}"$'\n'
                continue
            fi
            
            # Handle <!-- JSON: xxx --> markers
            if [[ "$line" =~ \<!--[[:space:]]*JSON:[[:space:]]*([^[:space:]]+)[[:space:]]*--\> ]]; then
                marker_path="${BASH_REMATCH[1]}"
                
                if [ -f "$marker_path" ]; then
                    new_json=$(process_json_file "$marker_path")
                    echo "Path: $marker_path"
                    echo '```json'
                    echo "$new_json"
                    echo '```'
                    echo "  ✓ Converted marker: $marker_path" >&2
                    updated=1
                else
                    echo "$line"
                    echo "  ⚠️  Not found: $marker_path" >&2
                fi
                continue
            fi
            
            # Regular line
            echo "$line"
        done < "$mdfile"
    } > "$TMP" 2>&1
    
    # Filter stderr from stdout and show it
    grep "^  " "$TMP" >&2 || true
    grep -v "^  " "$TMP" > "${TMP}.clean"
    
    # Replace original if changed
    if ! cmp -s "$mdfile" "${TMP}.clean"; then
        mv "${TMP}.clean" "$mdfile"
        echo "  → File updated"
    else
        rm "${TMP}.clean"
        echo "  → No changes"
    fi
    
    rm -f "$TMP"
    echo ""
done

echo "✅ All Markdown files processed!"