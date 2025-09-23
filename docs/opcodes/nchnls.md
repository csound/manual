<!--
id:nchnls
category:Orchestra Syntax:Header
-->
# nchnls
Sets the number of channels of audio output.

These statements are global value [assignments](../opcodes/assign.md), made at the beginning of an orchestra, before any instrument block is defined. Their function is to set certain [reserved symbol variables](../orch/data-types.md#constants-and-reserved-symbols) that are required for performance. Once set, these reserved symbols can be used in expressions anywhere in the orchestra.

## Syntax
``` csound-orc
nchnls = iarg
```

### Initialization

_nchnls_ = (optional) -- set number of channels of audio output to _iarg_. (1 = mono, 2 = stereo, 4 = quadraphonic.) The default value is 1 (mono).

In addition, any [global variable](../orch/data-types.md) can be initialized by an _init-time assignment_ anywhere before the first [instr statement](../opcodes/instr.md).  All of the above assignments are run as instrument 0 (i-pass only) at the start of real performance.

## Examples

Here is an example of the nchnls opcode. It uses the file [nchnls.csd](../examples/nchnls.csd).

``` csound-csd title="Example of the nchnls opcode." linenums="1"
--8<-- "examples/nchnls.csd"
```

## See also

[Orchestra Header Statements](../orch/header.md)
