<!--
id:db
category:Mathematical Operations:Amplitude Functions
-->
# db
Returns the amplitude equivalent for a given decibel amount.

This opcode is the same as [ampdb](../opcodes/ampdb.md).

## Syntax
``` csound-orc
db(x)
```

This function works at a-rate, i-rate, and k-rate.

### Initialization

_x_ -- a value expressed in decibels.

### Performance

Returns the amplitude for a given decibel amount.

## Examples

Here is an example of the db opcode. It uses the file [db.csd](../examples/db.csd).

``` csound-csd title="Example of the db opcode." linenums="1"
--8<-- "examples/db.csd"
```

Its output should include lines like:

```
instr 1:  iamp = 316.252
instr 1:  iamp = 1211.582
instr 1:  iamp = 4641.643
instr 1:  iamp = 17782.420
```

## See also

[Amplitude Converters](../math/amp.md)

New in version 4.16
