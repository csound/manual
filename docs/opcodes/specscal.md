<!--
id:specscal
category:Spectral Processing:Non-Standard
-->
# specscal
Scales an input spectral datablock with spectral envelopes.

## Syntax
=== "Modern"
    ``` csound-orc
    wsig = specscal(wsigin, ifscale, ifthresh)
    ```

=== "Classic"
    ``` csound-orc
    wsig specscal wsigin, ifscale, ifthresh
    ```

### Initialization

_ifscale_ -- scale function table. A function table containing values by which a value's magnitude is rescaled.

_ifthresh_ -- threshold function table. If _ifthresh_ is non-zero, each magnitude is reduced by its corresponding table-value (to not less than zero)

### Performance

_wsig_ -- the output spectrum

_wsigin_ -- the input spectra

Scales an input spectral datablock with spectral envelopes. Function tables _ifthresh_ and _ifscale_ are initially sampled across the (logarithmic) frequency space of the input spectrum; then each time a new input spectrum is sensed the sampled values are used to scale each of its magnitude channels as follows: if _ifthresh_ is non-zero, each magnitude is reduced by its corresponding table-value (to not less than zero); then each magnitude is rescaled by the corresponding _ifscale_ value, and the resulting spectrum written to _wsig_.

## Examples

``` csound-orc


  wsig2    specdiff    wsig1         ; sense onsets
  wsig3    specfilt    wsig2, 2      ; absorb slowly
           specdisp    wsig2, 0.1    ; & display both spectra
           specdisp    wsig3, 0.1
```

## See Also

[specaddm](../opcodes/specaddm.md), [specdiff](../opcodes/specdiff.md), [specfilt](../opcodes/specfilt.md), [spechist](../opcodes/spechist.md)
