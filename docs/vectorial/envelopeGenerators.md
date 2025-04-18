# **Vectorial Envelope Generators**

The opcodes to generate vectors containing envelopes are [vlinseg](../opcodes/vlinseg.md) and [vexpseg](../opcodes/vexpseg.md).

These opcodes are similar to [linseg](../opcodes/linseg.md) and [expseg](../opcodes/expseg.md), but operate with vectorial signals instead of with scalar signals.

Output is a vector hosted by an f-table (that must be previously allocated), while each break-point of the envelope is actually a vector of values. All break-points must contain the same number of elements (_ielements_).

These operators are designed to be used together with other opcodes that operate with vectorial signals such as [vcella](../opcodes/vcella.md), [adsynt](../opcodes/adsynt.md), [adsynt2](../opcodes/adsynt2.md), etc.
