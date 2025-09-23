# **Signal Output**

The opcodes that write audio signals are:

* Synchronous output: [out](../opcodes/out.md), [out32](../opcodes/out32.md), [outall](../opcodes/outall.md), [outc](../opcodes/outc.md), [outch](../opcodes/outch.md), [outh](../opcodes/outh.md), [outo](../opcodes/outo.md), [outrg](../opcodes/outrg.md),  [outq](../opcodes/outq.md), [outq1](../opcodes/outq1.md), [outq2](../opcodes/outq2.md), [outq3](../opcodes/outq3.md), [outq4](../opcodes/outq4.md), [outs](../opcodes/outs.md), [outs1](../opcodes/outs1.md), [outs2](../opcodes/outs2.md), [outx](../opcodes/outx.md) and *hdf5write* (plugin in hdf5 from the plugins repository)
* Streaming output: [soundout](../opcodes/soundout.md) and [soundouts](../opcodes/soundouts.md)
* User defined channel output: [outvalue](../opcodes/outvalue.md)
* Direct from zak output: [outz](../opcodes/outz.md)
* Websocket output: *websocket* (plugin in websockets from the plugins repository)

The opcode [monitor](../opcodes/monitor.md) can be used for monitoring the complete output of csound (the output spout frame).

See the section [Software Bus](softbus.md) for input and output through the API.
