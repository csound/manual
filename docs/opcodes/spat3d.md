<!--
id:spat3d
category:Signal Modifiers:Panning and Spatialization
-->
# spat3d
Positions the input sound in a 3D space and allows moving the sound at k-rate.

This opcode positions the input sound in a 3D space, with optional simulation of room acoustics, in various output formats. _spat3d_ allows moving the sound at k-rate (this movement is interpolated internally to eliminate "zipper noise" if sr not equal to kr).

## Syntax
=== "Modern"
    ``` csound-orc
    aW, aX, aY, aZ = spat3d(ain, kX, kY, kZ, idist, ift, imode, imdel, iovr [, istor])
    ```

=== "Classic"
    ``` csound-orc
    aW, aX, aY, aZ spat3d ain, kX, kY, kZ, idist, ift, imode, imdel, iovr [, istor]
    ```

### Initialization

_idist_ -- For modes 0 to 3, _idist_ is the unit circle distance in meters. For mode 4, _idist_ is the distance between microphones.

The following formulas describe amplitude and delay as a function of sound source distance from microphone(s):

```
amplitude = 1 / (0.1 + distance)

delay = distance / 340 (in seconds)
```

Distance can be calculated as:

```
distance = sqrt(iX^2 + iY^2 + iZ^2)
```

In Mode 4, distance can be calculated as:

```
distance from left mic = sqrt((iX + idist/2)^2 + iY^2 + iZ^2)
distance from right mic = sqrt((iX - idist/2)^2 + iY^2 + iZ^2)
```

With _spat3d_ the distance between the sound source and any microphone should be at least (340 * 18) / sr meters. Shorter distances will work, but may produce artifacts in some cases.  There is no such limitation for _spat3di_ and _spat3dt_.

Sudden changes or discontinuities in sound source location can result in pops or clicks. Very fast movement may also degrade quality.

_ift_ -- Function table storing room parameters (for free field spatialization, set it to zero or negative). Table size is 54. The values in the table are:

| Room Parameter | Purpose |
|---|---|
| 0 | Early reflection recursion depth (0 is the sound source, 1 is the first reflection etc.) for spat3d and spat3di. The number of echoes for four walls (front, back, right, left) is: N = (2*R + 2) * R. If all six walls are enabled: N = (((4*R + 6)*R + 8)*R) / 3 |
| 1 | Late reflection recursion depth (used by spat3dt only). spat3dt skips early reflections and renders echoes up to this level. If early reflection depth is negative, spat3d and spat3di will output zero, while spat3dt will start rendering from the sound source. |
| 2 | imdel for spat3d. Overrides opcode parameter if non-negative. |
| 3 | irlen for spat3dt. Overrides opcode parameter if non-negative. |
| 4 | idist value. Overrides opcode parameter if >= 0. |
| 5 | Random seed (0 - 65535) -1 seeds from current time. |
| 6 - 53 | wall parameters (w = 6: ceil, w = 14: floor, w = 22: front, w = 30: back, w = 38: right, w = 46: left) |
| w + 0 | Enable reflections from this wall (0: no, 1: yes) |
| w + 1 | Wall distance from listener (in meters) |
| w + 2 | Randomization of wall distance (0 - 1) (in units of 1 / (wall distance)) |
| w + 3 | Reflection level (-1 - 1) |
| w + 4 | Parametric equalizer frequency in Hz. |
| w + 5 | Parametric equalizer level (1.0: no filtering) |
| w + 6 | Parametric equalizer Q (0.7071: no resonance) |
| w + 7 | Parametric equalizer mode (0: peak EQ, 1: low shelf, 2: high shelf) |

_imode_ -- Output mode

* 0: B format with W output only (mono)

``` csound-orc
aout    =  aW
```

* 1: B format with W and Y output (stereo)

``` csound-orc
aleft   =  aW + 0.7071*aY
aright  =  aW - 0.7071*aY
```

* 2: B format with W, X, and Y output (2D). This can be converted to UHJ:

``` csound-orc
aWre, aWim      hilbert aW
aXre, aXim      hilbert aX
aYre, aYim      hilbert aY
aWXr    =  0.0928*aXre + 0.4699*aWre
aWXiYr  =  0.2550*aXim - 0.1710*aWim + 0.3277*aYre
aleft   =  aWXr + aWXiYr
aright  =  aWXr - aWXiYr
```

* 3: B format with all outputs (3D)
* 4: Simulates a pair of microphones (stereo output)

``` csound-orc
aW      butterlp aW, ifreq      ; recommended values for ifreq
aY      butterlp aY, ifreq      ; are around 1000 Hz
aleft   =  aW + aX
aright  =  aY + aZ
```

Mode 0 is the cheapest to calculate, while mode 4 is the most expensive.

In Mode 4, The optional lowpass filters can change the frequency response depending on direction. For example, if the sound source is located left to the listener then the high frequencies are attenuated in the right channel and slightly increased in the left. This effect can be disabled by not using filters. You can also experiment with other filters (tone etc.) for better effect.

Note that mode 4 is most useful for listening with headphones, and is also more expensive to calculate than the B-format (0 to 3) modes. The _idist_ parameter in this case sets the distance between left and right microphone; for headphones, values between 0.2 - 0.25 are recommended, although higher settings up to 0.4 may be used for wide stereo effects.

More information about B format can be found here: [http://www.york.ac.uk/inst/mustech/3d_audio/ambis2.htm](http://www.york.ac.uk/inst/mustech/3d_audio/ambis2.htm)

_imdel_ -- Maximum delay time for spat3d in seconds. This has to be longer than the delay time of the latest reflection (depends on room dimensions, sound source distance, and recursion depth; using this formula gives a safe (although somewhat overestimated) value:

```
imdel = (R + 1) * sqrt(W*W + H*H + D*D) / 340.0
```

where R is the recursion depth, W, H, and D are the width, height, and depth of the room, respectively).

_iovr_ -- Oversample ratio for spat3d (1 to 8). Setting it higher improves quality at the expense of memory and CPU usage. The recommended value is 2.

_istor_ (optional, default=0) -- Skip initialization if non-zero (default: 0).

### Performance

_aW, aX, aY, aZ_ -- Output signals

|    | mode 0 | mode 1 | mode 2 | mode 3 | mode 4 |
|----|--------|--------|--------|--------|--------|
| aW | W out  | W out  | W out  | W out  | left chn / low freq.   |
| aX | 0      | 0      | X out  | X out  | left chn / high freq.  |
| aY | 0      | Y out  | Y out  | Y out  | right chn / low freq.  |
| aZ | 0      | 0      | 0      | Z out  | right chn / high freq. |

_ain_ -- Input signal

_kX, kY, kZ_ -- Sound source coordinates (in meters)

If you encounter very slow performance (up to 100 times slower), it may be caused by denormals (this is also true of many other IIR opcodes, including [butterlp](../opcodes/butterlp.md), [pareq](../opcodes/pareq.md), [hilbert](../opcodes/hilbert.md), and many others). Underflows can be avoided by:

* Using the [denorm](../opcodes/denorm.md) opcode on _ain_ before _spat3d_.
* mixing low level DC or noise to the input signal, e.g.

``` csound-orc
atmp rnd31 1/1e24, 0, 0

aW, aX, aY, aZ spa3di ain + atmp, ...
```
or
``` csound-orc
aW, aX, aY, aZ spa3di ain + 1/1e24, ...
```

* reducing _irlen_ in the case of _spat3dt_ (which does not have an input signal). A value of about 0.005 is suitable for most uses, although it also depends on EQ settings. If the equalizer is not used, &#8220;irlen&#8221; can be set to 0.

## Examples

Here is an example of the spat3d opcode that outputs a stereo file. It uses the file [spat3d_stereo.csd](../examples/spat3d_stereo.csd).

``` csound-csd title="Stereo example of the spat3d opcode." linenums="1"
--8<-- "examples/spat3d_stereo.csd"
```

Here is an example of the spat3d opcode that outputs a UHJ file. It uses the file [spat3d_UHJ.csd](../examples/spat3d_UHJ.csd).

``` csound-csd title="UHJ example of the spat3d opcode." linenums="1"
--8<-- "examples/spat3d_UHJ.csd"
```

Here is an example of the spat3d opcode that outputs a quadrophonic file. It uses the file [spat3d_quad.csd](../examples/spat3d_quad.csd).

``` csound-csd title="Quadrophonic example of the spat3d opcode." linenums="1"
--8<-- "examples/spat3d_quad.csd"
```

## See also

[Panning and Spatialization: Simulation of room acoustics](../sigmod/panspatl.md)

## Credits

Author: Istvan Varga<br>
2001<br>

New in version 4.12

Updated April 2002 by Istvan Varga
