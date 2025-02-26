# **MIDI input and Initialization**

The following opcodes can receive MIDI information:

* MIDI information for any instruments: [aftouch](../../opcodes/aftouch), [chanctrl](../../opcodes/chanctrl) and [polyaft](../../opcodes/polyaft), [pchbend](../../opcodes/pchbend).
* MIDI information for MIDI-triggered instruments: [veloc](../../opcodes/veloc), [midictrl](../../opcodes/midictrl), [midichn](../../opcodes/midichn) and [notnum](../../opcodes/notnum). See also [Converters](../MidiConvert).
* MIDI Controller input for any instrument: [ctrl7](../../opcodes/ctrl7), [ctrl14](../../opcodes/ctrl14) and [ctrl21](../../opcodes/ctrl21).
* MIDI Controller input for MIDI-triggered instruments only: [midic7](../../opcodes/midic7), [midic14](../../opcodes/midic14) and [midic21](../../opcodes/midic21).
* MIDI controller  value initialization: [initc7](../../opcodes/initc7), [initc14](../../opcodes/initc14), [initc21](../../opcodes/initc21), [ctrlinit](../../opcodes/ctrlinit), [ctrlpreset](../../opcodes/ctrlpreset), [ctrlprint](../../opcodes/ctrlprint), [ctrlprintpresets](../../opcodes/ctrlprintpresets), [ctrlsave](../../opcodes/ctrlsave) and [ctrlselect](../../opcodes/ctrlselect).
* MIDI file input information: [midifilestatus](../../opcodes/midifilestatus).
* Generic MIDI input: [midiin](../../opcodes/midiin).

[massign](../../opcodes/massign) can be used to specify the csound instrument to be triggered by a particular MIDI channel. [pgmassign](../../opcodes/pgmassign) can be use to assign a csound instrument to a specific MIDI program.
