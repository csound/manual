# **Limiting and Wrapping of Vectorial Control Signals**

The opcodes to perform limiting and wrapping of elements within a vector are:

* [vlimit](../opcodes/vlimit.md)
* [vwrap](../opcodes/vwrap.md)
* [vmirror](../opcodes/vmirror.md)

These opcodes are similar to [limit](../opcodes/limit.md), [wrap](../opcodes/wrap.md) and [mirror](../opcodes/mirror.md), but operate on a vector instead of a scalar signal. The old values of the vector contained in an f-table are over-written if they are out of min/max interval. If you want to keep the original values of the input vector, use the [vcopy](../opcodes/vcopy.md) opcode to copy it in another table.

All these opcodes work at k-rate. 

All these operators are designed to be used together with other opcodes that operate with vectorial signals such as [vcella](../opcodes/vcella.md), [adsynt](../opcodes/adsynt.md), [adsynt2](../opcodes/adsynt2.md) etc.
