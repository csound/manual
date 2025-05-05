<!--
id:specfilt
category:Spectral Processing:Non-Standard
-->
# specfilt
Filters each channel of an input spectrum.

## Syntax
=== "Modern"
    ``` csound-orc
    wsig = specfilt(wsigin, ifhtim)
    ```

=== "Classic"
    ``` csound-orc
    wsig specfilt wsigin, ifhtim
    ```

### Initialization

_ifhtim_ --  half-time constant.

### Performance

_wsigin_ --  the input spectrum.

Filters each channel of an input spectrum. At each new frame of _wsigin_, each magnitude value is injected into a 1st-order lowpass recursive filter, whose half-time constant has been initially set by sampling the ftable _ifhtim_ across the (logarithmic) frequency space of the input spectrum. This unit effectively applies a _persistence_ factor to the data occurring in each spectral channel, and is useful for simulating the _energy integration_ that occurs during auditory perception. It may also be used as a time-attenuated running _histogram_ of the spectral distribution.

## Examples

``` csound-orc
  wsig2    specdiff    wsig1         ; sense onsets
  wsig3    specfilt    wsig2, 2      ; absorb slowly
           specdisp    wsig2, 0.1    ; & display both spectra
           specdisp    wsig3, 0.1
```

## See Also

[specaddm](../opcodes/specaddm.md), [specdiff](../opcodes/specdiff.md), [spechist](../opcodes/spechist.md), [specscal](../opcodes/specscal.md)
