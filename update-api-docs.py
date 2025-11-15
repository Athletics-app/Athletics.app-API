#!/usr/bin/env python3
import os
import re
import json
import sys
from pathlib import Path

DOCS_DIR = "docs"
MAX_DEPTH = 10

def process_json_file(json_path, depth=0):
    """Recursively process a JSON file and replace all 'Path: xxx' references."""
    if depth >= MAX_DEPTH:
        print(f"⚠️  Max recursion depth reached for: {json_path}", file=sys.stderr)
        return None
    
    if not os.path.isfile(json_path):
        print(f"⚠️  JSON file not found: {json_path}", file=sys.stderr)
        return None
    
    try:
        with open(json_path, 'r', encoding='utf-8') as f:
            content = f.read()
        
        # Parse JSON
        data = json.loads(content)
        
        # Recursively replace "Path: xxx" values
        def replace_paths(obj):
            if isinstance(obj, dict):
                return {k: replace_paths(v) for k, v in obj.items()}
            elif isinstance(obj, list):
                return [replace_paths(item) for item in obj]
            elif isinstance(obj, str) and obj.startswith("Path:"):
                # Extract the path
                nested_path = obj[5:].strip()
                # Recursively process
                nested_data = process_json_file(nested_path, depth + 1)
                return nested_data if nested_data is not None else None
            else:
                return obj
        
        result = replace_paths(data)
        return result
        
    except json.JSONDecodeError as e:
        print(f"⚠️  Invalid JSON in {json_path}: {e}", file=sys.stderr)
        return None
    except Exception as e:
        print(f"⚠️  Error processing {json_path}: {e}", file=sys.stderr)
        return None

def process_markdown_file(md_path):
    """Process a markdown file and update all Path: xxx blocks."""
    with open(md_path, 'r', encoding='utf-8') as f:
        content = f.read()
    
    original_content = content
    updated = False
    
    # Pattern 1: Handle <!-- JSON: xxx --> markers (convert to Path: format)
    def replace_marker(match):
        nonlocal updated
        json_path = match.group(1).strip()
        
        if not os.path.isfile(json_path):
            print(f"  ⚠️  Not found: {json_path}", file=sys.stderr)
            return match.group(0)
        
        data = process_json_file(json_path)
        if data is None:
            return match.group(0)
        
        json_str = json.dumps(data, indent=2, ensure_ascii=False)
        print(f"  ✓ Converted marker: {json_path}", file=sys.stderr)
        updated = True
        return f"Path: {json_path}\n```json\n{json_str}\n```"
    
    content = re.sub(
        r'<!--\s*JSON:\s*([^\s]+)\s*-->',
        replace_marker,
        content
    )
    
    # Pattern 2: Update existing Path: xxx followed by ```json blocks
    def replace_block(match):
        nonlocal updated
        json_path = match.group(1).strip()
        old_json = match.group(2)
        
        if not os.path.isfile(json_path):
            print(f"  ⚠️  Not found: {json_path}", file=sys.stderr)
            return match.group(0)
        
        data = process_json_file(json_path)
        if data is None:
            return match.group(0)
        
        new_json = json.dumps(data, indent=2, ensure_ascii=False)
        
        # Only update if content changed
        if old_json.strip() != new_json.strip():
            print(f"  ✓ Updated: {json_path}", file=sys.stderr)
            updated = True
            return f"Path: {json_path}\n```json\n{new_json}\n```"
        
        return match.group(0)
    
    content = re.sub(
        r'Path:\s*([^\n]+)\n```json\n(.*?)\n```',
        replace_block,
        content,
        flags=re.DOTALL
    )
    
    # Pattern 3: Handle standalone Path: xxx (without json block) - convert them
    def add_block(match):
        nonlocal updated
        json_path = match.group(1).strip()
        
        if not os.path.isfile(json_path):
            print(f"  ⚠️  Not found: {json_path}", file=sys.stderr)
            return match.group(0)
        
        data = process_json_file(json_path)
        if data is None:
            return match.group(0)
        
        json_str = json.dumps(data, indent=2, ensure_ascii=False)
        print(f"  ✓ Added block: {json_path}", file=sys.stderr)
        updated = True
        return f"Path: {json_path}\n```json\n{json_str}\n```"
    
    # Match "Path: xxx" that is NOT followed by ```json
    content = re.sub(
        r'Path:\s*([^\n]+)(?!\n```json)',
        add_block,
        content
    )
    
    # Write back if changed
    if content != original_content:
        with open(md_path, 'w', encoding='utf-8') as f:
            f.write(content)
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