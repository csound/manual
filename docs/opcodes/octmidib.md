<!--
id:octmidib
category:Real-time MIDI:Converters
-->
# octmidib
Get the note number of the current MIDI event and modify it by the current pitch-bend value, express it in octave-point-decimal.

## Syntax
=== "Modern"
    ``` csound-orc
    ioct = octmidib([irange])
    koct = octmidib([irange])
    ```

=== "Classic"
    ``` csound-orc
    ioct octmidib [irange]
    koct octmidib [irange]
    ```

### Initialization

_irange_ (optional) -- the pitch bend range in semitones

### Performance

Get the note number of the current MIDI event, modify it by the current pitch-bend value, and express the result in octave-point-decimal units. Available as an i-time value or as a continuous k-rate value.

## Examples

Here is an example of the octmidib opcode. It uses the file [octmidib.csd](../examples/octmidib.csd).

``` csound-csd title="Example of the octmidib opcode." linenums="1"
--8<-- "examples/octmidib.csd"
```

## See also

[Midi Converters](../midi/convert.md)

## Credits

Author: Barry L. Vercoe - Mike Berry<br>
MIT - Mills<br>
May 1997<br>

Example written by Kevin Conder.
