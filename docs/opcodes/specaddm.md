<!--
id:specaddm
category:Spectral Processing:Non-Standard
-->
# specaddm
Perform a weighted add of two input spectra.

## Syntax
=== "Modern"
    ``` csound-orc
    wsig = specaddm(wsig1, wsig2 [, imul2])
    ```

=== "Classic"
    ``` csound-orc
    wsig specaddm wsig1, wsig2 [, imul2]
    ```

### Initialization

_imul2_ (optional, default=0) -- if non-zero, scale the _wsig2_ magnitudes before adding. The default value is 0.

### Performance

_wsig1_ -- the first input spectra.

_wsig2_ -- the second input spectra.

Do a weighted add of two input spectra. For each channel of the two input spectra, the two magnitudes are combined and written to the output according to:

```
magout = mag1in + mag2in * imul2
```

The operation is performed whenever the input _wsig1_ is sensed to be new. This unit will (at Initialization) verify the consistency of the two spectra (equal size, equal period, equal mag types).

## See Also

[specdiff](../opcodes/specdiff.md), [specfilt](../opcodes/specfilt.md), [spechist](../opcodes/spechist.md), [specscal](../opcodes/specscal.md)
