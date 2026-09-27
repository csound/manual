<!--
id:midiout_i
category:Real-time MIDI:Generic I/O
-->
# midiout_i
Sends a MIDI channel message at initialization.

[midiouti](midiouti.md) is another name for `midiout_i`. Both spellings use the same arguments and behavior. Use [midiout](midiout.md) to send messages during performance.

## Syntax

=== "Modern"
    ``` csound-orc
    midiout_i(istatus, ichan, idata1, idata2 [, iport])
    midiouti(istatus, ichan, idata1, idata2 [, iport])
    ```

=== "Classic"
    ``` csound-orc
    midiout_i istatus, ichan, idata1, idata2 [, iport]
    midiouti istatus, ichan, idata1, idata2 [, iport]
    ```

### Initialization

All arguments are i-rate. The opcode sends one message when it initializes, including during reinitialization. It has no output arguments. An instrument's duration does not cause the message to repeat or arrange a later note-off.

`istatus` selects the message type. Use 0 to send nothing. The other supported values are shown below.

| `istatus` | Message | `idata1` | `idata2` |
| --- | --- | --- | --- |
| 128 | Note off | Note number | Release velocity |
| 144 | Note on | Note number | Velocity |
| 160 | Polyphonic aftertouch | Note number | Pressure |
| 176 | Control change | Controller number | Value |
| 192 | Program change | Program number | Ignored |
| 208 | Channel aftertouch | Pressure | Ignored |
| 224 | Pitch bend | Least significant 7 bits | Most significant 7 bits |

`ichan` is the MIDI channel, from 1 to 16. Supply the message type and channel separately.

`idata1` and `idata2` are MIDI data bytes. Use integers from 0 to 127. Both arguments are required, even for messages that use only one data byte. Set the unused argument to 0. Program numbers use the raw MIDI range 0 to 127, so a device that labels programs 1 to 128 displays a number one greater. Pitch bend has its center at `idata1 = 0` and `idata2 = 64`.

`iport` selects the output port and defaults to 0. Use a nonnegative integer supported by the MIDI output backend. It is separate from `ichan` and does not open or select a physical device on its own.

Configure real-time MIDI output with `-Q` and the chosen MIDI backend, or write messages to a MIDI file with `--midioutfile`. Port routing depends on the backend or host. PortMidi's `-Qm` mode routes port 0 to the first opened output, port 1 to the second, and so on. Its single-device mode ignores the per-message port. MIDI file output writes the messages without preserving `iport` as a port designation.

A note-on needs a matching note-off message later. Use a separate scheduled event for that message, as in the example.

## Examples

The example writes a program change, a volume setting and two short notes to `midiout_i.mid`. It uses both spellings and shows an explicit port 0 as well as the default. Each note has a separate note-off event.

Run it from a writable directory. It needs no MIDI device and produces no audio. Open the resulting MIDI file in a sequencer to inspect or play the messages.

It uses [midiout_i.csd](../examples/midiout_i.csd).

``` csound-csd title="Write MIDI messages using both i-time spellings" linenums="1"
--8<-- "examples/midiout_i.csd"
```

## See also

[midiouti](midiouti.md), [midiout](midiout.md), [MIDI Message Output](../midi/output.md), [Generic Input and Output](../midi/generic.md)

## Credits

Gabriel Maldonado wrote the original MIDI output implementation in 1998. Victor Lazzarini added the i-time form in 2017.

The i-time form is available from Csound 6.10.
