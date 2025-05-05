<!--
id:hrtfstat
category:Signal Modifiers:Panning and Spatialization
-->
# hrtfstat
Generates static 3d binaural audio for headphones using a Woodworth based spherical head model with improved low frequency phase accuracy.

This opcode takes a source signal and spatialises it in the 3 dimensional space around a listener using head related transfer function (HRTF) based filters. It produces a static output (azimuth and elevation parameters are i-rate), because a static source allows much more efficient processing than [hrtfmove](../opcodes/hrtfmove.md) and [hrtfmove2](../opcodes/hrtfmove2.md),.

## Syntax
=== "Modern"
    ``` csound-orc
    aleft, aright = hrtfstat(asrc, iAz, iElev, ifilel, ifiler [,iradius, isr])
    ```

=== "Classic"
    ``` csound-orc
    aleft, aright hrtfstat asrc, iAz, iElev, ifilel, ifiler [,iradius, isr]
    ```

### Initialization

_iAz_ -- azimuth value in degrees. Positive values represent position on the right, negative values are positions on the left.

_iElev_ -- elevation value in degrees. Positive values represent position above horizontal, negative values are positions below horizontal (min -40).

_ifilel _ -- left HRTF spectral data file

_ifiler _ -- right HRTF spectral data file

> :memo: **Note**
>
> Spectral datafiles (based on the MIT HRTF database) are available in 3 different sampling rates: 44.1, 48 and 96 khz and are labelled accordingly. Input and processing sr should match datafile sr. Files should be in the current directory or the SADIR (see [Environment Variables](../invoke/environment-variables.md)).
>

> :memo: **Note**
>
> HRTF Data files for use with [hrtfmove](../opcodes/hrtfmove.md), [hrtfmove2](../opcodes/hrtfmove2.md), _hrtfstat_, [hrtfearly](../opcodes/hrtfearly.md), [hrtfreverb](../opcodes/hrtfreverb.md) were updated for Csound 5.15 and later (the code was updated and is more efficient). Old datafiles are now deprecated.

_iradius_ --  optional, head radius used for phase spectra calculation in centimeters (default 9.0)

_isr_ - optional (default 44.1kHz). Legal values are 44100, 48000 and 96000.

### Performance

Artifact-free user-defined static spatialisation is made possible using an interpolation algorithm based on spectral magnitude interpolation and a derived phase based on the Woodworth spherical head model. Accuracy is increased for the data set provided by extracting and applying a frequency dependent scaling factor to the phase spectra, leading to a more precise low frequency interaural time difference. Users can control head radius for the phase derivation, allowing a crude level of individualisation. The static source version of the opcode uses overlap add convolution (it does not need STFT processing, see [hrtfmove2](../opcodes/hrtfmove2.md)), and is thus considerably more efficient than [hrtfmove2](../opcodes/hrtfmove2.md) or [hrtfmove](../opcodes/hrtfmove.md), but cannot generate moving sources.

## Examples

Here is an example of the hrtfstat opcode. It uses the file [hrtfstat.csd](../examples/hrtfstat.csd).

``` csound-csd title="Example of the hrtfstat opcode." linenums="1"
--8<-- "examples/hrtfstat.csd"
```

Here is another example of the hrtfstat opcode. It uses the file [htrfstat-2.csd](../examples/hrtfstat-2.csd), and [Church.wav](../examples/Church.wav), which is a looped sample.

``` csound-csd title="Example two of the hrtfstat opcode" linenums="1"
--8<-- "examples/hrtfstat-2.csd"
```

## See also

[Panning and Spatialization: Binaural spatialization](../sigmod/panspatl.md)

More information on this opcode: [http://www.csoundjournal.com/issue9/newHRTFOpcodes.html](http://www.csoundjournal.com/issue9/newHRTFOpcodes.html), written by Brian Carty

## Credits

Author: Brian Carty<br>
Maynooth<br>
2008<br>
