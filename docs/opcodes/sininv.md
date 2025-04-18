<!--
id:sininv
category:Mathematical Operations:Trigonometric Functions
-->
# sininv
Returns the arcsine of _x_ (_x_ in radians).

## Syntax
``` csound-orc
sininv(x)     (no rate restriction)
sininv(k/i[]) (k- or i-arrays)
```

## Examples

Here is an example of the sininv opcode. It uses the file [sininv.csd](../examples/sininv.csd).

``` csound-csd title="Example of the sininv opcode." linenums="1"
--8<-- "examples/sininv.csd"
```

Its output should include a line like this:

```
instr 1:  i1 = 0.524
```

## See also

[Trigonometric Functions](../math/trig.md)

## Credits

Author: John ffitch

New in version 3.48

Example written by Kevin Conder.
