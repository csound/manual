<!--
id:ctrlselect
category:Real-time MIDI:Input
-->
# ctrlselect
Loads a preset of values for MIDI controllers from a previous ctrlpreset call.

## Syntax
=== "Modern"
    ``` csound-orc
    ctrlselect(kpre)
    ```

=== "Classic"
    ``` csound-orc
    ctrlselect kpre
    ```

### Initialization

At initialisation time the existence of the internal data structure is checked.

### Performance

_kpre_ -- the numeric tag for the preset, as returned by ctrlpreset.

## Examples

Here is an example of the ctrlselect opcode. It uses the file [ctrls.csd](../examples/ctrls.csd).

``` csound-csd title="Example of the ctrlselect opcode." linenums="1"
--8<-- "examples/ctrls.csd"
```

## See also

[MIDI input and Initialization](../midi/input.md)

## Credits

Authors: John ffitch and Richard Boulanger<br>

New in Csound version 6.16
