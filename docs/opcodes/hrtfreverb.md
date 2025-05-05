<!--
id:hrtfreverb
category:Signal Modifiers:Panning and Spatialization
-->
# hrtfreverb
A binaural, dynamic FDN based diffuse-field reverberator. The opcode works independently as an efficient, flexible reverberator.

A frequency-dependent, efficient reverberant field is created based on low and high frequency desired reverb times. The opcode is designed to work with [hrtfearly](../opcodes/hrtfearly.md), ideally using its outputs as inputs. However, _hrtfreverb_ can be used as a standalone tool. Stability is enforced.

It is, however, designed for use with [hrtfearly](../opcodes/hrtfearly.md) to provide spatially accurate reverberation with user definable source trajectories. Accurate interaural coherence is also provided.

## Syntax
=== "Modern"
    ``` csound-orc
    aleft, aright, idel = hrtfreverb(asrc, ilowrt60, ihighrt60, ifilel, ifiler \
                                     [,isr, imfp, iorder])
    ```

=== "Classic"
    ``` csound-orc
    aleft, aright, idel hrtfreverb asrc, ilowrt60, ihighrt60, ifilel, ifiler \
                                   [,isr, imfp, iorder]
    ```

### Initialization

_ilowrt60_ - low frequency reverb time.

_ihighrt60_ - high frequency reverb time.

_ifilel_ - left HRTF spectral data file.

_ifiler_ - right HRTF spectral data file.

> :memo: **Note**
>
Spectral datafiles (based on the MIT HRTF database) are available in 3 different sampling rates: 44.1, 48 and 96 kHz and are labelled accordingly. Input and processing _sr_ should match datafile _sr_. Files should be in the current directory or the SADIR (see [Environment Variables](../invoke/environment-variables.md)).

> :memo: **Note**
>
> HRTF Data files for use with [hrtfmove](../opcodes/hrtfmove.md), [hrtfmove2](../opcodes/hrtfmove2.md), [hrtfstat](../opcodes/hrtfstat.md), _hrtfreverb_ were updated for Csound 5.15 and later (the code was updated and is more efficient). Old datafiles are now deprecated.

_isr_ - optional, default 44.1kHz, legal values: 44100, 48000 and 96000.

_imfp_ - optional, mean free path, defaults to that of a medium room. If used with [hrtfearly](../opcodes/hrtfearly.md), the mean free path of the room can be used to calculate the appropriate delay for the later reverb. Legal range: the mean free path of the smallest room allowed by hrtfearly (0.003876)  1.

_iorder_ - optional, order of early reflection processing. If used with [hrtfearly](../opcodes/hrtfearly.md), the order of early reflections can be used to calculate the appropriate delay on the later reverb.

### Performance

_asrc_ - Input/source signal.

### Output

_idel_ - if used with [hrtfearly](../opcodes/hrtfearly.md), the appropriate delay for the later reverb, based on the room and order of processing.

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
