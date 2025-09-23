<!--
id:pluck
category:Signal Generators:Waveguide Physical Modeling
-->
# pluck
Produces a naturally decaying plucked string or drum sound.

It is based on the Karplus-Strong algorithms.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = pluck(kamp, kcps, icps, ifn, imeth [, iparm1] [, iparm2])
    ```

=== "Classic"
    ``` csound-orc
    ares pluck kamp, kcps, icps, ifn, imeth [, iparm1] [, iparm2]
    ```

### Initialization

_icps_ -- intended pitch value in Hz, used to set up a buffer of 1 cycle of audio samples which will be smoothed over time by a chosen decay method. _icps_ normally anticipates the value of _kcps_, but may be set artificially high or low to influence the size of the sample buffer.

_ifn_ -- table number of a stored function used to initialize the cyclic decay buffer. If _ifn_ = 0, a random sequence will be used instead.

_imeth_ -- method of natural decay. There are six, some of which use parameters values that follow.

1.   simple averaging. A simple smoothing process, uninfluenced by parameter values.
2.   stretched averaging. As above, with smoothing time stretched by a factor of _iparm1_ (>=1).
3.   simple drum. The range from pitch to noise is controlled by a 'roughness factor' in _iparm1_ (0 to 1). Zero gives the plucked string effect, while 1 reverses the polarity of every sample (octave down, odd harmonics). The setting .5 gives an optimum snare drum.
4.   stretched drum. Combines both roughness and stretch factors. _iparm1_ is roughness (0 to 1), and _iparm2_ the stretch factor (>=1).
5.   weighted averaging. As method 1, with _iparm1_ weighting the current sample (the status quo) and _iparm2_ weighting the previous adjacent one. _iparm1 + iparm2_ must be &lt;= 1.
6.   1st order recursive filter, with coefs .5. Unaffected by parameter values.

_iparm1, iparm2_ (optional) -- parameter values for use by the smoothing algorithms (above). The default values are both 0.

### Performance

_kamp_ -- the output amplitude.

_kcps_ -- the resampling frequency in cycles-per-second.

An internal audio buffer, filled at i-time according to _ifn_, is continually resampled with periodicity _kcps_ and the resulting output is multiplied by _kamp_. Parallel with the sampling, the buffer is smoothed to simulate the effect of natural decay.

Plucked strings (1, 2, 5, 6) are best realized by starting with a random noise source, which is rich in initial harmonics. Drum sounds (methods 3, 4) work best with a flat source (wide pulse), which produces a deep noise attack and sharp decay.

The original Karplus-Strong algorithm used a fixed number of samples per cycle, which caused serious quantization of the pitches available and their intonation. This implementation resamples a buffer at the exact pitch given by _kcps_, which can be varied for vibrato and glissando effects. For low values of the orch sampling rate (e.g. _sr_ = 10000), high frequencies will store only very few samples (_sr / icps_). Since this may cause noticeable noise in the resampling process, the internal buffer has a minimum size of 64 samples. This can be further enlarged by setting _icps_ to some artificially lower pitch.

## Examples

Here is an example of the pluck opcode. It uses the file [pluck.csd](../examples/pluck.csd).

``` csound-csd title="Example of the pluck opcode." linenums="1"
--8<-- "examples/pluck.csd"
```

A musical example featuring the pluck opcode: [ResonPluck_Cucchi.csd](../examples/musical/ResonPluck_Cucchi.csd) by Stefano Cucchi.

## See also

[Waveguide Physical Modeling](../siggen/wavguide.md)
