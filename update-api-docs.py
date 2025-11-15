#!/usr/bin/env python3
import os
import re
import json
import sys
from pathlib import Path

DOCS_DIR = "docs"

def read_json_file(json_path, depth=0, max_depth=10):
    """Read and parse a JSON file, recursively replacing Path: references."""
    if depth >= max_depth:
        print(f"  ⚠️  Max nesting depth reached for: {json_path}", file=sys.stderr)
        return None
    
    if not os.path.isfile(json_path):
        print(f"  ⚠️  File not found: {json_path}", file=sys.stderr)
        return None
    
    try:
        with open(json_path, 'r', encoding='utf-8') as f:
            data = json.load(f)
        
        # Recursively replace "Path:..." values
        def replace_paths(obj, current_file_dir):
            if isinstance(obj, dict):
                return {k: replace_paths(v, current_file_dir) for k, v in obj.items()}
            elif isinstance(obj, list):
                return [replace_paths(item, current_file_dir) for item in obj]
            elif isinstance(obj, str) and obj.startswith("Path:"):
                # Extract the path (remove "Path:" prefix and whitespace)
                nested_path = obj[5:].strip()
                
                # Resolve relative paths
                if nested_path.startswith('../') or nested_path.startswith('./'):
                    nested_path = os.path.normpath(os.path.join(current_file_dir, nested_path))
                
                # Recursively load the nested file
                nested_data = read_json_file(nested_path, depth + 1, max_depth)
                return nested_data if nested_data is not None else None
            else:
                return obj
        
        # Get the directory of the current JSON file for resolving relative paths
        file_dir = os.path.dirname(json_path)
        result = replace_paths(data, file_dir)
        
        return result
        
    except json.JSONDecodeError as e:
        print(f"  ⚠️  Invalid JSON in {json_path}: {e}", file=sys.stderr)
        return None
    except Exception as e:
        print(f"  ⚠️  Error reading {json_path}: {e}", file=sys.stderr)
        return None

def process_markdown_file(md_path):
    """Process a markdown file and update all Path: blocks."""
    with open(md_path, 'r', encoding='utf-8') as f:
        lines = f.readlines()
    
    new_lines = []
    i = 0
    updated = False
    
    while i < len(lines):
        line = lines[i]
        
        # Check if line starts with "Path:"
        if line.strip().startswith('Path:'):
            json_path = line.strip()[5:].strip()  # Remove "Path:" and whitespace
            
            # Check if next line is ```json (existing block)
            if i + 1 < len(lines) and lines[i + 1].strip() == '```json':
                # Find the closing ```
                json_start = i + 2
                json_end = json_start
                
                while json_end < len(lines) and lines[json_end].strip() != '```':
                    json_end += 1
                
                if json_end < len(lines):
                    # Read the JSON file
                    data = read_json_file(json_path)
                    
                    if data is not None:
                        # Replace the old JSON block
                        new_lines.append(line)  # Path: line
                        new_lines.append('```json\n')
                        new_lines.append(json.dumps(data, indent=2, ensure_ascii=False) + '\n')
                        new_lines.append('```\n')
                        
                        print(f"  ✓ Updated: {json_path}", file=sys.stderr)
                        updated = True
                        
                        # Skip the old block
                        i = json_end + 1
                        continue
                    else:
                        # Keep original if file not found
                        new_lines.append(line)
                        i += 1
                        continue
            else:
                # No JSON block after Path: - add one
                data = read_json_file(json_path)
                
                if data is not None:
                    new_lines.append(line)  # Path: line
                    new_lines.append('```json\n')
                    new_lines.append(json.dumps(data, indent=2, ensure_ascii=False) + '\n')
                    new_lines.append('```\n')
                    
                    print(f"  ✓ Added block: {json_path}", file=sys.stderr)
                    updated = True
                    i += 1
                    continue
                else:
                    # Keep original if file not found
                    new_lines.append(line)
                    i += 1
                    continue
        
        # Regular line - just copy it
        new_lines.append(line)
        i += 1
    
    # Write back if changed
    if updated:
        with open(md_path, 'w', encoding='utf-8') as f:
            f.writelines(new_lines)
        return True
    
    return False

def main():
    print(f"🔄 Processing Markdown files in {DOCS_DIR}...")
    print()
    
    # Find all markdown files
    md_files = list(Path(DOCS_DIR).rglob("*.md"))
    
    if not md_files:
        print(f"No markdown files found in {DOCS_DIR}")
        return
    
    print(f"Found {len(md_files)} markdown file(s):")
    for f in md_files:
        print(f"  - {f}")
    print()
    
    for md_path in md_files:
        print(f"📄 Processing: {md_path}")
        
        try:
            updated = process_markdown_file(str(md_path))
            
            if updated:
                print("  → File updated")
            else:
                print("  → No changes")
        except Exception as e:
            print(f"  ❌ Error: {e}", file=sys.stderr)
        
        print()
    
    print("✅ All Markdown files processed!")

if __name__ == "__main__":
    main()