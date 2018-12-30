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
from __future__ import print_function
import glob, re
from pygments import highlight
from pygments.formatter import Formatter
from pygments.lexers import CsoundDocumentLexer, CsoundOrchestraLexer, CsoundScoreLexer, _csound_builtins
from pygments.token import Token, STANDARD_TYPES
from xml.sax.saxutils import escape


# The _csound_builtins.OPCODES set will have these opcodes added to it when
# https://bitbucket.org/birkenfeld/pygments-main/pull-requests/684/update-for-csound-6080
# is merged.
opcodeNames = '''
OSCinitM
S
cepsinv
changed2
compress2
dct
dctinv
directory
filescal
framebuffer
ftsamplebank
getftargs
getseed
lua_exec
lua_opdef
mfb
moogladder2
mp3scal
mvchpf
mvclpf1
mvclpf2
mvclpf3
mvclpf4
nchnls_hw
nxtpow2
olabuffer
part2txt
paulstretch
pows
pylrun
pylruni
pylrunt
pyrun
pyruni
pyrunt
scoreline
scoreline_i
tabifd
urandom
'''.split()

# The _csound_builtins.OPCODES set does not contain these opcodes, and there’s
# not yet a pull request to add them.
opcodeNames.extend('''
JackoAudioIn
JackoAudioInConnect
JackoAudioOut
JackoAudioOutConnect
JackoFreewheel
JackoInfo
JackoInit
JackoMidiInConnect
JackoMidiOut
JackoMidiOutConnect
JackoNoteOut
JackoOn
JackoTransport
STKBandedWG
STKBeeThree
STKBlowBotl
STKBlowHole
STKBowed
STKBrass
STKClarinet
STKDrummer
STKFMVoices
STKFlute
STKHevyMetl
STKMandolin
STKModalBar
STKMoog
STKPercFlut
STKPlucked
STKResonate
STKRhodey
STKSaxofony
STKShakers
STKSimple
STKSitar
STKStifKarp
STKTubeBell
STKVoicForm
STKWhistle
STKWurley
cpumeter
dssiactivate
dssiaudio
dssictls
dssiinit
dssilist
jacktransport
joystick
la_i_add_mc
la_i_add_mr
la_i_add_vc
la_i_add_vr
la_i_assign_mc
la_i_assign_mr
la_i_assign_t
la_i_assign_vc
la_i_assign_vr
la_i_conjugate_mc
la_i_conjugate_mr
la_i_conjugate_vc
la_i_conjugate_vr
la_i_distance_vc
la_i_distance_vr
la_i_divide_mc
la_i_divide_mr
la_i_divide_vc
la_i_divide_vr
la_i_dot_mc
la_i_dot_mc_vc
la_i_dot_mr
la_i_dot_mr_vr
la_i_dot_vc
la_i_dot_vr
la_i_get_mc
la_i_get_mr
la_i_get_vc
la_i_get_vr
la_i_invert_mc
la_i_invert_mr
la_i_lower_solve_mc
la_i_lower_solve_mr
la_i_lu_det_mc
la_i_lu_det_mr
la_i_lu_factor_mc
la_i_lu_factor_mr
la_i_lu_solve_mc
la_i_lu_solve_mr
la_i_mc_create
la_i_mc_set
la_i_mr_create
la_i_mr_set
la_i_multiply_mc
la_i_multiply_mr
la_i_multiply_vc
la_i_multiply_vr
la_i_norm1_mc
la_i_norm1_mr
la_i_norm1_vc
la_i_norm1_vr
la_i_norm_euclid_mc
la_i_norm_euclid_mr
la_i_norm_euclid_vc
la_i_norm_euclid_vr
la_i_norm_inf_mc
la_i_norm_inf_mr
la_i_norm_inf_vc
la_i_norm_inf_vr
la_i_norm_max_mc
la_i_norm_max_mr
la_i_print_mc
la_i_print_mr
la_i_print_vc
la_i_print_vr
la_i_qr_eigen_mc
la_i_qr_eigen_mr
la_i_qr_factor_mc
la_i_qr_factor_mr
la_i_qr_sym_eigen_mc
la_i_qr_sym_eigen_mr
la_i_random_mc
la_i_random_mr
la_i_random_vc
la_i_random_vr
la_i_size_mc
la_i_size_mr
la_i_size_vc
la_i_size_vr
la_i_subtract_mc
la_i_subtract_mr
la_i_subtract_vc
la_i_subtract_vr
la_i_t_assign
la_i_trace_mc
la_i_trace_mr
la_i_transpose_mc
la_i_transpose_mr
la_i_upper_solve_mc
la_i_upper_solve_mr
la_i_vc_create
la_i_vc_set
la_i_vr_create
la_i_vr_set
la_k_a_assign
la_k_add_mc
la_k_add_mr
la_k_add_vc
la_k_add_vr
la_k_assign_a
la_k_assign_f
la_k_assign_mc
la_k_assign_mr
la_k_assign_t
la_k_assign_vc
la_k_assign_vr
la_k_conjugate_mc
la_k_conjugate_mr
la_k_conjugate_vc
la_k_conjugate_vr
la_k_current_f
la_k_current_vr
la_k_distance_vc
la_k_distance_vr
la_k_divide_mc
la_k_divide_mr
la_k_divide_vc
la_k_divide_vr
la_k_dot_mc
la_k_dot_mc_vc
la_k_dot_mr
la_k_dot_mr_vr
la_k_dot_vc
la_k_dot_vr
la_k_f_assign
la_k_get_mc
la_k_get_mr
la_k_get_vc
la_k_get_vr
la_k_invert_mc
la_k_invert_mr
la_k_lower_solve_mc
la_k_lower_solve_mr
la_k_lu_det_mc
la_k_lu_det_mr
la_k_lu_factor_mc
la_k_lu_factor_mr
la_k_lu_solve_mc
la_k_lu_solve_mr
la_k_mc_set
la_k_mr_set
la_k_multiply_mc
la_k_multiply_mr
la_k_multiply_vc
la_k_multiply_vr
la_k_norm1_mc
la_k_norm1_mr
la_k_norm1_vc
la_k_norm1_vr
la_k_norm_euclid_mc
la_k_norm_euclid_mr
la_k_norm_euclid_vc
la_k_norm_euclid_vr
la_k_norm_inf_mc
la_k_norm_inf_mr
la_k_norm_inf_vc
la_k_norm_inf_vr
la_k_norm_max_mc
la_k_norm_max_mr
la_k_qr_eigen_mc
la_k_qr_eigen_mr
la_k_qr_factor_mc
la_k_qr_factor_mr
la_k_qr_sym_eigen_mc
la_k_qr_sym_eigen_mr
la_k_random_mc
la_k_random_mr
la_k_random_vc
la_k_random_vr
la_k_subtract_mc
la_k_subtract_mr
la_k_subtract_vc
la_k_subtract_vr
la_k_t_assign
la_k_trace_mc
la_k_trace_mr
la_k_upper_solve_mc
la_k_upper_solve_mr
la_k_vc_set
la_k_vr_set
lua_iaopcall
lua_iaopcall_off
lua_ikopcall_off
lua_iopcall
lua_iopcall_off
mp3scal_check
mp3scal_load
mp3scal_load2
mp3scal_play
mp3scal_play2
p5gconnect
p5gdata
socksend_k
sumTableFilter
systime
vbap1move
websocket
bpf
linlin
xyscale
cmp
mtof
ftom
mton
ntom
pchtom
sc_trig
sc_lag
sc_lagud
sc_phasor
'''.split())

# These aren’t in _csound_builtins.OPCODES because CsoundOrchestraLexer treats
# them as keywords:
#   cggoto   https://csound.github.io/docs/manual/cggoto.html
#   cigoto   https://csound.github.io/docs/manual/cigoto.html
#   cingoto  (undocumented)
#   ckgoto   https://csound.github.io/docs/manual/ckgoto.html
#   cngoto   https://csound.github.io/docs/manual/cngoto.html
#   cnkgoto  (undocumented)
#   endin    https://csound.github.io/docs/manual/endin.html
#   endop    https://csound.github.io/docs/manual/endop.html
#   goto     https://csound.github.io/docs/manual/goto.html
#   igoto    https://csound.github.io/docs/manual/igoto.html
#   instr    https://csound.github.io/docs/manual/instr.html
#   kgoto    https://csound.github.io/docs/manual/kgoto.html
#   loop_ge  https://csound.github.io/docs/manual/loop_ge.html
#   loop_gt  https://csound.github.io/docs/manual/loop_gt.html
#   loop_le  https://csound.github.io/docs/manual/loop_le.html
#   loop_lt  https://csound.github.io/docs/manual/loop_lt.html
#   opcode   https://csound.github.io/docs/manual/opcode.html
#   return   https://csound.github.io/docs/manual/return.html
#   rigoto   https://csound.github.io/docs/manual/rigoto.html
#   rireturn https://csound.github.io/docs/manual/rireturn.html
#   tigoto   https://csound.github.io/docs/manual/tigoto.html
#   timout   https://csound.github.io/docs/manual/timout.html

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
                elif currentTypeString == 'kt' and re.match('g?[aikSw]', currentValue) and typeString == 'n':
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
