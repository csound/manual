<!--
id:tan
category:Mathematical Operations:Trigonometric Functions
-->
# tan
Returns the tangent of _x_ (_x_ in radians).

## Syntax
``` csound-orc
tan(x)     (no rate restriction)
tan(k/i[]) (k- or i-arrays )
```

## Examples

Here is an example of the tan opcode. It uses the file [tan.csd](../examples/tan.csd).

``` csound-csd title="Example of the tan opcode." linenums="1"
--8<-- "examples/tan.csd"
```

Its output should include a line like this:

```
instr 1:  i1 = -0.134
```

## See also

[Trigonometric Functions](../math/trig.md)

## Credits

Written by John ffitch.

New in version 3.47
