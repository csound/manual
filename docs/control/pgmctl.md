# **Program Flow Control**

The opcodes to manipulate which orchestra statements are executed are:

* [cggoto](../../opcodes/cggoto)
* [cigoto](../../opcodes/cigoto)
* [ckgoto](../../opcodes/ckgoto)
* [cngoto](../../opcodes/cngoto)
* [elseif](../../opcodes/elseif)
* [else](../../opcodes/else)
* [endif](../../opcodes/endif)
* [goto](../../opcodes/goto)
* [if](../../opcodes/if)
* [igoto](../../opcodes/igoto)
* [kgoto](../../opcodes/kgoto)
* [tigoto](../../opcodes/tigoto)
* [timout](../../opcodes/timout)

Opcodes to create looping constructions are:

* [loop_ge](../../opcodes/loop_ge)
* [loop_gt](../../opcodes/loop_gt)
* [loop_le](../../opcodes/loop_le)
* [loop_lt](../../opcodes/loop_lt)
* [until](../../opcodes/until)
* [while](../../opcodes/while)

> :warning: **Warning**
>
>Some of these opcodes work at i-rate even if they contain k- or a- rate comparisons. See the [Reinitialization](../reinitn) section.

These opcodes are part of a counter system:

* [count](../../opcodes/count)
* [count_i](../../opcodes/count_i)
* [cntCycles](../../opcodes/cntcycles)
* [cntRead](../../opcodes/cntread)
* [cntReset](../../opcodes/cntreset)
* [cntState](../../opcodes/cntstate)
* [cntCreate](../../opcodes/cntcreate)
* [cntDelete](../../opcodes/cntDelete)
* [cntDelete_i](../../opcodes/cntDelete_i)
