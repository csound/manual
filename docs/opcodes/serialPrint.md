<!--
id:serialPrint
category:Serial I/O
-->
# serialprint
Print data from a serial port.

> :warning: **Deprecated alias**
>
> `serialPrint` is a deprecated alias of `serialprint` in Csound 7. Use `serialprint` in new code. The old name still works for compatibility.

Plugin opcode in serial.

Print to the screen any bytes (up to 32k) in the input buffer. Note that these bytes will be cleared from the buffer. use this opcode mainly for debugging messages. If you want to mix debugging and other communication messages over the same port, you will need to manually parse the data with the *serialread* opcode.

## Syntax
=== "Modern"
    ``` csound-orc
    serialprint(iPort)
    ```

=== "Classic"
    ``` csound-orc
    serialPrint iPort
    ```

### Performance

_iPort_ -- port number optained from a *serialbegin* opcode.

## See also

[non-MIDI Devices](../oscnetwork/nonMIDIdevices.md)

## Credits

Author: Matt Ingalls<br>
2011<br>

New in version 5.14
