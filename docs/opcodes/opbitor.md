<!--
id:opbitor
category:Mathematical Operations:Arithmetic and Logic Operations
-->
# &verbar;
Bitwise OR operator.

The bitwise operators perform operations of bitwise AND, bitwise OR, bitwise NOT and bitwise non-equivalence.

## Syntax
``` csound-orc
a | b  (bitwise OR)
```

where the arguments $a$ and $b$ may be further expressions.  They are converted to the nearest integer to machine precision and then the operation is performed.

### Performance

The priority of these operators is less binding that the arithmetic ones, but more binding that the comparisons.

Parentheses may be used as above to force particular groupings.

## Examples

Here is an example of the bitwise AND and OR operators. It uses the file [bitwise.csd](../../examples/bitwise.csd).

``` csound-csd title="Example of the bitwise operators." linenums="1"
--8<-- "examples/bitwise.csd"
```

Here is an example for the bitwise-group, comparing the different bitwise opcodes. It uses the file [bitwise-group.csd](../../examples/bitwise-group.csd).

``` csound-csd title="Example of the bitwise group." linenums="1"
--8<-- "examples/bitwise-group.csd"
```

## See also

[Arithmetic and Logic Operations](../../math/artlogic)
