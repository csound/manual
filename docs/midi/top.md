# **Real-time MIDI Support**

Csound supports realtime MIDI input and output, as well as input    from MIDI files. Realtime MIDI input is activated using the [-M](../invoke/cs-options-by-category.md#-m-device-midi-devicedevice) (or    _--midi-device_=DEVICE) command line flag. For    single port input, you    must specify the device number or name after the _-M_. For multiport input (currently    implemented only in the PortMIDI module),  use 'a' or 'm'.    For example to use device number 2, you would use something like:
  
```
csound -M2 myrtmidi.csd
```

You can find out the available devices by running Csound with --midi-devices option:
  
```
csound --midi-devices
```
 
Starting from version 6.14, the PortMIDI module (see below for a listof all modules) allows multiple ports to be mapped to higher-orderchannels. By using the 'm' device name, Csound will take inputs fromany existing MIDI device in the system and map it according to(N+1)*channel, where N is the device number as listed by PortMIDI andchannel is the original device input channel. Alternatively, the 'a'device name listens to all inputs but does not map to higher-orderchannels.
  
Realtime MIDI output is activated using [-Q](../invoke/cs-options-by-category.md#-q-device), using device number or names as shown above.
  
You can also load a MIDI file using the [-F](../invoke/cs-options-by-category.md#-f-file-midifilefile) or _--midifile_=FILE command line flag. The MIDI file is read in realtime, and behaves as if it was being performed or received in realtime. So the csound program is not aware if MIDI input comes from a MIDI file or directly from a MIDI interface.

Once realtime MIDI input and/or output has been activated, opcodes like [MIDI Input](input.md) and [MIDI Output](output.md) will have effect.

When MIDI input is enabled (with -M or -F), each incoming _noteon_ message will generate a note event for an instrument which has the same number as the channel of the event  (This means that MIDI controlled instruments are polyphonic by default, since each note will generate a new instance of the instrument.)If you have 1 instrument only, Csound works in omni mode, ie. it responds to all channels into that single instrument.If you have more than one instrument and instrs 1 - 16 , then by default  instr 1 -> chn 1, instr 2 -> chn 2, unless you alter the mapping (see [massign](../opcodes/massign.md) and [pgmassign](../opcodes/pgmassign.md) to change this behavior).For a single port input, if you have more than one instrument, but instr N in between 1 - 16 is missing, then chn N will be routed by default to the lowest order instrument.

See the [MIDI/Score Interoperability](interop.md) opcodes for information on designing instruments which can be used from the score or driven by MIDI.

There are several realtime MIDI modules available, you must use the _-+rtmidi_ flag (See [-+rtmidi](../invoke/cs-options-by-category.md#-rtmidistring)), to specify the module. The default module is portmidi which provides adequate MIDI I/O on all platforms, however for improved performance and reliability some platform specific modules are also provided.
Currently the midi modules available are:

* _portmidi_ - To use thePortMIDI system (all platforms). This is the default setting andit allows multiple-port inputs (with 'm' or 'a' device names).
* _alsa_ - To use the ALSA midi system (Linux only)
* _jack_ - To use the Jack midi system
* _winmme_ - To use the windows MME system (Windows only)
* _virtual_ - To use a virtual graphical keyboard (plugin in widgets from the plugins repository) as MIDI input (all platforms)

> :memo: **Note**
>
> When csound runs, it will process the score and then quit. If there are no events in the score, Csound will run forever. If you want to use only MIDI events instead of score events and you know how long you wish to run, you can tell Csound to run that amount of time by using the dummy [f-statement](../scoregens/f.md) like "f 0 360".    
