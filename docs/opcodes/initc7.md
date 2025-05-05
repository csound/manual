<!--
id:initc7
category:Real-time MIDI:Input
-->
# initc7
Initializes the controller used to create a 7-bit MIDI value.

## Syntax
=== "Modern"
    ``` csound-orc
    initc7(ichan, ictlno, ivalue)
    ```

=== "Classic"
    ``` csound-orc
    initc7 ichan, ictlno, ivalue
    ```

### Initialization

_ichan_ -- MIDI channel (1-16)

_ictlno_ -- controller number (0-127)

_ivalue_ -- floating point value (must be within 0 to 1)

### Performance

_initc7_ can be used together with both [midic7](../opcodes/midic7.md) and  [ctrl7](../opcodes/ctrl7.md) opcodes for initializing the first controller's value. _ivalue_ argument must be set with a number within 0 to 1. An error occurs if it is not. Use the following formula to set _ivalue_ according with _midic7_ and _ctrl7_ min and max range:

```
ivalue = (initial_value - min) / (max - min)
```

## Examples

Here is an example of the initc7 opcode. It uses the file [initc7.csd](../examples/initc7.csd).

``` csound-csd title="Example of the initc7 opcode." linenums="1"
--8<-- "examples/initc7.csd"
```

## See also

[MIDI input and Initialization](../midi/input.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>

New in Csound version 3.47

Thanks goes to Rasmus Ekman for pointing out the correct MIDI channel and controller number ranges.
