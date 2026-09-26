<!--
id:tabifd
category:Spectral Processing:Streaming
-->
# tabifd
Instantaneous Frequency Distribution, magnitude and phase analysis.

The tabifd opcode takes an input function table and performs an Instantaneous Frequency, magnitude and phase analysis, using the STFT and tabifd (Instantaneous Frequency Distribution), as described in Lazzarini et al, "Time-stretching using the Instantaneous Frequency Distribution and Partial Tracking", Proc.of ICMC05, Barcelona. It generates two PV streaming signals: one containing magnitudes and frequencies, and another containing magnitudes and phases.

## Syntax
=== "Modern"
    ``` csound-orc
    ffr,fphs = tabifd(ktimpt, kamp, kpitch, ifftsize, ihopsize, iwintype,ifn)
    ```

=== "Classic"
    ``` csound-orc
    ffr,fphs tabifd ktimpt, kamp, kpitch, ifftsize, ihopsize, iwintype,ifn
    ```

### Initialization

_ifftsize_ -- FFT size in samples. It must be a power of two, at least 2, and an integer multiple of _ihopsize_. The Hann window requires at least 4 samples.

_ihopsize_ -- positive whole number of samples between analysis frames. The opcode produces at most one frame per control period, so use a hop size of at least _ksmps_ to receive every frame.

_iwintype_ -- window type: 0 for Hamming, 1 for Hann.

_ifn_ -- source function table

### Performance

_ffr_ -- output PV stream in AMP_FREQ format, with magnitudes and frequencies in Hz.

_fphs_ -- output PV stream in AMP_PHASE format, with magnitudes and phases in radians, wrapped to the range from -pi to pi.

Both outputs have nonnegative magnitudes, including at DC and Nyquist. At those two bins, a negative real coefficient has phase pi; a positive or zero coefficient has phase zero.

_ktimpt_ -- position in seconds at which to start reading. Reading wraps at the table boundaries and uses linear interpolation between samples, including at negative positions.

_kamp_ -- amplitude scaling

_kpitch_ -- table samples to advance per analysis sample: 1 reads forward at the original pitch, -1 reads backward, and 0 holds the value at _ktimpt_.

## Examples

Here is an example of the tabifd opcode. It uses the file [tabifd.csd](../examples/tabifd.csd).

``` csound-csd title="Example of the tabifd opcode." linenums="1"
--8<-- "examples/tabifd.csd"
```

The example above shows the tabifd analysis feeding into partial tracking andcubic-phase additive resynthesis with pitch shifting.

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
Aug 2015 <br>

New plugin in version 6

Aug 2015
