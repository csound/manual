<!--
id:ctrlprint
category:Real-time MIDI:Input
-->
# ctrlprint
Print the saved values of MIDI controllers from an array to the console or a file.

## Syntax
=== "Modern"
    ``` csound-orc
    ctrlprint(kcont[][, Sfile])
    ```

=== "Classic"
    ``` csound-orc
    ctrlprint kcont[][, Sfile]
    ```

### Initialization

_Sfile_ -- File name to receive the values. If omitted it writes to the console.

### Performance

_kcont_ -- the array of controls as saved by _ctrlsave_.

## Examples

Here is an example of the ctrlprint opcode. It uses the file [ctrls.csd](../examples/ctrls.csd).

``` csound-csd title="Example of the ctrlprint opcode." linenums="1"
--8<-- "examples/ctrls.csd"
```

## See also

[MIDI input and Initialization](../midi/input.md)

## Credits

Authors: John ffitch and Richard Boulanger<br>

New in Csound version 6.16
