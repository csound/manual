<!--
id:ctrlprintpresets
category:Real-time MIDI:Input
-->
# ctrlprintpresets
Prints the current collection of presets for MIDI controllers in a format that can be used in an orchestra, to the console or a file.

## Syntax
=== "Modern"
    ``` csound-orc
    ctrlprintpresets([Sfilenam])
    ```

=== "Classic"
    ``` csound-orc
    ctrlprintpresets [Sfilenam]
    ```

### Initialization

At initialisation time the existence of the internal data structure is checked.

### Performance

_Sfilename_ -- (optional) file to which to print.  If omitted it uses the current output.

## Examples

Here is an example of the ctrlprintpresets opcode. It uses the file [ctrls.csd](../examples/ctrls.csd).

``` csound-csd title="Example of the ctrlprintpresets opcode." linenums="1"
--8<-- "examples/ctrls.csd"
```

## See also

[MIDI input and Initialization](../midi/input.md)

## Credits

Authors: John ffitch and Richard Boulanger<br>

New in Csound version 6.16
