<!--
id:serialWrite_i
category:Serial I/O
-->
# serialWrite_i
Write data to a serial port for arduino.

Plugin opcode in serial.

## Syntax
=== "Modern"
    ``` csound-orc
    serialWrite_i(iPort, iByte)
    serialWrite_i(iPort, SBytes)
    ```

=== "Classic"
    ``` csound-orc
    serialWrite_i iPort, iByte
    serialWrite_i iPort, SBytes
    ```

### Initialization

_iPort_ -- port number optained from a _serialBegin_ opcode.

_iByte_ -- a byte of data to write.

## See Also

[non-MIDI Devices](../oscnetwork/nonMIDIdevices.md)

## Credits

Author: Matt Ingalls<br>
2011<br>

New in version 5.14
