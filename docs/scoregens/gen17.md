<!--
id:GEN17
category:
-->
# GEN17
Creates a step function from given x-y pairs.

## Syntax
``` csound-orc
f # time size 17 x1 a x2 b x3 c  ...
```

### Initialization

_size_ -- number of points in the table. Must be a power of 2 or a power-of-2 plus 1 (see [f statement](../scoregens/f.md)). The normal value is power-of-2 plus 1.

_x1, x2, x3,_ etc. -- x-ordinate values, in ascending order, 0 first.

_a, b, c,_ etc. -- y-values at those x-ordinates, held until the next x-ordinate.

> :memo: **Note**
>
> This subroutine creates a step function of x-y pairs whose y-values are held to the right. The right-most y-value is then held to the end of the table. The function is useful for mapping one set of data values onto another, such as MIDI note numbers onto sampled sound ftable numbers ( see [loscil](../opcodes/loscil.md)).

## Examples

``` csound-orc
f_  1  0  128  -17   0  1   12  2   24  3   36  4   48  5  60  6   72  7   84  8
```

This describes a step function with 8 successively increasing levels, each 12 locations wide except the last which extends its value to the end of the table. Rescaling is inhibited. Indexing into this table with a MIDI note-number would retrieve a different value every octave up to the eighth, above which the value returned would remain the same.

Here is a complete example of the GEN17 routine. It uses the files [gen17.csd](../examples/gen17.csd).

``` csound-csd title="An example of the GEN17 routine." linenums="1"
--8<-- "examples/gen17.csd"
```

## See Also

[GEN02](../scoregens/gen02.md)
