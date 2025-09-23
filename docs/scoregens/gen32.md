<!--
id:GEN32
category:
-->
# GEN32
Mixes any waveform, resampled with either FFT or linear interpolation.

This routine is similar to [GEN31](../scoregens/gen31.md), but allows specifying source ftable for each partial. Tables can be resampled either with FFT, or linear interpolation.

## Syntax
``` csound-orc
f # time size  32  srca  pna stra phsa  srcb pnb strb phsb  ...
```

### Performance

_srca, srcb_ -- source table number. A negative value can be used to read the table with linear interpolation (by default, the source waveform is transposed and phase shifted using FFT); this is less accurate, but faster, and allows non-integer and negative partial numbers.

_pna, pnb, ..._ -- partial number, must be a positive integer if source table number is positive (i.e. resample with FFT).

_stra, strb, ..._ -- amplitude scale

_phsa, phsb, ..._ -- start phase (0 to 1)

## Examples

Here is an example of the GEN32 routine. It uses the file [gen32.csd](../examples/gen32.csd).

``` csound-csd title="Example of the gen32 generator." linenums="1"
--8<-- "examples/gen32.csd"
```

## Credits

Author: Rasmus Ekman

Programmer: Istvan Varga

New in version 4.17
