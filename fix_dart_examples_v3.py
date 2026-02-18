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
        
    # Check if import already exists
    if import_statement.strip() in content:
        return content
        
    # Find existing imports to place next to them
    lines = content.split('\n')
    import_lines = [i for i, line in enumerate(lines) if line.strip().startswith('import ')]
    
    if import_lines:
        lines.insert(import_lines[-1] + 1, import_statement)
        return '\n'.join(lines)
    else:
        # No imports found, prepend
        return import_statement + '\n\n' + content

def fix_imports(code):
    c = code
    c = add_import_if_needed(c, "import 'package:flutter/material.dart';", ['MaterialApp', 'Scaffold', 'StatelessWidget', 'StatefulWidget', 'Widget', 'BuildContext', 'Colors', 'Icons', 'Text', 'Column', 'Row', 'SizedBox', 'Container', 'ElevatedButton', 'Theme', 'TextStyle', 'EdgeInsets', 'BorderRadius', 'VoidCallback', 'CircularProgressIndicator', 'LinearGradient', 'BoxDecoration', 'Card', 'TextField', 'InputDecoration', 'OutlineInputBorder', 'TextButton', 'ListView', 'ListTile', 'Padding', 'Center', 'InkWell', 'GestureDetector', 'Stack', 'Positioned', 'Align', 'ColorScheme'])
    c = add_import_if_needed(c, "import 'package:flutter/cupertino.dart';", ['CupertinoApp', 'CupertinoButton', 'CupertinoColors', 'CupertinoTextField', 'CupertinoAlertDialog', 'CupertinoDialogAction'])
    c = add_import_if_needed(c, "import 'package:flutter/foundation.dart';", ['kDebugMode', 'kReleaseMode', 'foundation'])
    c = add_import_if_needed(c, "import 'dart:io';", ['Platform', 'File', 'Directory'])
    c = add_import_if_needed(c, "import 'dart:convert';", ['json', 'jsonDecode', 'jsonEncode'])
    c = add_import_if_needed(c, "import 'dart:math';", ['Random', 'Point', 'Rectangle', 'max', 'min', 'Vector2'])
    c = add_import_if_needed(c, "import 'dart:async';", ['Stream', 'Completer', 'Timer', 'Future']) 
    return c

def fix_shorthands(code):
    # .height(n) -> SizedBox(height: n)
    code = re.sub(r'(?<!\w)\.height\s*\(\s*(\d+(\.\d+)?)\s*\)', r'SizedBox(height: \1)', code)
    code = re.sub(r'(?<!\w)\.width\s*\(\s*(\d+(\.\d+)?)\s*\)', r'SizedBox(width: \1)', code)
    
    # Styles and Properties (User's preferred replacements)
    code = re.sub(r'style:\s*\.white', r'style: TextStyle(color: Colors.white)', code)
    code = re.sub(r'style:\s*\.bold', r'style: TextStyle(fontWeight: FontWeight.bold)', code)
    code = re.sub(r'style:\s*\.caption', r'style: TextStyle(color: Colors.grey)', code)
    code = re.sub(r'child:\s*\.empty', r'child: SizedBox.shrink()', code)
    code = re.sub(r'fontWeight:\s*\.bold', r'fontWeight: FontWeight.bold', code)
    code = re.sub(r'fontWeight:\s*\.normal', r'fontWeight: FontWeight.normal', code)

    # Main/Cross Axis Alignment
    code = re.sub(r'mainAxisAlignment:\s*\.center', r'mainAxisAlignment: MainAxisAlignment.center', code)
    code = re.sub(r'mainAxisAlignment:\s*\.start', r'mainAxisAlignment: MainAxisAlignment.start', code)
    code = re.sub(r'mainAxisAlignment:\s*\.end', r'mainAxisAlignment: MainAxisAlignment.end', code)
    code = re.sub(r'crossAxisAlignment:\s*\.center', r'crossAxisAlignment: CrossAxisAlignment.center', code)
    code = re.sub(r'crossAxisAlignment:\s*\.start', r'crossAxisAlignment: CrossAxisAlignment.start', code)
    code = re.sub(r'crossAxisAlignment:\s*\.end', r'crossAxisAlignment: CrossAxisAlignment.end', code)
    code = re.sub(r'crossAxisAlignment:\s*\.stretch', r'crossAxisAlignment: CrossAxisAlignment.stretch', code)

    # EdgeInsets
    code = re.sub(r'(?<!\w)\.all\s*\(', r'EdgeInsets.all(', code)
    code = re.sub(r'(?<!\w)\.symmetric\s*\(', r'EdgeInsets.symmetric(', code)
    code = re.sub(r'(?<!\w)\.only\s*\(', r'EdgeInsets.only(', code)
    code = re.sub(r'padding:\s*\.zero', r'padding: EdgeInsets.zero', code)
    code = re.sub(r'margin:\s*\.zero', r'margin: EdgeInsets.zero', code)

    # BorderRadius
    code = re.sub(r'(?<!\w)\.circular\s*\(', r'BorderRadius.circular(', code)

    # Colors
    colors = ['white', 'black', 'red', 'green', 'blue', 'grey', 'transparent', 'purple', 'pink', 'orange', 'yellow', 'amber', 'teal', 'indigo', 'cyan']
    for col in colors:
        # Match .color if it's not preceded by a word character
        pattern = r'(?<!\w)\.' + col + r'\b'
        # Skip if part of TextStyle(color: Colors.color)
        if f'Colors.{col}' not in code:
            code = re.sub(pattern, f'Colors.{col}', code)

    # Double
    code = re.sub(r'(?<!\w)\.infinity\b', r'double.infinity', code)

    return code

def process_file(path):
    print(f"Processing {path}...")
    with open(path, 'r', encoding='utf-8') as f:
        content = f.read()
        
    # Match StrCodeBlock(r'''...''')
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
    print(f"Found and processed {count} StrCodeBlock matches in {path}")

for p in files:
    try:
        process_file(p)
    except Exception as e:
        print(f"Error processing {p}: {e}")
