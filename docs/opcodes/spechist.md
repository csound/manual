<!--
id:spechist
category:Spectral Processing:Non-Standard
-->
# spechist
Accumulates the values of successive spectral frames.

## Syntax
=== "Modern"
    ``` csound-orc
    wsig = spechist(wsigin)
    ```

=== "Classic"
    ``` csound-orc
    wsig spechist wsigin
    ```

### Performance

_wsigin_ -- the input spectra.

Accumulates the values of successive spectral frames. At each new frame of _wsigin_, the accumulations-to-date in each magnitude track are written to the output spectrum. This unit thus provides a running _histogram_ of spectral distribution.

## Examples

``` csound-orc
  wsig2    specdiff    wsig1         ; sense onsets
  wsig3    specfilt    wsig2, 2      ; absorb slowly
           specdisp    wsig2, 0.1    ; & display both spectra
           specdisp    wsig3, 0.1
```

## See Also

[specaddm](../opcodes/specaddm.md), [specdiff](../opcodes/specdiff.md), [specfilt](../opcodes/specfilt.md), [specscal](../opcodes/specscal.md)
