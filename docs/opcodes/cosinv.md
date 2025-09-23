<!--
id:cosinv
category:Mathematical Operations:Trigonometric Functions
-->
# cosinv
Returns the arccosine of _x_ (_x_ in radians).

## Syntax
``` csound-orc
cosinv(x)     (no rate restriction)
cosinv(k/i[]) (k- or i-arrays )
```

## Examples

Here is an example of the cosinv opcode. It uses the file [cosinv.csd](../examples/cosinv.csd).

``` csound-csd title="Example of the cosinv opcode." linenums="1"
--8<-- "examples/cosinv.csd"
```

Its output should include lines like this:

```
instr 1:  i1 = 1.047
```

## See also

[Trigonometric Functions](../math/trig.md)

## Credits

Author: John ffitch

New in version 3.48
