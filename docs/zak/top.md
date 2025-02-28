# **Zak Patch System**

The zak opcodes are used to create a system for i-rate, k-rate or a-rate patching.  The zak system can be thought of as a global array of variables. These opcodes are useful for performing flexible patching or routing from one instrument to another. The system is similar to a patching matrix on a mixing console or to a modulation matrix on a synthesizer.  It is also useful whenever an array of variables is required.

The zak system is initialized by the [zakinit](../../opcodes/zakinit) opcode, which is usually placed just after the other global initializations: _sr_, _kr_, _ksmps_, _nchnls_. The _zakinit_ opcode defines two areas of memory, one area for i- and k-rate patching, and the other area for a-rate patching. The _zakinit_ opcode may only be called once. Once the zak space is initialized, other zak opcodes can be used to read from, and write to the zak memory space, as well as perform various other tasks.

Zak channels count from 0, so if you define 1 channel, the only valid channel is channel 0.

Opcodes for the zak patch system are:

* Audio Rate: [zacl](../../opcodes/zacl), [zakinit](../../opcodes/zakinit), [zamod](../../opcodes/zamod), [zar](../../opcodes/zar), [zarg](../../opcodes/zarg), [zaw](../../opcodes/zaw) and [zawm](../../opcodes/zawm).
* Control Rate: [zkcl](../../opcodes/zkcl), [zkmod](../../opcodes/zkmod), [zkr](../../opcodes/zkr), [zkw](../../opcodes/zkw), and [zkwm](../../opcodes/zkwm).
* At initialization: [zir](../../opcodes/zir), [ziw](../../opcodes/ziw) and [ziwm](../../opcodes/ziwm)
