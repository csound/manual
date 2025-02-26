# **Signal Input**

The opcodes that receive audio signals are:

* Synchronous input: [in](../../opcodes/in), [in32](../../opcodes/in32), [inch](../../opcodes/inch), [inh](../../opcodes/inh), [ino](../../opcodes/ino), [inq](../../opcodes/inq), [inrg](../../opcodes/inrg), [ins](../../opcodes/ins) and [inx](../../opcodes/inx)
* File streaming: [diskin](../../opcodes/diskin), [diskin2](../../opcodes/diskin2), and [hdf5read](../../opcodes/hdf5read) 
* User defined channel input: [invalue](../../opcodes/invalue)
* Streaming input: [soundin](../../opcodes/soundin)
* Websocket input: [websocket](../../opcodes/websocket)
* Direct to zak input: [inz](../../opcodes/inz)

See the section [Software Bus](../softbus) for input and output through the API.

The [mp3in](../../opcodes/mp3in) allows reading of mp3 files, which are currently not supported by ordinary reading methods inside Csound.
