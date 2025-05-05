<!--
id:ctrlsave
category:Real-time MIDI:Input
-->
# ctrlsave
Recovers the current values of MIDI controllers to a k-array.

## Syntax
=== "Modern"
    ``` csound-orc
    kconnt[] = ctrlsave(ichnl, ictlno1, [ictlno2] [, ictlno3] ...)
    ```

=== "Classic"
    ``` csound-orc
    kconnt[] ctrlsave ichnl, ictlno1, [ictlno2] [, ictlno3] ...
    ```

### Initialization

_ichnl_ -- MIDI channel number (1-16)

_ictlno1_, _ictlno1_, etc. -- MIDI controller numbers (0-127)

### Performance

Sets the array kcontrl to the current values of MIDI controllers indicated.

## Examples

Here is an example of the ctrlsave opcode. It uses the file [ctrls.csd](../examples/ctrls.csd).

``` csound-csd title="Example of the ctrlsave opcode." linenums="1"
--8<-- "examples/ctrls.csd"
```

## See also

[MIDI input and Initialization](../midi/input.md)

## Credits

Authors: John ffitch and Richard Boulanger<br>

New in Csound version 6.16
