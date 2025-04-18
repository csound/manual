<!--
id:powoftwo
category:Mathematical Operations:Mathematical Functions
-->
# powoftwo
Performs a  power-of-two calculation.

## Syntax
``` csound-orc
powoftwo(x)  (init-rate or control-rate args only)
```

### Performance

_powoftwo_() function returns 2<sup>_x_</sup> and allows positive and negatives numbers as argument. The range of values admitted in _powoftwo_() is -5 to +5 allowing a precision more fine than one cent in a range of ten octaves. If a greater range of values is required, use the slower opcode [pow](../opcodes/pow.md).

These functions are fast, because they read values stored in tables. Also they are very useful when working with tuning ratios. They work at i- and k-rate.

## Examples

Here is an example of the powoftwo opcode. It uses the file [powoftwo.csd](../examples/powoftwo.csd).

``` csound-csd title="Example of the powoftwo opcode." linenums="1"
--8<-- "examples/powoftwo.csd"
```

Its output should include a line like this:

```
instr 1:  iQuantize = 32768.000
instr 1:  iQuantize = 2048.000
instr 1:  iQuantize = 128.000
instr 1:  iQuantize = 8.000
instr 1:  iQuantize = 2.000
instr 1:  iQuantize = 1.000
```

## See also

[Mathematical Functions](../math/mathfunc.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>
June 1998<br>

Author: John ffitch<br>
University of Bath, Codemist, Ltd.<br>
Bath, UK<br>
July 1999<br>

New in Csound version 3.57
