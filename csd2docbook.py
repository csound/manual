# -*- coding: utf-8 -*-
#
# Copyright (C) 2007 François Pinot
# Copyright (C) 2017 Nathan Whetsell
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

import glob
from pygments import highlight
from pygments.formatter import Formatter
from pygments.lexers import CsoundDocumentLexer, CsoundOrchestraLexer
from pygments.token import STANDARD_TYPES
from xml.sax.saxutils import escape


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
    with open(path.replace('examples/', 'examples-xml/') + '.xml', 'w') as file:
        file.write('<refsect1>\n')
        file.write(highlight(code, CsoundDocumentLexer(), DocBookFormatter()))
        file.write('</refsect1>\n')

path = 'examples/table1.inc'
with open(path, 'r') as file:
    code = file.read()
with open(path.replace('examples/', 'examples-xml/') + '.xml', 'w') as file:
    file.write(highlight(code, CsoundOrchestraLexer(), DocBookFormatter()))
