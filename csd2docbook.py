# -*- coding: utf-8 -*-
#
# Copyright (C) 2007 François Pinot
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

from __future__ import print_function
import glob, re
from pygments import highlight
from pygments.formatter import Formatter
from pygments.lexers import CsoundDocumentLexer, CsoundOrchestraLexer, CsoundScoreLexer, _csound_builtins
from pygments.token import Token, STANDARD_TYPES
from xml.sax.saxutils import escape


# FluidSynth opcodes are not installed with Csound 6.11 and later on macOS, and
# they were removed from _csound_builtins.OPCODES at
# https://bitbucket.org/birkenfeld/pygments-main/diff/pygments/lexers/_csound_builtins.py?diff2=1d8eed62b214
opcodeNames = '''
fluidAllOut
fluidCCi
fluidCCk
fluidControl
fluidEngine
fluidInfo
fluidLoad
fluidNote
fluidOut
fluidProgramSelect
fluidSetInterpMethod
'''.split()
for opcodeName in opcodeNames:
    if opcodeName in _csound_builtins.OPCODES:
        print('_csound_builtins.OPCODES already contains ‘' + opcodeName + '’')
    else:
        _csound_builtins.OPCODES.add(opcodeName)


# To match the syntax highlighting from
# https://github.com/csound/manual/tree/c1b097bae66e04c2b11395f12a03f0d67fc1f059
# as closely as possible, change the token type of score statements from Keyword
# to Name.Builtin so that they look like opcodes. With Pygments 2.3 and later,
# this doesn’t apply to m statements (https://csound.com/docs/manual/m.html),
# n statements (https://csound.com/docs/manual/n.html), or p symbols
# (https://csound.com/docs/manual/ScoreNextp.html); see
# https://bitbucket.org/birkenfeld/pygments-main/commits/b60b37f36a03802e0c5ed412268d37bbc55eb9fb#Lpygments/lexers/csound.pyT159
stateTuple = CsoundScoreLexer.tokens['root'][3]
CsoundScoreLexer.tokens['root'][3] = stateTuple[:1] + (Token.Name.Builtin,) + stateTuple[2:]


# See http://pygments.org/docs/formatterdevelopment/.
class DocBookFormatter(Formatter):
    def format(self, tokensource, outfile):
        outfile.write('<programlisting>\n')

        currentTypeString = ''
        currentValue = ''
        for ttype, value in tokensource:
            typeString = STANDARD_TYPES[ttype]
            if typeString == currentTypeString:
                currentValue += value
            else:
                if currentTypeString == 'k' and re.match('end(?:in|op)|instr|opcode', currentValue):
                    # If the current token is a Keyword and is one of endin,
                    # endop, instr, or opcode, treat it as a Keyword.Declaration
                    # token. This is only necessary with Pygments 2.1 through
                    # 2.2. In Pygments 2.3 and later, endin, endop, instr, and
                    # opcode are Keyword.Declaration tokens; see
                    # https://bitbucket.org/birkenfeld/pygments-main/commits/b60b37f36a03802e0c5ed412268d37bbc55eb9fb#Lpygments/lexers/csound.pyT249
                    currentTypeString = 'kd'
                elif currentTypeString == 'kt' and re.match('g?[afikSw]', currentValue) and typeString == 'n':
                    # If the current token is a Keyword.Type, has a value that
                    # matches a Csound type sigil, and is followed immediately
                    # by a name, then it’s a type sigil. Treat it as a Text
                    # token.
                    currentTypeString = ''
                self.writeToken(currentTypeString, currentValue, outfile)
                currentTypeString = typeString
                currentValue = value

        self.writeToken(currentTypeString, currentValue, outfile)

        outfile.write('</programlisting>\n')

    def writeToken(self, typeString, value, outfile):
        escapedValue = escape(value)
        # Don’t wrap Text tokens in emphasis elements.
        if typeString == '':
            outfile.write(escapedValue)
        else:
            outfile.write('<emphasis role="' + typeString + '">' + escapedValue + '</emphasis>')


for path in glob.glob('examples/*.csd'):
    with open(path, 'r') as file:
        code = file.read()
        with open(path.replace('examples', 'examples-xml') + '.xml', 'w') as file2:
            file2.write('<refsect1>\n')
            file2.write(highlight(code, CsoundDocumentLexer(), DocBookFormatter()))
            file2.write('</refsect1>\n')

path = 'examples/table1.inc'
with open(path, 'r') as file:
    code = file.read()
with open(path.replace('examples/', 'examples-xml/') + '.xml', 'w') as file:
    file.write(highlight(code, CsoundOrchestraLexer(), DocBookFormatter()))
