<!--
id:GEN30
category:
-->
# GEN30
Extracts a range of harmonic partials from an existing waveform.

## Syntax
``` csound-orc
f # time size  30  src  minh maxh [ref_sr] [interp]
```

### Performance

_src_ -- source ftable

_minh_ -- lowest harmonic number

_maxh_ -- highest harmonic number

_ref_sr_ (optional) -- maxh is scaled by (sr / ref_sr). The default value of ref_sr is sr. If _ref_sr_ is zero or negative, it is now ignored.

_interp_ (optional) -- if non-zero, allows changing the amplitude of the lowest and highest harmonic partial depending on the fractional part of _minh_ and _maxh_. For example, if _maxh_ is 11.3 then the 12th harmonic partial is added with 0.3 amplitude. This parameter is zero by default.

_GEN30_ does not support tables with an extended guard point (ie. table size = power of two + 1). Although such tables will work both for input and output, when reading source table(s), the guard point is ignored, and when writing the output table, guard point is simply copied from the first sample (table index = 0).

The reason of this limitation is that _GEN30_ uses FFT, which requires power of two table size.  [GEN32](../scoregens/gen32.md) allows using linear interpolation for resampling and phase shifting, which makes it possible to use any table size (however, for partials calculated with FFT, the power of two limitation still exists).

## Examples

Here is an example of the GEN30 routine. It uses the files [gen30.csd](../examples/gen30.csd).

``` csound-csd title="Example of the GEN30 routine." linenums="1"
--8<-- "examples/gen30.csd"
```

## Credits

Author: Istvan Varga

New in version 4.16
