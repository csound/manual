<!--
id:outic14
category:Real-time MIDI:Output
-->
# outic14
Sends 14-bit MIDI controller output at i-rate.

## Syntax
=== "Modern"
    ``` csound-orc
    outic14(ichn, imsb, ilsb, ivalue, imin, imax)
    ```

=== "Classic"
    ``` csound-orc
    outic14 ichn, imsb, ilsb, ivalue, imin, imax
    ```

### Initialization

_ichn_ -- MIDI channel number (1-16)

_imsb_ -- most significant byte controller number when using 14-bit parameters (0-127)

_ilsb_ -- least significant byte controller number when using 14-bit parameters (0-127)

_ivalue_ -- floating point value

_imin_ -- minimum floating point value (converted in MIDI integer value 0)

_imax_ -- maximum floating point value (converted in MIDI integer value 16383 (14-bit))

### Performance

_outic14_ (i-rate MIDI 14-bit controller output) sends a pair of controller messages. This opcode can drive 14-bit parameters on MIDI instruments that recognize them. The first control message contains the most significant byte of _ivalue_ argument while the second message contains the less significant byte. _imsb_ and _ilsb_ are the number of the most and less significant controller.

This opcode can drive a different value of a parameter for each note currently active.

It can scale an i-value floating-point argument according to the _imin_ and _imax_ values. For example, set _imin_ = 1.0 and _imax_ = 2.0. When the _ivalue_ argument receives a 2.0 value, the opcode will send a 127 value to the MIDI OUT device. When the _ivalue_ argument receives a 1.0 value, it will send a 0 value. i-rate opcodes send their message once during instrument initialization.

## See also

[MIDI Message Output](../midi/output.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>

New in Csound version 3.47

Thanks goes to Rasmus Ekman for pointing out the correct MIDI channel and controller number ranges.
