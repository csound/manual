# -*- coding: utf-8 -*-

# This script generates misc/examples.xml and misc/quickref.xml.
# by Andres Cabrera June 2006
# Licensed under the GPL licence version 3 or later
# modification for empty arg in command and links on opcodes by Francois Pinot February 2007

from xml.dom import minidom
import codecs, glob, re, sys
from categories import categories # categories.py contains the list of valid opcode categories.

def stringFromDOMNode(node):
    string = ''
    if node.nodeType == minidom.Node.ELEMENT_NODE:
        for childNode in node.childNodes:
            string += stringFromDOMNode(childNode)
    elif node.nodeType == minidom.Node.TEXT_NODE:
        string += node.data
    return string

commentString = " Don't modify this file. It is generated automatically by quickref.py "
DocBookNamespaceURI = 'http://docbook.org/ns/docbook'
opcodeXMLFilenames = glob.glob('opcodes/*.xml')
if opcodeXMLFilenames.count('opcodes/template.xml') > 0:
    opcodeXMLFilenames.remove('opcodes/template.xml')
opcodeXMLFilenames.sort()
XO = sys.argv.count('-x') > 0
if XO:
    with open('opcode_listXO.txt', 'r') as file:
        removedOpcodes = file.read().split()

# Generate misc/examples.xml, which lists all example files.
CSDFilenamesForCategories = {}
for category in categories:
    CSDFilenamesForCategories[category] = []

XMLDocument = minidom.getDOMImplementation().createDocument(None, 'appendix', None)
documentElement = XMLDocument.documentElement
# This is a hack to add a namespace using minidom.
documentElement.setAttribute('xmlns', DocBookNamespaceURI)
documentElement.setAttribute('version', '5.0')
documentElement.setAttribute('id', 'MiscExamples')
documentElement.appendChild(XMLDocument.createTextNode('\n'))
documentElement.appendChild(XMLDocument.createComment(commentString))
documentElement.appendChild(XMLDocument.createTextNode('\n  '))
documentElement.appendChild(XMLDocument.createElement('title')).appendChild(XMLDocument.createTextNode('List of examples'))

for opcodeXMLFilename in opcodeXMLFilenames:
    opcodeXMLDocument = minidom.parse(opcodeXMLFilename)
    refentryinfoElements = opcodeXMLDocument.getElementsByTagName('refentryinfo')
    if refentryinfoElements.length == 0:
        continue
    category = stringFromDOMNode(refentryinfoElements.item(0))
    if categories.count(category) == 0:
        continue
    for includeElement in opcodeXMLDocument.getElementsByTagNameNS('http://www.w3.org/2001/XInclude', 'include'):
        match = re.search(r'examples-xml/([\w-]+\.csd)\.xml', includeElement.getAttribute('href'))
        if match:
            CSDFilenamesForCategories[category].append(match.group(1))

for category in categories:
    print category
    CSDFilenames = CSDFilenamesForCategories[category]
    if len(CSDFilenames) > 0:
        formalparaElement = documentElement.appendChild(XMLDocument.createElement('formalpara'))
        formalparaElement.appendChild(XMLDocument.createElement('title')).appendChild(XMLDocument.createTextNode(category))
        formalparaElement.appendChild(XMLDocument.createElement('simpara'))
        formalparaElement.appendChild(XMLDocument.createTextNode('\n'))
        for CSDFilename in CSDFilenames:
            paraElement = formalparaElement.appendChild(XMLDocument.createElement('para'))
            ulinkElement = paraElement.appendChild(XMLDocument.createElement('ulink'))
            ulinkElement.setAttribute('url', 'examples/' + CSDFilename)
            ulinkElement.appendChild(XMLDocument.createElement('citetitle')).appendChild(XMLDocument.createTextNode(CSDFilename))
            print paraElement.toxml('utf-8')
            formalparaElement.appendChild(XMLDocument.createElement('simpara'))
            formalparaElement.appendChild(XMLDocument.createTextNode('\n'))
        documentElement.appendChild(XMLDocument.createTextNode('\n'))

with codecs.open('misc/examples.xml', 'w', 'utf-8') as file:
    XMLDocument.writexml(file, encoding='UTF-8')

# Generate misc/quickref.xml.
opcodeXMLFilenames.extend(glob.glob('opcodes/*/*.xml'))
opcodeXMLFilenames.extend(glob.glob('utility/*.xml'))
opcodeXMLFilenames.extend(glob.glob('vectorial/*.xml'))
opcodeXMLFilenames.sort()

paraElementsForCategories = {}
for category in categories:
    paraElementsForCategories[category] = XMLDocument.createElement('para')

XMLDocument = minidom.getDOMImplementation().createDocument(None, 'part', None)
documentElement = XMLDocument.documentElement
# This is a hack to add a namespace using minidom.
documentElement.setAttribute('xmlns', DocBookNamespaceURI)
documentElement.setAttribute('version', '5.0')
documentElement.appendChild(XMLDocument.createTextNode('\n'))
documentElement.appendChild(XMLDocument.createComment(commentString))
documentElement.appendChild(XMLDocument.createTextNode('\n  '))
documentElement.appendChild(XMLDocument.createElement('title')).appendChild(XMLDocument.createTextNode('Opcode Quick Reference'))
documentElement.appendChild(XMLDocument.createTextNode('\n  '))
chapterElement = documentElement.appendChild(XMLDocument.createElement('chapter'))
chapterElement.setAttribute('id', 'MiscQuickref')
chapterElement.appendChild(XMLDocument.createTextNode('\n  '))
chapterElement.appendChild(XMLDocument.createElement('title')).appendChild(XMLDocument.createTextNode('Opcode Quick Reference'))
chapterElement.appendChild(XMLDocument.createElement('para'))

for opcodeXMLFilename in opcodeXMLFilenames:
    opcodeXMLDocument = minidom.parse(opcodeXMLFilename)
    if opcodeXMLDocument.getElementsByTagName('refentry').length == 0:
        continue

    synopsisElements = opcodeXMLDocument.getElementsByTagName('synopsis')
    if synopsisElements.length == 0:
        continue

    refentryinfoElements = opcodeXMLDocument.getElementsByTagName('refentryinfo')
    if refentryinfoElements.length > 0:
        category = stringFromDOMNode(refentryinfoElements.item(0))
        if not category in paraElementsForCategories:
            print opcodeXMLFilename + 'WARNING! No Category Match!'
            continue
        print category
    else:
        category = 'Miscellaneous'
        print 'no refentryinfo tag for file ' + opcodeXMLFilename
        print opcodeXMLFilename + ' sent to ' + category
    paraElement = paraElementsForCategories[category]

    opcodeID = opcodeXMLDocument.documentElement.getAttribute('id')

    # There can be more than one synopsis element per file.
    for synopsisElement in synopsisElements:
        print synopsisElement.toxml()
        commandElements = synopsisElement.getElementsByTagName('command')
        if commandElements.length == 0:
            continue

        commandElement = commandElements.item(0)

        if XO:
            opcodeName = stringFromDOMNode(commandElement)
            if removedOpcodes.count(opcodeName) > 0:
                print 'Removed ----------------------', opcodeName
                continue

        newSynopsisElement = paraElement.appendChild(XMLDocument.createElement('synopsis'))
        if commandElement.previousSibling:
            newSynopsisElement.appendChild(XMLDocument.createTextNode(stringFromDOMNode(commandElement.previousSibling)))
        linkElement = newSynopsisElement.appendChild(XMLDocument.createElement('link'))
        linkElement.setAttribute('linkend', opcodeID)
        linkElement.appendChild(XMLDocument.createTextNode(stringFromDOMNode(commandElement)))
        followingSibling = commandElement.nextSibling
        if followingSibling:
            while followingSibling:
                if followingSibling.nodeType == minidom.Node.ELEMENT_NODE:
                    if followingSibling.tagName == 'command':
                        linkElement = newSynopsisElement.appendChild(XMLDocument.createElement('link'))
                        linkElement.setAttribute('linkend', opcodeID)
                        linkElement.appendChild(XMLDocument.createTextNode(stringFromDOMNode(followingSibling)))
                    else:
                        newSynopsisElement.appendChild(XMLDocument.createElement(followingSibling.tagName)).appendChild(XMLDocument.createTextNode(stringFromDOMNode(followingSibling)))
                elif followingSibling.nodeType == minidom.Node.TEXT_NODE:
                    newSynopsisElement.appendChild(XMLDocument.createTextNode(stringFromDOMNode(followingSibling)))
                followingSibling = followingSibling.nextSibling
        else:
            # DocBook command elements describing opcodes should be followed
            # by a text node if the opcode accepts input arguments. If the
            # command element does not have a next sibling, insert a
            # NO-BREAK SPACE character (U+00A0).
            newSynopsisElement.appendChild(XMLDocument.createTextNode(u'\u00A0'))

    # Note nesting of DocBook para elements.
    paraElement.appendChild(XMLDocument.createElement('para'))
    paraElement.appendChild(XMLDocument.createTextNode('\n'))

for category in categories:
    paraElement = paraElementsForCategories[category]
    synopsisElementCount = paraElement.childNodes.length
    if synopsisElementCount == 0:
        print 'No entries for category: ' + category + '...Skipping'
        continue
    formalparaElement = chapterElement.appendChild(XMLDocument.createElement('formalpara'))
    formalparaElement.appendChild(XMLDocument.createTextNode('\n'))
    formalparaElement.appendChild(XMLDocument.createElement('title')).appendChild(XMLDocument.createTextNode(category))
    formalparaElement.appendChild(XMLDocument.createTextNode('\n'))
    formalparaElement.appendChild(paraElement)

    paraElement.insertBefore(XMLDocument.createTextNode('\n'), paraElement.firstChild)
    # Note nesting of DocBook para elements.
    paraElement.insertBefore(XMLDocument.createElement('para'), paraElement.firstChild)
    paraElement.insertBefore(XMLDocument.createTextNode('\n'), paraElement.firstChild)

    chapterElement.appendChild(XMLDocument.createTextNode('\n'))
    chapterElement.appendChild(XMLDocument.createElement('para'))
    chapterElement.appendChild(XMLDocument.createElement('para'))

    print str(synopsisElementCount) + ' entries in category: ' + category

filename = 'misc/quickref'
if XO:
    filename += 'XO'
with codecs.open(filename + '.xml', 'w', 'utf-8') as file:
    XMLDocument.writexml(file, encoding='UTF-8')
