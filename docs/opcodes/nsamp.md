<!--
id:nsamp
category:Table Control:Table Queries
-->
# nsamp
Returns the number of samples loaded into a stored function table number.

## Syntax
``` csound-orc
nsamp(x) (init-rate args only)
```

### Performance

Returns the number of samples loaded into stored function table number _x_ by GEN01. This is useful when a sample is shorter than the power-of-two function table that holds it. New in Csound version 3.49.

As of Csound version 5.02, _nsamp_ works with deferred-length function tables (see [GEN01](../scoregens/gen01.md)).

_nsamp_ differs from _ftlen_ in that _nsamp_ gives the number of sample frames loaded, while _ftlen_ gives the total number of samples. For example, with a stereo sound file of 10000 samples, ftlen() would return 19999 (i.e. a total of 20000 mono samples, not including a guard point), but nsamp() returns 10000.

## Examples

Here is an example of the nsamp opcode. It uses the file [nsamp.csd](../examples/nsamp.csd), [drumsSlp.wav](../examples/drumsSlp.wav). and [fox.wav](../examples/fox.wav).

``` csound-csd title="Example of the nsamp opcode." linenums="1"
--8<-- "examples/nsamp.csd"
```

Since the stereo audio file &#8220;drumsSlp.wav&#8221; has 176400 samples and the mono file &#8220;fox.wav&#8221; has 121569 samples, its output should include lines like these:

```
actual numbers of samples = 176400
actual numbers of samples = 121569
```

## See also

[Table Control:Table Queries](../table/queries.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>
October 1998<br>
