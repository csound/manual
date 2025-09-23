<!--
id:reverbsc
category:Signal Modifiers:Reverberation
-->
# reverbsc
8 delay line stereo FDN reverb.

It has a feedback matrix based upon physical modeling scattering junction of 8 lossless waveguides of equal characteristic impedance. Based on Csound orchestra version by Sean Costello.

## Syntax
=== "Modern"
    ``` csound-orc
    aoutL, aoutR = reverbsc(ainL, ainR, kfblvl, kfco[, israte[, ipitchm[, iskip]]])
    ```

=== "Classic"
    ``` csound-orc
    aoutL, aoutR reverbsc ainL, ainR, kfblvl, kfco[, israte[, ipitchm[, iskip]]]
    ```

### Initialization

_israte_ (optional, defaults to the orchestra sample rate) -- assume a sample rate of israte. This is normally set to sr, but a different setting can be useful for special effects.

_ipitchm_ (optional, defaults to 1) -- depth of random variation added to delay times, in the range 0 to 10. The default is 1, but this may be too high and may need to be reduced for held pitches such as piano tones.

_iskip_ (optional, defaults to zero) -- if non-zero, initialization of the opcode is skipped, whenever possible.

### Performance

_aoutL, aoutR_ -- output signals for left and right channel

_ainL, ainR_ -- left and right channel input. Note that having an input signal on either the left or right channel only will still result in having reverb output on both channels, making this unit more suitable for reverberating stereo input than the [freeverb](../opcodes/freeverb.md) opcode.

_kfblvl_ -- feedback level, in the range 0 to 1. 0.6 gives a good small "live" room sound, 0.8 a small hall, and 0.9 a large hall. A setting of exactly 1 means infinite length, while higher values will make the opcode unstable.

_kfco_ -- cutoff frequency of simple first order lowpass filters in the feedback loop of delay lines, in Hz. Should be in the range 0 to israte/2 (not sr/2). A lower value means faster decay in the high frequency range.

## Examples

Here is an example of the _reverbsc_ opcode. It uses the file [reverbsc.csd](../examples/reverbsc.csd).

``` csound-csd title="An example of the reverbsc opcode." linenums="1"
--8<-- "examples/reverbsc.csd"
```

## See also

[Reverberation](../sigmod/reverbtn.md)

## Credits

Author: Istvan Varga<br>
2005<br>
