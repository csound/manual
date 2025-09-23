<!--
id:serialFlush
category:Serial I/O
-->
# serialFlush
Flush data from a serial port.

Plugin opcode in serial.

Flush to the screen any bytes (up to 32k) in the input buffer. Note that these bytes will be cleared from the buffer. use this opcode mainly for debugging messages. If you want to mix debugging and other communication messages over the same port, you will need to manually parse the data with the _serialRead_ opcode.

## Syntax
=== "Modern"
    ``` csound-orc
    serialFlush(iPort)
    ```

=== "Classic"
    ``` csound-orc
    serialFlush iPort
    ```

### Performance

_iPort_ -- port number optained from a _serialBegin_ opcode.

## See Also

[non-MIDI Devices](../oscnetwork/nonMIDIdevices.md)

## Credits

Author: Matt Ingalls<br>
2011<br>

New in version 5.14
