<CsoundSynthesizer>
<CsOptions>
-odac
; For file output, replace -odac with -o includestr.wav -W.
</CsOptions>
<CsInstruments>
sr = 44100
ksmps = 32
nchnls = 2
0dbfs = 1

; Keep includestr-tone.inc in the same directory as this CSD.
; The macro contains the file name without quotes.
#define INSTRUMENT #includestr-tone.inc#

; Expand the macro inside the quotes, then read that file.
; This inserts instrument 1 before Csound compiles the orchestra.
#includestr "$INSTRUMENT"
</CsInstruments>
<CsScore>
; Play the instrument defined in includestr-tone.inc.
i 1 0 2
e
</CsScore>
</CsoundSynthesizer>
