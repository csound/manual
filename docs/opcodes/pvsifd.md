<!--
id:pvsifd
category:Spectral Processing:Streaming
-->
# pvsifd
Instantaneous Frequency Distribution, magnitude and phase analysis.

The pvsifd opcode takes an input a-rate signal and performs an Instantaneous Frequency, magnitude and phase analysis, using the STFT and pvsifd (Instantaneous Frequency Distribution), as described in Lazzarini et al, "Time-stretching using the Instantaneous Frequency Distribution and Partial Tracking", Proc.of ICMC05, Barcelona. It generates two PV streaming signals, one containing the amplitudes and frequencies (a similar output to pvsanal) and another containing amplitudes and unwrapped phases.

## Syntax
=== "Modern"
    ``` csound-orc
    ffr, fphs = pvsifd(ain, ifftsize, ihopsize, iwintype [,iscal])
    ```

=== "Classic"
    ``` csound-orc
    ffr, fphs pvsifd ain, ifftsize, ihopsize, iwintype [,iscal]
    ```

### Performance

_ffr_ -- output pv stream in AMP_FREQ format

_fphs_ -- output pv stream in AMP_PHASE format

_ifftsize_ -- FFT analysis size, must be power-of-two and integer multiple of the hopsize.

_ihopsize_ -- hopsize in samples

_iwintype_ -- window type (O: Hamming, 1: Hanning)

_iscal_ -- amplitude scaling (defaults to 1).

> :warning: **Warning**
>
> It is unsafe to use the same f-variable for both input and output of pvs opcodes. Using the same one might lead to undefined behavior on some opcodes. Use a different one on the left and right sides of the opcode.

## Examples

Here is an example of the pvsifd opcode. It uses the file [pvsifd.csd](../examples/pvsifd.csd).

``` csound-csd title="Example of the pvsifd opcode." linenums="1"
--8<-- "examples/pvsifd.csd"
```

The example above shows the pvsifd analysis feeding into partial tracking and cubic-phase additive resynthesis with pitch shifting.

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
June 2005 <br>

New plugin in version 5

November 2004.
