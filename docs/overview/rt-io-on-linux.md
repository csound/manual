# Realtime I/O on Linux

Under Linux, the default portaudio/portmidi settings will result in higher latency than that which can be achieved using ALSA and/or JACK (see a separate manual section on this). The portaudio/portmidi plugins are audio and MIDI servers, which provide an interface to the ALSA drivers, in a manner which is in some respects similar but fundamentally different from that provided by JACK.

> :memo: **Note**
>
> If you are able to run Csound as the root user, using the "--sched" flag will dramatically improve realtime performance, when using ALSA, however you may hang your system if you do something stupid. DO NOT use "--sched" if you are using JACK for audio output. JACK controls scheduling for the audio applications connected to it, and also tries to run at the highest possible priority. If the "--sched" flag is used, Csound and JACK will be competing rather than cooperating, resulting in extremely poor performance.

### Using ALSA

The highest level of control and the lowest possible level of latency are to be achieved using the ALSA plugins in combination with the [--sched](../invoke/cs-options-by-category.md#-sched) flag. Using [--sched](../invoke/cs-options-by-category.md#-sched) flag requires that Csound be run as the root user, which may be impossible or undesirable in some circumstances.

The ALSA plugins require the "name" of a "card" and a "device". Unless you have named your "cards" in ~/.asoundrc (or /etc/asound.conf), the "names" will actually be numbers. In order to obtain a list of the possible configurations, use the command line utilities "aplay", "arecord" and "amidi". These utilities are included with most Linux distros, or can be downloaded and built from source here:

[ftp://ftp.alsa-project.org/pub/utils/](ftp://ftp.alsa-project.org/pub/utils/)

> :memo: **Note**
>
> On every boot, the soundcard may have a different hardware order number, especially when there are more soundcards in the system. This can be awkward as every time you have to set the right number again. You can assign a fixed order by adding some lines to /etc/modprobe.d/alsa-base-conf, for example for a card with the ice1712 chip :

    ``` 
    # ALSA module ordering for soundcard
    options snd slots=snd_ice1712
    ```
  
### Audio Output

Running the following command:

```
aplay -l
```

will give you a list of the audio playback devices available on your system. Typically this list will look something like:

```
[....]
**** List of PLAYBACK Hardware Devices ****
card 0: A5451 [ALI 5451], device 0: ALI 5451 [ALI 5451]
[....]
```

If you have more than one card on your system, or if there is more than one device on your card, the list will of course be more complicated, however in all cases the information that is pertinent is the number/name of the card/device. In order to use the above soundcard for audio output, the following flag would be added to the Csound command line, ~/.csoundrc, or the `<CsOptions>` section of a CSD:

```
-+rtaudio=alsa -o dac
```

### Output with dmix

If you would like to use Csound with dmix and your soundcard does not support hardware mixing of audio streams, special care is needed in setting up of software (-b) and hardware (-B) buffers. If you get a message from Csound's ALSA driver that looks like the following:

```
ALSA: -B 8192 not allowed on this device; use 7526 instead
```

there is a good chance that you may be using dmix. If you are using dmix, the -b and -B settings of Csound must be synced the period_size and buffer_size of dmix respectively, using a ratio of the sr for the Csound project to the sample rate that dmix is set up to. The following formula will determine what settings to use for Csound given the settings of dmix:

```
-b = (csound_sr/dmix_sample_rate) * dmix_period_size
-B = (csound_sr/dmix_sample_rate)  * dmix_buffer_size
```

For example, if dmix is set to 48000 sample rate, a period_size of 1024, and a buffer_size of 8192, when running a Csound project with sr=48000, the settings for buffers should be "-b 1024 -B8192". If the sr=24000, the settings for buffers should be "-b 512 -B4096".

Because of this relationship, if a Csound project's sr does not evenly divide into the sample_rate used by dmix, then it may be difficult if not imposible to set the correct setting for -b and -B due to rounding errors. It is suggested then that if you are using sample rates different than what your setting is for dmix, then you may want to configure dmix to have a period_size and buffer_size that can be evenly divided by the ratio between the csound sr and dmix sample_rate. For example, to run a project with sr=16000, the following dmix setting:

```
pcm.amix {
   type dmix
   ipc_key 50557
   slave {
       pcm "hw:0,0"
       period_time 0
       #period_size 1024
       #buffer_size 8192
       period_size 1536
       buffer_size 12288
   }
   bindings {
       0 0
       1 1
   }
}

# route ALSA software through pcm.amix
pcm.!default {
   type plug
   slave.pcm "amix"
}
```

with period_size 1536 and buffer_size 12288 will divide nicely by 3 (the ratio of the csound sr to the dmix sample_rate) to get "-b 512 -B4096" ( (16000/48000) * 1536 = 512, (16000/48000) * 12288 = 4096 ).

> :memo: **Note**
>
> For most soundcards that this affects, the default sample rate for the card will be 48000 and the defaults for dmix will be 1024 and 8192.

### Audio Input

Typically the same card will be used for both input and output, so to continue using the foregoing example, the flag:

```
-i adc:hw:0,0
```

would be added for audio input from Card 0 Device 0. To use the default card employ one of the following flags, with the forementioned warning that this will not necessarily work:

```
-i adc
```

If you wish to use a different card or device for input, running the following utility from the command line will provide a list of input devices:

```
arecord -l
```

If, by way of an example, you wanted to use a USB audio interface, which is the second "card" in your system, for output, but wanted to use your internal soundcard, the first card in your setup, for input, you would put the following flags somewhere useful:

```
-+rtaudio=alsa -i adc:hw:0,0 -o dac:hw:1,0
```

If you wanted to use the second device on your USB interface, to send audio to a specific channel, for instance, you would use the following flags:

```
-+rtaudio=alsa -i adc:hw:0,0 -o dac:hw:1,1
```

### Using Pulseaudio

Support for [Pulseaudio](http://www.pulseaudio.org/) was added in Csound 5.09. You can specify the following settings:

1. Sink names: it's possible to use a number instead of the full name, so -odac:1 would select your second device (count starts at 0).
2. Server name: it's possible to connect to a specific server by using `-+server=<server_string>` where server_string is a name of a server or a more complex server selection string (see [pulseaudio.org](http://www.pulseaudio.org/) on server strings). This should be network transparent and should allow connections to remote machines.
3. Stream names: it is possible to label the streams generated by csound, by using `-+output_stream=<stream-name>` and `-+input_stream=<stream-name>`

Here's an example command line:

```
csound -odac:1 examples/trapped.csd -+rtaudio=pulse -+server=unix:/tmp/pulse-victor/native -+output_stream=trapped
```

### MIDI

3 Midi drivers are available: PortMidi, Raw Midi and Alsa Sequencer (since version 5.18).

Csound will use PortMidi as the default MIDI module. With PortMIDI, DEVICE is either a number for single port input, 'a' for listening to all input ports, or 'm' for mapping ports to MIDI channels above 16. In this case, device 0 uses 1-16, device 1 uses 17-32, ... device N uses (N+1)*channel. The options 'a' and 'm' are also convenient when you don't have devices as they will not generate an error.

```
-+rtmidi=PortMIDI -Ma -Q 1
```

### MIDI Input (Raw Midi driver)

In order to enable your orchestra to receive MIDI input you can use VirMIDI or MIDIThru, whichever you prefer. Setting up these virtual MIDI ports is a topic that has been covered extensively elsewhere, see [The Linux MIDI how-to](http://www.midi-howto.com/) or browse your distro's documentation or the ALSA documentation for instructions on how to install and configure either VirMIDI or MIDIThru (seqdummy). Once you have done so run:

```
amidi -l
```

for a list of available devices. Typically this will look something like the following:

```
    [....]
Device    Name
hw:1,0    Virtual Raw MIDI (16 subdevices)
hw:1,1    Virtual Raw MIDI (16 subdevices)
hw:1,2    Virtual Raw MIDI (16 subdevices)
hw:1,3    Virtual Raw MIDI (16 subdevices)
hw:2,0,0  PCR MIDI
hw:2,0,1  PCR 1
```

In this example, Csound can connect to any of the four available Virtual Raw MIDI ports, where it will listen for MIDI input. The following flag instructs Csound to listen on the first of these ports:

```
-+rtmidi=alsa -Mhw:1,0
```

You will then need to connect your hardware or software controller to the port which is hosting your Csound synthesizer. The simplest way to do this is using the "aconnect" utility. Run:

```
aconnect -li
```

for a list of available input devices, and:

```
aconnect -lo
```

for a list of available output devices (including the port to which Csound has been connected). These should give something like the following:

```
#aconnect -li
client 0: 'System' [type=kernel]
    0 'Timer           '
    1 'Announce        '
        Connecting To: 15:0
client 20: 'Virtual Raw MIDI 1-0' [type=kernel]
    0 'VirMIDI 1-0     '
client 21: 'Virtual Raw MIDI 1-1' [type=kernel]
    0 'VirMIDI 1-1     '
client 22: 'Virtual Raw MIDI 1-2' [type=kernel]
    0 'VirMIDI 1-2     '
client 23: 'Virtual Raw MIDI 1-3' [type=kernel]
    0 'VirMIDI 1-3     '
client 24: 'PCR' [type=kernel]
    0 'PCR MIDI        '
    1 'PCR 1           '
    2 'PCR 2           '


#aconnect -lo
client 20: 'Virtual Raw MIDI 1-0' [type=kernel]
    0 'VirMIDI 1-0     '
client 21: 'Virtual Raw MIDI 1-1' [type=kernel]
    0 'VirMIDI 1-1     '
client 22: 'Virtual Raw MIDI 1-2' [type=kernel]
    0 'VirMIDI 1-2     '
client 23: 'Virtual Raw MIDI 1-3' [type=kernel]
    0 'VirMIDI 1-3     '
client 24: 'PCR' [type=kernel]
    0 'PCR MIDI        '
    1 'PCR 1           '
```

In the following example, the USB keyboard which is listed above as client 24 will be connected to a Csound synthesizer which is listening on the first VirMIDI port. The keyboard has three output ports. The first (24:0) transmits messages received on the MIDI in port, the second (24:1) transmits keyboard and controller messages, and the third (24:2) transmits system exclusive messages. The following command connects the second port of the keyboard to the Csound synthesizer:

```
aconnect 24:1 20:0
```

Remember that Csound acts as a raw MIDI device and is not an ALSA sequencer client. This means that Csound will not appear in MIDI device listings and will not be available for use directly with aconnect, so you must connect to a virtual device (like 'virtual raw MIDI' or 'MIDI through') for persistent connections, or conect directly to the destination using command line flags.

### MIDI Output (Raw Midi driver)

Csound can be connected to any device which shows up on the ALSA sequencer list of output ports, obtained by "amidi -l" as above. In order to connect a Csound synthesizer to the MIDI out port of the keyboard listed above, the following flag would be used:

```
-Qhw:2,0,0
```

### MIDI Input and Output (Midi Sequencer driver)

This driver is to be preferred over the Raw Midi driver. It has these advantages:

* Multiple concurrent access.
* Scheduled by priority queues.
* Real-time event dispatching i.e., the role of the Midi Sequencer is to deliver events at the right time (sequence) to the right destination (device).

The following command will call the Midi Sequencer. Here it listens to midi port 20. The midi output port is also 20:

```
-+rtmidi=alsaseq -M20 -Q20  
```

Csound will automatically create its own ALSA sequencer port. For a list of available devices, use the following command:

```
aconnect -i -o 
```

This will create output that will look something like the following:

```
    client 0: 'System' [type=kernel]
    0 'Timer           '
    1 'Announce        '
client 14: 'Midi Through' [type=kernel]
    0 'Midi Through Port-0'
client 20: 'M Audio Delta 1010' [type=kernel]
    0 'M Audio Delta 1010 MIDI'
client 130: 'Csound' [type=user]
    0 'Csound 
```

The output of Csound will contain lines like:

```
...........
ALSASEQ: opened MIDI output sequencer
ALSASEQ: created output port 'Csound' 130:0
ALSASEQ: connected to 20:0
.............. 
...........
ALSASEQ: opened MIDI input sequencer
ALSASEQ: created input port 'Csound' 130:0
ALSASEQ: connected from 20:0
.............. 
```
