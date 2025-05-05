<!--
id:outkc14
category:Real-time MIDI:Output
-->
# outkc14
Sends 14-bit MIDI controller output at k-rate.

## Syntax
=== "Modern"
    ``` csound-orc
    outkc14(kchn, kmsb, klsb, kvalue, kmin, kmax)
    ```

=== "Classic"
    ``` csound-orc
    outkc14 kchn, kmsb, klsb, kvalue, kmin, kmax
    ```

### Performance

_kchn_ -- MIDI channel number (1-16)

_kmsb_ -- most significant byte controller number when using 14-bit parameters (0-127)

_klsb_ -- least significant byte controller number when using 14-bit parameters (0-127)

_kvalue_ -- floating point value

_kmin_ -- minimum floating point value (converted in MIDI integer value 0)

_kmax_ -- maximum floating point value (converted in MIDI integer value 16383 (14-bit))

_outkc14_ (k-rate MIDI 14-bit controller output) sends a pair of controller messages. It works only with MIDI instruments which recognize them. These opcodes can drive 14-bit parameters on MIDI instruments that recognize them. The first control message contains the most significant byte of _kvalue_ argument while the second message contains the less significant byte. _kmsb_ and _klsb_ are the number of the most and less significant controller.

It can drive a different value of a parameter for each note currently active.

It can scale the k-value floating-point argument according to the _kmin_ and _kmax_ values. For example: set _kmin_ = 1.0 and _kmax_ = 2.0.
When the _kvalue_ argument receives a 2.0 value, the opcode will send a 127 value to the MIDI OUT device. When the _kvalue_ argument receives a 1.0 value, it will send a 0 value. k-rate opcodes send a message each time the MIDI converted value of argument _kvalue_ changes.

## See also

[MIDI Message Output](../midi/output.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>

New in Csound version 3.47

Thanks goes to Rasmus Ekman for pointing out the correct MIDI channel and controller number ranges.
