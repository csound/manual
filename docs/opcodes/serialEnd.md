<!--
id:serialEnd
category:Serial I/O
-->
# serialend
Close a serial port for arduino.

> :memo: **Note**
>
> Up to Csound 6, this opcode was called *serialEnd*.

Plugin opcode in serial.

## Syntax
=== "Modern"
    ``` csound-orc
    serialend(iPort)
    ```

=== "Classic"
    ``` csound-orc
    serialEnd iPort
    ```

### Initialization

_iPort_ -- port number optained from a *serialbegin* opcode.

## See Also

[non-MIDI Devices](../oscnetwork/nonMIDIdevices.md)

## Credits

Author: Matt Ingalls<br>
2011<br>

New in version 5.14
