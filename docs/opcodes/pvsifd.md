<!--
id:pvsifd
category:Spectral Processing:Streaming
-->
# pvsifd
Instantaneous Frequency Distribution, magnitude and phase analysis.

The pvsifd opcode takes an input a-rate signal and performs an Instantaneous Frequency, magnitude and phase analysis, using the STFT and pvsifd (Instantaneous Frequency Distribution), as described in Lazzarini et al, "Time-stretching using the Instantaneous Frequency Distribution and Partial Tracking", Proc.of ICMC05, Barcelona. It generates two PV streaming signals: one containing magnitudes and frequencies, and another containing magnitudes and phases.

## Syntax
=== "Modern"
    ``` csound-orc
    ffr, fphs = pvsifd(ain, ifftsize, ihopsize, iwintype [,iscal])
    ```

=== "Classic"
    ``` csound-orc
    ffr, fphs pvsifd ain, ifftsize, ihopsize, iwintype [,iscal]
    ```

### Initialization

_ifftsize_ -- FFT size in samples. It must be a power of two, at least 2, and an integer multiple of _ihopsize_. The Hann window requires at least 4 samples.

_ihopsize_ -- positive whole number of samples between analysis frames.

_iwintype_ -- window type: 0 for Hamming, 1 for Hann.

_iscal_ -- amplitude scaling (defaults to 1).

### Performance

_ain_ -- input audio signal.

_ffr_ -- output PV stream in AMP_FREQ format, with magnitudes and frequencies in Hz.

_fphs_ -- output PV stream in AMP_PHASE format, with magnitudes and phases in radians, wrapped to the range from -pi to pi.

Both outputs have nonnegative magnitudes, including at DC and Nyquist. At those two bins, a negative real coefficient has phase pi; a positive or zero coefficient has phase zero.

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
