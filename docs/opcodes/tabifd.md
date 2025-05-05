<!--
id:tabifd
category:Spectral Processing:Streaming
-->
# tabifd
Instantaneous Frequency Distribution, magnitude and phase analysis.

The tabifd opcode takes an input function table and performs an Instantaneous Frequency, magnitude and phase analysis, using the STFT and tabifd (Instantaneous Frequency Distribution), as described in Lazzarini et al, "Time-stretching using the Instantaneous Frequency Distribution and Partial Tracking", Proc.of ICMC05, Barcelona. It generates two PV streaming signals, one containing the amplitudes and frequencies (a similar output to pvsanal) and another containing amplitudes and unwrapped phases.

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

_ifftsize_ -- FFT analysis size, must be power-of-two and integer multiple of the hopsize.

_ihopsize_ -- hopsize in samples

_iwintype_ -- window type (O: Hamming, 1: Hanning)

_ifn_ -- source function table

### Performance

_ffr_ -- output pv stream in AMP_FREQ format

_fphs_ -- output pv stream in AMP_PHASE format

_ktimpt_ -- time point (in secs) to read from table (if less than 0 or bigger than table length, it will wraparound)

_kamp_ -- amplitude scaling

_kpitch_ -- pitch scaling (transposition)

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
