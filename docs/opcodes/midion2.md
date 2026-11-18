<!--
id:midion2
category:Real-time MIDI:Note Output
-->
# midion2
Sends noteon and noteoff messages to the MIDI OUT port when triggered by a value different than zero.

## Syntax
=== "Modern"
    ``` csound-orc
    midion2(kchn, knum, kvel, ktrig[, iport])
    ```

=== "Classic"
    ``` csound-orc
    midion2 kchn, knum, kvel, ktrig[, iport]
    ```

### Initialisation

_iport_ -- MIDI output port, optional set to 0.

### Performance

_kchn_ -- MIDI channel (1-16)

_knum_ -- MIDI note number (0-127)

_kvel_ -- note velocity (0-127)

_ktrig_ -- trigger input signal (normally 0)

Similar to [midion](../opcodes/midion.md), this opcode sends noteon and noteoff messages to the MIDI out port, but only when _ktrig_ is non-zero. This opcode is can work together with the output of the [trigger](../opcodes/trigger.md) opcode.

_midion2_ turns off only notes it sent. Each trigger turns off the last note before sending the new one, and the release turns it off, on the port the note went to. A note still sounding at a [tie](../scoregens/i.md) or a [reinit](../opcodes/reinit.md) pass is turned off by the next trigger or the release, and when the instrument ends without a release, for instance through [turnoff2](../opcodes/turnoff2.md) with _krelease_ 0, or the performance stops, it is turned off then. A channel above 16 is sent on channel 16.

Csound 7.0.0 and earlier sent a noteoff for channel 1, note 0 before the first note, sent a channel above 16 on channel 1, and left a note sounding when its instrument ended without a release.

## Examples

Here is an example of the midion2 opcode. It uses the file [midion2.csd](../examples/midion2.csd).

``` csound-csd title="Example of the midion2 opcode." linenums="1"
--8<-- "examples/midion2.csd"
```

## See also

[Note-on/Note-off Output](../midi/onoff.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>
1998<br>

New in Csound version 3.492

Thanks goes to Rasmus Ekman for pointing out the correct MIDI channel and controller number ranges.
