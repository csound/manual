<!--
id:logbtwo
category:Mathematical Operations:Mathematical Functions
-->
# logbtwo
Performs a logarithmic base two calculation.

## Syntax
``` csound-orc
logbtwo(x)  (init-rate or control-rate args only)
```

### Performance

_logbtwo_() returns the logarithm base two of _x_. The range of values admitted as argument is .25 to 4 (i.e. from -2 octave to +2 octave response). This function is the inverse of _powoftwo_().

These functions are fast, because they read values stored in tables. Also they are very useful when working with tuning ratios. They work at i- and k-rate.

## Examples

Here is an example of the logbtwo opcode. It uses the file [logbtwo.csd](../examples/logbtwo.csd).

``` csound-csd title="Example of the logbtwo opcode." linenums="1"
--8<-- "examples/logbtwo.csd"
```

Its output should include a line like this:

```
instr 1:  i1 = 1.585
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

Example written by Kevin Conder.

New in Csound version 3.57
