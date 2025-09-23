<!--
id:taninv2
category:Mathematical Operations:Opcode Equivalents of Functions
-->
# taninv2
Returns the arctangent of _iy/ix_, _ky/kx_, or _ay/ax_.

## Syntax
``` csound-orc
ares taninv2 ay, ax
ires taninv2 iy, ix
kres taninv2 ky, kx
 ... taninv2(ky, kx)... (no rate restriction)
```

Returns the arctangent of _iy/ix_, _ky/kx_, or _ay/ax_. If _y_ is zero, _taninv2_ returns zero regardless of the value of _x_. If _x_ is zero, the return value is:

* _&#960;/2_, if _y_ is positive.
* _-&#960;/2_, if _y_ is negative.
* _0_, if _y_ is 0.

### Initialization

_iy, ix_ -- values to be converted

### Performance

_ky, kx_ -- control rate signals to be converted

_ay, ax_ -- audio rate signals to be converted

## Examples

Here is an example of the taninv2 opcode. It uses the file [taninv2.csd](../examples/taninv2.csd).

``` csound-csd title="Example of the taninv2 opcode." linenums="1"
--8<-- "examples/taninv2.csd"
```

Its output should include a line like this:

```
instr 1:  i1 = 0.464
```

Here is another example of the taninv2 opcode. It uses the file [taninv2-advanced.csd](../examples/taninv2-advanced.csd).

``` csound-csd title="Advanced example of the taninv2 opcode." linenums="1"
--8<-- "examples/taninv2-advanced.csd"
```

## See also

[Opcode Equivalents of Functions](../math/opeqfunc.md)

[Trigonometric Functions](../math/trig.md)

## Credits

Author: John ffitch<br>
University of Bath/Codemist Ltd.<br>
Bath, UK<br>
April 1998<br>

New in Csound version 3.48

Corrected on May 2002, thanks to Istvan Varga.

Available as a function in version 6.00
