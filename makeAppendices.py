# -*- coding: utf-8 -*-
# This script generates the opcodes index and ref files
# and the List of examples file in the appendix.
# Author: François Pinot, March 2025
# Licensed under the GPL licence version 3 or later

import os
import sys
from categories import categories
from diffopnames import diff_opcnames

class OpcodeInfo:
    def __init__(self, filename):
        f = open(filename, 'r')
        self.data = f.read()
        f.close()

        fn = os.path.split(filename)[1]
        self.filename = os.path.splitext(fn)[0]
        j = self.find_name()
        self.find_description(j)
        self.find_syntax()
        self.find_category()
        self.find_examples()
        self.set_link(filename)

    def find_name(self):
        self.name = ""
        j = 0
        i = self.data.find('# ')
        if i != -1:
            j = self.data[i:].find('\n')
            if j != -1:
                j += i
                self.name = self.data[i+2:j].strip()
        return j

    def find_description(self, i):
        self.description = ""
        j = 0
        s = self.data[i:]
        while True:
            k = s[j:].find('.')
            if k != -1:
                j += k
                if s[j-1] == '(':
                    k = s[j:].find(')')
                    if k == -1:
                        return
                    j += k
                elif s[j-1:j+3] == "i.e.":
                    j += 3
                elif s[j-1:j+3] == "e.g.":
                    j += 3
                else:
                    self.description = s[:j+1].strip()
                    return

    def find_syntax(self):
        self.syntax = ""
        i = self.data.find('## Syntax')
        if i != -1:
            j = self.data[i:].find('``` csound-orc\n')
            if j != -1:
                i += j
                j = self.data[i:].find('```\n')
                if j != -1:
                    j += i + 4
                    self.syntax = self.data[i:j]
                    l = self.syntax.splitlines()
                    if l[1][0:4] == '    ':
                        for k in range(1, len(l)-1):
                            l[k] = l[k][4:]
                        self.syntax = '\n'.join(l)

    def find_category(self):
        self.category = ""
        i = self.data.find('<!--')
        if i != -1:
            j = self.data[i:].find('-->')
            if j != -1:
                s = self.data[i:i+j]
                i = s.find('category:')
                if i != -1:
                    i += 9
                    j = s[i:].find('\n')
                    if j != -1:
                        self.category = s[i:i+j].strip()
    
    def find_examples(self):
        self.examples = []
        s = self.data
        while True:
            i = s.find('--8<--')
            if i == -1:
                break
            s = s[i+6:]
            i = s.find('/')
            if i == -1:
                break
            s = s[i+1:]
            j = s.find('.csd')
            if j == -1:
                break
            self.examples.append(s[:j+4])
            s = s[j+4:]
    
    def set_link(self, filename):
        self.link = ""
        i = filename.find('docs/')
        if i != -1:
            self.link = filename[i+5:]

def find_bad_categories(opcodes, categories):
    cats = []
    for opc in opcodes:
        cats.append(opc.category)
    cats = list(set(cats))
    cats.sort()
    cats_ref = categories.copy()
    cats_ref.sort()
    if len(cats_ref) == len(cats):
        err = False
        for i in range(len(cats)):
            if cats[i] != cats_ref[i]:
                print('!!!', cats[i], cats_ref[i])
                err = True
        return err
    print("length categories:{}, cats found: {}".format(len(cats_ref), len(cats)))
    return True

def write_opcodes_index(opcodes, filename, ncol=5):
    entries = []
    for opc in opcodes:
        entries.append("| [{}]({}) ".format(opc.name, opc.link))
    entries.sort()

    f = open(filename, 'w')
    print("<!-- Don't modify this file.", file=f)
    print(" It is generated automatically by makeAppendices.py-->", file=f)
    print("# **Opcodes Index**\n", file=f)
    for i in range(ncol):
        print("|   ", end='', file=f)
    print("|", file=f)
    for i in range(ncol):
        print("|---", end='', file=f)
    print("|", file=f)
    k = 0
    for e in entries:
        print(e, end='', file=f)
        k += 1
        if k == ncol:
            print("|", file=f)
            k = 0
    if k != 0:
        print("|", file=f)
    f.close()

def write_opcodes_reference(opcodes, filename):
    entries = []
    for opc in opcodes:
        entries.append("[{}]({}) - {}<br>".format(opc.name, "../" + opc.link, opc.description))
    entries.sort()

    f = open(filename, 'w')
    print("<!-- Don't modify this file.", file=f)
    print(" It is generated automatically by makeAppendices.py-->", file=f)
    print("# **Orchestra Opcodes and Operators**\n", file=f)
    for e in entries:
        print(e, file=f)
    f.close()

def write_opcodes_quick_ref(opc_by_cat, filename):
    f = open(filename, 'w')
    print("<!-- Don't modify this file.", file=f)
    print(" It is generated automatically by makeAppendices.py-->", file=f)
    print("# **Opcode Quick Reference**\n", file=f)
    for cat in categories:
        print("### {}".format(cat), file=f)
        for o in opc_by_cat[cat]:
            cmd = o.name
            if o.filename in diff_opcnames:
                cmd = diff_opcnames[o.filename]
            s = o.syntax
            lines = s[:-1].split('\n')
            sout = ""
            linked = cmd_flag = False
            for l in (lines[1:-1]):
                if not linked:
                    i = l.find(cmd)
                    if i != -1:
                        cmd_flag = True
                    else:
                        cmd = cmd[:-1] + "("
                        i = l.find(cmd)
                        if i != -1:
                            cmd_flag = True
                        else:
                            cmd = cmd[:-1]
                            if len(l) >= len(cmd) and l[len(l)-len(cmd):] == cmd:
                                cmd_flag = True
                if not linked and cmd_flag:
                    link = o.link
                    l = l.replace(cmd, "[**`{}`**]({})".format(cmd, link))
                    k = l.find("[**")
                    if k > 0:
                        l = "`" + l[:k] + "`" + l[k:]
                    k = l.find(link) + len(link) + 1
                    if k < len(l):
                        l = l[:k] + "`" + l[k:] + "`"
                    linked = True
                else:
                    if l[:1] == " ":
                        l = "&nbsp;&nbsp;&nbsp;&nbsp;`" + l.strip() + "`"
                    else:
                        l = "`" + l + "`"
                sout += l + "<br>\n"
            print(sout + '\n', file=f)
    f.close()

def write_examples_list(opc_by_cat, filename):
    f = open(filename, 'w')
    print("<!-- Don't modify this file.", file=f)
    print(" It is generated automatically by makeAppendices.py-->", file=f)
    print("# **List of Examples**\n", file=f)
    for cat in categories:
        print("### {}".format(cat), file=f)
        for o in opc_by_cat[cat]:
            if len(o.examples) > 0:
                link = "(../" + o.link + "#examples)"
                for ex in o.examples:
                    print("[**" + ex + "**]" + link + "<br>", file=f)
        print(file=f)
    f.close()

dir = './docs/opcodes/'
files = os.listdir(dir)
opcodes = []
for f in files:
    opcodes.append(OpcodeInfo(dir+f))
if find_bad_categories(opcodes, categories):
    sys.exit("Bad categories")

opc_by_cat = {}
for opc in opcodes:
    if opc.category in opc_by_cat:
        opc_by_cat[opc.category].append(opc)
    else:
        opc_by_cat[opc.category] = [opc]
for cat, opc_list in opc_by_cat.items():
    opc_list.sort(key=lambda x: x.name)

write_opcodes_index(opcodes, "./docs/opcodesIndex.md", ncol=5)
write_opcodes_reference(opcodes, "./docs/reference/opcodesReference.md")
write_opcodes_quick_ref(opc_by_cat, "./docs/opcodesQuickRef.md")
write_examples_list(opc_by_cat, "./docs/misc/examples.md")
