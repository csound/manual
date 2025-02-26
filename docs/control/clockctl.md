# **Clock Control**

The opcodes to start and stop internal clocks are:

* [clockoff](../../opcodes/clockoff)
* [clockon](../../opcodes/clockon)

These clocks count CPU time. There are 32 independent clocks available. You can use the opcode [readclock](../../opcodes/readclock) to read current values of a clock. See [Time Reading](../timeread) for other timing opcodes.
