# Realtime I/O with JACK Connection Kit

Under a number of systems the JACK connection kit can be used for both audio and MIDI input/output. JACK is available for Linux, Mac and Windows. For more details on this, see [http://jackaudio.org/faq](http://jackaudio.org/faq)

### Scheduling

DO NOT use "--sched" if you are using JACK for audio output. JACK controls scheduling for the audio applications connected to it, and also tries to run at the highest possible priority. If the "--sched" flag is used, Csound and JACK will be competing rather than cooperating, resulting in extremely poor performance.

### JACK Audio

The simplest way to use the JACK plugin enabling input and output is as follows:

```
-+rtaudio=jack -i adc -o dac
```

Additionally, there are some command line options specific to JACK:

#### JACK Command-line Flags

**-+jack_client=[client_name]**

The client name used by Csound, defaults to 'csound7'. If multiple instances of Csound connect to the JACK server, different client names need to be used to avoid name conflicts.

**-+jack_inportname=[input port name prefix], -+jack_outportname=[output port name prefix]**

Name prefix of Csound JACK input/output ports; the default is 'input' and 'output'. The actual port name is the channel number appended to the name prefix. Example: with the above default settings, a stereo orchestra will create these ports in full duplex operation:

```
csound7:input1              (record left)
csound7:input2              (record right)
csound7:output1             (playback left)
csound7:output2             (playback right)
```

### Connecting Csound to other JACK clients

By default, connections are made to the first ports on the jack port list (generally these default to system physical ports).The plugin can connect to ports specified as names or numbers.

As names: the port name prefix is used, e.g. "system:playback_", "system:capture_", "alsa_pcm:playback_" or "alsa_pcm:capture_". For example: -odac:system:playback_ (for output), -iadc:system:capture_. The port name prefix excludes channel names.

As numbers: the base port number is given, where the connection is made to this and subsequent ports up to the number of channels. For a base port number N we will have the connections as N+0, N+1, ..., N+nchnls-1. For instance -odac2 with nchnls=1 will connect outputs to ports 2 and 3. Ports are listed as in other input/output backends.

Note that ports can be prevented from autoconnecting by passing -odac:null and -iadc:null, for output and input, respectively. Connections can also be made manually using jack connection tools.

### Notes on buffer sizes

Audio data is received from and sent to the JACK server by Csound using a ring buffer that is controlled by the -b and -B flags. -B is the total size of the buffer, while -b is the size of a single period. These values are rounded so that the total size is an integer multiple of, and greater than the period size. The difference of the Csound buffer and period size must be greater than or equal to the JACK period size.

If both -iadc and -odac are used at the same time, the -b option should be set to an integer multiple of ksmps.

An example of buffer settings for low latency on a fast Linux system:

```
jackd -d alsa -P -r 48000 -p 64 -n 4 -zt &
csound -+rtaudio=jack -b 64 -B 256 [...]
```

To improve performance, use ksmps values like 32 and 64.

The sample rate of the orchestra must be the same as that of the JACK server.

### JACK Midi

Jack can also be used for MIDI IO. For this -+rtmidi=jack is needed. For input -M followed by the requested jack MIDI port name is used to connect directly to an input stream. For output -Q followed by the jack port name is used.

For example

```
-+rtmidi=jack -Q UM-3:midi/capture_2
```

makes a conection from the Csound Midi port to the second Midi port of a Midi interface.

The options `-+jack_midi_inportname=` and `-+jack_midi_outportname=` can be used to rename Csound's MIDI IO ports. 