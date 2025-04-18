<!--
id:ksmps
category:Orchestra Syntax:Header
-->
# ksmps
Sets the number of samples in a control period.

These statements are global value [assignments](../opcodes/assign.md), made at the beginning of an orchestra, before any instrument block is defined. Their function is to set certain [reserved symbol variables](../orch/data-types.md#constants-and-reserved-symbols) that are required for performance. Once set, these reserved symbols can be used in expressions anywhere in the orchestra.

## Syntax
``` csound-orc
ksmps = iarg
```

### Initialization

_ksmps_ = (optional) -- set the number of samples in a control period. This value must equal_ sr/kr_. The default value is 10.

In addition, any [global variable](../orch/data-types.md) can be initialized by an _init-time assignment_ anywhere before the first [instr statement](../opcodes/instr.md).  All of the above assignments are run as instrument 0 (i-pass only) at the start of real performance.

Beginning with Csound version 3.46, either _ksmps_ may be omitted. Csound will attempt to calculate the omitted value from the specified [sr](../opcodes/sr.md) and [kr](../opcodes/kr.md)values, but it should evaluate to an integer.

> :warning: **Warning**
>
> ksmps must be an integer value.

## Examples

Here is an example of the ksmps opcode. It uses the file [ksmps.csd](../examples/ksmps.csd).

``` csound-csd title="Example of the ksmps opcode." linenums="1"
--8<-- "examples/ksmps.csd"
```

## See also

[Orchestra Header Statements](../orch/header.md)

## Credits

Thanks to a note from Gabriel Maldonado, added a warning about integer values.
