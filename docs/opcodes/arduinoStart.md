<!--
id:arduinoStart
category:Serial I/O
-->
# arduinoStart
Open a serial port for use with the Arduino protocol.

Plugin opcode in serial.

## Syntax
=== "Modern"
    ``` csound-orc
    iPort = arduinoStart(SPortName [, ibaudRate])
    ```

=== "Classic"
    ``` csound-orc
    iPort arduinoStart SPortName [, ibaudRate]
    ```

### Initialization

_SPortName_ -- port name number

_ibaudrate_ -- serial speed, defaulting to 9600 bps.

## See Also

[non-MIDI Devices](../oscnetwork/nonMIDIdevices.md)

More information: [New Arduino Opcodes to Simplify the Streaming of Sensor and Controller Data to Csound](https://csound.com/icsc2022/proceedings/New%20Arduino%20Opcodes%20to%20Simplify%20the%20Streaming%20of%20Sensor%20and%20Controller%20Data%20to%20Csound.pdf)

## Credits

Author: John ffitch<br>
2020<br>

New in version 6.15
