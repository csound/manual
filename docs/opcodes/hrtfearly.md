<!--
id:hrtfearly
category:Signal Modifiers:Panning and Spatialization
-->
# hrtfearly
Generates 3D binaural audio with high-fidelity early reflections in a parametric room using a Phase Truncation algorithm.

This opcode essentially nests the [hrtfmove](../opcodes/hrtfmove.md) opcode in an image model for a user-definable shoebox-shaped room. A default room can be selected, or advanced room parameters can be used. Room surfaces can be controlled with high and low-frequency absorption coefficients and gain factors of a three-band equaliser.

Although valid as a stand alone opcode, _hrtfearly_ is designed to work with [hrtfreverb](../opcodes/hrtfreverb.md) to provide spatially accurate, dynamic binaural reverberation. A number of sources can be processed dynamically using a number of _hrtfearly_ instances. All can then be processed with one instance of [hrtfreverb](../opcodes/hrtfreverb.md).

## Syntax
=== "Modern"
    ``` csound-orc
    aleft, aright, irt60low, irt60high, imfp = hrtfearly(asrc, ksrcx, ksrcy, ksrcz, \
          klstnrx, klstnry, klstnrz, ifilel, ifiler, idefroom [,ifade, isr, iorder, \
          ithreed, kheadrot, iroomx, iroomy, iroomz, iwallhigh, iwalllow, \
          iwallgain1, iwallgain2, iwallgain3, ifloorhigh, ifloorlow, ifloorgain1, \
          ifloorgain2, ifloorgain3, iceilinghigh, iceilinglow, iceilinggain1, \
          iceilinggain2, iceilinggain3])
    ```

=== "Classic"
    ``` csound-orc
    aleft, aright, irt60low, irt60high, imfp hrtfearly asrc, ksrcx, ksrcy, ksrcz, \
        klstnrx, klstnry, klstnrz, ifilel, ifiler, idefroom [,ifade, isr, iorder, \
        ithreed, kheadrot, iroomx, iroomy, iroomz, iwallhigh, iwalllow, \
        iwallgain1, iwallgain2, iwallgain3, ifloorhigh, ifloorlow, ifloorgain1, \
        ifloorgain2, ifloorgain3, iceilinghigh, iceilinglow, iceilinggain1, \
        iceilinggain2, iceilinggain3]
    ```

### Initialization

_ifilel_ - left HRTF spectral data file.

_ifiler_ - right HRTF spectral data file.

> :memo: **Note**
>
Spectral datafiles (based on the MIT HRTF database) are available in 3 different sampling rates: 44.1, 48 and 96 kHz and are labelled accordingly. Input and processing _sr_ should match datafile _sr_. Files should be in the current directory or the SADIR (see [Environment Variables](../invoke/environment-variables.md)).

> :memo: **Note**
>
> HRTF Data files for use with [hrtfmove](../opcodes/hrtfmove.md), [hrtfmove2](../opcodes/hrtfmove2.md), [hrtfstat](../opcodes/hrtfstat.md), _hrtfearly_, [hrtfreverb](../opcodes/hrtfreverb.md) were updated for Csound 5.15 and later (the code was updated and is more efficient). Old datafiles are now deprecated.

_idefroom_ - default room, medium (1: 10*10*3), small (2: 3*4*3) or large (3: 20*25*7). Wall details (high coef, low coef, gain1, gain2, gain3): .3, .1, .75, .95, .9. Floor: .6, .1, .95, .6, .35. Ceiling: .2, .1, 1, 1, 1. If 0 is entered, optional room parameters will be read.

_ifade_ - optional, number of processing buffers for phase change crossfade (default 8). Legal range is 1-24. See [hrtfmove](../opcodes/hrtfmove.md).

_isr_ - optional, default 44.1kHz, legal values: 44100, 48000 and 96000.

_iorder_ - optional, order of images processed: higher order: more reflections. Defaults to 1, legal range: 0-4.

_ithreed_ - optional, process image sources in three dimensions (1) or two (0: default).

_iroomx_ - optional, x room size in metres, will be read if no valid default room is entered (all below parameters behave similarly). Minimum room size is 2\*2\*2.

_iroomy_ - optional, y room size.

_iroomz_ - optional, z room size.

_iwallhigh_ - optional, high frequency wall absorption coefficient (all 4 walls are assumed identical). Absorption coefficients will affect reverb time output.

_iwalllow_ - optional, low frequency wall absorption coefficient.

_iwallgain1_ - optional, gain on filter centred at 250 Hz (all filters have a Q implying 4 octaves).

_iwallgain2_ - optional, as above, centred on 1000 Hz.

_iwallgain3_ - optional, as above, centred on 4000 Hz.

_ifloorhigh, ifloorlow, ifloorgain1, ifloorgain2, ifloorgain3_ - as above for floor.

_iceilinghigh, iceilinglow, iceilinggain1, iceilinggain2, iceilinggain3_ - as above for ceiling.

### Performance

_ksrcx_  source x location, must be 10 cm inside room. Also, near-field HRTFs are not processed, so source will not change spatially within a 45 cm radius of the listener. These restrictions also apply to location parameters below.

_ksrcy_  source y location.

_ksrcz_  source z location.

_klstnrx, klstnry, klstnrz_  listener location, as above.

_kheadrot_ - optional, angular value for head rotation.

_asrc_ - Input/source signal.

### Output

_irt60low_ - suggested low frequency reverb time for later binaural reverb.

_irt60high_ - as above, for high frequency.

_imfp_ - mean free path of room, to be used with later reverb.

## Examples

Here is an example of the hrtfearly and hrtfreverb opcodes. It uses the file [hrtfearly.csd](../examples/hrtfearly.csd).

``` csound-csd title="Example of the htrfearly opcode." linenums="1"
--8<-- "examples/hrtfearly.csd"
```

## See also

[Panning and Spatialization: Binaural spatialization](../sigmod/panspatl.md)

## Credits

Author: Brian Carty<br>
Maynooth<br>
2011<br>
