<!--
id:opbitnot
category:Mathematical Operations:Arithmetic and Logic Operations
-->
# ~
Bitwise NOT operator.

The bitwise operators perform operations of bitwise AND, bitwise OR, bitwise NOT and bitwise non-equivalence.

The priority of these operators is less binding that the arithmetic ones, but more binding that the comparisons.

Parentheses may be used as above to force particular groupings.

## Syntax
``` csound-orc
~ a  (bitwise NOT)
```

where the argument $a$ may be a further expression.  It is converted to the nearest integer to machine precision and then the operation is performed.

## Examples

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
