# **Converters**

The following opcodes can convert MIDI information. Some are conceived to work with a MIDI-triggered instrument instance. All opcodes converting from MIDI note to frequency (and back) use the global variable [A4](../../opcodes/A4) to set the reference frequency

* MIDI note number to frequency converters (MIDI-triggered events): [cpsmidi](../../opcodes/cpsmidi), [cpsmidib](../../opcodes/cpsmidib), [cpstmid](../../opcodes/cpstmid), [octmidi](../../opcodes/octmidi), [octmidib](../../opcodes/octmidib), [pchmidi](../../opcodes/pchmidi), [pchmidib](../../opcodes/pchmidib).
* MIDI note number to frequency converter (general case): [mtof](../../opcodes/mtof), [cpsmidinn](../../opcodes/cpsmidinn)
* Pitch/frequency to MIDI note number converters: [ftom](../../opcodes/ftom), [pchtom](../../opcodes/pchtom).
* MIDI velocity to amplitude converters: [ampmidi](../../opcodes/ampmidi), [ampmidid](../../opcodes/ampmidid) and [ampmidicurve](../../opcodes/ampmidicurve)
* Note name to midi / frequency and viceversa: [ntom](../../opcodes/ntom), [mton](../../opcodes/mton), [ntof](../../opcodes/ntof).
