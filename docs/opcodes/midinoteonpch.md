<!--
id:midinoteonpch
category:Real-time MIDI:MIDI/Score Interoperability
-->
# midinoteonpch
Gets a MIDI note number as a pitch-class value.

_midinoteonpch_ is designed to simplify writing instruments that can be used interchangeably for either score or MIDI input, and to make it easier to adapt instruments originally written for score input to work with MIDI input.

In general, it should be possible to write instrument definitions that work identically with both scores and MIDI, including both MIDI files and real-time MIDI input, without using any conditional statements, and that take full advantage of MIDI voice messages.

Note that correlating Csound instruments with MIDI channel numbers is done using the [massign](../opcodes/massign.md) opcode for real-time performance,.  For file-driven performance, instrument numbers default to MIDI channel number + 1, but the defaults are overridden by any MIDI program change messages in the file.

## Syntax
=== "Modern"
    ``` csound-orc
    midinoteonpch(xpch, xvelocity)
    ```

=== "Classic"
    ``` csound-orc
    midinoteonpch xpch, xvelocity
    ```

### Performance

_xpch_ -- returns MIDI key translated to octave.pch during MIDI activation, remains unchanged otherwise.

_xvelocity_ -- returns MIDI velocity during MIDI activation, remains unchanged otherwise.

If the instrument was activated by MIDI input, the opcode overwrites the values of _xpch_ and _xvelocity_ with the corresponding value from MIDI input. If the instrument was _NOT_ activated by MIDI input, the values of _xpch_ and _xvelocity_ remain unchanged.

This enables score p-fields to receive MIDI input data during MIDI activation, and score values otherwise.

> :memo: **Adapting a score-activated Csound instrument.**
>
> See the [MIDI interop opcodes](../midi/interop.md) section for details on adapting score driven instruments for MIDI or vice-versa.

## Examples

Here is an example of the midinoteonpch opcode. It uses the file [midinoteonpch.csd](../examples/midinoteonpch.csd).

``` csound-csd title="Example of the midinoteonpch opcode." linenums="1"
--8<-- "examples/midinoteonpch.csd"
```

Its output should include lines like:

```
i1     8.09000
i1     9.05000
```

## See also

[MIDI/Score Interoperability](../midi/interop.md)

## Credits

Author: Michael Gogins

New in version 4.20
