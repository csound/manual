<!--
id:outkpat
category:Real-time MIDI:Output
-->
# outkpat
Sends polyphonic MIDI aftertouch messages at k-rate.

## Syntax
=== "Modern"
    ``` csound-orc
    outkpat(kchn, knotenum, kvalue, kmin, kmax)
    ```

=== "Classic"
    ``` csound-orc
    outkpat kchn, knotenum, kvalue, kmin, kmax
    ```

### Performance

_kchn_ -- MIDI channel number (1-16)

_knotenum_ -- MIDI note number (used in polyphonic aftertouch messages)

_kvalue_ -- floating point value

_kmin_ -- minimum floating point value (converted in MIDI integer value 0)

_kmax_ -- maximum floating point value (converted in MIDI integer value 127 (7 bit))

_outkpat_ (k-rate polyphonic aftertouch output) sends polyphonic aftertouch messages. It works only with MIDI instruments which recognize them. It can drive a different value of a parameter for each note currently active.

It can scale the k-value floating-point argument according to the _kmin_ and _kmax_ values. For example: set _kmin_ = 1.0 and _kmax_ = 2.0.
When the _kvalue_ argument receives a 2.0 value, the opcode will send a 127 value to the MIDI OUT device. When the _kvalue_ argument receives a 1.0 value, it will send a 0 value. k-rate opcodes send a message each time the MIDI converted value of argument _kvalue_ changes.

## See also

[MIDI Message Output](../midi/output.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>

New in Csound version 3.47

Thanks goes to Rasmus Ekman for pointing out the correct MIDI channel and controller number ranges.
