<!--
id:ampmidi
category:Real-time MIDI:Converters
-->
# ampmidi
Get the velocity of the current MIDI event.

## Syntax
=== "Modern"
    ``` csound-orc
    iamp = ampmidi(iscal [, ifn])
    ```

=== "Classic"
    ``` csound-orc
    iamp ampmidi iscal [, ifn]
    ```

### Initialization

_iscal_ -- i-time scaling factor

_ifn_ (optional, default=0) -- function table number of a normalized translation table, by which the incoming value is first interpreted. The default value is 0, denoting no translation.

### Performance

Get the velocity of the current MIDI event, optionally pass it through a normalized translation table, and return an amplitude value in the range 0 - _iscal_.

## Examples

=== "Modern"
    Here is an example of the ampmidi opcode. It uses the file [ampmidi-modern.csd](../examples/ampmidi-modern.csd).
    ``` csound-csd title="Example of the ampmidi opcode." linenums="1"
    --8<-- "examples/ampmidi-modern.csd"
    ```

=== "Classic"
    Here is an example of the ampmidi opcode. It uses the file [ampmidi.csd](../examples/ampmidi.csd).
    ``` csound-csd title="Example of the ampmidi opcode." linenums="1"
    --8<-- "examples/ampmidi.csd"
    ```

## See also

[Midi Converters](../midi/convert.md)

## Credits

Author: Barry L. Vercoe - Mike Berry<br>
MIT - Mills<br>
May 1997<br>
