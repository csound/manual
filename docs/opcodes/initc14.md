<!--
id:initc14
category:Real-time MIDI:Input
-->
# initc14
Initializes the controllers used to create a 14-bit MIDI value.

## Syntax
=== "Modern"
    ``` csound-orc
    initc14(ichan, ictlno1, ictlno2, ivalue)
    ```

=== "Classic"
    ``` csound-orc
    initc14 ichan, ictlno1, ictlno2, ivalue
    ```

### Initialization

_ichan_ -- MIDI channel (1-16)

_ictlno1_ -- most significant byte controller number (0-127)

_ictlno2_ -- least significant byte controller number (0-127)

_ivalue_ -- floating point value (must be within 0 to 1)

### Performance

_initc14_ can be used together with both [midic14](../opcodes/midic14.md) and [ctrl14](../opcodes/ctrl14.md) opcodes for initializing the first controller's value. _ivalue_ argument must be set with a number within 0 to 1. An error occurs if it is not. Use the following formula to set _ivalue_ according with _midic14_ and _ctrl14_ min and max range:

```
ivalue = (initial_value - min) / (max - min)
```

## See also

[MIDI input and Initialization](../midi/input.md)

## Credits

Author: Gabriel Maldonado<br>
Italy<br>

New in Csound version 3.47

Thanks goes to Rasmus Ekman for pointing out the correct MIDI channel and controller number ranges.
