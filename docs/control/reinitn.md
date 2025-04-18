# **Initialization and Reinitialization**

Opcodes used for the initialization of variables:

* [init](../opcodes/init.md)
* [tival](../opcodes/tival.md)
* [=](../opcodes/assign.md)
* [passign](../opcodes/passign.md)
* [pset](../opcodes/pset.md)

The opcodes that can generate another initialization pass are:

* [reinit](../opcodes/reinit.md)
* [rigoto](../opcodes/rigoto.md)
* [rireturn](../opcodes/rireturn.md)

The opcode [p](../opcodes/p.md) can be used to find score p-fields at i- or k-rate.

[nstrnum](../opcodes/nstrnum.md) returns the instrument number for a named instrument.

> :memo: **Note**
>
> Note that an instrument may modify the p3 (duration) parameter at initialisation time.<br>
For example statements like
``` csound-orc
iattack = 0.02
irelease = 0.04
isustain = p3
p3 = iattack + isustain + irelease
```
> are valid.
