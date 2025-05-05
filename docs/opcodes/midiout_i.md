<!--
id:midiout_i
category:Real-time MIDI:Generic I/O
-->
# midiout_i
Sends a generic MIDI message to the MIDI OUT port.

## Syntax
=== "Modern"
    ``` csound-orc
    midiout_i(istatus, ichan, idata1, idata2)
    ```

=== "Classic"
    ``` csound-orc
    midiout_i istatus, ichan, idata1, idata2
    ```

Initialisation

_istatus_ -- the type of MIDI message. Can be:

* 128 (note off)
* 144 (note on)
* 160 (polyphonic aftertouch)
* 176 (control change)
* 192 (program change)
* 208 (channel aftertouch)
* 224 (pitch bend)
* 0 when no MIDI messages must be sent to the MIDI OUT port

_ichan_ -- MIDI channel (1-16)

_idata1, idata2_ -- message-dependent data values

_midiout_i_ has no output arguments, because it sends a message to the MIDI OUT port implicitly. It works at i-time. It sends a MIDI message only when _istatus_ is non-zero.

## Examples

Here is an example of the midiout_i opcode. It uses the file [midiout_i.csd](../examples/midiout_i.csd).

``` csound-csd title="Example of the midiout_i opcode." linenums="1"
--8<-- "examples/midiout_i.csd"
```

## See also

[MIDI Message Output](../midi/output.md)

[Generic Input and Output](../midi/generic.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>
1998<br>

New in Csound version 6.10
