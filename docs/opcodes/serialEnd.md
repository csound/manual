<!--
id:serialEnd
category:Serial I/O
-->
# serialend
Close a serial port for arduino.

> :warning: **Deprecated alias**
>
> `serialEnd` is a deprecated alias of `serialend` in Csound 7. Use `serialend` in new code. The old name still works for compatibility.

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

## See also

[non-MIDI Devices](../oscnetwork/nonMIDIdevices.md)

## Credits

Author: Matt Ingalls<br>
2011<br>

New in version 5.14
