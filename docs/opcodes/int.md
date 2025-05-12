<!--
id:int
category:Mathematical Operations:Mathematical Functions
-->
# int
Extracts an integer from a decimal number.

## Syntax
``` csound-orc
int(x)  (init-rate or control-rate; also works at audio rate in Csound5)
```

where the argument within the parentheses may be an expression. Value converters perform arithmetic translation from units of one kind to units of another. The result can then be a term in a further expression.

## Examples

Here is an example of the int opcode. It uses the file [int.csd](../examples/int.csd).

``` csound-csd title="Example of the int opcode." linenums="1"
--8<-- "examples/int.csd"
```

Its output should include lines like these:

```
integer (0.000000/3) = 0.000000
integer (1.000000/3) = 0.000000
integer (2.000000/3) = 0.000000
integer (3.000000/3) = 1.000000
integer (4.000000/3) = 1.000000
integer (5.000000/3) = 1.000000
integer (6.000000/3) = 2.000000
integer (7.000000/3) = 2.000000
integer (8.000000/3) = 2.000000
integer (9.000000/3) = 3.000000
```

=== "Modern"
    Here is an example for the rounding-group, comparing the different rounding opcodes. It uses the file [rounding-group-modern.csd](../examples/rounding-group-modern.csd).
    ``` csound-csd title="Example of the rounding group." linenums="1"
    --8<-- "examples/rounding-group-modern.csd"
    ```

=== "Classic"
    Here is an example for the rounding-group, comparing the different rounding opcodes. It uses the file [rounding-group.csd](../examples/rounding-group.csd).
    ``` csound-csd title="Example of the rounding group." linenums="1"
    --8<-- "examples/rounding-group.csd"
    ```

## See also

[Mathematical Functions](../math/mathfunc.md)
