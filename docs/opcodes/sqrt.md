<!--
id:sqrt
category:Mathematical Operations:Mathematical Functions
-->
# sqrt
Returns the square root of _x_ (_x_ non-negative).

The argument value is restricted for [log](../opcodes/log.md), [log10](../opcodes/log10.md), and _sqrt_.

## Syntax
``` csound-orc
sqrt(x)      (no rate restriction)
sqrt(k/i[])  (k- or i-arrays )
```

where the argument within the parentheses may be an expression. Value converters perform arithmetic translation from units of one kind to units of another. The result can then be a term in a further expression.

## Examples

Here is an example of the sqrt opcode. It uses the file [sqrt.csd](../examples/sqrt.csd).

``` csound-csd title="Example of the sqrt opcode." linenums="1"
--8<-- "examples/sqrt.csd"
```

Its output should include lines like these:

```
square root of left channel = 1.000000
square root of left channel = 0.948688
square root of left channel = 0.894437
square root of left channel = 0.836676
square root of left channel = 0.774620
square root of left channel = 0.707139
square root of left channel = 0.632499
square root of left channel = 0.547781
square root of left channel = 0.447295
square root of left channel = 0.316242
```

## See also

[Mathematical Functions](../math/mathfunc.md)
