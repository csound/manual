<!--
id:GEN31
category:
-->
# GEN31
Mixes any waveform specified in an existing table.

This routine is similar to [GEN09](../scoregens/gen09.md), but allows mixing any waveform specified in an existing table.

## Syntax
``` csound-orc
f # time size  31  src  pna stra phsa  pnb strb phsb  ...
```

### Performance

_src_ -- source table number

_pna, pnb, ..._ -- partial number, must be a positive integer

_stra, strb, ..._ -- amplitude scale

_phsa, phsb, ..._ -- start phase (0 to 1)

_GEN31_ does not support tables with an extended guard point (ie. table size = power of two + 1). Although such tables will work both for input and output, when reading source table(s), the guard point is ignored, and when writing the output table, guard point is simply copied from the first sample (table index = 0).

The reason of this limitation is that _GEN31_ uses FFT, which requires power of two table size.  [GEN32](../scoregens/gen32.md) allows using linear interpolation for resampling and phase shifting, which makes it possible to use any table size (however, for partials calculated with FFT, the power of two limitation still exists).

## Examples

Here is an example of the GEN31 routine. It uses the files [gen31.csd](../examples/gen31.csd).

``` csound-csd title="Example of the GEN31 routine." linenums="1"
--8<-- "examples/gen31.csd"
```

## Credits

Author: Istvan Varga

New in version 4.15
