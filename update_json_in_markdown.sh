# #!/usr/bin/env bash
set -e

DOCS_DIR="docs"

# Function to recursively replace Path: fields inside JSON
process_json_file() {
    local jsonfile="$1"
    local content
    if [ -f "$jsonfile" ]; then
        # Read and format JSON
        content=$(jq . "$jsonfile")

        # Recursively replace "Path:..." fields
        while echo "$content" | grep -q '"Path:[^"]*"'; do
            content=$(echo "$content" | perl -pe '
                use strict;
                use warnings;
                s/"Path:([^"]+)"/do {
                    my $f = $1;
                    if (-f $f) {
                        my $c = `jq . $f`;
                        $c =~ s/\n/\n/g;  # preserve newlines
                        $c;
                    } else {
                        warn "⚠️ Embedded JSON file not found: $f\n";
                        "null"
                    }
                }/ge;
            ')
        done

        echo "$content"
    else
        echo "⚠️ JSON file not found: $jsonfile" >&2
        echo "{}"
    fi
}

# Loop through all Markdown files in docs/
find "$DOCS_DIR" -name "*.md" | while read -r mdfile; do
    TMP="$mdfile.tmp"
    cp "$mdfile" "$TMP"

    perl -i -0777 -pe '
        use strict;
        use warnings;

        # Function to run bash to get processed JSON
        sub process_json {
            my $file = shift;
            my $json = `bash -c "process_json_file '$file'"`;
            return $json;
        }

        # Replace <!-- JSON: ... --> markers
        while (/<!-- JSON: ([^ ]*) -->/g) {
            my $jsonfile = $1;
            if (-f $jsonfile) {
                my $content = `jq . $jsonfile`;  # call process_json_file if embedded needed
                my $block = "```json\n$content\n```";
                s/<!-- JSON: \Q$jsonfile\E -->/$block/g;
                print "Updated marker $jsonfile\n";
            } else {
                warn "⚠️ JSON file not found: $jsonfile\n";
            }
        }

        # Replace Path: <jsonfile> followed by a ```json block
        while (/Path:\s*(.+?)\n```json\n(.*?)```/sg) {
            my $jsonfile = $1;
            my $oldblock = $2;
            if (-f $jsonfile) {
                my $newcontent = `bash -c "process_json_file '$jsonfile'"`;
                s/\Q$oldblock\E/$newcontent/s;
                print "Updated JSON block $jsonfile\n";
            } else {
                warn "⚠️ JSON file not found: $jsonfile\n";
            }
        }
    ' "$TMP"

    mv "$TMP" "$mdfile"
done

echo "✅ Alle Markdown-bestanden geüpdatet!"
