<!--
id:dbfsamp
category:Mathematical Operations:Amplitude Functions
-->
# dbfsamp
Returns the decibel equivalent of the raw amplitude _x_, relative to full scale amplitude.

Full scale is assumed to be 16 bit. New is Csound version 4.10.

## Syntax
``` csound-orc
dbfsamp(x)  (init-rate or control-rate args only)
```

## Examples

Here is an example of the dbfsamp opcode. It uses the file [dbfsamp.csd](../examples/dbfsamp.csd).

``` csound-csd title="Example of the dbfsamp opcode." linenums="1"
--8<-- "examples/dbfsamp.csd"
```

Its output should include lines like this:

```
instr 1:  idb = -90.309
instr 1:  idb = -50.309
instr 1:  idb = -30.309
instr 1:  idb = -10.309
instr 1:  idb = -0.767
```

## See also

[Amplitude Converters](../math/amp.md)
