<!--
id:mincer
category:Spectral Processing:Other
-->
# mincer
Phase-locked vocoder processing.

_mincer_ implements phase-locked vocoder processing using function tables containing sampled-sound sources, with [GEN01](../scoregens/gen01.md), and _mincer_ will accept deferred allocation tables.

This opcode allows for time and frequency-independent scaling. Time is controlled by a time index (in seconds) to the function table position and can be moved forward and backward at any chosen speed, as well as stopped at a given position ("frozen"). The quality of the effect is generally improved with phase locking switched on.

_mincer_ will also scale pitch, independently of frequency, using a transposition factor (k-rate).

## Syntax
=== "Modern"
    ``` csound-orc
    asig = mincer(atimpt, kamp, kpitch, ktab, klock [ ,ifftsize, idecim])
    ```

=== "Classic"
    ``` csound-orc
    asig mincer atimpt, kamp, kpitch, ktab, klock [ ,ifftsize, idecim]
    ```

### Initialization

_ifftsize_ -- FFT size (power-of-two), defaults to 2048.

_idecim_ -- decimation, defaults to 4 (meaning hopsize = fftsize/4)

### Performance

_atimpt_ -- time position of current audio sample in secs. Table reading wraps around the ends of the function table.

_kamp_ -- amplitude scaling

_kpitch_ -- grain pitch scaling (1=normal pitch, &lt; 1 lower, > 1 higher; negative, backwards)

_klock_ -- 0 or 1, to switch phase-locking on/off

_ktab_ -- source signal function table. Deferred-allocation tables (see [GEN01](../scoregens/gen01.md)) are accepted, but the opcode expects a mono source. Tables can be switched at k-rate.

## Examples

Here is an example of the mincer opcode. It uses the file [mincer.csd](../examples/mincer.csd)

``` csound-csd title="Example of the mincer opcode." linenums="1"
--8<-- "examples/mincer.csd"
```

## See Also

[Short-time Fourier Transform (STFT) Resynthesis](../spectral/stft.md)

## Credits

Author: Victor Lazzarini<br>
February 2010<br>

New plugin in version 5.13

February 2005.
