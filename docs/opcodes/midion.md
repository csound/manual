<!--
id:midion
category:Real-time MIDI:Note Output
-->
# midion
Generates MIDI note messages at k-rate.

## Syntax
=== "Modern"
    ``` csound-orc
    midion(kchn, knum, kvel)
    ```

=== "Classic"
    ``` csound-orc
    midion kchn, knum, kvel
    ```

### Performance

_kchn_ -- MIDI channel number (1-16)

_knum_ -- note number (0-127)

_kvel_ -- velocity (0-127)

_midion_ (k-rate note on) plays MIDI notes with current _kchn_, _knum_ and _kvel_. These arguments can be varied at k-rate. Each time the MIDI converted value of any of these arguments changes, last MIDI note played by current instance of _midion_ is immediately turned off and a new note with the new argument values is activated. This opcode, as well as _moscil_, can generate very complex melodic textures if controlled by complex k-rate signals.

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
