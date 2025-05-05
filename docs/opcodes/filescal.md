<!--
id:filescal
category:Spectral Processing:Other
-->
# filescal
Phase-locked vocoder processing with onset detection/processing, 'tempo-scaling'.

_filescal_ implements phase-locked vocoder processing from disk files, resampling if necessary.

This opcode allows for time and frequency-independent scaling. Time is advanced internally, but controlled by a tempo scaling parameter; when an onset is detected, timescaling is momentarily stopped to avoid smearing of attacks. The quality of the effect is generally improved with phase locking switched on.

_filescal_ will also scale pitch, independently of frequency, using a transposition factor (k-rate).

## Syntax
=== "Modern"
    ``` csound-orc
    asig [,asig2] = filescal(ktimescal, kamp, kpitch, Sfile, klock \
                             [,ifftsize, idecim, ithresh])
    ```

=== "Classic"
    ``` csound-orc
    asig [,asig2] filescal ktimescal, kamp, kpitch, Sfile, klock \
                           [,ifftsize, idecim, ithresh]
    ```

### Initialization

_Sfile_ -- source soundfile, mono or stereo files are allowed, but need to match the number of outputs.

_ifftsize_ -- FFT size (power-of-two), defaults to 2048.

_idecim_ -- decimation, defaults to 4 (meaning hopsize = fftsize/4)

_idbthresh_ -- threshold based on dB power spectrum ratio between two successive windows. A detected ratio above it will cancel timescaling momentarily, to avoid smearing (defaults to 1)

### Performance

_ktimescal_ -- timescaling ratio, &lt; 1 stretch, > 1 contract. Non-negative numbers only.

_kamp_ -- amplitude scaling

_kpitch_ -- grain pitch scaling (1=normal pitch, &lt; 1 lower, > 1 higher; negative, backwards)

_klock_ -- switchec phase-locking on (non-zero) or off (zero).

## Examples

Here is an example of the filescal opcode. It uses the file [filescal.csd](../examples/filescal.csd).

``` csound-csd title="Example of the filescal opcode." linenums="1"
--8<-- "examples/filescal.csd"
```

## See Also

[Short-time Fourier Transform (STFT) Resynthesis](../spectral/stft.md)

## Credits

Author: Victor Lazzarini<br>
April 2016<br>

New in version 6.07

April 2016.
