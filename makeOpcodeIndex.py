import os

def find_opcode_name(filename):
    f = open(filename, 'r')
    lines = f.readlines()
    f.close()
    for l in lines:
        if l[:2] == "# ":
            return l[2:-1]
    return None

def write_index(opcodes, filename):
    f = open(filename, 'w')
    print("# **Opcodes Index**\n\n", file=f)

    opcnames = list(opcodes.keys())
    opcnames.sort()
    n = len(opcnames)
    ncol = 5
    for i in range(ncol):
        print("|   ", end='', file=f)
    print("|", file=f)
    for i in range(ncol):
        print("|---", end='', file=f)
    print("|", file=f)
    n1 = n // ncol
    n2 = n % ncol
    k = 0
    for i in range(n1):
        for j in range(ncol):
            opc = opcnames[k]
            print("| [{}]({}) ".format(opc, opcodes[opc]), end='', file=f)
            k += 1
        print("|", file=f)
    while k < n:
        opc = opcnames[k]
        print("| [{}]({}) ".format(opc, opcodes[opc]), end='', file=f)
        k += 1
    print("|", file=f)

os.chdir("./docs/opcodes")
files = os.listdir(".")

opcodes = {}
for fn in files:
    opcodes[find_opcode_name(fn)] = "../opcodes/" + fn[:-3]

os.chdir("../")
write_index(opcodes, "opcodesIndex.md")
