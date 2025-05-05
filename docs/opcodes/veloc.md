<!--
id:veloc
category:Real-time MIDI:Input
-->
# veloc
Get the velocity from a MIDI event.

## Syntax
=== "Modern"
    ``` csound-orc
    ival = veloc([ilow] [, ihigh])
    ```

=== "Classic"
    ``` csound-orc
    ival veloc [ilow] [, ihigh]
    ```

### Initialization

_ilow, ihigh_ -- low and hi ranges for mapping

### Performance

Get the MIDI byte value (0 - 127) denoting the velocity of the current event.

## Examples

Here is an example of the veloc opcode. It uses the files [veloc.csd](../examples/veloc.csd) and [midiChords.mid](../examples/midiChords.mid).

``` csound-csd title="Example of the veloc opcode." linenums="1"
--8<-- "examples/veloc.csd"
```

## See also

[MIDI input and Initialization](../midi/input.md)

## Credits

Author: Barry L. Vercoe - Mike Berry<br>
MIT - Mills<br>
May 1997<br>
