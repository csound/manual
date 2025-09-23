<!--
id:cpsmidib
category:Real-time MIDI:Converters
-->
# cpsmidib
Get the note number of the current MIDI event and modify it by the current pitch-bend value, express it in cycles-per-second.

## Syntax
=== "Modern"
    ``` csound-orc
    icps = cpsmidib([irange])
    kcps = cpsmidib([irange])
    ```

=== "Classic"
    ``` csound-orc
    icps cpsmidib [irange]
    kcps cpsmidib [irange]
    ```

### Initialization

_irange_ (optional) -- the pitch bend range in semitones.

### Performance

Get the note number of the current MIDI event, modify it by the current pitch-bend value, and express the result in cycles-per-second units. Available as an i-time value or as a continuous k-rate value.

## Examples

Here is an example of the cpsmidib opcode. It uses the file [cpsmidib.csd](../examples/cpsmidib.csd).

``` csound-csd title="Example of the cpsmidib opcode." linenums="1"
--8<-- "examples/cpsmidib.csd"
```

## See also

[Midi Converters](../midi/convert.md)

## Credits

Author: Barry L. Vercoe - Mike Berry<br>
MIT - Mills<br>
May 1997<br>
