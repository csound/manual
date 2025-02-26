# **Basic Oscillators**

## Basic Oscillators
The basic oscillator opcodes are: (note that opcodes that end with 'i' implement linear interpolation and those that end with '3' implement cubic interpolation).

- Oscillator Banks: [oscbnk](../../opcodes/oscbnk)
- Simple table oscillators: [oscil](../../opcodes/oscil), [oscil3](../../opcodes/oscil3) and [oscili](../../opcodes/oscili).
- Simple, fast sine oscilator: [oscils](../../opcodes/oscils)
- Precision oscilators: [poscil](../../opcodes/poscil) and [poscil3](../../opcodes/poscil3).
- More flexible oscillators: [oscilikt](../../opcodes/oscilikt), [osciliktp](../../opcodes/osciliktp), [oscilikts](../../opcodes/oscilikts) and [osciln](../../opcodes/osciln) (also called [oscilx](../../opcodes/oscilx)).

Oscillators can also be constructed from generic table read opcodes. See the [Table Read/Write operations](../../table/readwrit) section.

## LFOs

- [lfo](../../opcodes/lfo)
- [vibr](../../opcodes/vibr)
- [vibrato](../../opcodes/vibrato)

See the section [Table access](../tableacc) for other table reading opcodes that can be used as oscillators. Also see the section [Dynamic spectrum Oscillators](../dynamic).
