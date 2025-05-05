<!--
id:specdiff
category:Spectral Processing:Non-Standard
-->
# specdiff
Finds the positive difference values between consecutive spectral frames.

## Syntax
=== "Modern"
    ``` csound-orc
    wsig = specdiff(wsigin)
    ```

=== "Classic"
    ``` csound-orc
    wsig specdiff wsigin
    ```

### Performance

_wsig_ -- the output spectrum.

_wsigin_ -- the input spectra.

Finds the positive difference values between consecutive spectral frames. At each new frame of _wsigin_, each magnitude value is compared with its predecessor, and the positive changes written to the output spectrum. This unit is useful as an energy onset detector.

## Examples

``` csound-orc
  wsig2    specdiff    wsig1         ; sense onsets 
  wsig3    specfilt    wsig2, 2      ; absorb slowly
           specdisp    wsig2, 0.1    ; & display both spectra
           specdisp    wsig3, 0.1
```

## See Also

[specaddm](../opcodes/specaddm.md), [specfilt](../opcodes/specfilt.md), [spechist](../opcodes/spechist.md), [specscal](../opcodes/specscal.md)
