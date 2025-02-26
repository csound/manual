<!--
id:abs
category:Mathematical Operations:Mathematical Functions
-->
# abs
Returns an absolute value.

## Syntax
``` csound-orc
abs(x) (no rate restriction)
abs(k/i[]) (k- or i-arrays )
```

where the argument within the parentheses may be an expression. Value converters perform arithmetic translation from units of one kind to units of another. The result can then be a term in a further expression.

## Examples

Here is an example of the abs opcode. It uses the file [abs.csd](../../examples/abs.csd).

``` csound-csd title="Example of the abs opcode." linenums="1"
--8<-- "examples/abs.csd"
```

Its output should include lines like:

```
instr 1:  iabs = 0.000
instr 1:  iabs = 0.150
instr 1:  iabs = 13.000
```

## See also

[Mathematical Functions](../../math/mathfunc)
