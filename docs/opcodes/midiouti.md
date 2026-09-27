<!--
id:midiouti
category:Real-time MIDI:Generic I/O
-->
# midiouti
Sends a MIDI channel message at initialization.

`midiouti` is another name for [midiout_i](midiout_i.md). Both accept the optional output port, which defaults to 0.

## Syntax

=== "Modern"
    ``` csound-orc
    midiouti(istatus, ichan, idata1, idata2 [, iport])
    ```

=== "Classic"
    ``` csound-orc
    midiouti istatus, ichan, idata1, idata2 [, iport]
    ```

See [midiout_i](midiout_i.md) for arguments, port routing, the shared example and credits.
