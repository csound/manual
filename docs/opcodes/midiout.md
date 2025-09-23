<!--
id:midiout
category:Real-time MIDI:Generic I/O
-->
# midiout
Sends a generic MIDI message to the MIDI OUT port.

## Syntax
=== "Modern"
    ``` csound-orc
    midiout(kstatus, kchan, kdata1, kdata2)
    ```

=== "Classic"
    ``` csound-orc
    midiout kstatus, kchan, kdata1, kdata2
    ```

### Performance

_kstatus_ -- the type of MIDI message. Can be:

* 128 (note off)
* 144 (note on)
* 160 (polyphonic aftertouch)
* 176 (control change)
* 192 (program change)
* 208 (channel aftertouch)
* 224 (pitch bend)
* 0 when no MIDI messages must be sent to the MIDI OUT port

_kchan_ -- MIDI channel (1-16)

_kdata1, kdata2_ -- message-dependent data values

_midiout_ has no output arguments, because it sends a message to the MIDI OUT port implicitly. It works at k-rate. It sends a MIDI message only when _kstatus_ is non-zero.

> :warning: **Warning**
>
> Normally _kstatus_ should be set to 0. Only when the user intends to send a MIDI message, can it be set to the corresponding message type number.

## Examples

Here is an example of the midiout opcode. It uses the file [midiout.csd](../examples/midiout.csd).

``` csound-csd title="Example of the midiout opcode." linenums="1"
--8<-- "examples/midiout.csd"
```

## See also

[MIDI Message Output](../midi/output.md)

[Generic Input and Output](../midi/generic.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>
1998<br>

New in Csound version 3.492
