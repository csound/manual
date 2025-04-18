<!--
id:GEN27
category:
-->
# GEN27
Construct functions from segments of straight lines in breakpoint fashion.

## Syntax
``` csound-orc
f # time size 27 x1  y1 x2 y2 x3 ...
```

### Initialization

_size_ -- number of points in the table. Must be a power of 2 or power-of-2 plus 1 (see [f statement](../scoregens/f.md)).

_x1, x2, x3,_ etc. -- locations in table at which to attain the following y value. Must be in increasing order. If the last value is less than size, then the rest will be set to zero. Should not be negative but can be zero.

_y1, y2, y3,_, etc. -- Breakpoint values attained at the location specified by the preceding x value.

> :memo: **Note**
>
>  If p4 is positive, functions are post-normalized (rescaled to a maximum absolute value of 1 after generation). A negative p4 will cause rescaling to be skipped.

## Examples

Here is an example of the GEN27 generator. It uses the file [gen27.csd](../examples/gen27.csd).

``` csound-csd title="Example of the GEN27 generator." linenums="1"
--8<-- "examples/gen27.csd"
```

This is the diagram of the waveform of the GEN27 routine, as used in the example:

<figure markdown="span">
![f 2 0 1025 27 0 0 200 1 400 -1 513 0 - a function which begins at 0, rises to 1 at the 200th table location, falls to -1, by the 400th location, and returns to 0 by the end of the table. The interpolation is linear](../images/gen27.png)
<figcaption>f 2 0 1025 27 0 0 200 1 400 -1 513 0 - a function which begins at 0, rises to 1 at the 200th table location, falls to -1, by the 400th location, and returns to 0 by the end of the table. The interpolation is linear</figcaption>
</figure>

## See Also

[f statement](../scoregens/f.md), [GEN25](../scoregens/gen25.md)

## Credits

Author: John ffitch<br>
University of Bath/Codemist Ltd.<br>
Bath, UK<br>

New in Csound version 3.49
