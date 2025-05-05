<!--
id:midiprogramchange
category:Real-time MIDI:MIDI/Score Interoperability
-->
# midiprogramchange
Gets a MIDI program change value.

_midiprogramchange_ is designed to simplify writing instruments that can be used interchangeably for either score or MIDI input, and to make it easier to adapt instruments originally written for score input to work with MIDI input.

In general, it should be possible to write instrument definitions that work identically with both scores and MIDI, including both MIDI files and real-time MIDI input, without using any conditional statements, and that take full advantage of MIDI voice messages.

Note that correlating Csound instruments with MIDI channel numbers is done using the [massign](../opcodes/massign.md) opcode for real-time performance,.  For file-driven performance, instrument numbers default to MIDI channel number + 1, but the defaults are overridden by any MIDI program change messages in the file.

## Syntax
=== "Modern"
    ``` csound-orc
    midiprogramchange(xprogram)
    ```

=== "Classic"
    ``` csound-orc
    midiprogramchange xprogram
    ```

### Performance

_xprogram_ -- returns the MIDI program change value during MIDI activation, remains unchanged otherwise.

If the instrument was activated by MIDI input, the opcode overwrites the value of _xprogram_ with the corresponding value from MIDI input. If the instrument was _NOT_ activated by MIDI input, the value of _xprogram_ remains unchanged.

This enables score p-fields to receive MIDI input data during MIDI activation, and score values otherwise.

> :memo: **Adapting a score-activated Csound instrument.**
>
> See the [MIDI interop opcodes](../midi/interop.md) section for details on adapting score driven instruments for MIDI or vice-versa.

## Examples

Here is an example of the midiprogramchange opcode. It uses the file [midiprogramchange.csd](../examples/midiprogramchange.csd).

``` csound-csd title="Example of the midiprogramchange opcode." linenums="1"
--8<-- "examples/midiprogramchange.csd"
```

## See also

[MIDI/Score Interoperability](../midi/interop.md)

## Credits

Author: Michael Gogins

New in version 4.20
