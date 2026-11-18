<!--
id:midion
category:Real-time MIDI:Note Output
-->
# midion
Generates MIDI note messages at k-rate.

## Syntax
=== "Modern"
    ``` csound-orc
    midion(kchn, knum, kvel [, iport])
    ```

=== "Classic"
    ``` csound-orc
    midion kchn, knum, kvel [, iport]
    ```

### Initialization

_iport_ -- MIDI output port, optional set to 0.

### Performance

_kchn_ -- MIDI channel number (1-16)

_knum_ -- note number (0-127)

_kvel_ -- velocity (0-127)

_midion_ (k-rate note on) plays MIDI notes with current _kchn_, _knum_ and _kvel_. These arguments can be varied at k-rate. Each time the MIDI converted value of any of these arguments changes, last MIDI note played by current instance of _midion_ is immediately turned off and a new note with the new argument values is activated. This opcode, as well as _moscil_, can generate very complex melodic textures if controlled by complex k-rate signals.

A change of port, when _iport_ is a global variable another instrument sets, moves the note the same way: it is turned off on the old port and sent on the new one. A noteoff always goes to the port of its noteon.

When a note is [tied](../scoregens/i.md) onto a held note, _midion_ keeps sounding a note whose channel, number, velocity and port stay the same, and turns it off before sending a different one. A [reinit](../opcodes/reinit.md) pass turns the note off and sends it again. When the instrument ends without a release, for instance through [turnoff2](../opcodes/turnoff2.md) with _krelease_ 0, or the performance stops, the note still sounding is turned off.

In Csound 7.0.0, _midion_ crashed at its first control cycle. Earlier versions sent the new note at a tie or a reinit without turning off the one still sounding, and left a note sounding when its instrument ended without a release.

Any number of _midion_ opcodes can appear in the same Csound instrument, allowing a counterpoint-style polyphony within a single instrument.

## Examples

Here is a simple example of the midion opcode. It uses the file [midion_simple.csd](../examples/midion_simple.csd).

This example generates a minor chord over every note received on the MIDI input. It generates MIDI notes on csound's MIDI output, so be sure to connect something.

``` csound-csd title="Simple Example of the midion opcode." linenums="1"
--8<-- "examples/midion_simple.csd"
```

Here is another example of the midion opcode. It uses the file [midion_scale.csd](../examples/midion_scale.csd).

This example generates random notes from a given scale for every note received on the MIDI input. It generates MIDI notes on csound's MIDI output, so be sure to connect something.

``` csound-csd title="Example of the midion opcode to generate random notes from a scale." linenums="1"
--8<-- "examples/midion_scale.csd"
```

## See also

[Note-on/Note-off Output](../midi/onoff.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>
May 1997<br>

Thanks goes to Rasmus Ekman for pointing out the correct MIDI channel and controller number ranges.
