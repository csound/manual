Arduino-Joystick2Csound1g-fm1-port (version with smoothing)

- Push Joystick button to turn on note
- Use JoystickX to offset and control the modulation index of
  the foscil opcode from 0-40 via the scale opcode
- Use JoystickY to offset and control the Frequency of the foscil
  opcode up/down two octaves via the scale opcode

<CsoundSynthesizer>

<CsInstruments>

sr  = 44100
ksmps = 441
nchnls  = 2
0dbfs   = 1

Port@global:i = init(0)

// NOTE: change USB port "/dev/cu.usbmodem1414301" to correspond
//       with USB port used by Arduino on your system
Port = arduinostart("//dev/ttyACM0", 9600)    // for GNULinux

instr 1
  Y:k = arduinoread(Port, 1)  ; Joystick Y
  X:k = arduinoread(Port, 2)  ; Joystick X
  SW:k = arduinoread(Port, 3) ; Joystick Button/Switch

  Amp:k = init(0)
  Freq:k = init(0)
  Indx:k = init(1)

  Xraw:k = X
  X = port(Xraw, 0.02)  // smoothed kY stream
  Yraw:k = Y
  Y = port(Yraw, 0.02)  // smoothed kY stream

  Yscaled:k = scale(Y, 400, 100, 1023, 0) ; scaling the raw sensor
                                          ; data to a user-defined
                                          ; range of (100-400)
  Xscaled:k = scale(X, 40, 0, 1023, 0)    ; scaling the raw sensor
                                          ; data to a user-defined
                                          ; range of (0-40)

  if SW == 1 then
    Amp = 0.333
  elseif SW == 0 then
    Amp = 0
  endif

  Out:a = foscil(1, Freq + Yscaled, 1, 1, Indx + Xscaled, 1)
  out(Out*Amp, Out*Amp)

  printks("Button=%d, RawX=%d, ScaleX=%d, RawY=%d, ScaleY=%d \\n", \
          0.5, SW, X, Xscaled, Y, Yscaled)
 endin

</CsInstruments>

<CsScore>

f 1 0 16384 10 1

i 1 0 z

e

</CsScore>

</CsoundSynthesizer>

<arduinoSketch>
// Joystick Example

// John ffitch & Richard Boulanger
// June 11, 2020

// BreadBoard & Arduino Setup

// Insert the Joystick Controller into the breadboard
// NOTE:  Joystick Pins (in order from left to right) are:
           GND, 5V, vrX, vrY, SW
// Connect the power rails on breadboard to 5V and GND on Arduino
// Connect GND and 5V from Joystick to + and - power rails on
//         the breadboard
// Connect Joystick vrX on breadboard to Analog In A0 on the Arduino
// Connect Joystick vrY on breadboard to Analog In A1 on the Arduino
// Connect Joystick SW on breadboard to Digital Pin 2 on Arduino

// Arduino pin numbers
// Note: Because of the way that the Joystick stands up in a
//       breadboard, in this example the vrX and vrY have been swapped.

const int SW_pin = 2; // Joystick switch output connected to
                      //   Arduino digital pin 2
const int Y_pin = 0;  // Joystick Y output connected to Arduino
                      //   analog pin A0
const int X_pin = 1;  // Joystick X output connected to Arduino
                      //   analog pin A1

int lastState_SW_pin = 1;
int currentState_SW_pin;

void setup() {
              // NOTE: Digital pins can be either inputs or outputs.
  pinMode(SW_pin, INPUT_PULLUP); // Setting digital pin to input mode
                                 // and using onboard pullup resistor
                                 // to reduce noise.

  Serial.begin(9600);
}

// put_val( ) - a function to send data values to the Csound
//              "arduinoRead" opcode
// The first argument of the put_val function "int senChan" sets
// the software channel number that Csound reads
// NOTE: "senChan" does "not" define the input pin that is used on
// the Arduino for a specific sensor
// The specific Arduino input pin used by any sensor is assigned
// and set elsewhere in the Arduino sketch and mapped to a
// user-defined put_val "senChan" channel

void put_val(int senChan, int senVal)
        // Set the Csound receive channel "senChan", and read from
        // the sensor data stream "senVal"
{       // The packing of the data is sssssvvv 0vvvvvvv where s is a
        // senChan bit, v a senVal bit and 0 is zero` bit
  int   low = senVal&0x7f;
  int hi = ((senVal>>7)&0x07) | ((senChan&0x1f)<<3);
  Serial.write(low); Serial.write(hi);
}

void loop() {

   Serial.write(0xf8);

   int currentState_SW_pin = digitalRead(SW_pin); // reading digital
                                                  // input 2 and
                                                  // assigning it to
                                                  // "currentState..."

  if (currentState_SW_pin != lastState_SW_pin)
  {                           // checking if the value has changed
    if (currentState_SW_pin == 1)
    {
      put_val(3,0); // In this sketch, the Joystick button,
                    //in Arduino digital pin 2, is sending a 0 or 1
                    // to Csound arduinoRead channel 3
    }
    else
    {
      put_val(3,1);
    }
  }

  lastState_SW_pin = currentState_SW_pin;

  int X = analogRead(X_pin); // reading the Joystick vrX data
                             //  (0-1023) and asigning to X
    put_val(2,X);            // In this sketch, the Joystick vrX,
                             // in Arduino analog pin A1, is sending
                             // a 0-1023 to Csound arduinoRead channel 2

  int Y = analogRead(Y_pin); // reading the Joystick vrY data
                             // (0-1023) and asigning to Y
    put_val(1,Y);            // In this sketch, the Joystick vrY,
                             // in Arduino analog pin A0, is sending
                             // a 0-1023 to Csound arduinoRead channel 1

  delay(10);

}

</arduinoSketch>