<!--
id:opbitshl
category:Mathematical Operations:Arithmetic and Logic Operations
-->
# &lt;&lt;
Bitshift left operator.

The bitshift operators shift the bits to the left or to the right the number of bits given.

The priority of these operators is less binding that the arithmetic ones, but more binding that the comparisons.

Parentheses may be used as above to force particular groupings.

## Syntax
``` csound-orc
a << b  (bitshift left)
```

where the arguments $a$ and $b$ may be further expressions.

## Examples

=== "Modern"
    Here is an example of the bitshift left operator. It uses the file [bitshift-modern.csd](../examples/bitshift-modern.csd).
    ``` csound-csd title="Example of the bitshift left operator." linenums="1"
    --8<-- "examples/bitshift-modern.csd"
    ```

=== "Classic"
    Here is an example of the bitshift left operator. It uses the file [bitshift.csd](../examples/bitshift.csd).
    ``` csound-csd title="Example of the bitshift left operator." linenums="1"
    --8<-- "examples/bitshift.csd"
    ```

The example above will produce the following output:

```
2>>1 = 1
B  0.000 ..  0.100 T  0.100 TT  0.100 M:      0.0      0.0
3>>1 = 1
B  0.100 ..  0.200 T  0.200 TT  0.200 M:      0.0      0.0
7>>2 = 1
B  0.200 ..  0.300 T  0.300 TT  0.300 M:      0.0      0.0
16>>1 = 8
B  0.300 ..  0.400 T  0.400 TT  0.400 M:      0.0      0.0
16>>2 = 4
B  0.400 ..  0.500 T  0.500 TT  0.500 M:      0.0      0.0
16>>3 = 2
B  0.500 ..  5.000 T  5.000 TT  5.000 M:      0.0      0.0
new alloc for instr 2:
1<<1 = 2
B  5.000 ..  5.100 T  5.100 TT  5.100 M:      0.0      0.0
1<<2 = 4
B  5.100 ..  5.200 T  5.200 TT  5.200 M:      0.0      0.0
1<<3 = 8
B  5.200 ..  5.300 T  5.300 TT  5.300 M:      0.0      0.0
1<<4 = 16
B  5.300 ..  5.400 T  5.400 TT  5.400 M:      0.0      0.0
2<<1 = 4
B  5.400 ..  5.500 T  5.500 TT  5.500 M:      0.0      0.0
2<<2 = 8
B  5.500 ..  5.600 T  5.600 TT  5.600 M:      0.0      0.0
2<<3 = 16
B  5.600 ..  5.700 T  5.700 TT  5.700 M:      0.0      0.0
3<<2 = 12
```

## See also

[Arithmetic and Logic Operations](../math/artlogic.md)
