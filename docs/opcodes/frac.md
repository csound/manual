<!--
id:frac
category:Mathematical Operations:Mathematical Functions
-->
# frac
Returns the fractional part of a decimal number.

## Syntax
``` csound-orc
frac(x) (init-rate or control-rate args; also works at audio rate in Csound5)
frac(k/i[]) (k- or i-arrays )
```

where the argument within the parentheses may be an expression. Value converters perform arithmetic translation from units of one kind to units of another. The result can then be a term in a further expression.

## Examples

Here is an example of the frac opcode. It uses the file [frac.csd](../examples/frac.csd).

``` csound-csd title="Example of the frac opcode." linenums="1"
--8<-- "examples/frac.csd"
```

Its output should include a line like this:

```
instr 1:  i2 = 0.200
```

Here is another example of the frac opcode. It uses the file [frac2.csd](../examples/frac2.csd).

``` csound-csd linenums="1"
--8<-- "examples/frac2.csd"
```

## See also

[Mathematical Functions](../math/mathfunc.md)

## Credits

Example written by Kevin Conder.
