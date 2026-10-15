<CsoundSynthesizer>
<CsOptions>
-n -d -m0
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 1
0dbfs = 1

struct Envelope attack:i, release:i
struct Note pitch:i, label:S
struct Preset name:S, gain:i, cutoff:k, enabled:b, bypass:B, envelope:Envelope, notes:Note[], levels:i[], controls:k[], labels:S[], switches:b[], gates:B[]
struct Row values:i[]

instr 1
  ; Member names, including their case, are the JSON keys.
  source:S = {{
    {
      "name": "Étude // this is text",
      "gain": 0.2,
      "cutoff": 1200,
      "enabled": true,
      "bypass": false,
      "envelope": {"attack": 0.01, "release": 0.2},
      "notes": [{"pitch": 60, "label": "C4"}, {"pitch": 67, "label": "G4"}],
      "levels": [0.25, 0.5, 1],
      "controls": [800, 1200],
      "labels": ["soft", "bright"],
      "switches": [true, false],
      "gates": [false, true]
    }
  }}
  preset:Preset = jsonunmarshal(source)
  prints("%s: %d notes, attack %.2f seconds\n", \
         preset.name, lenarray(preset.notes), preset.envelope.attack)

  ; Writing reads k and B members once, during initialization.
  encoded:S = jsonmarshal(preset, 1)
  prints("%s\n", encoded)
  restored:Preset = jsonunmarshal(encoded)
  prints("Restored last note: %s\n", restored.notes[1].label)

  ; Each supported scalar type can also be the element type of a root array.
  numbers:i[] = jsonunmarshal("[1, 2.5, -3]")
  controls:k[] = jsonunmarshal("[440, 660]")
  names:S[] = jsonunmarshal({{ ["one", "two"] }})
  switches:b[] = jsonunmarshal("[true, false]")
  gates:B[] = jsonunmarshal("[false, true]")
  notes:Note[] = jsonunmarshal({{ [{"pitch":72,"label":"C5"}] }})
  empty:i[] = jsonunmarshal("[]")
  prints("Root arrays: %s | %s | %s | %s | %s | %s | %s\n", \
         jsonmarshal(numbers), jsonmarshal(controls), jsonmarshal(names), \
         jsonmarshal(switches), jsonmarshal(gates), jsonmarshal(notes), \
         jsonmarshal(empty))

  ; Use structs containing arrays for rows of different lengths.
  rows:Row[] = jsonunmarshal({{ [{"values":[1,2]},{"values":[3]}] }})
  prints("Rows: %s\n", jsonmarshal(rows))
endin
</CsInstruments>
<CsScore>
i 1 0 0.1
e
</CsScore>
</CsoundSynthesizer>
