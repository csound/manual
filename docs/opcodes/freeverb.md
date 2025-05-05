<!--
id:freeverb
category:Signal Modifiers:Reverberation
-->
# freeverb
Opcode version of Jezar's Freeverb.

freeverb is a stereo reverb unit based on Jezar's public domain C++ sources, composed of eight parallel comb filters on both channels, followed by four allpass units in series. The filters on the right channel are slightly detuned compared to the left channel in order to create a stereo effect.

## Syntax
=== "Modern"
    ``` csound-orc
    aoutL, aoutR = freeverb(ainL, ainR, kRoomSize, kHFDamp[, iSRate[, iSkip]])
    ```

=== "Classic"
    ``` csound-orc
    aoutL, aoutR freeverb ainL, ainR, kRoomSize, kHFDamp[, iSRate[, iSkip]]
    ```

### Initialization

_iSRate_
(optional, defaults to 44100): adjusts the reverb parameters for use with the specified sample rate (this will affect the length of the delay lines in samples, and, as of the latest CVS version, the high frequency attenuation). Only integer multiples of 44100 will reproduce the original character of the reverb exactly, so it may be useful to set this to 44100 or 88200 for an orchestra sample rate of 48000 or 96000 Hz, respectively. While iSRate is normally expected to be close to the orchestra sample rate, different settings may be useful for special effects.

_iSkip_
(optional, defaults to zero): if non-zero, initialization of the opcode will be skipped, whenever possible.

### Performance

_ainL, ainR_
-- input signals; usually both are the same, but different inputs can be used for special effect

> :memo: **Note**
>
> It is recommended to process the input signal(s) with the denorm opcode in order to avoid denormalized numbers which could significantly increase CPU usage in some cases

_aoutL, aoutR_ -- output signals for left and right channel

_kRoomSize_ (range: 0 to 1) -- controls the length of the reverb, a higher value means longer reverb. Settings above 1 may make the opcode unstable.

_kHFDamp_ (range: 0 to 1): high frequency attenuation; a value of zero means all  frequencies decay at the same rate, while higher settings will result in a faster decay of the high frequency range.

## Examples

Here is an example of the _freeverb_ opcode. It uses the file [freeverb.csd](../examples/freeverb.csd).

``` csound-csd title="An example of the freeverb opcode." linenums="1"
--8<-- "examples/freeverb.csd"
```

## See also

[Reverberation](../sigmod/reverbtn.md)

## Credits

Author: Istvan Varga<br>
2005<br>
