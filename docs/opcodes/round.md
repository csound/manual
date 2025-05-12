<!--
id:round
category:Mathematical Operations:Mathematical Functions
-->
# round
Returns the integer value nearest to _x_.

If the fractional part of _x_ is exactly 0.5, the direction of rounding
is undefined and may depend on the host operating system and Csound version.

## Syntax
``` csound-orc
round(x)      (init-, control-, or audio-rate arg allowed)
round(k/i[])  (k- or i-arrays )
```

where the argument within the parentheses may be an expression. Value converters perform arithmetic translation from units of one kind to units of another. The result can then be a term in a further expression.

## Examples

Here is an example of the round opcode. It uses the file [round.csd](../examples/round.csd).

``` csound-csd title="Example of the round opcode." linenums="1"
--8<-- "examples/round.csd"
```

Its output should include a line like these:

```
instr 1:  inumber = 9.000  idiv = 1.000  ifl = 9.000
instr 1:  inumber = 9.000  idiv = 2.000  ifl = 5.000
instr 1:  inumber = 9.000  idiv = 3.000  ifl = 3.000
instr 1:  inumber = 9.000  idiv = 4.000  ifl = 2.000
instr 1:  inumber = 9.000  idiv = 5.000  ifl = 2.000
instr 1:  inumber = 9.000  idiv = 6.000  ifl = 2.000
instr 1:  inumber = 9.000  idiv = 7.000  ifl = 1.000
instr 1:  inumber = 9.000  idiv = 8.000  ifl = 1.000
instr 1:  inumber = 9.000  idiv = 9.000  ifl = 1.000
instr 1:  inumber = 9.000  idiv = 10.000  ifl = 1.000
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

## Credits

Author: Istvan Varga<br>
New in Csound 5<br>
2005<br>
