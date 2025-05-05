<!--
id:grain
category:Signal Generators:Granular Synthesis
-->
# grain
Generates granular synthesis textures.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = grain(xamp, xpitch, xdens, kampoff, kpitchoff, kgdur, igfn, \
                 iwfn, imgdur [, igrnd])
    ```

=== "Classic"
    ``` csound-orc
    ares grain xamp, xpitch, xdens, kampoff, kpitchoff, kgdur, igfn, \
               iwfn, imgdur [, igrnd]
    ```

### Initialization

_igfn_ -- The ftable number of the grain waveform. This can be just a sine wave or a sampled sound.

_iwfn_ -- Ftable number of the amplitude envelope used for the grains (see also [GEN20](../scoregens/gen20.md)).

_imgdur_ -- Maximum grain duration in seconds. This is the biggest value to be assigned to _kgdur_.

_igrnd_ (optional) -- if non-zero, turns off grain offset randomness. This means that all grains will begin reading from the beginning of the _igfn_ table. If zero (the default), grains will start reading from random _igfn_ table positions.

### Performance

_xamp_ -- Amplitude of each grain.

_xpitch_ -- Grain pitch. To use the original frequency of the input sound, use the formula:

```
sndsr / ftlen(_igfn_)
```

where sndsr is the original sample rate of the _igfn_ sound.

_xdens_ -- Density of grains measured in grains per second. If this is constant then the output is synchronous granular synthesis, very similar to [fof](../opcodes/fof.md). If _xdens_ has a random element (like added noise), then the result is more like asynchronous granular synthesis.

_kampoff_ -- Maximum amplitude deviation from _xamp_. This means that the maximum amplitude a grain can have is _xamp_ + _kampoff_ and the minimum is _xamp_. If _kampoff_ is set to zero then there is no random amplitude for each grain.

_kpitchoff_ -- Maximum pitch deviation from _xpitch_ in Hz. Similar to _kampoff_.

_kgdur_ -- Grain duration in seconds. The maximum value for this should be declared in _imgdur_. If _kgdur_ at any point becomes greater than _imgdur_, it will be truncated to _imgdur_.

The grain generator is based primarily on work and writings of Barry Truax and Curtis Roads.

## Examples

This example generates a texture with gradually shorter grains and wider amp and pitch spread. It uses the file [grain.csd](../examples/grain.csd), and [drumsMlp.wav](../examples/drumsMlp.wav).

``` csound-orc title="Example of the grain opcode." linenums="1"
--8<-- "examples/grain.csd"
```

## See Also

[Granular Synthesis](../siggen/granular.md)

## Credits

Author: Paris Smaragdis<br>
MIT<br>
May 1997<br>
