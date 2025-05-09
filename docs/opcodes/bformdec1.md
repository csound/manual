<!--
id:bformdec1
category:Signal Modifiers:Panning and Spatialization
-->
# bformdec1
Decodes an ambisonic B format signal into loudspeaker specific signals.

## Syntax
=== "Modern"
    ``` csound-orc
    ao1, ao2 = bformdec1(isetup, aw, ax, ay, az [, ar, as, at, au, av \
          [, abk, al, am, an, ao, ap, aq]])
    ao1, ao2, ao3, ao4 = bformdec1(isetup, aw, ax, ay, az [, ar, as, at, au, av \
          [, abk, al, am, an, ao, ap, aq]])
    ao1, ao2, ao3, ao4, ao5 = bformdec1(isetup, aw, ax, ay, az [, ar, as, at, au, av \
          [, abk, al, am, an, ao, ap, aq]])
    ao1, ao2, ao3, ao4, ao5, ao6, ao7, ao8 = bformdec1(isetup, aw, ax, ay, az \
          [, ar, as, at, au, av [, abk, al, am, an, ao, ap, aq]])
    aout[] = bformdec1(isetup, abform[])
    ```

=== "Classic"
    ``` csound-orc
    ao1, ao2 bformdec1 isetup, aw, ax, ay, az [, ar, as, at, au, av \
        [, abk, al, am, an, ao, ap, aq]]
    ao1, ao2, ao3, ao4 bformdec1 isetup, aw, ax, ay, az [, ar, as, at, au, av \
        [, abk, al, am, an, ao, ap, aq]]
    ao1, ao2, ao3, ao4, ao5 bformdec1 isetup, aw, ax, ay, az [, ar, as, at, au, av \
        [, abk, al, am, an, ao, ap, aq]]
    ao1, ao2, ao3, ao4, ao5, ao6, ao7, ao8 bformdec1 isetup, aw, ax, ay, az \
        [, ar, as, at, au, av [, abk, al, am, an, ao, ap, aq]]
    aout[] bformdec1 isetup, abform[]
    ```

### Initialization

Note that horizontal angles are measured anticlockwise in this description.

_isetup_ –- loudspeaker setup. There are five supported setups:

* 1:  Stereo - L(90), R(-90); this is an M+S style stereo decode.
* 2:	Quad - FL(45), BL(135), BR(-135), FR(-45). This is a first-order `in-phase' decode.
* 3:	5.0 - L(30),R(-30),C(0),BL(110),BR(-110). Note that many people do not actually use the angles above for their speaker arrays and a good decode for DVD etc can be achieved using the Quad configuration to feed L, R, BL and BR (leaving C silent).
* 4:	Octagon - FFL(22.5), FLL(67.5), BLL(112.5), BBL(157.5), BBR(-157.5), BRR(-112.5), FRR(-67.5), FFR(-22.5). This is a first-, second- or third-order `in-phase' decode, depending on the number of input channels.
* 5:	Cube - FLD(45,-35.26), FLU(45,35.26), BLD(135,-35.26), BLU(135,35.26), BRD(-135,-35.26), BRU(-135,35.26), FRD(-45,-35.26), FRU(-45,35.26). This is a first-order `in-phase' decode.

### Performance

_aw, ax, ay_, ... -- input signal in the B format.

_ao1 .. ao8_ -- loudspeaker specific output signals.

## Examples

=== "Modern"
    Here is an example of the bformenc1 opcode. It uses the file [bformenc1-modern.csd](../examples/bformenc1-modern.csd).
    ``` csound-csd title="Example of the bformenc1 opcode." linenums="1"
    --8<-- "examples/bformenc1-modern.csd"
    ```

=== "Classic"
    Here is an example of the bformenc1 opcode. It uses the file [bformenc1.csd](../examples/bformenc1.csd).
    ``` csound-csd title="Example of the bformenc1 opcode." linenums="1"
    --8<-- "examples/bformenc1.csd"
    ```

## See also

[Panning and Spatialization: Ambisonics](../sigmod/panspatl.md)

## Credits

Author: Richard Furse, Bruce Wiggins and Fons
Adriaensen, following code by Samuel Groner<br>
2008<br>

New in version 5.09
