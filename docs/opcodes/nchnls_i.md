<!--
id:nchnls_i
category:Orchestra Syntax:Header
-->
# nchnls_i
Sets the number of channels of audio input.

These statements are global value [assignments](../opcodes/assign.md), made at the beginning of an orchestra, before any instrument block is defined. Their function is to set certain [reserved symbol variables](../orch/data-types.md#constants-and-reserved-symbols) that are required for performance. Once set, these reserved symbols can be used in expressions anywhere in the orchestra.

## Syntax
``` csound-orc
nchnls_i = iarg
```

### Initialization

_nchnls_i_ = (optional) -- set number of channels of audio input to _iarg_. (1 = mono, 2 = stereo, 4 = quadraphonic.) The default value is the valus of _nchnls_.

In addition, any [global variable](../orch/data-types.md) can be initialized by an _init-time assignment_ anywhere before the first [instr statement](../opcodes/instr.md).  All of the above assignments are run as instrument 0 (i-pass only) at the start of real performance.

## Examples

Here is an example of the nchnls_i opcode. It uses the file [nchnls_i.csd](../examples/nchnls_i.csd).

``` csound-csd title="Example of the nchnls_i opcode." linenums="1"
--8<-- "examples/nchnls_i.csd"
```

## See also

[Orchestra Header Statements](../orch/header.md)
