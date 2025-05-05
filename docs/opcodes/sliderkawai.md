<!--
id:sliderKawai
category:Real-time MIDI:Slider Banks
-->
# sliderKawai
Creates a bank of 16 different MIDI control message numbers from a KAWAI MM-16 midi mixer.

## Syntax
=== "Modern"
    ``` csound-orc
    k1, k2, ...., k16 = sliderKawai(imin1, imax1, init1, ifn1, imin2, imax2, \
                                    init2, ifn2, ..., imin16, imax16, init16, ifn16)
    ```

=== "Classic"
    ``` csound-orc
    k1, k2, ...., k16 sliderKawai imin1, imax1, init1, ifn1, imin2, imax2, \
                                  init2, ifn2, ..., imin16, imax16, init16, ifn16
    ```

### Initialization

_imin1 ... imin16_ -- minimum values for each controller

_imax1 ... imax16_ -- maximum values for each controller

_init1 ... init16_ -- initial value for each controller

_ifn1 ... ifn16_ -- function table for conversion for each controller

### Performance

_k1 ... k16_ -- output values

The opcode _sliderKawai_ is equivalent to [slider16](../opcodes/slider16.md), but it has the controller and channel numbers (_ichan_ and _ictlnum_) hard-coded to make for quick compatiblity with the KAWAI MM-16 midi mixer. This device doesn't allow changing the midi message associated to each slider. It can only output on control 7 for each fader on a separate midi channel. This opcode is a quick way of assigning the mixer's 16 faders to k-rate variables in csound.

## See Also

[Slider Banks](../midi/sliderbk.md)

## Credits

Author: Gabriel Maldonado<br>

New in Csound version 5.06
