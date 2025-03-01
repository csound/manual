# **Non-MIDI Devices**

The following opcodes connect and communicate with non-MIDI hardware devices.

### Arduino

Opcodes designed to work with an Arduino:

* [arduinoRead](../../opcodes/arduinoRead) - Read data from an arduino.
* [arduinoReadF](../../opcodes/arduinoReadF) - Read data from an arduino.
* [arduinoStart](../../opcodes/arduinoStart) - Open a serial port for use with the Arduino protocol.
* [arduinoStop](../../opcodes/arduinoStop) - Close a serial port using Arduino protocol.
* [serialBegin](../../opcodes/serialBegin) - Open a serial port for Arduino.
* [serialEnd](../../opcodes/serialEnd) - Close a serial port for Arduino.
* [serialFlush](../../opcodes/serialFlush) - Flush data from a serial port.
* [serialPrint](../../opcodes/serialPrint) - Print data from a serial port.
* [serialRead](../../opcodes/serialRead) - Read data from a serial port.
* [serialWrite_i](../../opcodes/serialWrite_i) - Write data to a serial port.
* [serialWrite](../../opcodes/serialWrite) - Write data to a serial port.

### P5 Glove

Opcodes designed to work with a P5 Glove controller:

* [p5gconnect](../../opcodes/p5gconnect) - Reads data from a P5 Glove controller.
* [p5gdata](../../opcodes/p5gdata) - Reads data fields from an external P5 Glove.

### Joystick

Opcode designed to work with a Joystick controller (Linux only):

* [joystick](../../opcodes/joystick) - Reads data from a joystick controller.

### Nintendo Wiimote

Opcodes designed to work with Nintendo Wiimote controllers:

* [wiiconnect](../../opcodes/wiiconnect) - Reads data from a number of external Nintendo Wiimote controllers.
* [wiidata](../../opcodes/wiidata) - Reads data fields from a number of external Nintendo Wiimote controllers.
* [wiirange](../../opcodes/wiirange) - Sets scaling and range limits for certain Wiimote fields.
* [wiisend](../../opcodes/wiisend) - Sends data to one of a number of external Nintendo Wiimote controllers.
