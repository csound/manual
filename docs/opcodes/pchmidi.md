<!--
id:pchmidi
category:Real-time MIDI:Converters
-->
# pchmidi
Get the note number of the current MIDI event, expressed in pitch-class units.

## Syntax
=== "Modern"
    ``` csound-orc
    ipch = pchmidi()
    ```

=== "Classic"
    ``` csound-orc
    ipch pchmidi
    ```

### Performance

Get the note number of the current MIDI event, expressed in pitch-class units for local processing.

> :memo: **pchmidi vs. pchmidinn**
>
> The _pchmidi_ opcode only produces meaningful results in a Midi-activated note (either real-time or from a Midi score with the -F flag).  With _pchmidi_, the Midi note number value is taken from the Midi event that is internally associated with the instrument instance.  On the other hand, the _pchmidinn_ opcode may be used in any Csound instrument instance whether it is activated from a Midi event, score event, line event, or from another instrument.  The input value for _pchmidinn_ might for example come from a p-field in a textual score or it may have been retrieved from the real-time Midi event that activated the current note using the _notnum_ opcode.

## Examples

Here is an example of the pchmidi opcode. It uses the file [pchmidi.csd](../examples/pchmidi.csd).

``` csound-csd title="Example of the pchmidi opcode." linenums="1"
--8<-- "examples/pchmidi.csd"
```

## See also

[Midi Converters](../midi/convert.md)

## Credits

Author: Barry L. Vercoe - Mike Berry<br>
MIT - Mills<br>
May 1997<br>

Example written by Kevin Conder.
