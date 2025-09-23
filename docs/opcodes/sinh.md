<!--
id:sinh
category:Mathematical Operations:Trigonometric Functions
-->
# sinh
Returns the hyperbolic sine of _x_ (_x_ in radians).

## Syntax
``` csound-orc
sinh(x)     (no rate restriction)
sinh(k/i[]) (k- or i-arrays )
```

## Examples

Here is an example of the sinh opcode. It uses the file [sinh.csd](../examples/sinh.csd).

``` csound-csd title="Example of the sinh opcode." linenums="1"
--8<-- "examples/sinh.csd"
```

Its output should a line like this:

```
instr 1:  i1 = 1.175
```

## See also

[Trigonometric Functions](../math/trig.md)

## Credits

Example written by Kevin Conder.

New in version 3.47
