<!--
id:arduinoRead
category:Serial I/O
-->
# arduinoRead
Read integer data from an arduino port using the Csound-Arduino protocol.

Plugin opcode in serial.

## Syntax
=== "Modern"
    ``` csound-orc
    kval = arduinoRead(iPort, iStream [, iSmooth])
    ```

=== "Classic"
    ``` csound-orc
    kval arduinoRead iPort, iStream [, iSmooth]
    ```

### Performance

_iPort_ -- port number obtained from a _arduinoStart_ opcode.

_iStream_ -- Number of the data stream in range 0 to 30.

_iSmooth_ -- halftime of a portamento filter to smooth the stream of data. Defaults to 0 meaning no filtering.

_kval_ -- data to read in range [0, 1023].

## Examples

Here is an example of the arduinoRead opcode. It uses the file [arduinoRead.csd](../examples/arduinoRead.csd).

``` csound-csd title="Example of the arduinoRead opcode." linenums="1"
--8<-- "examples/arduinoRead.csd"
```

## See Also

[non-MIDI Devices](../oscnetwork/nonMIDIdevices.md)

More information: [New Arduino Opcodes to Simplify the Streaming of Sensor and Controller Data to Csound](https://csound.com/icsc2022/proceedings/New%20Arduino%20Opcodes%20to%20Simplify%20the%20Streaming%20of%20Sensor%20and%20Controller%20Data%20to%20Csound.pdf)

## Credits

Author: John ffitch<br>
Author: Richard Boulanger<br>
2020<br>

New in version 6.15
