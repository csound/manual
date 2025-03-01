import os

def find_opcode_name(filename):
    f = open(filename, 'r')
    lines = f.readlines()
    f.close()
    for l in lines:
        if l[:2] == "# ":
            return l[2:-1]
    return None

os.chdir("./docs/opcodes")
files = os.listdir(".")

opcodes = {}
for fn in files:
    opcodes[find_opcode_name(fn)] = "../../opcodes/" + fn[:-3]

opcnames = list(opcodes.keys())
opcnames.sort()
print("# **Opcodes Index**\n\n")

n = len(opcnames)
ncol = 5
for i in range(ncol):
    print("|   ", end='')
print("|")
for i in range(ncol):
    print("|---", end='')
print("|")
n1 = n // ncol
n2 = n % ncol
k = 0
for i in range(n1):
    for j in range(ncol):
        opc = opcnames[k]
        print("| [{}]({}) ".format(opc, opcodes[opc]), end='')
        k += 1
    print("|")
while k < n:
    opc = opcnames[k]
    print("| [{}]({}) ".format(opc, opcodes[opc]), end='')
    k += 1
print("|")
