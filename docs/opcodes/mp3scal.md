<!--
id:mp3scal
category:Spectral Processing:Other
-->
# mp3scal
Phase-locked vocoder processing with onset detection/processing, 'tempo-scaling'.

_mp3scal_ implements phase-locked vocoder processing from mp3-format disk files, resampling if necessary.

This opcode allows for time and frequency-independent scaling. Time is advanced internally. The quality of the effect is generally improved with phase locking switched on.

_mp3scal_ will also scale pitch, independently of frequency, using a transposition factor (k-rate).

## Syntax
=== "Modern"
    ``` csound-orc
    asig, asig2, ktime = mp3scal(Sfile, ktimescal, kpitch, kamp \
                                 [, iskip, ifftsize, idecim, ilock])
      )
    ```

=== "Classic"
    ``` csound-orc
    asig, asig2, ktime mp3scal Sfile, ktimescal, kpitch, kamp \
                               [, iskip, ifftsize, idecim, ilock]
    
    ```

### Initialization

_Sfile_ -- source soundfile stereo mp3 files.

_ifftsize_ -- FFT size (power-of-two), defaults to 2048.

_idecim_ -- decimation, defaults to 4 (meaning hopsize = fftsize/4)

_iskip_ -- skiptime in seconds, defaults to 1.

_ilock_ -- 0 or 1, to switch phase-locking on/off, defaults to 1.

### Performance

_ktimescal_ -- timescaling ratio, &lt; 1 stretch, > 1 contract. Non-negative numbers only.

_kamp_ -- amplitude scaling

_kpitch_ -- grain pitch scaling (1=normal pitch, &lt; 1 lower, > 1 higher)

_ktime_ -- time stamp

_asig_, _asig2_ -- stereo output signals

## Examples

Here is an example of the mp3scal opcode. It uses the file [mp3scal.csd](../examples/mp3scal.csd).

``` csound-csd title="Example of the mp3scal opcode." linenums="1"
--8<-- "examples/mp3scal.csd"
```

## See Also

[Short-time Fourier Transform (STFT) Resynthesis](../spectral/stft.md)

## Credits

Author: Victor Lazzarini<br>
April 2016<br>

New in version 6.07

April 2016.
