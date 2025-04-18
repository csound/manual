# Windows

### Real-time Audio

Windows users can use either the default *PortAudio* Realtime module, or the *winmm* Realtime Audio Module. The winmm module is a native windows module which provides great stability, but latency will usually be too high for realtime interaction. To activate a realtime module, you can use the [-+rtaudio](../invoke/cs-options-by-category.md#-rtaudiostring) flag with value of *portaudio* or *winmme* The default value is *portaudio*, which is activated by default without specifying it.

You also need to specify the sound device you want to use, and specify that you want to generate real-time audio ouput instead of soundfile to disk output. To do this, you must use the [-odac](../invoke/cs-options-by-category.md#-o-dacdevice-outputdacdevice) or [-o dac](../invoke/cs-options-by-category.md#-o-dacdevice-outputdacdevice) flag, which tells csound to output to the Digital-to-Analog converters instead of a file. By adding a number after the flag (e.g. -odac2), you can choose the device number you want. To find out available devices in your system, you can use a large out of range number (e.g. -odac99), and csound will report an error, and list available devices.

When choosing the device number under Portaudio, you are also choosing the driver interface, since Portaudio supports WinMME, DirectX and ASIO. If you have an ASIO capable interface or an ASIO driver emulator like [ASIO4ALL](http://www.asio4all.com/), the device will show multiple times, once for each driver interface. ASIO will give you the best latency on your system, so if available it should be your choice for realtime audio output.

Enabling realtime audio input is done using [-iadc](../invoke/cs-options-by-category.md#-i-adcdevice-inputadcdevice), which makes csound listen to the realtime audio outputs. You can again select the device by its number, and check for available devices using an out of range number. Note that for input you use 'adc' instead of 'dac'. Make sure you have the appropriate input selected in your soundcard's control panel.

### Real-time MIDI

To enable Real-time MIDI on Windows, you can use the [-M](../invoke/cs-options-by-category.md#-m-device-midi-devicedevice) flag for MIDI input and the [-Q](../invoke/cs-options-by-category.md#-q-device) flag for MIDI output. You might need to specify the device number after the flag (e.g. -M2), and again, you can find the available devices by giving an out of range number.

Csound will use PortMidi as the default MIDI module. With PortMIDI, DEVICE is either a number for single port input, 'a' for listening to all input ports, or 'm' for mapping ports to MIDI channels above 16. In this case, device 0 uses 1-16, device 1 uses 17-32, ... device N uses (N+1)*channel. The options 'a' and 'm' are also convenient when you don't have devices as they will not generate an error.

```
-+rtmidi=PortMIDI -Ma -Q 1
```

There's also a native winmme module, which can be activated with the flag:

```
-+rtmidi=winmme
```

A typical set of flags to enable Real-time Audio and MIDI I/O can look like:

```
-+rtmidi=winmme -M1 -Q1 -+rtaudio=portaudio -odac3 -iadc3
```
