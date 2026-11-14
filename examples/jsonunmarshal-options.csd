<CsoundSynthesizer>
<CsOptions>
-n -d -m0
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 1
0dbfs = 1

struct Settings gain:i, name:S

instr 1
  source:S = {{
    {
      // Comments help when editing a preset by hand.
      "name": "soft // literal text",
      "gain": /* linear amplitude */ 0.2,
    }
  }}
  ; 1 allows comments, 2 allows trailing commas; 3 allows both.
  ; The root object is the only container, so a depth of 1 is enough.
  settings:Settings = jsonunmarshal(source, 3, 1)
  strict:S = jsonmarshal(settings)
  prints("Strict JSON: %s\n", strict)
  again:Settings = jsonunmarshal(strict)
  prints("Read back: gain = %.1f, name = %s\n", again.gain, again.name)
endin
</CsInstruments>
<CsScore>
i 1 0 0.1
e
</CsScore>
</CsoundSynthesizer>
