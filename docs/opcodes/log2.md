<!--
id:log2
category:Mathematical Operations:Mathematical Functions
-->
# log2
Returns the base 2 log of _x_ (_x_ positive only).

The argument value is restricted for [log](../opcodes/log.md), _log2_, and [sqrt](../opcodes/sqrt.md).

## Syntax
``` csound-orc
log2(x) (no rate restriction)
log2(k/i[]) (k- or i-arrays )
```

where the argument within the parentheses may be an expression. Value converters perform arithmetic translation from units of one kind to units of another. The result can then be a term in a further expression.

## Examples

Here is an example of the log2 opcode. It uses the file [log2.csd](../examples/log2.csd).

``` csound-csd title="Example of the log2 opcode." linenums="1"
--8<-- "examples/log2.csd"
```

Its output should include a line like this:

```
instr 1:  i1 = 3.000
```

## See also

[Mathematical Functions](../math/mathfunc.md)

## Credits

Written by John ffitch.

New in version 5.17.12
