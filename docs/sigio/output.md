# **Signal Output**

The opcodes that write audio signals are:

* Synchronous output: [out](../../opcodes/out), [out32](../../opcodes/out32), [outall](../../opcodes/outall), [outc](../../opcodes/outc), [outch](../../opcodes/outch), [outh](../../opcodes/outh), [outo](../../opcodes/outo), [outrg](../../opcodes/outrg),  [outq](../../opcodes/outq), [outq1](../../opcodes/outq1), [outq2](../../opcodes/outq2), [outq3](../../opcodes/outq3), [outq4](../../opcodes/outq4), [outs](../../opcodes/outs), [outs1](../../opcodes/outs1), [outs2](../../opcodes/outs2), [outx](../../opcodes/outx) and [hdf5write](../../opcodes/hdf5write)
* Streaming output: [soundout](../../opcodes/soundout) and [soundouts](../../opcodes/soundouts)
* User defined channel output: [outvalue](../../opcodes/outvalue)
* Direct from zak output: [outz](../../opcodes/outz)
* Websocket output: [websocket](../../opcodes/websocket)

The opcode [monitor](../../opcodes/monitor) can be used for monitoring the complete output of csound (the output spout frame).

See the section [Software Bus](../softbus) for input and output through the API.
