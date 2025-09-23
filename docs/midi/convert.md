# **Converters**

The following opcodes can convert MIDI information. Some are conceived to work with a MIDI-triggered instrument instance. All opcodes converting from MIDI note to frequency (and back) use the global variable [A4](../opcodes/A4.md) to set the reference frequency

* MIDI note number to frequency converters (MIDI-triggered events): [cpsmidi](../opcodes/cpsmidi.md), [cpsmidib](../opcodes/cpsmidib.md), [cpstmid](../opcodes/cpstmid.md), [octmidi](../opcodes/octmidi.md), [octmidib](../opcodes/octmidib.md), [pchmidi](../opcodes/pchmidi.md), [pchmidib](../opcodes/pchmidib.md).
* MIDI note number to frequency converter (general case): [mtof](../opcodes/mtof.md), [cpsmidinn](../opcodes/cpsmidinn.md)
* Pitch/frequency to MIDI note number converters: [ftom](../opcodes/ftom.md), [pchtom](../opcodes/pchtom.md).
* MIDI velocity to amplitude converters: [ampmidi](../opcodes/ampmidi.md), [ampmidid](../opcodes/ampmidid.md) and [ampmidicurve](../opcodes/ampmidicurve.md)
* Note name to midi / frequency and viceversa: [ntom](../opcodes/ntom.md), [mton](../opcodes/mton.md), [ntof](../opcodes/ntof.md).
