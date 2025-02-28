# **Limiting and Wrapping of Vectorial Control Signals**

The opcodes to perform limiting and wrapping of elements within a vector are:

* [vlimit](../../opcodes/vlimit)
* [vwrap](../../opcodes/vwrap)
* [vmirror](../../opcodes/vmirror)

These opcodes are similar to [limit](../../opcodes/limit), [wrap](../../opcodes/wrap) and [mirror](../../opcodes/mirror), but operate on a vector instead of a scalar signal. The old values of the vector contained in an f-table are over-written if they are out of min/max interval. If you want to keep the original values of the input vector, use the [vcopy](../../opcodes/vcopy) opcode to copy it in another table.

All these opcodes work at k-rate. 

All these operators are designed to be used together with other opcodes that operate with vectorial signals such as [vcella](../../opcodes/vcella), [adsynt](../../opcodes/adsynt), [adsynt2](../../opcodes/adsynt2) etc.
