<!--
id:serialWrite
category:Serial I/O
-->
# serialWrite
Write data to a serial port for arduino.

Plugin opcode in serial.

## Syntax
=== "Modern"
    ``` csound-orc
    serialWrite(iPort, iByte)
    serialWrite(iPort, kByte)
    serialWrite(iPort, SBytes)
    ```

=== "Classic"
    ``` csound-orc
    serialWrite iPort, iByte
    serialWrite iPort, kByte
    serialWrite iPort, SBytes
    ```

### Performance

_iPort_ -- port number optained from a _serialBegin_ opcode.

_iByte_ -- a byte of data to write.

## Examples

Here is an example of the serialWrite opcode. It uses the file [serialWrite.csd](../examples/serialWrite.csd).

``` csound-csd title="Example of the serialWrite opcode." linenums="1"
--8<-- "examples/serialWrite.csd"
```

This is the matching Arduino code :

```
void setup() {
  // enable serial communication
  Serial.begin(9600);

  // declare pin 9 to be an output:
  pinMode(9, OUTPUT);
}

void loop() {
  // only do something if we received something (this should be at csound's k-rate)
  if (Serial.available()) {
    // set the brightness of LED (connected to pin 9) to our input value
    int brightness = Serial.read();
    analogWrite(9, brightness);

    // while we are here, get our knob value and send it to csound
    int sensorValue = analogRead(A0);
    Serial.write(sensorValue/4); // scale to 1-byte range (0-255)
  }     
}
.....
```

## See Also

[non-MIDI Devices](../oscnetwork/nonMIDIdevices.md)

## Credits

Author: Matt Ingalls<br>
2011<br>

New in version 5.14
