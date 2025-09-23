<!--
id:pvscfs
category:Spectral Processing:LPC
-->
# pvscfs
Cepstrum all-pole coefficient analysis.

This opcode takes in a pvs signal in AMP_* format, applies the cepstrum transform and computes the coefficients for a an allpole filter

## Syntax
=== "Modern"
    ``` csound-orc
    kCoef[], krms, kerr = pvscfs(fsig, iord [, imod])
    ```

=== "Classic"
    ``` csound-orc
    kCoef[], krms, kerr pvscfs fsig, iord [, imod]
    ```

### Initialization

_iord_ -- all-pole filter order.

_imod_ -- filter stabilisation mode (0=no stabilisation; 1= pole reflection; 2 = pole limiting; defaults to 1).

### Performance

_kCoef[]_ -- all-pole filter coefficients (iord-size array)

_krms_ - RMS estimate of source signal.

_kerr_ -  error (or residual).

_fsig_ -- pvs signal input in PV_AMP_* format.

This opcode is part of a suite of streaming linear prediction opcodes. It takes an fsig, applies a cepstrum transform, retaining iord coefficients, and computes the coefficient for an all-pole filter. Unlike in the linear prediction case, the resulting filter may be unstable. To resolve this, two stabilisation methods are offered: poles can be reflected inside the unit circle, or limited to it. This is somewhat computationally intensive, so there is also the option of turning it off (if the particular use case allows).

## Examples

Here is an example of the pvscfs opcode using an audio input
signal as lpc source. It uses the file [pvscfs.csd](../examples/pvscfs.csd).

``` csound-csd title="Example of the pvscfs opcode." linenums="1"
--8<-- "examples/pvscfs.csd"
```

## See also

[Streaming Linear Predictive Coding (SLPC) Resynthesis](../spectral/lpcresyn.md)
