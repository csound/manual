<!--
id:semitone
category:Pitch Converters:Functions
-->
# semitone
Calculates a factor to raise/lower a frequency by a given amount of semitones.

## Syntax
``` csound-orc
semitone(x)
```

This function works at a-rate, i-rate, and k-rate.

### Initialization

_x_ -- a value expressed in semitones.

### Performance

The value returned by the _semitone_ function is a factor. You can multiply a frequency by this factor to raise/lower it by the given amount of semitones.

## Examples

Here is an example of the semitone opcode. It uses the file [semitone.csd](../examples/semitone.csd).

``` csound-csd title="Example of the semitone opcode." linenums="1"
--8<-- "examples/semitone.csd"
```

Its output should include lines like:

```
i1   880.00000
i1     2.00000
i1   830.65625
i1     1.88786
i1   783.94665
i1     1.78170
i1   739.98885
i1     1.68179
i1   698.49586
i1     1.58749
i1   659.21793
i1     1.49822
i1   622.25397
i1     1.41421
i1   587.36267
i1     1.33492
i1   554.33399
i1     1.25985
i1   523.25113
i1     1.18921
i1   493.91116
i1     1.12253
i1   466.13747
i1     1.05940
i1   440.00000
i1     1.00000
.......
```

## See also

[Pitch Converters: Functions](../pitch/funcs.md)

## Credits

New in version 4.16
