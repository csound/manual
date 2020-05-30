# This script generates the opcode.xml file
# by Andres Cabrera June 2006-2010
# Licensed under the GPL licence version 3 or later
# modification for empty arg in command and links on opcodes by Francois Pinot February 2007

from __future__ import print_function

from xml.dom import minidom
import os, glob

# categories holds the list of valid categories for opcodes
from categories import categories

XO = False
opcodelist = []

outfilename = 'opcodes.xml'
quickref = open(outfilename,'w')
quickref.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!-- "
               "Don't modify this file. It is generated automatically by opcodeparser.py\n"
               "This file is distributed under the GNU Free Documentation Licence-->")
quickref.write("<opcodes>\n")

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

if files.index('opcodes/topXO.xml') >= 0:
    files.remove('opcodes/topXO.xml')

headerText = text[0:text.find('<book id="index"')]

special_entries = {
  'adds.xml': '<synopsis>a <opcodename>+</opcodename> b  (no rate restriction)</synopsis>\n',
  'dollar.xml': '<synopsis><opcodename>$NAME</opcodename></synopsis>\n<para/>',
  'divides.xml': '<synopsis>a <opcodename>/</opcodename> b  (no rate restriction)</synopsis>\n',
  'modulus.xml': '<synopsis>a <opcodename>%</opcodename> b  (no rate restriction)</synopsis>\n',
  'multiplies.xml': '<synopsis>a <opcodename>*</opcodename> b  (no rate restriction)</synopsis>\n',
  'opbitor.xml': '<synopsis>a <opcodename>'+'|</opcodename> b  (bitwise OR)</synopsis>\n',
  'opor.xml': '<synopsis>a <opcodename>'+'||</opcodename> b  (logical OR; not audio-rate)</synopsis>\n',
  'raises.xml': '<synopsis>a <opcodename>^</opcodename> b  (b not audio-rate)</synopsis>\n',
  'substracts.xml': '<synopsis>a <opcodename>-</opcodename> b (no rate restriction)</synopsis>\n',
  'ifdef.xml': ('<synopsis><opcodename>#ifdef</opcodename> NAME</synopsis><synopsis>  ....</synopsis>\n'
                '<synopsis><opcodename>#else</opcodename></synopsis><synopsis>  ....</synopsis>\n'
                '<synopsis><opcodename>#end</opcodename></synopsis>\n'),
  'define.xml': ('<synopsis><opcodename>#define</opcodename> NAME # replacement text #</synopsis>\n'
                 '<synopsis><opcodename>#define</opcodename> NAME(a&apos; b&apos; c&apos;) # replacement text #</synopsis>\n'),
  'include.xml': '<synopsis><opcodename>#include</opcodename> &quot;filename&quot;</synopsis>\n',
  'undef.xml': '<synopsis><opcodename>#undef</opcodename> NAME</synopsis>\n',
  '0dbfs.xml': '<synopsis><opcodename>0dbfs</opcodename> = iarg</synopsis>\n'
}

for i,filename in enumerate(files):
    source = open(filename, 'r')
    # Necessary to define entities>
    entryText = source.read().replace("\xef\xbb\xbf","")
    newfile = headerText + '<book id="index" lang="en">' + entryText + '</book>'
    newfile = newfile.replace("\r", "")
    source.close()
    xmldoc = minidom.parseString(newfile)
    xmldocId = xmldoc.documentElement.getAttribute('id')
    # Some files need special treatment (adds, dollar, divides, modulus, multiplies,
    # opbitor, opor, raises, subtracts, assign, ifdef, ifndef, define, include, undef)
    # There must be a better way to avoid loosing the entities when parsing the XML
    # file. Anyone???
    folder, base = os.path.split(filename)
    entry = special_entries.get(base)
    if entry is None:
        synopsis = xmldoc.getElementsByTagName('synopsis')
        entry = ''
        if synopsis:
            # There can be more than 1 synopsis per file
            for num in range(len(synopsis)):
                tmp = synopsis[num].toxml()
                if XO:
                    opcodename = tmp[tmp.find('<command>') + 9:tmp.find('</command>')]
                else:
                    opcodename = ""
                tmp = tmp.replace('<command>', '<opcodename>')
                entry += tmp.replace('</command>', '</opcodename>')

    # print "Entry ------ ", entry

    info = xmldoc.getElementsByTagName('refentryinfo')
    if info and entry:
        category = info[0].toxml()
        category = category[21:-23]
    else:
        print("no refentryinfo tag for file " + filename)
        category = "Miscellaneous"
        if entry:
            print(filename + " sent to Miscellaneous")
    desc = xmldoc.getElementsByTagName('refpurpose')
    description = ""
    if desc and entry:
        description = desc[0].firstChild.toxml().strip()
        # print(filename, category)
    else:
        print("no refpurpose tag for file " + filename)
    # print(category)
    match = False
    for j, thiscategory in enumerate(categories):
        if category == thiscategory:
            entries[j].append([entry, description])
            match = True
    if not match:
        print(filename + "---- WARNING! No Category Match!")

for i, category in enumerate(categories):
    if not category:
        print(f"No entries for category: {category} ...Skipping")
        continue
    quickref.write("<category name=\"" + categories[i] + "\">\n")
    count = 0
    for entry in entries[i]:
        entrydef, description = entry
        if not entrydef:
            continue
        # newentry = entry.pop(0)
        # entry = entry.replace("&dollar;", "$")
        # entry = entry.replace("&#160;", " ")
        quickref.write("<opcode>")
        if description:
            quickref.write("<desc>")
            quickref.write(description)
            quickref.write("</desc>")
        quickref.write(entrydef)
        quickref.write("</opcode>\n")
        count += 1
    quickref.write("</category>\n")
    print(str(count) + " entries in category: " + categories[i])

quickref.write('</opcodes>\n')
quickref.close()
print(entries)
