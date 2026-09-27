<!--
id:midinoteoff
category:Real-time MIDI:MIDI/Score Interoperability
-->
# midinoteoff
Returns the key number and Note On velocity of a MIDI-activated instrument.

The current implementation behaves like [midinoteonkey](midinoteonkey.md). It reads the Note On values that started the instrument and does not return Note Off velocity. Use `midinoteonkey` for these values in new code. To read incoming Note Off messages and their velocities, use [midiin](midiin.md).

_midinoteoff_ is designed to simplify writing instruments that can be used interchangeably for either score or MIDI input, and to make it easier to adapt instruments originally written for score input to work with MIDI input.

In general, it should be possible to write instrument definitions that work identically with both scores and MIDI, including both MIDI files and real-time MIDI input, without using any conditional statements, and that take full advantage of MIDI voice messages.

Note that correlating Csound instruments with MIDI channel numbers is done using the [massign](../opcodes/massign.md) opcode for real-time performance,.  For file-driven performance, instrument numbers default to MIDI channel number + 1, but the defaults are overridden by any MIDI program change messages in the file.

## Syntax
=== "Modern"
    ``` csound-orc
    midinoteoff(xkey, xvelocity)
    ```

=== "Classic"
    ``` csound-orc
    midinoteoff xkey, xvelocity
    ```

### Performance

_xkey_ -- receives the MIDI key number from the Note On message that started the instrument. For a score event, its value stays unchanged.

_xvelocity_ -- receives the velocity from that Note On message. A later Note Off message does not replace this value. For a score event, its value stays unchanged.

If the instrument was activated by MIDI input, the opcode overwrites the values of the _xkey_ and _xvelocity_ with the key number and velocity from the Note On message that started the instrument. If the instrument was _NOT_ activated by MIDI input, the values of _xkey_ and _xvelocity_ remain unchanged.

This enables score p-fields to receive MIDI input data during MIDI activation, and score values otherwise.

> :memo: **Adapting a score-activated Csound instrument.**
>
> See the [MIDI interop opcodes](../midi/interop.md) section for details on adapting score driven instruments for MIDI or vice-versa.

## Examples

Here is an example of the midinoteoff opcode. It uses the file [midinoteoff.csd](../examples/midinoteoff.csd).

``` csound-csd title="Example of the midinoteoff opcode." linenums="1"
--8<-- "examples/midinoteoff.csd"
```

When you play a MIDI note, the example prints its Note On velocity. Releasing the key does not make it print the Note Off velocity. The score events leave the initialized values unchanged.

## See also

[midinoteonkey](midinoteonkey.md), [midiin](midiin.md), [MIDI/Score Interoperability](../midi/interop.md)

## Credits

Author: Michael Gogins

New in version 4.20
