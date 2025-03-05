<!--
id:kr
category:Orchestra Syntax:Header
-->
# kr
Sets the control rate.

These statements are global value [assignments](../../opcodes/assign), made at the beginning of an orchestra, before any instrument block is defined. Their function is to set certain [reserved symbol variables](../../) that are required for performance. Once set, these reserved symbols can be used in expressions anywhere in the orchestra.

## Syntax
``` csound-orc
kr = iarg
```

### Initialization

_kr_ = (optional) -- set control rate to _iarg_ samples per second. The default value is 4410.

In addition, any [global variable](../../) can be initialized by an _init-time assignment_ anywhere before the first [instr statement](../../opcodes/instr).  All of the above assignments are run as instrument 0 (i-pass only) at the start of real performance.

Beginning with Csound version 3.46, _kr_ can be omitted. Csound will use the default values, or calculate _kr_ from defined [ksmps](../../opcodes/ksmps) and [sr](../../opcodes/sr). It is usually better to just specify [ksmps](../../opcodes/ksmps) and [sr](../../opcodes/sr) and let csound calculate _kr_.


## Examples
``` csound-orc
sr = 10000
kr = 500
ksmps = 20
gi1 = sr/2.
ga init 0
itranspose = octpch(.0l)
```

Here is an example of the kr opcode. It uses the file [kr.csd](../../examples/kr.csd).

``` csound-csd title="Example of the kr opcode." linenums="1"
--8<-- "examples/kr.csd"
```

## See also

[Orchestra Header Statements](../../orch/header)
