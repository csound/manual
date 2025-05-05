<!--
id:midinoteoff
category:Real-time MIDI:MIDI/Score Interoperability
-->
# midinoteoff
Gets a MIDI noteoff value.

This opcode is incorrect. It is _identical_ to _midinoteonkey_. It does not do what you would expect from its name, as it does not respond to Note-Off events, but is activated by Note-On. The _midiin_ opcode can be used to receive noteoff events and their velocities.

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

_xkey_ -- returns MIDI key during MIDI activation, remains unchanged otherwise.

_xvelocity_ -- returns MIDI velocity during MIDI activation, remains unchanged otherwise.

If the instrument was activated by MIDI input, the opcode overwrites the values of the _xkey_ and _xvelocity_ with the corresponding values from MIDI input. If the instrument was _NOT_ activated by MIDI input, the values of _xkey_ and _xvelocity_ remain unchanged.

This enables score p-fields to receive MIDI input data during MIDI activation, and score values otherwise.

> :memo: **Adapting a score-activated Csound instrument.**
>
> See the [MIDI interop opcodes](../midi/interop.md) section for details on adapting score driven instruments for MIDI or vice-versa.

## Examples

Here is an example of the midinoteoff opcode. It uses the file [midinoteoff.csd](../examples/midinoteoff.csd).

``` csound-csd title="Example of the midinoteoff opcode." linenums="1"
--8<-- "examples/midinoteoff.csd"
```

Its output should include lines like:

```
i1    60.00000
i1    76.00000
```

## See also

[MIDI/Score Interoperability](../midi/interop.md)

## Credits

Author: Michael Gogins

New in version 4.20
