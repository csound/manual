<!--
id:serialBegin
category:Serial I/O
-->
# serialBegin
Open a serial port for arduino.

Plugin opcode in serial.

## Syntax
=== "Modern"
    ``` csound-orc
    iPort = serialBegin(SPortName [, ibaudRate])
    ```

=== "Classic"
    ``` csound-orc
    iPort serialBegin SPortName [, ibaudRate]
    ```

### Initialization

_SPortName_ -- port name number

_ibaudrate_ -- serial speed, defaulting to 9600 bps.

## Examples

Here is an example of the serialBegin opcode. It uses the file [serialBegin.csd](../examples/serialBegin.csd).

``` csound-csd title="Example of the serialBegin opcode." linenums="1"
--8<-- "examples/serialBegin.csd"
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
