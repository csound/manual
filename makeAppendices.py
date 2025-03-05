import os
import sys
from categories import categories

class OpcodeInfo:
    def __init__(self, filename):
        f = open(filename, 'r')
        self.data = f.read()
        f.close()
        self.find_name()
        self.find_syntax()
        self.find_category()
        self.find_examples()
        self.set_link(filename)

    def find_name(self):
        self.name = ""
        i = self.data.find('# ')
        if i != -1:
            j = self.data[i:].find('\n')
            if j != -1:
                j += i
                self.name = self.data[i+2:j].strip()

    def find_syntax(self):
        self.syntax = ""
        i = self.data.find('## Syntax')
        if i != -1:
            j = self.data[i:].find('``` csound-orc\n')
            if j != -1:
                i += j
                j = self.data[i:].find('```\n')
                if j != -1:
                    j += i
                    i += 15
                    self.syntax = self.data[i:j]

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
            self.link = "../../" + filename[i+5:-3]

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
    print("length categories:{}, cats found: {}".format(len(cats_ref, len(cats))))
    return True

def write_opcodes_index(opcodes, filename, ncol=5):
    entries = []
    for opc in opcodes:
        entries.append("| [{}]({}) ".format(opc.name, opc.link))
    entries.sort()

    f = open(filename, 'w')
    print("<!-- Don't modify this file.", file=f)
    print(" It is generated automatically by makeAppendices.py-->", file=f)
    print("# **Opcodes Index**\n\n", file=f)
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

def write_opcodes_ref(opc_by_cat, filename):
    f = open(filename, 'w')
    print("<!-- Don't modify this file.", file=f)
    print(" It is generated automatically by makeAppendices.py-->", file=f)
    print("# **Opcode Quick Reference**\n", file=f)
    for cat in categories:
        print("### {}".format(cat), file=f)
        for o in opc_by_cat[cat]:
            s = o.syntax
            lines = s[:-1].split('\n')
            for i in range(len(lines)):
                l = lines[i]
                l = l.replace(o.name, "[**`{}`**]({})".format(o.name, o.link))
                k = l.find("[**")
                if k > 0:
                    l = "`" + l[:k] + "`" + l[k:]
                    k = l.find(o.link) + len(o.link) + 2
                    if k < len(l):
                        l = l[:k] + "`" + l[k:-1] + "`"
                else:
                     l = "`" + l + "`"
                lines[i] = l
            s = "<br>\n".join(lines)
            print(s + '\n', file=f)
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



write_opcodes_index(opcodes, "./docs/opcodesIndex.md", ncol=5)
#write_opcodes_ref(opc_by_cat, "./docs/opcodesRef.md")
