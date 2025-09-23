<!--
id:pchmidib
category:Real-time MIDI:Converters
-->
# pchmidib
Get the note number of the current MIDI event and modify it by the current pitch-bend value, express it in pitch-class units.

## Syntax
=== "Modern"
    ``` csound-orc
    ipch = pchmidib([irange])
    kpch = pchmidib([irange])
    ```

=== "Classic"
    ``` csound-orc
    ipch pchmidib [irange]
    kpch pchmidib [irange]
    ```

### Initialization

_irange_ (optional) -- the pitch bend range in semitones

### Performance

Get the note number of the current MIDI event, modify it by the current pitch-bend value, and express the result in pitch-class units. Available as an i-time value or as a continuous k-rate value.

## Examples

Here is an example of the pchmidib pchmidib. It uses the file [pchmidib.csd](../examples/pchmidib.csd).

``` csound-csd title="Example of the pchmidib pchmidib." linenums="1"
--8<-- "examples/pchmidib.csd"
```

## See also

[Midi Converters](../midi/convert.md)

## Credits

Author: Barry L. Vercoe - Mike Berry<br>
MIT - Mills<br>
May 1997<br>

Example written by Kevin Conder.
