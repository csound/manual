# Mac OSX

### Real-time Audio

OSX users can use either the *PortAudio* (default), *auhal* (or *coreaudio*), or the *Jack* realtime audio modules. The auhal module is a native OSX module which provides good latency, but it might not work with some external hardware. The Jack module can be used for interconnecting with other applications, but you will need to install the JackOSX software in order to use it. To activate a realtime module, you can use the [-+rtaudio](../invoke/cs-options-by-category.md#-rtaudiostring) flag with value of *portaudio*, *auhal*, or *jack*. The default value is portaudio, which is activated by default without specifying it.

You also need to specify the sound device you want to use, and specify that you want to generate real-time audio ouput instead of soundfile to disk output. To do this, you must use the [-odac](../invoke/cs-options-by-category.md#-o-dacdevice-outputdacdevice) or [-o dac](../invoke/cs-options-by-category.md#-o-dacdevice-outputdacdevice) flag, which tells csound to output to the Digital-to-Analog converters instead of a file. By adding a number after the flag (e.g. -odac2), you can choose the device number you want. To find out available devices in your system, you can use a large out of range number (e.g. -odac99), and Csound will report an error, and list available devices. This numbering convention works for portaudio and auhal, but for Jack, you will need to pass the name of the desired output device after a colon (e.g. -odac:system:playback_).

Enabling realtime audio input is done using [-iadc](../invoke/cs-options-by-category.md#-i-adcdevice-inputadcdevice), which makes csound listen to the realtime audio inputs. You can again select the device by its number (or name), and check for available devices using an out of range number. Note that for input you use 'adc' instead of 'dac'. Make sure you have the appropriate input selected in your soundcard's control panel.

### Real-time MIDI

To enable Real-time MIDI on OSX, you can use the [-M](../invoke/cs-options-by-category.md#-m-device-midi-devicedevice) flag for MIDI input and the [-Q](../invoke/cs-options-by-category.md#-q-device) flag for MIDI output. You might need to specify the device number after the flag (e.g. -M2), and again, you can find the available devices by giving an out of range number.

Csound will use PortMidi as the default MIDI module. With PortMIDI, DEVICE is either a number for single port input, 'a' for listening to all input ports, or 'm' for mapping ports to MIDI channels above 16. In this case, device 0 uses 1-16, device 1 uses 17-32, ... device N uses (N+1)*channel. The options 'a' and 'm' are also convenient when you don't have devices as they will not generate an error.

```
-+rtmidi=PortMIDI -Ma -Q 1
```

There's also a native coremidi module, which can be activated with the flag:

```
-+rtmidi=cmidi
```
  

The coremidi module corrently only supports MIDI input.

A typical set of flags to enable Real-time Audio and MIDI I/O can look like:

```
-+rtmidi=cmidi -M1 -+rtaudio=auhal-odac3 -iadc3
```
