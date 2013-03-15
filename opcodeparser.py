# This script generates the opcode.xml file
# by Andres Cabrera June 2006-2010
# Licensed under the GPL licence version 3 or later
# modification for empty arg in command and links on opcodes by Francois Pinot February 2007

from xml.dom import minidom
import os, glob, sys

# categories holds the list of valid categories for opcodes
from categories import categories

XO = False
opcodelist = []

outfilename = 'opcodes.xml'
quickref = open(outfilename,'w')
quickref.write("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<!-- Don't modify this file. It is generated automatically by opcodeparser.py\nThis file is distributed under the GNU Free Documentation Licence-->")
quickref.write('''<opcodes>\n''')


entries = []
for i in categories:
  entries.append([])

manualfilename = 'manual.xml'
manual = open(manualfilename, 'r')
text = manual.read()
manual.close()

files = glob.glob('opcodes/*.xml')
files[len(files):]=glob.glob('opcodes/*/*.xml')
files[len(files):]=glob.glob('vectorial/*.xml')
files[len(files):]=glob.glob('utility/*.xml')
files.sort()
if files.index('opcodes/topXO.xml') >= 0:
    files.remove('opcodes/topXO.xml')

headerText = text[0:text.find('<book id="index"')]

for i,filename in enumerate(files):
    entry = ''
    #print filename
    source = open(filename, 'r')
    # Necessary to define entities>
    entryText = source.read().replace("\xef\xbb\xbf","")
    newfile = headerText + entryText
    newfile = newfile.replace("\r", "")

    source.close()
    #print text
    xmldoc = minidom.parseString(newfile)
    xmldocId = xmldoc.documentElement.getAttribute('id')
    # Some files need special treatment (adds, dollar, divides, modulus, multiplies,
    # opbitor, opor, raises, subtracts, assign, ifdef, ifndef, define, include, undef)
    # There must be a better way to avoid loosing the entities when parsing the XML
    # file. Anyone???
    if (filename == 'opcodes' + os.sep + 'adds.xml'):
        entry = '<synopsis>a <opcodename>+</opcodename> b  (no rate restriction)</synopsis>\n'
    elif (filename == 'opcodes' + os.sep + 'dollar.xml'):
        entry = '<synopsis><opcodename>$NAME</opcodename></synopsis>\n<para/>'
    elif (filename == 'opcodes' + os.sep + 'divides.xml'):
        entry = '<synopsis>a <opcodename>/</opcodename> b  (no rate restriction)</synopsis>\n'
    elif (filename == 'opcodes' + os.sep + 'modulus.xml'):
        entry = '<synopsis>a <opcodename>%</opcodename> b  (no rate restriction)</synopsis>\n'
    elif (filename == 'opcodes' + os.sep + 'multiplies.xml'):
        entry = '<synopsis>a <opcodename>*</opcodename> b  (no rate restriction)</synopsis>\n'
    elif (filename == 'opcodes' + os.sep + 'opbitor.xml'):
        entry = '<synopsis>a <opcodename>'+'|</opcodename> b  (bitwise OR)</synopsis>\n'
    elif (filename == 'opcodes' + os.sep + 'opor.xml'):
        entry = '<synopsis>a <opcodename>'+'||</opcodename> b  (logical OR; not audio-rate)</synopsis>\n'
    elif (filename == 'opcodes' + os.sep + 'raises.xml'):
        entry = '<synopsis>a <opcodename>^</opcodename> b  (b not audio-rate)</synopsis>\n'
    elif (filename == 'opcodes' + os.sep + 'subtracts.xml'):
        entry = '<synopsis>a <opcodename>-</opcodename> b (no rate restriction)</synopsis>\n'
#    elif (filename == 'opcodes' + os.sep + 'assign.xml'):
#        entry = '''<synopsis> <link linkend="'+xmldocId+'">'+'&minus;</link>a  (no rate restriction)</synopsis>
#        <synopsis> <link linkend="'+xmldocId+'">'+'&plus;</link>a  (no rate restriction)</synopsis>\n'''
    elif (filename == 'opcodes' + os.sep + 'ifdef.xml'):
          entry = '<synopsis><opcodename>#ifdef</opcodename> NAME</synopsis><synopsis>  ....</synopsis>' + \
                  '<synopsis><opcodename>#else</opcodename></synopsis><synopsis>  ....</synopsis>' + \
                  '<synopsis><opcodename>#end</opcodename></synopsis>\n'
    elif (filename == 'opcodes' + os.sep + 'ifndef.xml'):
          entry='<synopsis><opcodename>#ifndef</opcodename> NAME</synopsis><synopsis>  ....</synopsis>' + \
                '<synopsis><opcodename>#else</opcodename></synopsis><synopsis>  ....</synopsis>' + \
                '<synopsis><opcodename>#end</opcodename></synopsis>\n'
    elif (filename == 'opcodes' + os.sep + 'define.xml'):
          entry='<synopsis><opcodename>#define</opcodename> NAME # replacement text #</synopsis>\n' + \
    '<synopsis><opcodename>#define</opcodename> NAME(a&apos; b&apos; c&apos;) # replacement text #</synopsis>\n'
    elif (filename == 'opcodes' + os.sep + 'include.xml'):
          entry='<synopsis><opcodename>#include</opcodename> &quot;filename&quot;</synopsis>\n'
    elif (filename == 'opcodes' + os.sep + 'undef.xml'):
          entry='<synopsis><opcodename>#undef</opcodename> NAME</synopsis>\n'
    elif (filename == 'opcodes' + os.sep + '0dbfs.xml'):
        entry = '<synopsis><opcodename>0dbfs</opcodename> = iarg</synopsis>\n'
    else:
        synopsis = xmldoc.getElementsByTagName('synopsis')
        if (len(synopsis) != 0):
            # There can be more than 1 synopsis per file
            for num in range(len(synopsis)):
                tmp = synopsis[num].toxml()
                if XO:
                    opcodename = tmp[tmp.find('<command>') + 9:tmp.find('</command>')]
                else:
                    opcodename = ""
                tmp = tmp.replace('<command>', '<opcodename>')
                entry += tmp.replace('</command>', '</opcodename>')
            #if entry != '':
                #entry += '<para/>'
        else:
            #print "no synopsis tag for file: " + file
            entry = ''
    #print "Entry ------ ", entry

    info = xmldoc.getElementsByTagName('refentryinfo')
    if (len(info)!=0 and entry != ''):
        category = info[0].toxml()
        category = category[21:-23]
        #print filename, category
    else:
        print "no refentryinfo tag for file " + filename
        category = "Miscellaneous"
        if (entry!=''):
            print filename + " sent to Miscellaneous"
    desc = xmldoc.getElementsByTagName('refpurpose')
    description = ""
    if (len(desc)!=0 and entry != ''):
        description = desc[0].firstChild.toxml().strip()
        #print filename, category
    else:
        print "no refpurpose tag for file " + filename
    #print category
    match = False
    for j, thiscategory in enumerate(categories):
        if (category == thiscategory):
            entries[j].append([entry, description])
            match = True
    if match == False:
        print filename + "---- WARNING! No Category Match!"

for i in range(len(categories)):
    if (len(entries[i])==0):
        print "No entries for category: "+categories[i]+"...Skipping"
        continue
    #quickref.write("<para></para><formalpara>\n")
    quickref.write("<category name=\"" + categories[i] + "\">\n")
    count = 0
    for j in range(len(entries[i])):
        newentry = entries[i].pop(0)
        #entry = entry.replace("&dollar;", "$")
        #entry = entry.replace("&#160;", " ")
        quickref.write("<opcode><desc>" + description) # + '\n')
        quickref.write(newentry[1] + "</desc>") # + '\n')
        quickref.write(newentry[0] + "</opcode>\n") # + '\n')
        count += 1
    #quickref.write("</para></formalpara>\n<para></para>")
    quickref.write("</category>\n")
    print str(count) + " entries in category: " + categories[i]

quickref.write('</opcodes>\n')
quickref.close()
print entries

