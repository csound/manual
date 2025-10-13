# **Program Flow Control**

The opcodes to manipulate which orchestra statements are executed are:

* [cggoto](../opcodes/cggoto.md)
* [cigoto](../opcodes/cigoto.md)
* [ckgoto](../opcodes/ckgoto.md)
* [cngoto](../opcodes/cngoto.md)
* [elseif](../opcodes/elseif.md)
* [else](../opcodes/else.md)
* [endif](../opcodes/endif.md)
* [goto](../opcodes/goto.md)
* [if](../opcodes/if.md)
* [igoto](../opcodes/igoto.md)
* [kgoto](../opcodes/kgoto.md)
* [tigoto](../opcodes/tigoto.md)
* [timout](../opcodes/timout.md)

Opcodes to create looping constructions are:

* [break](../opcodes/break.md)
* [continue](../opcodes/continue.md)
* [for](../opcodes/for.md)
* [loop_ge](../opcodes/loop_ge.md)
* [loop_gt](../opcodes/loop_gt.md)
* [loop_le](../opcodes/loop_le.md)
* [loop_lt](../opcodes/loop_lt.md)
* [until](../opcodes/until.md)
* [while](../opcodes/while.md)

> :warning: **Warning**
>
>Some of these opcodes work at i-rate even if they contain k- or a- rate comparisons. See the [Reinitialization](reinitn.md) section.

These opcodes are part of a counter system:

* [count](../opcodes/count.md)
* [count_i](../opcodes/count_i.md)
* [cntCycles](../opcodes/cntcycles.md)
* [cntRead](../opcodes/cntread.md)
* [cntReset](../opcodes/cntreset.md)
* [cntState](../opcodes/cntstate.md)
* [cntCreate](../opcodes/cntcreate.md)
* [cntDelete](../opcodes/cntDelete.md)
* [cntDelete_i](../opcodes/cntDelete_i.md)
