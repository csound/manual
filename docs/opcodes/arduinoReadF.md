<!--
id:arduinoReadF
category:Serial I/O
-->
# arduinoReadF
Read integer data from an arduino port using the Csound-Arduino protocol.

Plugin opcode in serial.

## Syntax
=== "Modern"
    ``` csound-orc
    kval = arduinoReadF(iPort, iStream1, iStream2, iStream3)
    ```

=== "Classic"
    ``` csound-orc
    kval arduinoReadF iPort, iStream1, iStream2, iStream3
    ```

### Performance

_iPort_ -- port number obtained from a _arduinoStart_ opcode.

_iStream1, iStream2, iStream3_ -- Numbers of the three data streams in the range 0 to 30.  Each stream carries 10 bits of the 30 bits floating point result. The division is created in the Arduino sketch encapsulated in the put_float function.

_kval_ -- floating point value read.

> :memo: **Note**
>
> The value transmitted is two bits shorter in the mantissa than produced on the Arduino so there is a little error introduced.

## Examples

Here is an example of the arduinoReadF opcode. It uses the file [arduinoReadF.csd](../examples/arduinoReadF.csd).

``` csound-csd title="Example of the arduinoReadF opcode." linenums="1"
--8<-- "examples/arduinoReadF.csd"
```

## See Also

[non-MIDI Devices](../oscnetwork/nonMIDIdevices.md)

More information: [New Arduino Opcodes to Simplify the Streaming of Sensor and Controller Data to Csound](https://csound.com/icsc2022/proceedings/New%20Arduino%20Opcodes%20to%20Simplify%20the%20Streaming%20of%20Sensor%20and%20Controller%20Data%20to%20Csound.pdf)

## Credits

Author: John ffitch<br>
Author: Richard Boulanger<br>
2020<br>

New in version 6.15
