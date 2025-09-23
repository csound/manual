<!--
id:spat3dt
category:Signal Modifiers:Panning and Spatialization
-->
# spat3dt
Can be used to render an impulse response for a 3D space at i-time.

This opcode positions the input sound in a 3D space, with optional simulation of room acoustics, in various output formats. _spat3dt_ can be used to render the impulse response at i-time, storing output in a function table, suitable for convolution.

## Syntax
=== "Modern"
    ``` csound-orc
    spat3dt(ioutft, iX, iY, iZ, idist, ift, imode, irlen [, iftnocl])
    ```

=== "Classic"
    ``` csound-orc
    spat3dt ioutft, iX, iY, iZ, idist, ift, imode, irlen [, iftnocl]
    ```

### Initialization

_ioutft_ -- Output ftable number for spat3dt. W, X, Y, and Z outputs are written interleaved to this table. If the table is too short, output will be truncated.

_iX_ -- Sound source X coordinate in meters (positive: right, negative: left)

_iY_ -- Sound source Y coordinate in meters (positive: front, negative: back)

_iZ_ -- Sound source Z coordinate in meters (positive: up, negative: down)

_idist_ -- For modes 0 to 3, _idist_ is the unit circle distance in meters. For mode 4, _idist_ is the distance between microphones.

The following formulas describe amplitude and delay as a function of sound source distance from microphone(s):

``` csound-orc
amplitude = 1 / (0.1 + distance)

delay = distance / 340 (in seconds)
```

Distance can be calculated as:

``` csound-orc
distance = sqrt(iX^2 + iY^2 + iZ^2)
```

In Mode 4, distance can be calculated as:

``` csound-orc
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

_irlen_ -- Impulse response length of echoes (in seconds). Depending on filter parameters, values around 0.005-0.01 are suitable for most uses (higher values result in more accurate output, but slower rendering)

_iftnocl_ (optional, default=0) -- Do not clear output ftable (mix to existing data) if set to 1, clear table before writing if set to 0 (default: 0).

## Examples

Here is an example of the spat3dt opcode. It uses the file [spat3dt.csd](../examples/spat3dt.csd).

``` csound-csd title="Example of the spat3dt opcode." linenums="1"
--8<-- "examples/spat3dt.csd"
```

## See also

[Panning and Spatialization: Simulation of room acoustics](../sigmod/panspatl.md)

## Credits

Author: Istvan Varga<br>
2001<br>

New in version 4.12

Updated April 2002 by Istvan Varga
