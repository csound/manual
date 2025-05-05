<!--
id:moscil
category:Real-time MIDI:Note Output
-->
# moscil
Sends a stream of the MIDI notes.

## Syntax
=== "Modern"
    ``` csound-orc
    moscil(kchn, knum, kvel, kdur, kpause)
    ```

=== "Classic"
    ``` csound-orc
    moscil kchn, knum, kvel, kdur, kpause
    ```

### Performance

_kchn_ -- MIDI channel number (1-16)

_knum_ -- note number (0-127)

_kvel_ -- velocity (0-127)

_kdur_ -- note duration in seconds

_kpause_ -- pause duration after each noteoff and before new note in seconds

_moscil_ and [midion](../opcodes/midion.md) are the most powerful MIDI OUT opcodes. _moscil_ (MIDI oscil) plays a stream of notes of _kdur_ duration. Channel, pitch, velocity, duration and pause can be controlled at k-rate, allowing very complex algorithmically generated melodic lines. When current instrument is deactivated, the note played by current instance of _moscil_ is forcedly truncated.

Any number of _moscil_ opcodes can appear in the same Csound instrument, allowing a counterpoint-style polyphony within a single instrument.

## Examples

Here is an example of the moscil opcode. It uses the file [moscil.csd](../examples/moscil.csd).

This example generates a stream of notes for every note received on the MIDI input. It generates MIDI notes on csound's MIDI output, so be sure to connect something.

``` csound-csd title="Example of the moscil opcode." linenums="1"
--8<-- "examples/moscil.csd"
```

## See also

[Note-on/Note-off Output](../midi/onoff.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>
May 1997<br>

New in Csound version 3.47

Thanks goes to Rasmus Ekman for pointing out the correct MIDI channel and controller number ranges.
