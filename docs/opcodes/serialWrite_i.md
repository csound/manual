<!--
id:serialWrite_i
category:Serial I/O
-->
# serialwritei
Write data to a serial port for arduino.

> :memo: **Note**
>
> Up to Csound 6, this opcode was called *serialWrite_i*.

Plugin opcode in serial.

## Syntax
=== "Modern"
    ``` csound-orc
    serialwritei(iPort, iByte)
    serialwritei(iPort, SBytes)
    ```

=== "Classic"
    ``` csound-orc
    serialWrite_i iPort, iByte
    serialWrite_i iPort, SBytes
    ```

### Initialization

_iPort_ -- port number optained from a *serialbegin* opcode.

_iByte_ -- a byte of data to write.

## See Also

[non-MIDI Devices](../oscnetwork/nonMIDIdevices.md)

## Credits

Author: Matt Ingalls<br>
2011<br>

New in version 5.14
