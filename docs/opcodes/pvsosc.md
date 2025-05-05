<!--
id:pvsosc
category:Spectral Processing:Streaming
-->
# pvsosc
PVS-based oscillator simulator.

Generates periodic signal spectra in AMP-FREQ format, with the option of four wave types:

1. sawtooth-like (harmonic weight 1/n, where n is partial number)
2. square-like (similar to 1., but only odd partials)
3. pulse (all harmonics with same weight)
4. cosine

Complex waveforms (ie. all types except cosine) contain all harmonics up to the Nyquist. This makes pvsosc an option for generation of band-limited periodic waves. In addition, types can be changed using a k-rate variable.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = pvsosc(kamp, kfreq, ktype, isize [,ioverlap] [, iwinsize] [, iwintype] \
                  [, iformat])
    ```

=== "Classic"
    ``` csound-orc
    fsig pvsosc kamp, kfreq, ktype, isize [,ioverlap] [, iwinsize] [, iwintype] \
                [, iformat]
    ```

### Initialisation

_fsig_ -- output pv stream set to zero.

_isize_ -- size of analysis frame and window.

_ioverlap_ -- (Optional) size of overlap, defaults to isize/4.

_iwinsize_ -- (Optional) window size, defaults to isize.

_iwintype_ -- (Optional) window type, defaults to Hanning. The choices are currently:

* 0 = Hamming window
* 1 = von Hann window

_iformat_ -- (Optional) data format, defaults to 0 which produces AMP:FREQ data. That is currently the only option.

### Performance

_kamp_ -- signal amplitude. Note that the actual signal amplitude can, depending on wave type and frequency, vary slightly above or below this value. Generally the amplitude will tend to exceed kamp on higher frequencies (> 1000 Hz) and be reduced on lower ones. Also due to the overlap-add process, when resynthesing with pvsynth, frequency glides will cause the output amplitude to fluctuate above and below kamp.

_kfreq_ -- fundamental frequency in Hz.

_ktype_ -- wave type: 1. sawtooh-like, 2.square-like, 3.pulse and any other value for cosine.

## Examples

Here is an example of the pvsosc opcode. It uses the file [pvsosc.csd](../examples/pvsosc.csd).

``` csound-csd title="Example of the pvsosc opcode" linenums="1"
--8<-- "examples/pvsosc.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
August 2006 <br>
