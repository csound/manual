# -*- coding: utf-8 -*-
# This script generates the misc/quickref.html file
# by Andres Cabrera June 2006
# Licensed under the GPL licence version 3 or later
# modification for empty arg in command and links on opcodes by Francois Pinot February 2007

from __future__ import print_function
from xml.dom import minidom
import os, glob, sys

# categories holds the list of valid categories for opcodes
from categories import categories

XO = False
opcodelist = []

if sys.argv.count("-x"):
  XO = True
  file = open("opcode_listXO.txt", 'r')
  removedopcodes = file.read().split()
  file.close()

entries = []
example_cats = []
for i in categories:
  entries.append([])
  example_cats.append([])

# Generate a file listing all examples

outfilename = 'misc/examples.xml'
examples = open(outfilename,'w')
examples.write("\n<!-- Don't modify this file. It is generated automatically by quickref.py-->\n")
examples.write('''<appendix id="MiscExamples">
  <title>List of examples</title>''')

files = glob.glob('opcodes/*.xml')
try:
    files.remove('opcodes/template.xml')
except:
    pass
files.sort()
for i,filename in enumerate(files):
    entry = ''
    #print(filename)
    source = open(filename, 'r')
    text = source.read()
    source.close()
    cat_text = text[text.find("<refentryinfo><title>") + 21: text.find("</title></refentryinfo>")]
    if categories.count(cat_text) > 0:
      cat = categories.index(cat_text);
      #print(cat_text, cat)
      while text.find("examples-xml/") != -1:
        file_to_add = text[text.find("examples-xml/"):text.find(".csd",text.find("examples-xml/") )+ 4]
        if len(file_to_add) < 45: #yes, very flaky, I know...
          entries[cat].append(file_to_add)
        else:
          print(file_to_add)
        text = text[text.find("examples-xml/") + 10:]

for i,catname in enumerate(categories):
    print(catname)
    if len(entries[i]) > 0:
        title ="<formalpara><title>"
        title += catname
        #title += "</title><simpara />\n"
        title += "</title><simpara />\n"
        examples.write(title)
        for j,ex in enumerate(entries[i]):
            if ex != "":
                line = '<para><ulink url="'
                line += ex.replace("-xml", '') + '"><citetitle>' + ex.replace("examples-xml/",'')
                print(line)
                #line += "</citetitle></ulink></para><simpara />\n"
                line += "</citetitle></ulink></para><simpara />\n"
                examples.write(line)
        examples.write("</formalpara>\n")
  
examples.write('</appendix>\n')
examples.close()


#Now generate the quickref file

#Reset entries
entries = []
for i in categories:
    entries.append([])

outfilename = 'misc/quickref.xml' if not XO else 'misc/quickrefXO.xml'
quickref = open(outfilename,'w')
quickref.write("\n<!-- Don't modify this file. It is generated automatically by quickref.py-->\n")
quickref.write('''<part>
  <title>Opcode Quick Reference</title>
  <chapter id="MiscQuickref">
  <title>Opcode Quick Reference</title>''')

manualfilename = 'manual.xml' if not XO else 'manualXO.xml'
manual = open(manualfilename, 'r')
text = manual.read()
manual.close()

files = glob.glob('opcodes/*.xml')
try:
    files.remove('opcodes/template.xml')
except:
    pass
files[len(files):]=glob.glob('opcodes/*/*.xml')
files[len(files):]=glob.glob('vectorial/*.xml')
files[len(files):]=glob.glob('utility/*.xml')
files.sort()

headerText = text[0:text.find('<book id="index"')]

for i,filename in enumerate(files):
    entry = ''
    #print(file)
    source = open(filename, 'r')
    newfile = source.read()
    source.close()

    refStart = newfile.find("<refentry")

    if(refStart < 0):
        continue
    elif(refStart > 0):
#        print('Trimming file: ', filename, ' ', refStart)
        newfile = newfile[refStart:]
    
    # Necessary to define entities
    newfile = headerText + newfile

    #print(text)
    try:
        xmldoc = minidom.parseString(newfile)
    except:
        print('>>> Failed to parse:', filename)
        continue
    xmldocId = xmldoc.documentElement.getAttribute('id')
    # Some files need special treatment (adds, dollar, divides, modulus, multiplies,
    # opbitor, opor, raises, subtracts, assign, ifdef, ifndef, define, include, undef)
    # There must be a better way to avoid loosing the entities when parsing the XML
    # file. Anyone???
    if (filename == 'opcodes' + os.sep + 'adds.xml'):
        entry = '<synopsis>a <link linkend="'+xmldocId+'">'+'&plus;</link> b  (no rate restriction)</synopsis>\n<para/>'
    elif (filename == 'opcodes' + os.sep + 'dollar.xml'):
        entry = '<synopsis><link linkend="'+xmldocId+'">'+'&dollar;NAME</link>&#160;</synopsis>\n<para/>'
    elif (filename == 'opcodes' + os.sep + 'divides.xml'):
        entry = '<synopsis>a <link linkend="'+xmldocId+'">'+'&sol;</link> b  (no rate restriction)</synopsis>\n<para/>'
    elif (filename == 'opcodes' + os.sep + 'modulus.xml'):
        entry = '<synopsis>a <link linkend="'+xmldocId+'">'+'&percnt;</link> b  (no rate restriction)</synopsis>\n<para/>'
    elif (filename == 'opcodes' + os.sep + 'multiplies.xml'):
        entry = '<synopsis>a <link linkend="'+xmldocId+'">'+'&ast;</link> b  (no rate restriction)</synopsis>\n<para/>'
    elif (filename == 'opcodes' + os.sep + 'opbitor.xml'):
        entry = '<synopsis>a <link linkend="'+xmldocId+'">'+'&verbar;</link> b  (bitwise OR)</synopsis>\n<para/>'
    elif (filename == 'opcodes' + os.sep + 'opor.xml'):
        entry = '<synopsis>a <link linkend="'+xmldocId+'">'+'&verbar;&verbar;</link> b  (logical OR; not audio-rate)</synopsis>\n<para/>'
    elif (filename == 'opcodes' + os.sep + 'raises.xml'):
        entry = '<synopsis>a <link linkend="'+xmldocId+'">'+'&circ;</link> b  (b not audio-rate)</synopsis>\n<para/>'
    elif (filename == 'opcodes' + os.sep + 'subtracts.xml'):
        entry = '<synopsis>a <link linkend="'+xmldocId+'">'+'&minus;</link> b (no rate restriction)</synopsis>\n<para/>'
#    elif (filename == 'opcodes' + os.sep + 'assign.xml'):
#        entry = '''<synopsis> <link linkend="'+xmldocId+'">'+'&minus;</link>a  (no rate restriction)</synopsis>
#        <synopsis> <link linkend="'+xmldocId+'">'+'&plus;</link>a  (no rate restriction)</synopsis>\n'''
    elif (filename == 'opcodes' + os.sep + 'ifdef.xml'):
          entry = '<synopsis><link linkend="'+xmldocId+'">'+'&num;ifdef</link> NAME</synopsis><synopsis>  ....</synopsis>' + \
                  '<synopsis><link linkend="'+xmldocId+'">'+'&num;else</link>&#160;</synopsis><synopsis>  ....</synopsis>' + \
                  '<synopsis><link linkend="'+xmldocId+'">'+'&num;end</link>&#160;</synopsis>\n<para/>'
    elif (filename == 'opcodes' + os.sep + 'ifndef.xml'):
          entry='<synopsis><link linkend="'+xmldocId+'">'+'&num;ifndef</link> NAME</synopsis><synopsis>  ....</synopsis>' + \
                '<synopsis><link linkend="'+xmldocId+'">'+'&num;else</link>&#160;</synopsis><synopsis>  ....</synopsis>' + \
                '<synopsis><link linkend="'+xmldocId+'">'+'&num;end</link>&#160;</synopsis>\n<para/>'
    elif (filename == 'opcodes' + os.sep + 'define.xml'):
          entry='<synopsis><link linkend="'+xmldocId+'">'+'&num;define</link> NAME &num; replacement text &num;</synopsis><para/>\n' + \
    '<synopsis><link linkend="'+xmldocId+'">'+'&num;define</link> NAME(a&apos; b&apos; c&apos;) &num; replacement text &num;</synopsis>\n<para/>'
    elif (filename == 'opcodes' + os.sep + 'include.xml'):
          entry='<synopsis><link linkend="'+xmldocId+'">'+'&num;include</link> &quot;filename&quot;</synopsis>\n<para/>'
    elif (filename == 'opcodes' + os.sep + 'undef.xml'):
          entry='<synopsis><link linkend="'+xmldocId+'">'+'&num;undef</link> NAME</synopsis>\n<para/>'
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
                if XO and removedopcodes.count(opcodename) == 0:
                    print("Removed ----------------------", opcodename)
                else:
                    if tmp[-21:] == "</command></synopsis>":    # no arg, insert nbsp
                        tmp = tmp[:-11] + "&#160;</synopsis>"
                    tmp = tmp.replace('<command>', '<link linkend="' + xmldocId + '">')
                    entry += tmp.replace('</command>', '</link>')
            if entry != '':
                entry += '<para/>'
        else:
            #print("no synopsis tag for file: " + file)
            entry = ''
    #print("Entry ------ ", entry)

    info = xmldoc.getElementsByTagName('refentryinfo')
    if (len(info)!=0 and entry != ''):
        category = info[0].toxml()
        category = category[21:-23]
        print(category)
    else:
        print("no refentryinfo tag for file " + filename)
        category = "Miscellaneous"
        if (entry!=''):
            print(filename + " sent to Miscellaneous")
    #print(category)
    match = False
    for j, thiscategory in enumerate(categories):
        if (category == thiscategory):
            entries[j].append(entry+ '\n')
            match = True
    if match == False:
        print(filename + "WARNING! No Category Match!")

for i in range(len(categories)):
    if (len(entries[i])==0):
        print("No entries for category: "+categories[i]+"...Skipping")
        continue
    quickref.write("<para></para><formalpara>\n")
    quickref.write("<title>"+ categories[i] + "</title>\n<para>\n<para/>\n")
    count = 0
    for j in range(len(entries[i])):
        quickref.write(entries[i].pop(0)) # + '\n')
        count += 1
    quickref.write("</para></formalpara>\n<para></para>")
    print(str(count) + " entries in category: " + categories[i])

quickref.write('</chapter></part>\n')
quickref.close()
print(entries)
