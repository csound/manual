<!--
id:pvsmorph
category:Spectral Processing:Streaming
-->
# pvsmorph
Performs morphing (or interpolation) between two source fsigs.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = pvsmorph(fsig1, fsig2, kampint, kfrqint)
    ```

=== "Classic"
    ``` csound-orc
    fsig pvsmorph fsig1, fsig2, kampint, kfrqint
    ```

### Performance

_pvsmorph_ interpolates the amplitudes and frequencies of two input spectra. Unlike [pvinterp](../opcodes/pvinterp.md), it uses _fsig_s instead of analysis files and does not preserve the spectral envelope.

_fsig1_, _fsig2_ -- input spectra, such as those produced by [pvsanal](../opcodes/pvsanal.md). Both must use the same FFT size, hop size, window size, window type, and format. Amplitude/frequency and amplitude/phase formats are supported. Both inputs must use the same analysis mode: ordinary frames or sliding analysis. Reinitialize _pvsmorph_ if these settings change.

_kampint_ -- amplitude blend. A value of 0 selects amplitudes from _fsig1_; 1 selects amplitudes from _fsig2_. Values between 0 and 1 give a linear blend.

_kfrqint_ -- frequency blend, independent of _kampint_. A value of 0 selects frequencies from _fsig1_; 1 selects frequencies from _fsig2_. For amplitude/phase input, this control blends phases linearly instead.

Both blend controls are limited to the range 0 to 1. Ordinary analysis produces a new output frame when _fsig1_ supplies a new frame. Sliding analysis processes a spectrum for each active audio sample.

> :warning: **Warning**
>
> Use an output f-variable distinct from both inputs. _pvsmorph_ reports an initialization error if an input is also its output.

## Examples

Here is an example of the pvsmorph opcode. It uses the file [pvsmorph.csd](../examples/pvsmorph.csd).

``` csound-csd title="Example of the pvsmorph opcode." linenums="1"
--8<-- "examples/pvsmorph.csd"
```

Here is another example of the pvsmorph opcode. It uses the file [pvsmorph2.csd](../examples/pvsmorph2.csd).

``` csound-csd title="Example of the pvsmorph opcode." linenums="1"
--8<-- "examples/pvsmorph2.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
April 2007 <br>

New in Csound 5.06
