<!--
id:midiin
category:Real-time MIDI:Generic I/O
-->
# midiin
Returns a generic MIDI message received by the MIDI IN port.

## Syntax
=== "Modern"
    ``` csound-orc
    kstatus, kchan, kdata1, kdata2 = midiin()
    ```

=== "Classic"
    ``` csound-orc
    kstatus, kchan, kdata1, kdata2 midiin
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
* 0 if no MIDI message are pending in the MIDI IN buffer

_kchan_ -- MIDI channel (1-16 if only one input port is used, higher
if channel is port mapped.)

_kdata1, kdata2_ -- message-dependent data values

_midiin_ has no input arguments, because it reads at the MIDI in port implicitly. It works at k-rate. Normally (i.e., when no messages are pending) _kstatus_ is zero, only when MIDI data are present in the MIDI IN buffer, is _kstatus_ set to the type of the relevant messages.

> :memo: **Note**
>
> Be careful when using _midiin_ in low numbered instruments, since a MIDI note will launch additional instances of the instrument, resulting in duplicate events and weird behaviour. Use [massign](../opcodes/massign.md) to direct MIDI note on messages to a different instrument or to disable triggering of instruments from MIDI.

## Examples

Here is an example of the midiin opcode. It uses the file [midiin.csd](../examples/midiin.csd).

``` csound-csd title="Example of the midiin opcode." linenums="1"
--8<-- "examples/midiin.csd"
```

## See also

[MIDI input and Initialization](../midi/input.md)

[Generic Input and Output](../midi/generic.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>
1998<br>

New in Csound version 3.492
