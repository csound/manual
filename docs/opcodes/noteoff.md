<!--
id:noteoff
category:Real-time MIDI:Note Output
-->
# noteoff
Send a noteoff message to the MIDI OUT port.

## Syntax
=== "Modern"
    ``` csound-orc
    noteoff(ichn, inum, ivel)
    ```

=== "Classic"
    ``` csound-orc
    noteoff ichn, inum, ivel
    ```

### Initialization

_ichn_ -- MIDI channel number (1-16)

_inum_ -- note number (0-127)

_ivel_ -- velocity (0-127)

### Performance

_noteon_ (i-rate note on) and _noteoff_ (i-rate note off) are the simplest MIDI OUT opcodes. _noteon_ sends a MIDI noteon message to MIDI OUT port, and _noteoff_ sends a noteoff message. A [noteon](../opcodes/noteon.md) opcode must always be followed by an _noteoff_ with the same channel and number inside the same instrument, otherwise the note will play endlessly.

These _noteon_ and _noteoff_ opcodes are useful only when introducing a [timout](../opcodes/timout.md) statement to play a non-zero duration MIDI note. For most purposes, it is better to use [noteondur](../opcodes/noteondur.md) and [noteondur2](../opcodes/noteondur2.md).

## See also

[Note-on/Note-off Output](../midi/onoff.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>

New in Csound version 3.47

Thanks goes to Rasmus Ekman for pointing out the correct MIDI channel and controller number ranges.
