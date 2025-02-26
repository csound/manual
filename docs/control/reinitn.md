# **Initialization and Reinitialization**

Opcodes used for the initialization of variables:

* [init](../../opcodes/init)
* [tival](../../opcodes/tival)
* [=](../../opcodes/assign)
* [passign](../../opcodes/passign)
* [pset](../../opcodes/pset)

The opcodes that can generate another initialization pass are:

* [reinit](../../opcodes/reinit)
* [rigoto](../../opcodes/rigoto)
* [rireturn](../../opcodes/rireturn)

The opcode [p](../../opcodes/p) can be used to find score p-fields at i- or k-rate.

[nstrnum](../../opcodes/nstrnum) returns the instrument number for a named instrument.

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
