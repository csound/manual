<!--
id:mididefault
category:Real-time MIDI:MIDI/Score Interoperability
-->
# mididefault
Changes values, depending on MIDI activation.

_mididefault_ is designed to simplify writing instruments that can be used interchangeably for either score or MIDI input, and to make it easier to adapt instruments originally written for score input to work with MIDI input.

In general, it should be possible to write instrument definitions that work identically with both scores and MIDI, including both MIDI files and real-time MIDI input, without using any conditional statements, and that take full advantage of MIDI voice messages.

Note that correlating Csound instruments with MIDI channel numbers is done using the [massign](../opcodes/massign.md) opcode for real-time performance,.  For file-driven performance, instrument numbers default to MIDI channel number + 1, but the defaults are overridden by any MIDI program change messages in the file.

## Syntax
=== "Modern"
    ``` csound-orc
    mididefault(xdefault, xvalue)
    ```

=== "Classic"
    ``` csound-orc
    mididefault xdefault, xvalue
    ```

### Performance

_xdefault_ -- specifies a default value that will be used during MIDI activation.

_xvalue_ -- overwritten by _xdefault_ during MIDI activation, remains unchanged otherwise.

If the instrument was activated by MIDI input, the opcode will overwrite the value of _xvalue_ with the value of _xdefault_. If the instrument was _NOT_ activated by MIDI input, _xvalue_ will remain unchanged.

This enables score pfields to receive a default value during MIDI activation, and score values otherwise.

> :memo: **Adapting a score-activated Csound instrument.**
>
See the [MIDI interop opcodes](../midi/interop.md) section for details on adapting score driven instruments for MIDI or vice-versa.

## Examples

Here is an example of the mididefault opcode. It uses the file [mididefault.csd](../examples/mididefault.csd).

``` csound-csd title="Example of the mididefault opcode." linenums="1"
--8<-- "examples/mididefault.csd"
```

## See also

[MIDI/Score Interoperability](../midi/interop.md)

## Credits

Author: Michael Gogins

New in version 4.20
