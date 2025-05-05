<!--
id:hrtfmove
category:Signal Modifiers:Panning and Spatialization
-->
# hrtfmove
Generates dynamic 3d binaural audio for headphones using magnitude interpolation and phase truncation.

This opcode takes a source signal and spatialises it in the 3 dimensional space around a listener by convolving the source with stored head related transfer function (HRTF) based filters.

## Syntax
=== "Modern"
    ``` csound-orc
    aleft, aright = hrtfmove(asrc, kAz, kElev, ifilel, ifiler [, imode, ifade, isr])
    ```

=== "Classic"
    ``` csound-orc
    aleft, aright hrtfmove asrc, kAz, kElev, ifilel, ifiler [, imode, ifade, isr]
    ```

### Initialization

_ifilel_ -- left HRTF spectral data file

_ifiler_ -- right HRTF spectral data file

> :memo: **Note**
>
> Spectral datafiles (based on the MIT HRTF database) are available in 3 different sampling rates: 44.1, 48 and 96 khz and are labelled accordingly. Input and processing _sr_ should match datafile _sr_. Files should be in the current directory or the SADIR (see [Environment Variables](../invoke/environment-variables.md)).

> :memo: **Note**
>
> HRTF Data files for use with _hrtfmove_, [hrtfmove2](../opcodes/hrtfmove2.md), [hrtfstat](../opcodes/hrtfstat.md), [hrtfearly](../opcodes/hrtfearly.md), [hrtfreverb](../opcodes/hrtfreverb.md) were updated for Csound 5.15 and later (the code was updated and is more efficient). Old datafiles are now deprecated.

_imode_ -- optional, default 0 for phase truncation, 1 for minimum phase

_ifade_ -- optional, number of processing buffers for phase change crossfade (default 8). Legal range is 1-24. A low value is recommended for complex sources (4 or less: a higher value may make the crossfade audible), a higher value (8 or more: a lower value may make the inconsistency when the filter changes phase values audible) for narrowband sources. Does not effect minimum phase processing.

> :memo: **Note**
>
> Ocassionally fades may overlap (when unnaturally fast/complex trajectories are requested). In this case, a warning will be printed. Use a smaller crossfade or slightly change trajectory to avoid any possible inconsistencies that may arise.

_isr_ - optional, default 44.1kHz, legal values: 44100, 48000 and 96000.

### Performance

_kAz_ -- azimuth value in degrees. Positive values represent position on the right, negative values are positions on the left.

_kElev_ -- elevation value in degrees. Positive values represent position above horizontal, negative values are positions below horizontal (min -40).

Artifact-free user-defined trajectories are made possible using an interpolation algorithm based on spectral magnitude interpolation and phase truncation. Crossfades are implemented to minimise/eliminate any inconsistencies caused by updating phase values. These crossfades are performed over a user definable number of convolution processing buffers. Complex sources may only need to crossfade over 1 buffer; narrow band sources may need several. The opcode also offers minimum phase based processing, a more traditional and complex method. In this mode, the hrtf filters used are reduced to minimum phase representations and the interpolation process then uses the relationship between minimum phase magnitude and phase spectra. Interaural time difference, which is inherent to the phase truncation process, is reintroduced in the minimum phase process using variable delay lines.

## Examples

Here is an example of the hrtfmove opcode. It uses the file [hrtfmove.csd](../examples/hrtfmove.csd).

``` csound-csd title="Example of the htrfmove opcode." linenums="1"
--8<-- "examples/hrtfmove.csd"
```

## See also

[Panning and Spatialization: Binaural spatialization](../sigmod/panspatl.md)

More information on this opcode: [http://www.csoundjournal.com/issue9/newHRTFOpcodes.html](http://www.csoundjournal.com/issue9/newHRTFOpcodes.html), written by Brian Carty

## Credits

Author: Brian Carty<br>
Maynooth<br>
2008<br>
