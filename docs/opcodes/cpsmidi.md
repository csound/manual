<!--
id:cpsmidi
category:Real-time MIDI:Converters
-->
# cpsmidi
Get the note number of the current MIDI event, expressed in cycles-per-second.

## Syntax
=== "Modern"
    ``` csound-orc
    icps = cpsmidi()
    ```

=== "Classic"
    ``` csound-orc
    icps cpsmidi
    ```

### Performance

Get the note number of the current MIDI event, expressed in cycles-per-second units, for local processing.

> :memo: **cpsmidi vs. cpsmidinn**
>
> The _cpsmidi_ opcode only produces meaningful results in a Midi-activated note (either real-time or from a Midi score with the -F flag).  With _cpsmidi_, the Midi note number value is taken from the Midi event that is internally associated with the instrument instance.  On the other hand, the _cpsmidinn_ opcode may be used in any Csound instrument instance whether it is activated from a Midi event, score event, line event, or from another instrument.  The input value for _cpsmidinn_ might for example come from a p-field in a textual score or it may have been retrieved from the real-time Midi event that activated the current note using the _notnum_ opcode.

## Examples

Here is an example of the cpsmidi opcode. It uses the file [cpsmidi.csd](../examples/cpsmidi.csd).

``` csound-csd title="Example of the cpsmidi opcode." linenums="1"
--8<-- "examples/cpsmidi.csd"
```

## See also

[Midi Converters](../midi/convert.md)

## Credits

Author: Barry L. Vercoe - Mike Berry<br>
MIT - Mills<br>
May 1997<br>
