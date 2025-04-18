<!--
id:GENpadsynth
category:
-->
# GENpadsynth
Generate a sample table using the padsynth algorithm.

Plugin gen in padsynth.

Paul Octavian Nasca's "padsynth algorithm" adds bandwidth to each partial of a periodic waveform. This bandwidth is heard as color, movement, and additional richness of sound.

First, the waveform is defined by the user as a series of harmonic partials. Then, bandwidth is added by independently spreading each partial of the original waveform from a single frequency across neighboring frequencies, according to a "profile" function: a Gaussian curve, a square, or a rising and then falling expontential.

The partials of the original waveform may be considered to be samples in a discrete Fourier transform of the waveform. Normally there is not an exact one-to-one correspondence between the frequencies of the samples (frequency bins) of the discrete Fourier transform with the frequencies of the partials of the original waveform, because any frequency in the inverse of the discrete Fourier transform might be synthesized by interference between any number of bins. However, the padsynth algorithm uses a simple trick to create this correspondence. The discrete Fourier transform is simply made so large that the frequency of any partial of the original waveform will be very close to the frequency of the corresponding bin in the Fourier transform. Once this correspondence has been created, the bandwidth profile can be applied by centering it over the frequency bin of the original partial, scaling the profile by the bandwidth, and simply multiplying the original partial by each sample of the profile and adding the product to the corresponding bin of the Fourier transform.

As the frequencies of the partials increase, their bandwidth may optionally become wider or (less often) narrower.

Once each partial has been spread out in this way, the discrete Fourier transform may be given random phases, and is then simply inverted to synthesize the desired waveform, which may be used as the wavetable for a digital oscillator.

N.B.: The size of the function table does NOT necessarily reflect one periodic cycle of the waveform that it contains. The fundamental frequency must be used to generate the desired pitch from an oscillator using the function table, e.g.

```
oscillator_hz = desired_hz * (sr / padsynth_size / fundamental_hz)
```

## Syntax
``` csound-orc
f # score_time table_size "padsynth" fundamental_frequency \
    partial_bandwidth partial_scale harmonic_stretch profile_shape \
    profile_shape_parameter partial1_amplitude [partial2_amplitude ...]
```

### Initialization

_table_size_ -- Function table size. Should be large, e.g. 2^18 == 262144. Must be a power of 2 or power-of-2 plus 1 (see [f statement](../scoregens/f.md)).

_fundamental_frequency_ -- Fundamental frequency for the generated table.

_partial_bandwidth_ -- Bandwidth of each partial in cents.

_partial_scale_ -- Scaling factor for bandwidth of each partial (log of increase/decrease with partial frequency, 0 is no stretch or shrink).

_harmonic_stretch_ -- Harmonic stretch/shrink for all partials (1 is harmonic).

_profile_shape_ -- Number specifying the shape of the bandwidth profile: 1 = Gaussian, 2 = square, and 3 = exponential

_profile_shape_parameter_ -- Parameter passed to the function generating the profile shape, e.g. exponent.

_partial1_amplitude, partial2_amplitude, ..._ -- Amplitudes for each partial (may be zero).

## Examples

Here is an example of the GENpadsynth routine. It uses the files [padsynth_gen.csd](../examples/padsynth_gen.csd).

``` csound-csd title="An example of the GENpadsynth routine." linenums="1"
--8<-- "examples/padsynth_gen.csd"
```

## See Also

More information on Padsynth: [http://www.paulnasca.com/algorithms-created-by-me](http://www.paulnasca.com/algorithms-created-by-me)

## Credits

Written by Michael Gogins

New in version 6.05
