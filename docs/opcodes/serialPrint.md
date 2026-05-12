<!--
id:serialPrint
category:Serial I/O
-->
# serialprint
Print data from a serial port.

> :memo: **Note**
>
> Up to Csound 6, this opcode was called *serialPrint*.

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

## See Also

[non-MIDI Devices](../oscnetwork/nonMIDIdevices.md)

## Credits

Author: Matt Ingalls<br>
2011<br>

New in version 5.14
