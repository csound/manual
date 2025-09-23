# **MIDI input and Initialization**

The following opcodes can receive MIDI information:

* MIDI information for any instruments: [aftouch](../opcodes/aftouch.md), [chanctrl](../opcodes/chanctrl.md) and [polyaft](../opcodes/polyaft.md), [pchbend](../opcodes/pchbend.md).
* MIDI information for MIDI-triggered instruments: [veloc](../opcodes/veloc.md), [midictrl](../opcodes/midictrl.md), [midichn](../opcodes/midichn.md) and [notnum](../opcodes/notnum.md). See also [Converters](convert.md).
* MIDI Controller input for any instrument: [ctrl7](../opcodes/ctrl7.md), [ctrl14](../opcodes/ctrl14.md) and [ctrl21](../opcodes/ctrl21.md).
* MIDI Controller input for MIDI-triggered instruments only: [midic7](../opcodes/midic7.md), [midic14](../opcodes/midic14.md) and [midic21](../opcodes/midic21.md).
* MIDI controller  value initialization: [initc7](../opcodes/initc7.md), [initc14](../opcodes/initc14.md), [initc21](../opcodes/initc21.md), [ctrlinit](../opcodes/ctrlinit.md), [ctrlpreset](../opcodes/ctrlpreset.md), [ctrlprint](../opcodes/ctrlprint.md), [ctrlprintpresets](../opcodes/ctrlprintpresets.md), [ctrlsave](../opcodes/ctrlsave.md) and [ctrlselect](../opcodes/ctrlselect.md).
* MIDI file input information: [midifilestatus](../opcodes/midifilestatus.md).
* Generic MIDI input: [midiin](../opcodes/midiin.md).

[massign](../opcodes/massign.md) can be used to specify the csound instrument to be triggered by a particular MIDI channel. [pgmassign](../opcodes/pgmassign.md) can be use to assign a csound instrument to a specific MIDI program.
