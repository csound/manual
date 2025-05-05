<!--
id:midicontrolchange
category:Real-time MIDI:MIDI/Score Interoperability
-->
# midicontrolchange
Gets a MIDI control change value.

_midicontrolchange_ is designed to simplify writing instruments that can be used interchangeably for either score or MIDI input, and to make it easier to adapt instruments originally written for score input to work with MIDI input.

In general, it should be possible to write instrument definitions that work identically with both scores and MIDI, including both MIDI files and real-time MIDI input, without using any conditional statements, and that take full advantage of MIDI voice messages.

Note that correlating Csound instruments with MIDI channel numbers is done using the [massign](../opcodes/massign.md) opcode for real-time performance,.  For file-driven performance, instrument numbers default to MIDI channel number + 1, but the defaults are overridden by any MIDI program change messages in the file.

## Syntax
=== "Modern"
    ``` csound-orc
    midicontrolchange(xcontroller, xcontrollervalue [, ilow] [, ihigh])
    ```

=== "Classic"
    ``` csound-orc
    midicontrolchange xcontroller, xcontrollervalue [, ilow] [, ihigh]
    ```

### Initialization

_ilow_ (optional) -- optional low value after rescaling, defaults to 0.

_ihigh_ (optional) -- optional high value after rescaling, defaults to 127.

### Performance

_xcontroller_ -- specifies the MIDI controller number (0-127) to read from.

_xcontrollervalue_ -- returns the value of the MIDI controller during MIDI activation, remains unchanged otherwise.

If the instrument was activated by MIDI input, the opcode overwrites the value of _xcontrollervalue_ with the corresponding value from the MIDI data of the specified _xcontroller_. If the instrument was _NOT_ activated by MIDI input, the value remains unchanged.

This enables score p-fields to receive MIDI input data during MIDI activation, and score values otherwise.

> :memo: **Adapting a score-activated Csound instrument.**
>
> See the [MIDI interop opcodes](../midi/interop.md) section for details on adapting score driven instruments for MIDI or vice-versa.

## Examples

Here is an example of the midicontrolchange opcode. It uses the file [midicontrolchange.csd](../examples/midicontrolchange.csd)

``` csound-csd title="Example of the midicontrolchange opcode." linenums="1"
--8<-- "examples/midicontrolchange.csd"
```

## See also

[MIDI/Score Interoperability](../midi/interop.md)

## Credits

Author: Michael Gogins

New in version 4.20

Thanks goes to Rasmus Ekman for pointing out the correct MIDI channel and controller number ranges.
