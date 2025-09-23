<!--
id:hrtfmove2
category:Signal Modifiers:Panning and Spatialization
-->
# hrtfmove2
Generates dynamic 3d binaural audio for headphones using a Woodworth based spherical head model with improved low frequency phase accuracy.

This opcode takes a source signal and spatialises it in the 3 dimensional space around a listener using head related transfer function (HRTF) based filters.

## Syntax
=== "Modern"
    ``` csound-orc
    aleft, aright = hrtfmove2(asrc, kAz, kElev, ifilel, ifiler [,ioverlap, iradius, isr])
    ```

=== "Classic"
    ``` csound-orc
    aleft, aright hrtfmove2 asrc, kAz, kElev, ifilel, ifiler [,ioverlap, iradius, isr]
    ```

### Initialization

_ifilel_ -- left HRTF spectral data file

_ifiler_ -- right HRTF spectral data file

> :memo: **Note**
>
> Spectral datafiles (based on the MIT HRTF database) are available in 3 different sampling rates: 44.1, 48 and 96 khz and are labelled accordingly. Input and processing _sr_ should match datafile _sr_. Files should be in the current directory or the SADIR (see [Environment Variables](../invoke/environment-variables.md)).

> :memo: **Note**
>
> HRTF Data files for use with [hrtfmove](../opcodes/hrtfmove.md), _hrtfmove2_, [hrtfstat](../opcodes/hrtfstat.md), [hrtfearly](../opcodes/hrtfearly.md), [hrtfreverb](../opcodes/hrtfreverb.md) were updated for Csound 5.15 and later (the code was updated and is more efficient). Old datafiles are now deprecated.

_ioverlap_ -- optional, number of overlaps for STFT processing (default 4). See STFT section of manual.

_iradius_ --  optional, head radius used for phase spectra calculation in centimeters (default 9.0)

_isr_ - optional, default 44.1kHz, legal values: 44100, 48000 and 96000.

### Performance

_asrc_ -- Input/source signal.

_kAz_ -- azimuth value in degrees. Positive values represent position on the right, negative values are positions on the left.

_kElev_ -- elevation value in degrees. Positive values represent position above horizontal, negative values are positions below horizontal (min -40).

Artifact-free user-defined trajectories are made possible using an interpolation algorithm based on spectral magnitude interpolation and a derived phase spectrum based on the Woodworth spherical head model. Accuracy is increased for the data set provided by extracting and applying a frequency dependent scaling factor to the phase spectra, leading to a more precise low frequency interaural time difference. Users can control head radius for the phase derivation, allowing a crude level of individualisation. The dynamic source version of the opcode uses a Short Time Fourier Transform algorithm to avoid artefacts caused by derived phase spectra changes. STFT processing means this opcode is more computationally intensive than [hrtfmove](../opcodes/hrtfmove.md) using phase truncation, but phase is constantly updated by _hrtfmove2_.

## Examples

Here is an example of the hrtfmove2 opcode. It uses the file [hrtfmove2.csd](../examples/hrtfmove2.csd).

``` csound-csd title="Example of the htrfmove2 opcode." linenums="1"
--8<-- "examples/hrtfmove2.csd"
```

## See also

[Panning and Spatialization: Binaural spatialization](../sigmod/panspatl.md)

More information on this opcode: [http://www.csoundjournal.com/issue9/newHRTFOpcodes.html](http://www.csoundjournal.com/issue9/newHRTFOpcodes.html), written by Brian Carty

## Credits

Author: Brian Carty<br>
Maynooth<br>
2008<br>
