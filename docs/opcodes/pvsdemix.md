<!--
id:pvsdemix
category:Spectral Processing:Streaming
-->
# pvsdemix
Spectral azimuth-based de-mixing of stereo sources, with a reverse-panning result.

This opcode implements the Azimuth Discrimination and Resynthesis (ADRess) algorithm, developed by Dan Barry (Barry et Al. "Sound Source Separation Azimuth Discrimination and Resynthesis". DAFx'04, Univ. of Napoli). The source separation, or de-mixing, is controlled by two parameters: an azimuth position (_kpos_) and a subspace width (_kwidth_). The first one is used to locate the spectral peaks of individual sources on a stereo mix, whereas the second widens the 'search space', including/exclufing the peaks around _kpos_. These two parameters can be used interactively to extract source sounds from a stereo mix. The algorithm is particularly successful with studio recordings where individual instruments occupy individual panning positions; it is, in fact, a reverse-panning algorithm.

> :warning: **Warning**
>
> It is unsafe to use the same f-variable for both input and output of pvs opcodes. Using the same one might lead to undefined behavior on some opcodes. Use a different one on the left and right sides of the opcode.
>

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = pvsdemix(fleft, fright, kpos, kwidth, ipoints)
    ```

=== "Classic"
    ``` csound-orc
    fsig pvsdemix fleft, fright, kpos, kwidth, ipoints
    ```

### Performance

_fsig_ -- output pv stream

_fleft_ -- left channel input pv stream.

_fright_ -- right channel pv stream.

_kpos_ -- the azimuth target centre position, which will be de-mixed, from left to right (-1 &lt;= _kpos_ &lt;= 1). This is the reverse pan-pot control.

_kwidth_ -- the azimuth subspace width, which will determine the number of points around _kpos_ which will be used in the de-mixing process. (1 &lt;= _kwidth_ &lt;= _ipoints_)

_ipoints_ -- total number of discrete points, which will divide each pan side of the stereo image. This ultimately affects the resolution of the process.

## Examples

The example below takes a stereo input and passes through a de-mixing process revealing a source located at ipos +/- iwidth points. These parameters can be controlled in realtime (e.g. using FLTK widgets or MIDI) for an interactive
search of sound sources.

> :memo: **Note**
>
> Regarding the azimuth _kpos_, there is a stray image at around azimuth 0, which in case of a source with good intensity may possibly be masked.

``` csound-orc
ifftsize = 1024  
iwtype   = 1     /* cleaner with hanning window      */
ipos     = -0.8  /* to the left of the stereo image  */
iwidth   = 20    /* use peaks of 20 points around it */

al,ar  soundin   "sinput.wav"

flc    pvsanal   al, ifftsize, ifftsize/4, ifftsize, iwtype
frc    pvsanal   ar, ifftsize, ifftsize/4, ifftsize, iwtype
fdm    pvsdemix  flc, frc, kpos, kwidth, 100
adm    pvsynth   fdm
   
       outs      adm, adm
```

Here is a complete example of the pvsdemix opcode. It uses the file [pvsdemix.csd](../examples/pvsdemix.csd).

``` csound-csd title="Example of the pvsdemix opcode." linenums="1"
--8<-- "examples/pvsdemix.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
January 2005<br>

New plugin in version 5

January 2005.
