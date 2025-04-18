<!--
id:sin
category:Mathematical Operations:Trigonometric Functions
-->
# sin
Returns the sine of _x_ (_x_ in radians).

## Syntax
``` csound-orc
sin(x)     (no rate restriction)
sin(k/i[]) (k- or i-arrays )
```

## Examples

Here is an example of the sin opcode. It uses the file [sin.csd](../examples/sin.csd).

``` csound-csd title="Example of the sin opcode." linenums="1"
--8<-- "examples/sin.csd"
```

Its output should include a line like this:

```
instr 1:  isin1 = 0.000  isin2 = 1.000  isin3 = 0.000  isin4 = -1.000  isin5 = -0.000  isin6 = 0.000
```

## See also

[Trigonometric Functions](../math/trig.md)
