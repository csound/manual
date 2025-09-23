<!--
id:GEN24
category:
-->
# GEN24
Reads numeric values from another allocated function-table and rescales them according to the max and min values given by the user.

## Syntax
``` csound-orc
f # time size -24 ftable min max
```

### Initialization

_#, time, size_ -- the usual GEN parameters. See [f statement](../scoregens/f.md).

_ftable_ -- ftable must be an already allocated table with the same size as this function.

_min, max_ -- the rescaling range.

> :memo: **Note**
>
> This GEN is useful, for example, to eliminate the starting offset in exponential segments allowing a real starting from zero.

## Examples

Here is an example of the GEN24 opcode. It uses the file [gen24.csd](../examples/gen24.csd).

``` csound-csd title="Example of the GEN24 generator." linenums="1"
--8<-- "examples/gen24.csd"
```

## Credits

Author: Gabriel Maldonado

New in Csound version 4.16
