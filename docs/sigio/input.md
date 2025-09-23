# **Signal Input**

The opcodes that receive audio signals are:

* Synchronous input: [in](../opcodes/in.md), [in32](../opcodes/in32.md), [inch](../opcodes/inch.md), [inh](../opcodes/inh.md), [ino](../opcodes/ino.md), [inq](../opcodes/inq.md), [inrg](../opcodes/inrg.md), [ins](../opcodes/ins.md) and [inx](../opcodes/inx.md)
* File streaming: [diskin](../opcodes/diskin.md), [diskin2](../opcodes/diskin2.md), and *hdf5read* (plugin in hdf5 from the plugins repository) 
* User defined channel input: [invalue](../opcodes/invalue.md)
* Streaming input: [soundin](../opcodes/soundin.md)
* Websocket input: *websocket* (plugin in websockets from the plugins repository)
* Direct to zak input: [inz](../opcodes/inz.md)

See the section [Software Bus](softbus.md) for input and output through the API.

The [mp3in](../opcodes/mp3in.md) allows reading of mp3 files, which are currently not supported by ordinary reading methods inside Csound.
