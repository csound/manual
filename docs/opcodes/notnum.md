<!--
id:notnum
category:Real-time MIDI:Input
-->
# notnum
Get a note number from a MIDI event.

## Syntax
=== "Modern"
    ``` csound-orc
    ival = notnum()
    ```

=== "Classic"
    ``` csound-orc
    ival notnum
    ```

### Performance

Get the MIDI byte value (0 - 127) denoting the note number of the current event.

## Examples

Here is an example of the notnum opcode. It uses the file [notnum.csd](../examples/notnum.csd).

``` csound-csd title="Example of the notnum opcode." linenums="1"
--8<-- "examples/notnum.csd"
```

## See also

[MIDI input and Initialization](../midi/input.md)

## Credits

Author: Barry L. Vercoe - Mike Berry<br>
MIT - Mills<br>
May 1997<br>

Example written by David Akbari.
