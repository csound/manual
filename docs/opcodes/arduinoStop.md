<!--
id:arduinoStop
category:Serial I/O
-->
# arduinoStop
Close a serial port using Arduino protocol.

Plugin opcode in serial.

## Syntax
=== "Modern"
    ``` csound-orc
    arduinoStop(iPort)
    ```

=== "Classic"
    ``` csound-orc
    arduinoStop iPort
    ```

### Initialization

_iPort_ -- port number obtained from a _arduinoStart_opcode.

## See Also

[non-MIDI Devices](../oscnetwork/nonMIDIdevices.md)

More information: [New Arduino Opcodes to Simplify the Streaming of Sensor and Controller Data to Csound](https://csound.com/icsc2022/proceedings/New%20Arduino%20Opcodes%20to%20Simplify%20the%20Streaming%20of%20Sensor%20and%20Controller%20Data%20to%20Csound.pdf)

## Credits

Author: John ffitch<br>
2020<br>

New in version 6.15
