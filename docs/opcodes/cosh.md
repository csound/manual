<!--
id:cosh
category:Mathematical Operations:Trigonometric Functions
-->
# cosh
Returns the hyperbolic cosine of _x_ (_x_ in radians).

## Syntax
``` csound-orc
cosh(x)     (no rate restriction)
cosh(k/i[]) (k- or i-arrays )
```

## Examples

Here is an example of the cosh opcode. It uses the file [cosh.csd](../examples/cosh.csd).

``` csound-csd title="Example of the cosh opcode." linenums="1"
--8<-- "examples/cosh.csd"
```

Its output should include lines like this:

```
instr 1:  i1 = 1.543
```

## See also

[Trigonometric Functions](../math/trig.md)

## Credits

Author: John ffitch

New in version 3.47
