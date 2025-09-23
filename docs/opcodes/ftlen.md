<!--
id:ftlen
category:Table Control:Table Queries
-->
# ftlen
Returns the size of a stored function table.

## Syntax
``` csound-orc
ftlen(x) (init-rate args only)
```

### Performance

Returns the size (number of points, excluding guard point) of stored function table, number _x_. While most units referencing a stored table will automatically take its size into account (so tables can be of arbitrary length), this function reports the actual size if that is needed. Note that _ftlen_ will always return a power-of-2 value, i.e. the function table guard point (see [f Statement](../scoregens/f.md)) is not included.As of Csound version 3.53, _ftlen_ works with deferred function tables (see [GEN01](../scoregens/gen01.md)).

_ftlen_ differs from _nsamp_ in that _nsamp_ gives the number of sample frames loaded, while _ftlen_ gives the total number of samples without the guard point. For example, with a stereo sound file of 10000 samples, ftlen() would return 19999 (i.e. a total of 20000 mono samples, not including a guard point), but nsamp() returns 10000.

## Examples

Here is an example of the ftlen opcode. It uses the file [ftlen.csd](../examples/ftlen.csd), [fox.wav](../examples/fox.wav) and [drumsMlp.wav](../examples/drumsMlp.wav).

``` csound-csd title="Example of the ftlen opcode." linenums="1"
--8<-- "examples/ftlen.csd"
```

The audio file &#8220;fox.wav&#8221; is 121569 samples long, &#8220;drumsMlp.wav&#8221; has a length of 88200 samples. The ftlen opcode reports them as 121568 and 88199 samples, because it reserves 1 point for the guard point. Its output should include lines like these:

```
instr 1:  ift = 121568.000
instr 1:  ift = 88199.000
```

## See also

[Table Control:Table Queries](../table/queries.md)

## Credits

Author: Barry L. Vercoe<br>
MIT<br>
Cambridge, Massachussetts<br>
1997<br>
