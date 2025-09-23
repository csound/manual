<!--
id:log10
category:Mathematical Operations:Mathematical Functions
-->
# log10
Returns the base 10 log of _x_ (_x_ positive only).

The argument value is restricted for [log](../opcodes/log.md), _log10_, and [sqrt](../opcodes/sqrt.md).

## Syntax
``` csound-orc
log10(x) (no rate restriction)
log10(k/i[]) (k- or i-arrays )
```

where the argument within the parentheses may be an expression. Value converters perform arithmetic translation from units of one kind to units of another. The result can then be a term in a further expression.

## Examples

Here is an example of the log10 opcode. It uses the file [log10.csd](../examples/log10.csd).

``` csound-csd title="Example of the log10 opcode." linenums="1"
--8<-- "examples/log10.csd"
```

Its output should include a line like this:

```
instr 1:  i1 = 0.903
```

## See also

[Mathematical Functions](../math/mathfunc.md)

## Credits

Written by John ffitch.

New in version 3.47

Example written by Kevin Conder.
