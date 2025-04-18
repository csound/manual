<!--
id:dbamp
category:Mathematical Operations:Amplitude Functions
-->
# dbamp
Returns the decibel equivalent of the raw amplitude _x_.

## Syntax
``` csound-orc
dbamp(x)  (init-rate or control-rate args only)
```

## Examples

Here is an example of the dbamp opcode. It uses the file [dbamp.csd](../examples/dbamp.csd).

``` csound-csd title="Example of the dbamp opcode." linenums="1"
--8<-- "examples/dbamp.csd"
```

Its output should include lines like this:

```
instr 1:  idb = 40.000
instr 1:  idb = 60
instr 1:  idb = 80
instr 1:  idb = 86.021
```

## See also

[Amplitude Converters](../math/amp.md)
