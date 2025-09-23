<!--
id:doppler
category:Signal Modifiers:Special Effects
-->
# doppler
A fast and robust method for approximating sound propagation, achieving convincing Doppler shifts without having to solve equations.

Plugin opcode in doppler.

The method computes frequency shifts based on reading an input delay line at a delay time computed from the distance between source and mic and the speed of sound. One instance of the opcode is required for each dimension of space through which the sound source moves. If the source sound moves at a constant speed from in front of the microphone, through the microphone, to behind the microphone, then the output will be frequency shifted above the source frequency at a constant frequency while the source approaches, then discontinuously will be shifted below the source frequency at a constant frequency as the source recedes from the microphone. If the source sound moves at a constant speed through a point to one side of the microphone, then the rate of change of position will not be constant, and the familiar Doppler frequency shift typical of a siren or engine approaching and receding along a road beside a listener will be heard.

## Syntax
=== "Modern"
    ``` csound-orc
    ashifted = doppler(asource, ksourceposition, kmicposition [, isoundspeed, \
                       ifiltercutoff])
    ```

=== "Classic"
    ``` csound-orc
    ashifted doppler asource, ksourceposition, kmicposition [, isoundspeed, \
                     ifiltercutoff]
    ```

### Initialization

_isoundspeed_ (optional, default=340.29) -- Speed of sound in meters/second.

_ifiltercutoff_ (optional, default=6) -- Rate of updating the position smoothing filter, in cycles/second.

### Performance

_asource_ -- Input signal at the sound source.

_ksourceposition_ -- Position of the source sound in meters. The distance between source and mic should not be changed faster than about 3/4 the speed of sound.

_kmicposition_ -- Position of the recording microphone in meters. The distance between source and mic should not be changed faster than about 3/4 the speed of sound.

## Examples

Here is an example of the doppler opcode. It uses the file [doppler.csd](../examples/doppler.csd).

``` csound-csd title="Example of the doppler opcode." linenums="1"
--8<-- "examples/doppler.csd"
```

## See also

[Special Effects](../sigmod/speciale.md)

## Credits

Author of algorithm: Peter Brinkmann<br>
Author of opcode: Michael Gogins<br>
January 2010<br>

New in Csound version 5.11
