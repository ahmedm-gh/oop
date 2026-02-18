import re

files = [
    r'd:\loopsbase\lib\data\design_patterns\creational_patterns.dart',
    r'd:\loopsbase\lib\data\design_patterns\structural_patterns.dart'
]

def add_import_if_needed(content, import_statement, triggers):
    # Check if any trigger is present
    has_trigger = False
    for t in triggers:
        if re.search(r'\b' + re.escape(t) + r'\b', content):
            has_trigger = True
            break
            
    if not has_trigger:
        return content
        
    # Check if import already exists (simple check)
    if import_statement.strip() in content:
        return content
        
    # Add import
    lines = content.split('\n')
    last_import_idx = -1
    for i, line in enumerate(lines):
        if line.strip().startswith('import ') and not line.strip().startswith('import "'):
            last_import_idx = i
            
    if last_import_idx != -1:
        lines.insert(last_import_idx + 1, import_statement)
        return '\n'.join(lines)
    else:
        # Check if first line is a comment, if so, keep it? 
        # Actually usually imports go before comments if it's a file header, 
        # but in snippets comments often explain the example. 
        # Let's put imports at the top, followed by a blank line.
        return import_statement + '\n\n' + content

def fix_imports(code):
    c = code
    c = add_import_if_needed(c, "import 'package:flutter/material.dart';", ['MaterialApp', 'Scaffold', 'StatelessWidget', 'StatefulWidget', 'Widget', 'BuildContext', 'Colors', 'Icons', 'Text', 'Column', 'Row', 'SizedBox', 'Container', 'ElevatedButton', 'Theme', 'TextStyle', 'EdgeInsets', 'BorderRadius', 'VoidCallback', 'CircularProgressIndicator', 'LinearGradient', 'BoxDecoration', 'Card', 'TextField', 'InputDecoration', 'OutlineInputBorder', 'TextButton', 'ListView', 'ListTile', 'Padding', 'Center', 'InkWell', 'GestureDetector', 'Stack', 'Positioned', 'Align'])
    c = add_import_if_needed(c, "import 'package:flutter/cupertino.dart';", ['CupertinoApp', 'CupertinoButton', 'CupertinoColors', 'CupertinoTextField', 'CupertinoAlertDialog', 'CupertinoDialogAction'])
    c = add_import_if_needed(c, "import 'dart:io';", ['Platform', 'File', 'Directory'])
    c = add_import_if_needed(c, "import 'dart:convert';", ['json', 'jsonDecode', 'jsonEncode'])
    c = add_import_if_needed(c, "import 'dart:math';", ['Random', 'Point', 'Rectangle', 'max', 'min'])
    # Stream is in dart:async, but also exported by dart:core? No, Stream is async.
    c = add_import_if_needed(c, "import 'dart:async';", ['Stream', 'Completer', 'Timer']) 
    return c

def fix_shorthands(code):
    # .height(n) -> SizedBox(height: n)
    code = re.sub(r'(?<!\w)\.height\s*\(\s*(\d+(\.\d+)?)\s*\)', r'SizedBox(height: \1)', code)
    code = re.sub(r'(?<!\w)\.width\s*\(\s*(\d+(\.\d+)?)\s*\)', r'SizedBox(width: \1)', code)
    
    # Styles
    code = re.sub(r'style:\s*\.white', r'style: TextStyle(color: Colors.white)', code)
    code = re.sub(r'style:\s*\.bold', r'style: TextStyle(fontWeight: FontWeight.bold)', code)
    code = re.sub(r'style:\s*\.caption', r'style: TextStyle(color: Colors.grey)', code)

    # Colors
    colors = ['white', 'black', 'red', 'green', 'blue', 'grey', 'transparent', 'purple', 'pink', 'orange', 'yellow', 'amber', 'teal', 'indigo', 'cyan']
    for col in colors:
         # Be careful not to replace 'my.white' -> 'my.Colors.white'
        pattern = r'(?<=[\s\(\[,:])\.' + col + r'(?=\W)'
        code = re.sub(pattern, f'Colors.{col}', code)

    # EdgeInsets
    code = re.sub(r'(?<=[\s\(\[,:])\.all\s*\(', r'EdgeInsets.all(', code)
    code = re.sub(r'(?<=[\s\(\[,:])\.symmetric\s*\(', r'EdgeInsets.symmetric(', code)
    code = re.sub(r'(?<=[\s\(\[,:])\.only\s*\(', r'EdgeInsets.only(', code)
    # .zero can be EdgeInsets or BorderRadius or Size. 
    # Usually EdgeInsets in UI lists.
    # We'll skip .zero for now to avoid breaking Size.zero if used (though Size.zero is common).
    # If context is Padding(padding: .zero), it's EdgeInsets.
    code = re.sub(r'padding:\s*\.zero', r'padding: EdgeInsets.zero', code)
    code = re.sub(r'margin:\s*\.zero', r'margin: EdgeInsets.zero', code)

    # BorderRadius
    code = re.sub(r'(?<=[\s\(\[,:])\.circular\s*\(', r'BorderRadius.circular(', code)

    # FontWeight
    code = re.sub(r'(?<=[\s\(\[,:])\.bold(?=\W)', r'FontWeight.bold', code)
    code = re.sub(r'(?<=[\s\(\[,:])\.normal(?=\W)', r'FontWeight.normal', code)
    
    # TextInputType
    code = re.sub(r'(?<=[\s\(\[,:])\.emailAddress(?=\W)', r'TextInputType.emailAddress', code)
    code = re.sub(r'keyboardType:\s*\.phone', r'keyboardType: TextInputType.phone', code)
    code = re.sub(r'keyboardType:\s*\.text', r'keyboardType: TextInputType.text', code)
    code = re.sub(r'keyboardType:\s*\.number', r'keyboardType: TextInputType.number', code)

    # Double
    code = re.sub(r'(?<=[\s\(\[,:])\.infinity(?=\W)', r'double.infinity', code)

    return code

def process_file(path):
    print(f"Processing {path}...")
    with open(path, 'r', encoding='utf-8') as f:
        content = f.read()
        
    regex = r'StrCodeBlock\s*\(\s*(?P<quote>r"{3}|r\'{3})(?P<content>.*?)(?P=quote)'
    pattern = re.compile(regex, re.DOTALL)
    
    count = 0
    def replacer(match):
        nonlocal count
        inner = match.group('content')
        quote = match.group('quote')
        
        fixed_inner = fix_shorthands(inner)
        fixed_inner = fix_imports(fixed_inner)
        count += 1
        
        return f'StrCodeBlock({quote}{fixed_inner}{quote}'

    new_content = pattern.sub(replacer, content)
    
    with open(path, 'w', encoding='utf-8') as f:
        f.write(new_content)
    print(f"Processed {count} blocks in {path}")

for p in files:
    try:
        process_file(p)
    except Exception as e:
        print(f"Error processing {p}: {e}")
