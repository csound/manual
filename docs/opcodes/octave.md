<!--
id:octave
category:Pitch Converters:Functions
-->
# octave
Calculates a factor to raise/lower a frequency by a given amount of octaves.

## Syntax
``` csound-orc
octave(x)
```

This function works at a-rate, i-rate, and k-rate.

### Initialization

_x_ -- a value expressed in octaves.

### Performance

The value returned by the _octave_ function is a factor. You can multiply a frequency by this factor to raise/lower it by the given amount of octaves.

## Examples

Here is an example of the octave opcode. It uses the file [octave.csd](../examples/octave.csd).

``` csound-csd title="Example of the octave opcode." linenums="1"
--8<-- "examples/octave.csd"
```

Its output should include lines like:

```
i1  3520.00000
i1  1760.00000
i1   880.00000
i1   440.00000
i1  7040.00000
i1  3520.00000
i1  1760.00000
i1   880.00000
i1   440.00000
.......
```

## See also

[Pitch Converters: Functions](../pitch/funcs.md)

## Credits

New in version 4.16
