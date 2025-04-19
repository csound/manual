# **Non-MIDI Devices**

The following opcodes connect and communicate with non-MIDI hardware devices.

### Arduino

Opcodes designed to work with an Arduino:

* [arduinoRead](../opcodes/arduinoRead.md) - Read data from an arduino.
* [arduinoReadF](../opcodes/arduinoReadF.md) - Read data from an arduino.
* [arduinoStart](../opcodes/arduinoStart.md) - Open a serial port for use with the Arduino protocol.
* [arduinoStop](../opcodes/arduinoStop.md) - Close a serial port using Arduino protocol.
* [serialBegin](../opcodes/serialBegin.md) - Open a serial port for Arduino.
* [serialEnd](../opcodes/serialEnd.md) - Close a serial port for Arduino.
* [serialFlush](../opcodes/serialFlush.md) - Flush data from a serial port.
* [serialPrint](../opcodes/serialPrint.md) - Print data from a serial port.
* [serialRead](../opcodes/serialRead.md) - Read data from a serial port.
* [serialWrite_i](../opcodes/serialWrite_i.md) - Write data to a serial port.
* [serialWrite](../opcodes/serialWrite.md) - Write data to a serial port.

### P5 Glove

Opcodes in p5glove from the plugins repository, designed to work with a P5 Glove controller:

* *p5gconnect* - Reads data from a P5 Glove controller.
* *p5gdata* - Reads data fields from an external P5 Glove.

### Joystick

Opcode designed to work with a Joystick controller (Linux only):

* [joystick](../opcodes/joystick.md) - Reads data from a joystick controller.

### Nintendo Wiimote

Opcodes designed to work with Nintendo Wiimote controllers:

* *wiiconnect* - Reads data from a number of external Nintendo Wiimote controllers.
* *wiidata* - Reads data fields from a number of external Nintendo Wiimote controllers.
* *wiirange* - Sets scaling and range limits for certain Wiimote fields.
* *wiisend* - Sends data to one of a number of external Nintendo Wiimote controllers.

These opcodes are plugins in wiimote from the plugins repository.
