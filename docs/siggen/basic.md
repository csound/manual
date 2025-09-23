# **Basic Oscillators**

## Basic Oscillators
The basic oscillator opcodes are: (note that opcodes that end with 'i' implement linear interpolation and those that end with '3' implement cubic interpolation).

- Oscillator Banks: [oscbnk](../opcodes/oscbnk.md)
- Simple table oscillators: [oscil](../opcodes/oscil.md), [oscil3](../opcodes/oscil3.md) and [oscili](../opcodes/oscili.md).
- Simple, fast sine oscilator: [oscils](../opcodes/oscils.md)
- Precision oscilators: [poscil](../opcodes/poscil.md) and [poscil3](../opcodes/poscil3.md).
- More flexible oscillators: [oscilikt](../opcodes/oscilikt.md), [osciliktp](../opcodes/osciliktp.md), [oscilikts](../opcodes/oscilikts.md) and [osciln](../opcodes/osciln.md) (also called [oscilx](../opcodes/oscilx.md)).

Oscillators can also be constructed from generic table read opcodes. See the [Table Read/Write operations](../table/readwrit.md) section.

## LFOs

- [lfo](../opcodes/lfo.md)
- [vibr](../opcodes/vibr.md)
- [vibrato](../opcodes/vibrato.md)

See the section [Table access](tableacc.md) for other table reading opcodes that can be used as oscillators. Also see the section [Dynamic spectrum Oscillators](dynamic.md).
