# This script generates the opcode.json file. It reads the XML files in 
# the opcodes directory and generates a JSON file with the opcodes and 
# their descriptions. Licensed under the GPL licence version 3 or later
# It is based on the opcodeparser.py 

from __future__ import print_function

import os, glob, json
from xml.dom import minidom

# categories holds the list of valid categories for opcodes
from categories import categories

XO = False
opcodelist = []

outfilename = 'opcodes.json'
entries = []
for i in categories:
    entries.append([])

manualfilename = 'manual.xml'
manual = open(manualfilename, 'r')
text = manual.read()
manual.close()

files = glob.glob('opcodes/*.xml')
files.extend(list(glob.glob('opcodes/*/*.xml')))
files.extend(list(glob.glob('vectorial/*.xml')))
files.extend(list(glob.glob('utility/*.xml')))
files.sort()

if 'opcodes/topXO.xml' in files:
    files.remove('opcodes/topXO.xml')

headerText = text[0:text.find('<book id="index"')]

special_entries = {
    'adds.xml': {'synopsis': 'a + b  (no rate restriction)', 'opcodeName': '+'},
    'dollar.xml': {'synopsis': '$NAME', 'opcodeName': '$NAME'},
    'divides.xml': {'synopsis': 'a / b  (no rate restriction)', 'opcodeName': '/'},
    'modulus.xml': {'synopsis': 'a % b  (no rate restriction)', 'opcodeName': '%'},
    'multiplies.xml': {'synopsis': 'a * b  (no rate restriction)', 'opcodeName': '*'},
    'opbitor.xml': {'synopsis': 'a | b  (bitwise OR)', 'opcodeName': '|'},
    'opor.xml': {'synopsis': 'a || b  (logical OR; not audio-rate)', 'opcodeName': '||'},
    'raises.xml': {'synopsis': 'a ^ b  (b not audio-rate)', 'opcodeName': '^'},
    'substracts.xml': {'synopsis': 'a - b (no rate restriction)', 'opcodeName': '-'},
    'ifdef.xml': {
        'synopsis': '#ifdef NAME  .... #else  .... #end',
        'opcodeName': '#ifdef'
    },
    'define.xml': {
        'synopsis': '#define NAME # replacement text #, #define NAME(a b c) # replacement text #',
        'opcodeName': '#define'
    },
    'include.xml': {'synopsis': '#include "filename"', 'opcodeName': '#include'},
    'undef.xml': {'synopsis': '#undef NAME', 'opcodeName': '#undef'},
    '0dbfs.xml': {'synopsis': '0dbfs = iarg', 'opcodeName': '0dbfs'}
}

# Structure to hold JSON data
json_data = {'opcodes': []}

# Function to clean and reformat the synopsis, stripping out <synopsis> tags
def clean_synopsis(synopsis_list):
    synopsis_texts = []
    opcode_name = None

    for synopsis in synopsis_list:
        tmp = synopsis.toxml()

        # Handle both <opcodename> and <command> tags
        if '<opcodename>' in tmp:
            if not opcode_name:
                opcode_name = tmp[tmp.find('<opcodename>') + 12:tmp.find('</opcodename>')]
            tmp = tmp.replace('<opcodename>', '**').replace('</opcodename>', '**')
        elif '<command>' in tmp:
            if not opcode_name:
                opcode_name = tmp[tmp.find('<command>') + 9:tmp.find('</command>')]
            tmp = tmp.replace('<command>', '**').replace('</command>', '**')

        # Strip the <synopsis> tags
        tmp = tmp.replace('<synopsis>', '').replace('</synopsis>', '')

        synopsis_texts.append(tmp)

    # Join the cleaned synopsis with line breaks
    return '\n'.join(synopsis_texts), opcode_name

# Process each opcode XML file
for i, filename in enumerate(files):
    source = open(filename, 'r')
    entryText = source.read().replace("\xef\xbb\xbf", "")
    newfile = headerText + '<book id="index" lang="en">' + entryText + '</book>'
    newfile = newfile.replace("\r", "")
    source.close()

    xmldoc = minidom.parseString(newfile)
    xmldocId = xmldoc.documentElement.getAttribute('id')

    # Some files need special treatment (adds, dollar, divides, etc.)
    folder, base = os.path.split(filename)
    entry = special_entries.get(base)

    if entry is None:
        synopsis = xmldoc.getElementsByTagName('synopsis')
        cleaned_synopsis, opcode_name = clean_synopsis(synopsis)

        if not opcode_name:
            opcode_name = ""  # Fallback in case no <opcodename> or <command> tag is found
        entry = {
            'synopsis': cleaned_synopsis,
            'opcodeName': opcode_name
        }

    info = xmldoc.getElementsByTagName('refentryinfo')
    if info and entry:
        category = info[0].toxml()[21:-23]
    else:
        print(f"No refentryinfo tag for file {filename}")
        category = "Miscellaneous"
        if entry:
            print(f"{filename} sent to Miscellaneous")

    desc = xmldoc.getElementsByTagName('refpurpose')
    description = ""
    if desc and entry:
        description = desc[0].firstChild.toxml().strip()
    else:
        print(f"No refpurpose tag for file {filename}")

    match = False
    for j, thiscategory in enumerate(categories):
        if category == thiscategory:
            entries[j].append([entry, description])
            match = True

    if not match:
        print(f"{filename} ---- WARNING! No Category Match!")

# Build JSON structure
for i, category in enumerate(categories):
    if not entries[i]:
        print(f"No entries for category: {category} ...Skipping")
        continue
    category_entry = {'category': category, 'opcodes': []}
    for entry in entries[i]:
        entrydef, description = entry
        opcode_entry = {
            'description': description if description else '',
            'synopsis': entrydef['synopsis'],
            'opcodeName': entrydef['opcodeName']
        }
        category_entry['opcodes'].append(opcode_entry)
    json_data['opcodes'].append(category_entry)

# Write JSON data to file
with open(outfilename, 'w', encoding='utf-8') as jsonfile:
    json.dump(json_data, jsonfile, ensure_ascii=False, indent=4)

print("JSON data has been written to", outfilename)
