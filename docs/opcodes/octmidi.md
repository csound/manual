<!--
id:octmidi
category:Real-time MIDI:Converters
-->
# octmidi
Get the note number, in octave-point-decimal units, of the current MIDI event.

## Syntax
=== "Modern"
    ``` csound-orc
    ioct = octmidi()
    ```

=== "Classic"
    ``` csound-orc
    ioct octmidi
    ```

### Performance

Get the note number of the current MIDI event, expressed in octave-point-decimal units, for local processing.

> :memo: **octmidi vs. octmidinn**
>
> The _octmidi_ opcode only produces meaningful results in a Midi-activated note (either real-time or from a Midi score with the -F flag).  With _octmidi_, the Midi note number value is taken from the Midi event that is internally associated with the instrument instance.  On the other hand, the _octmidinn_ opcode may be used in any Csound instrument instance whether it is activated from a Midi event, score event, line event, or from another instrument.  The input value for _octmidinn_ might for example come from a p-field in a textual score or it may have been retrieved from the real-time Midi event that activated the current note using the _notnum_ opcode.

## Examples

Here is an example of the octmidi opcode. It uses the file [octmidi.csd](../examples/octmidi.csd).

``` csound-csd title="Example of the octmidi opcode." linenums="1"
--8<-- "examples/octmidi.csd"
```

## See also

[Midi Converters](../midi/convert.md)

## Credits

Author: Barry L. Vercoe - Mike Berry<br>
MIT - Mills<br>
May 1997<br>

Example written by Kevin Conder.
