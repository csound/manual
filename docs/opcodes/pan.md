<!--
id:pan
category:Signal Modifiers:Panning and Spatialization
-->
# pan
Distribute an audio signal amongst four channels with localization control.

## Syntax
=== "Modern"
    ``` csound-orc
    a1, a2, a3, a4 = pan(asig, kx, ky, ifn [, imode] [, ioffset])
    ```

=== "Classic"
    ``` csound-orc
    a1, a2, a3, a4 pan asig, kx, ky, ifn [, imode] [, ioffset]
    ```

### Initialization

_ifn_ -- function table number of a stored pattern describing the amplitude growth in a speaker channel as sound moves towards it from an adjacent speaker. Requires extended guard-point.

_imode_ (optional) -- mode of the _kx, ky_ position values. 0 signifies raw index mode, 1 means the inputs are normalized (0 - 1). The default value is 0.

_ioffset_ (optional) -- offset indicator for _kx, ky_. 0 infers the origin to be at channel 3 (left rear); 1 requests an axis shift to the quadraphonic center. The default value is 0.

### Performance

_pan_ takes an input signal _asig_ and distributes it amongst four outputs (essentially quad speakers) according to the controls _kx_ and _ky_. For normalized input (mode=1) and no offset, the four output locations are in order: left-front at (0,1), right-front at (1,1), left-rear at the origin (0,0), and right-rear at (1,0). In the notation (_kx_, _ky)_, the coordinates _kx_ and _ky_, each ranging 0 - 1, thus control the 'rightness' and 'forwardness' of a sound location.

Movement between speakers is by amplitude variation, controlled by the stored function table _ifn_. As _kx_ goes from 0 to 1, the strength of the right-hand signals will grow from the left-most table value to the right-most, while that of the left-hand signals will progress from the right-most table value to the left-most. For a simple linear pan, the table might contain the linear function 0 - 1. A more correct pan that maintains constant power would be obtained by storing the first quadrant of a sinusoid. Since _pan_ will scale and truncate _kx_ and _ky_ in simple table lookup, a medium-large table (say 8193) should be used.

_kx, ky_ values are not restricted to 0 - 1. A circular motion passing through all four speakers (inscribed) would have a diameter of root 2, and might be defined by a circle of radius R = root 1/2 with center at (.5,.5). _kx, ky_ would then come from Rcos(angle), Rsin(angle), with an implicit origin at (.5,.5) (i.e. _ioffset_ = 1). Unscaled raw values operate similarly. Sounds can thus be located anywhere in the polar or Cartesian plane; points lying outside the speaker square are projected correctly onto the square's perimeter as for a listener at the center.

## Examples

Here is an example of the pan opcodes. It uses the file [pan.csd](../examples/pan.csd).

``` csound-csd title="Example of the pan opcodes." linenums="1"
--8<-- "examples/pan.csd"
```

## See also

[Panning and Spatialization: Amplitude spatialization](../sigmod/panspatl.md)
