#!/usr/bin/env python3

import re
import sys
import argparse
from pathlib import Path

def convert_gfm_to_quarto(content):
    # 1. Convert Mermaid code blocks
    # GFM uses ```mermaid, Quarto needs ```{mermaid} to render the diagram
    content = re.sub(r'^```mermaid\s*$', '```{mermaid}', content, flags=re.MULTILINE)
    
    # 2. Convert GFM Alerts to Quarto Callouts
    lines = content.split('\n')
    processed_lines = []
    in_callout = False
    
    # Map GitHub alert types to Quarto callout types
    callout_mapping = {
        'NOTE': 'note',
        'TIP': 'tip',
        'INFO': 'tip',
        'IMPORTANT': 'important',
        'WARNING': 'warning',
        'CAUTION': 'caution'
    }
    
    for line in lines:
        # Match the start of a GFM alert: > [!TYPE]
        alert_match = re.match(r'^>\s*\[!(NOTE|TIP|INFO|IMPORTANT|WARNING|CAUTION)\](.*)', line, re.IGNORECASE)
        
        # Match a standard blockquote continuation line
        blockquote_match = re.match(r'^>\s?(.*)', line)
        
        if alert_match:
            if in_callout:
                processed_lines.append(':::') # Close previous callout if adjacent
            
            gfm_type = alert_match.group(1).upper()
            quarto_type = callout_mapping.get(gfm_type, 'note')
            remaining_text = alert_match.group(2).strip()
            
            processed_lines.append(f'::: {{.callout-{quarto_type}}}')
            if remaining_text:
                processed_lines.append(remaining_text)
            
            in_callout = True
            
        elif in_callout and blockquote_match:
            # We are inside an alert and the line continues the blockquote
            processed_lines.append(blockquote_match.group(1))
            
        elif in_callout and not line.strip():
            # An empty line without a '>' breaks the GFM blockquote
            processed_lines.append(':::')
            processed_lines.append(line)
            in_callout = False
            
        else:
            if in_callout:
                # Exited the blockquote
                processed_lines.append(':::')
                in_callout = False
            processed_lines.append(line)
            
    # Close any trailing callouts at the end of the file
    if in_callout:
        processed_lines.append(':::')
        
    return '\n'.join(processed_lines)

def main():
    parser = argparse.ArgumentParser(description="Convert GFM to Quarto Markdown (.qmd)")
    parser.add_argument("input_file", help="Path to the GFM .md file")
    parser.add_argument("-o", "--output", help="Output .qmd file path (Optional)", default=None)
    
    args = parser.parse_args()
    input_path = Path(args.input_file)
    
    if not input_path.exists():
        print(f"Error: File '{args.input_file}' not found.")
        sys.exit(1)
        
    # Default to saving as .qmd if no output is provided
    output_path = Path(args.output) if args.output else input_path.with_suffix('.qmd')
    
    with open(input_path, 'r', encoding='utf-8') as f:
        content = f.read()
        
    quarto_content = convert_gfm_to_quarto(content)
    
    with open(output_path, 'w', encoding='utf-8') as f:
        f.write(quarto_content)
        
    print(f"✅ Successfully converted '{input_path.name}' to '{output_path.name}'.")

if __name__ == "__main__":
    main()

