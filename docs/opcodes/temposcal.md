<!--
id:temposcal
category:Spectral Processing:Other
-->
# temposcal
Phase-locked vocoder processing with onset detection/processing, 'tempo-scaling'.

_temposcal_ implements phase-locked vocoder processing using function tables containing sampled-sound sources, with [GEN01](../scoregens/gen01.md), and _temposcal_ will accept deferred allocation tables.

This opcode allows for time and frequency-independent scaling. Time is advanced internally, but controlled by a tempo scaling parameter; when an onset is detected, timescaling is momentarily stopped to avoid smearing of attacks. The quality of the effect is generally improved with phase locking switched on.

_temposcal_ will also scale pitch, independently of frequency, using a transposition factor (k-rate).

## Syntax
=== "Modern"
    ``` csound-orc
    asig = temposcal(ktimescal, kamp, kpitch, ktab, klock [,ifftsize, idecim, ithresh])
    ```

=== "Classic"
    ``` csound-orc
    asig temposcal ktimescal, kamp, kpitch, ktab, klock [,ifftsize, idecim, ithresh]
    ```

### Initialization

_ifftsize_ -- FFT size (power-of-two), defaults to 2048.

_idecim_ -- decimation, defaults to 4 (meaning hopsize = fftsize/4)

_idbthresh_ -- threshold based on dB power spectrum ratio between two successive windows. A detected ratio above it will cancel timescaling momentarily, to avoid smearing (defaults to 1)

### Performance

_ktimescal_ -- timescaling ratio, &lt; 1 stretch, > 1 contract.

_kamp_ -- amplitude scaling

_kpitch_ -- grain pitch scaling (1=normal pitch, &lt; 1 lower, > 1 higher; negative, backwards)

_klock_ -- 0 or 1, to switch phase-locking on/off

_ktab_ -- source signal function table. Deferred-allocation tables (see [GEN01](../scoregens/gen01.md)) are accepted, but the opcode expects a mono source. Tables can be switched at k-rate.

## Examples

Here is an example of the temposcal opcode. It uses the file [temposcal.csd](../examples/temposcal.csd).

``` csound-csd title="Example of the temposcal opcode." linenums="1"
--8<-- "examples/temposcal.csd"
```

## See Also

[Short-time Fourier Transform (STFT) Resynthesis](../spectral/stft.md)

## Credits

Author: Victor Lazzarini<br>
February 2010<br>

New plugin in version 5.13

February 2005.
