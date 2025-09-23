<!--
id:opbitand
category:Mathematical Operations:Arithmetic and Logic Operations
-->
# &amp;
Bitwise AND operator.

The bitwise operators perform operations of bitwise AND, bitwise OR, bitwise NOT and bitwise non-equivalence.

## Syntax
``` csound-orc
a & b  (bitwise AND)
```

where the arguments $a$ and $b$ may be further expressions.  They are converted to the nearest integer to machine precision and then the operation is performed.

### Performance

The priority of these operators is less binding that the arithmetic ones, but more binding that the comparisons.

Parentheses may be used as above to force particular groupings.

## Examples

=== "Modern"
    Here is an example of the bitwise AND and OR operators. It uses the file [bitwise-modern.csd](../examples/bitwise-modern.csd).
    ``` csound-csd title="Example of the bitwise operators." linenums="1"
    --8<-- "examples/bitwise-modern.csd"
    ```

=== "Classic"
    Here is an example of the bitwise AND and OR operators. It uses the file [bitwise.csd](../examples/bitwise.csd).
    ``` csound-csd title="Example of the bitwise operators." linenums="1"
    --8<-- "examples/bitwise.csd"
    ```

=== "Modern"
    Here is an example for the bitwise-group, comparing the different bitwise opcodes. It uses the file [bitwise-group-modern.csd](../examples/bitwise-group-modern.csd).
    ``` csound-csd title="Example of the bitwise group." linenums="1"
    --8<-- "examples/bitwise-group-modern.csd"
    ```

=== "Classic"
    Here is an example for the bitwise-group, comparing the different bitwise opcodes. It uses the file [bitwise-group.csd](../examples/bitwise-group.csd).
    ``` csound-csd title="Example of the bitwise group." linenums="1"
    --8<-- "examples/bitwise-group.csd"
    ```

## See also

[Arithmetic and Logic Operations](../math/artlogic.md)
