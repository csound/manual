<!--
id:taninv
category:Mathematical Operations:Trigonometric Functions
-->
# taninv
Returns the arctangent of _x_ (_x_ in radians).

## Syntax
``` csound-orc
taninv(x)     (no rate restriction)
taninv(k/i[]) (k- or i-arrays )
```

## Examples

Here is an example of the taninv opcode. It uses the file [taninv.csd](../examples/taninv.csd).

``` csound-csd title="Example of the taninv opcode." linenums="1"
--8<-- "examples/taninv.csd"
```

Its output should include a line like this:

```
instr 1:  i1 = 0.464
```

## See also

[Trigonometric Functions](../math/trig.md)

## Credits

Author: John ffitch

New in version 3.48
