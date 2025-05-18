# Csound options (flags) by category

## Audio File Ouput

#### -3, --format=24bit
Use 24-bit audio samples.

#### -8, --format=uchar
Use 8-bit unsigned character audio samples.

#### -A, --aiff, --format=aiff
Write an AIFF format soundfile. Use with the [-c](#-c-formatschar), [-s](#-s-formatshort), [-l](#-l-formatlong), or [-f](#-f-formatfloat) flags.

#### -a, --format=alaw
Use a-law audio samples.

#### -c, --format=schar
Use 8-bit signed character audio samples.

#### -f, --format=float
Use single-format float audio samples (not playable on some systems, but can be read by [-i](#-i-file-inputfile), [soundin](../opcodes/soundin.md) and [GEN01](../scoregens/gen01.md))

#### --format=*type*
Set the audio file output format to one of the formats available in libsndfile.  At present the list is aiff, au, avr, caf, flac, htk, ircam, mat4, mat5, MPC, nist, ogg, paf, pvf, raw, sd2, sds, svx, voc, w64, W64, wav, wavex, WVE, xi. Can also be used as --format=type:format or --format=format:type to set both the file type (wav, aiff, etc.) and sample format (short, long, float, etc.) at the same time.

#### -h, --noheader
No header on output soundfile. Don't write a file header, just binary samples.

#### -i FILE, --input=FILE
Input soundfile name. If not a full pathname, the file will be sought first in the current directory, then in that given by the environment variable [SSDIR](environment-variables.md) (if defined), then by [SFDIR](environment-variables.md). The name *stdin* will cause audio to be read from standard input.

The name *devaudio* or *adc* will request sound from the host audio input device. It is possible to select a device number by appending an integer value in the range 0 to 1023, or a device name separated by a : character (e.g. -iadc3, -iadc:hw:1,1). It depends on the host audio interface whether a device number or a name should be used. In the first case, an out of range number usually results in an error and listing the valid device numbers.

The audio coming in using *-i* can be received using opcodes like [inch](../opcodes/inch.md).

#### -J, --ircam, --format=ircam
Write an IRCAM format soundfile.

#### -K, --nopeaks
Do not generate any PEAK chunks.

#### -l, --format=long
Use long integer audio samples.

#### -n, --nosound
No sound. Do all processing, but bypass writing of sound to disk. This flag does not change the execution in any other way.

#### -o FILE, --output=FILE
Output soundfile name. If not a full pathname, the soundfile will be placed in the directory given by the environment variable [SFDIR](environment-variables.md) (if defined), else in the current directory. The name *stdout* will cause audio to be written to standard output, while *null* results in no sound output similarly to the -n flag. If no name is given, the default name will be *test*.

The name *devaudio* or *dac* (you can use *-odac* or *-o dac*) will request writing sound to the host audio output device. It is possible to select a device number by appending an integer value in the range 0 to 1023, or a device name separated by a : character (e.g. -odac3, -odac:hw:1,1). It depends on the host audio interface whether a device number or a name should be used. In the first case, an out of range number usually results in an error and listing the valid device numbers.

#### --ogg
Set output file format to ogg.  (csound 5.18 and later)

#### --vbr-quality=X
Set variable bit-rate quality for output to ogg.  (Csound 6.03 and later).

#### -R, --rewrite
Continually rewrite the header while writing the soundfile (WAV/AIFF).

#### -s, --format=short
Use short integer audio samples.

#### -u, --format=ulaw
Use u-law audio samples.

#### -W, --wave, --format=wave
Write a WAV format soundfile.

#### -Z, --dither
Switch on dithering of audio conversion from internal floating point to 32, 16 and 8-bit formats.  The default form of the dither is triangular.

#### -Z, --dither--triangular, --dither--uniform
Switch on dithering of audio conversion from internal floating point to 32, 16 and 8-bit formats.  In the case of -Z the next digit should be a 1 (for trangular) or a 2 (for uniform).  The exact interpretation depends on the output system.

#### --limiter
Use a limiter when outputing audio samples.  The limiting value is 0.5 or the value given in the range [0, 1].

## Output File Id tags

#### -+id_artist=string
(max. length = 200 characters) Artist tag in output soundfile (no spaces)

#### -+id_comment=string
(max. length = 200 characters) Comment tag in output soundfile (no spaces)

#### -+id_copyright=string
(max. length = 200 characters) Copyright tag in output soundfile (no spaces)

#### -+id_scopyright=integer
(Since version 6.05) Simple copyright/licence encoded as an integer.  Coding is:

0. "All rights reserved" (default)
1. "Creative Commons Attribution-NonCommercial-NoDerivatives (CC BY-NC-ND)"
2. "Creative Commons Attribution-NonCommercial-ShareAlike (CC BY-NC-SA)"
3. "Creative Commons Attribution-NonCommercial (CC BY-NC)"
4. "Creative Commons Attribution-NoDerivatives (CC BY-ND)"
5. "Creative Commons Attribution-ShareAlike (CC BY-SA)"
6. "Creative Commons Attribution-ShareAlike (CC BY)"
7. "Licenced under BSD"

#### -+id_date=string
(max. length = 200 characters) Date tag in output soundfile (no spaces)

#### -+id_software=string
(max. length = 200 characters) Software tag in output soundfile (no spaces)

#### -+id_title=string
(max. length = 200 characters) Title tag in output soundfile (no spaces)

## Realtime Audio Input/Output

#### -i adc[DEVICE], --input=adc[DEVICE]
The name **devaudio** or **adc** will request sound from the host audio input device. It is possible to select a device number by appending an integer value in the range 0 to 1023, or a device name separated by a : character (e.g. -iadc3, -iadc:hw:1,1). It depends on the host audio interface whether a device number or a name should be used. In the first case, an out of range number usually results in an error and listing the valid device numbers.

#### -o dac[DEVICE], --output=dac[DEVICE]
The name **dac** or **devaudio** (you can use **-odac** or **-o dac**) will request writing sound to the host audio output device. It is possible to select a device number by appending an integer value in the range 0 to 1023, or a device name separated by a : character (e.g. -odac3, -odac:hw:1,1). It depends on the host audio interface whether a device number or a name should be used. In the first case, an out of range number usually results in an error and listing the valid device numbers.

#### -+rtaudio=string
(max. length = 20 characters) Real time audio module name. The default is PortAudio. Also available, depending on platform and build options: Linux: alsa, jack; Windows: mme; Mac OS X: CoreAudio. In addition, null can be used on all platforms, to disable the use of any real time audio plugin.

#### --set-system-sr
Sets sr to the system sr, requires previous -o dac. If the audio does not support this request then -1 is reported.

#### --realtime
Realtime priority mode is switched on which the following effects:

1. all opcode audio file reading/writing is handled asynchronously by a separate thread.
2. all init-pass operations are also performed asynchronously.

#### -+server=string
Pulseaudio server name.

#### -+output_stream=string
Pulseaudio output stream name.

#### -+input_stream=string
Pulseaudio input stream name.

#### -+jack_client=[client_name]
The client name used by Csound, defaults to 'csound5'. If multiple instances of Csound connect to the JACK server, different client names need to be used to avoid name conflicts. (Linux and Mac OS X only)

#### -+jack_inportname=[input port name prefix], -+jack_outportname=[output port name prefix]
Name prefix of Csound JACK input/output ports; the default is 'input' and 'output'. The actual port name is the channel number appended to the name prefix. (Linux and Mac OS X only)

Example: with the above default settings, a stereo orchestra will create these ports in full duplex operation:

```
csound5:input1              (record left)
csound5:input2              (record right)
csound5:output1             (playback left)
csound5:output2             (playback right)
```

## MIDI File Input/Ouput

#### --aft-zero
Use zero as initial value of after-touch.

#### -F [FILE], --midifile[=FILE]
Open MIDI file input (for access using MIDI file opcodes). If *FILE* is given, read MIDI events from MIDI
file *FILE*, assigning MIDI file id 0 to it (see MIDI file input opcodes), with playback starting immediately. 

#### --midioutfile=FILENAME
Save MIDI output to a file.

#### -+mute_tracks=string
(max. length = 255 characters) Ignore events (other than tempo changes) in MIDI file tracks defined by pattern (for example, -+mute_tracks=00101 will mute the third and fifth tracks).

#### -+raw_controller_mode=boolean
Disable special handling of MIDI controllers like sustain pedal, all notes off etc., allowing the use of all the 128 controllers for any purpose. This will also set the initial value of all controllers to zero.  Default: no.

-+skip_seconds=float
(min: 0) Start playback at the specified time (in seconds), skipping earlier events in the score and MIDI file.

#### -T, --terminate-on-midi
Terminate the performance when the end of MIDI file is reached.

## MIDI Realtime Input/Ouput

#### -M DEVICE, --midi-device=DEVICE
Read MIDI events from device *DEVICE*. If using ALSA MIDI (-+rtmidi=alsa), devices are selected by name and not number. So, you need to use an option like -M hw:CARD, DEVICE where CARD and DEVICE are the card and device numbers (e.g. -M hw:1,0). In the case of CoreMIDI and MME, DEVICE should be a number, and if it is out of range, an error occurs and the valid device numbers are printed. With PortMIDI, DEVICE is either a number for single port input, 'a' for listening to all input ports, or 'm' for mapping ports to MIDI channels above 16. In this case, device 0 uses 1-16, device 1 uses 17-32, ... device N uses (N+1)*channel. The options 'a' and 'm' are also convenient when you don't have devices as they will not generate an error.

#### --midi-key=N
Route MIDI note on message key number to pfield N as MIDI value [0-127].

#### --midi-key-cps=N
Route MIDI note on message key number to pfield N as cycles per second.

#### --midi-key-oct=N
Route MIDI note on message key number to pfield N as linear octave.

#### --midi-key-pch=N
Route MIDI note on message key number to pfield N as oct.pch (pitch class).

#### --midi-velocity=N
Route MIDI note on message velocity number to pfield N as MIDI value [0-127].

#### --midi-velocity-amp=N
Route MIDI note on message velocity number to pfield N as amplitude [0-0dbFS].

#### --midioutfile=FILENAME
Save MIDI output to a file (Csound 5.00 and later only).

#### -+rtmidi=string
(max. length = 20 characters) Real time MIDI module name. Defaults to PortMIDI (if present). Other options (depending on platform and build) are Linux: alsa; MacOS: cmidi; Windows: mme, winmm. In addition, null can be used on all platforms, to disable the use of any real time MIDI plugin.

ALSA MIDI devices are selected by name and not number. So, you need to use an option like -M hw:CARD,DEVICE where CARD and DEVICE are the card and device numbers (e.g. -M hw:1,0). PortMIDI allows multiple port inputs with either -Ma or -Mm.

#### -Q DEVICE
Enables MIDI OUT operations to device id *DEVICE*. This flag allows parallel MIDI OUT and DAC performance. Unfortunately the real-time timing implemented in Csound is completely managed by DAC buffer sample flow. So MIDI OUT operations can present some time irregularities. These irregularities can be reduced by using a lower value for the [-b](#-b-num-iobufsampsnum) flag.

If using ALSA MIDI (-+rtmidi=alsa), devices are selected by name and not number. So, you need to use an option like -Q hw:CARD,DEVICE where CARD and DEVICE are the card and device numbers (e.g. -Q hw:1,0). In the case of PortMIDI, CoreMIDI and MME, DEVICE should be a number, and if it is out of range, an error occurs and the valid device numbers are printed.

## Display

#### --csd-line-nums=NUM
Determines how line numbers are counted and displayed for error messages when processing a Csound Unified Document file (.csd).  This flag has no effect if separate orchestra and score files are used.  (Csound 5.08 and later).

* 0 = line numbers are relative to the beginning of the orchestra or score sections of the CSD
* 1 = line numbers are relative to the beginning of the CSD file.  This is the default as of Csound 5.08.

#### -d, --nodisplays
Suppress all displays. See [-O](#-o-file-logfilefile) if you want to save the log to a file.
> :memo: **Note**
>
>This option only works from the command line and not from .csound7rc or a CsOptions section of a  csd file.  It needs to be acted upon before sound proper starts.  It is ignored in .csound7rc and CsOptions.

#### --displays
Enables displays, reverting the effect of any previous -d flag.

#### -G, --postscriptdisplay
Suppress graphics, use PostScript displays instead.

#### -g, --asciidisplay
Suppress graphics, use ASCII displays instead.

#### -H#, --heartbeat=NUM
Print a heartbeat after each soundfile buffer write:

* no NUM, a rotating bar.
* NUM = 1, a rotating bar.
* NUM = 2, a dot (.)
* NUM = 3, filesize in seconds.
* NUM = 4, sound a bell.

#### -m NUM, --messagelevel=NUM
Message level for standard (terminal) output. Takes the *sum* of any of the following values:

* 1 = note amplitude messages
* 2 = samples out of range message
* 4 = warning messages
* 128 = print benchmark information
* 1024 = suppress deprecated messages

And exactly one of these to select note amplitude format:

* 0 = raw amplitudes, no colours
* 32 = dB, no colors
* 64 = dB, out of range highlighted with red
* 96 = dB, all colors
* 256 = raw, out of range highlighted with red
* 512 = raw, all colours

All messages can be suppressed by using message level 16.

The default is 135 (128+4+2+1), which means all messages, raw amplitude values, and printing elapsed time at the end of performance.  The coloring of raw amplitudes was introduced in version 5.04. The supression of deprecated messages new in 6.14. Suppression of all messages is new in 6.17.

#### --m-amps=NUM
Message level for amplitudes on standard (terminal) output.

* 0 = no note amplitude messages
* 1 = note amplitude messages

#### --m-range=NUM
Message level for out of range messages on standard (terminal) output.

* 0 = no samples out of range message
* 1 = samples out of range message

#### --m-warnings=NUM
Message level for warnings on standard (terminal) output.

* 0 = no warning messages
* 1 = warning messages

#### --m-dB=NUM
Message level for amplitude format on standard (terminal) output.

* 0 = absolute amplitude messages
* 1 = dB amplitude messages

#### --m-colours=NUM
Message level for amplitude format on standard (terminal) output.

* 0 = no colouring of amplitude messages
* 1 = colouring of amplitude messages

#### --m-benchmarks=NUM
Message level for benchmark information on standard (terminal) output.

* 0 = no benchnark numbers
* 1 = print benchnark numbers

#### -+msg_color=boolean
Enable message attributes (colors etc.); might need to be disabled on some terminals which print strange characters instead of modifying text attributes. default: true.

#### -v, --verbose
Verbose translate and run. Prints details of orch translation and performance, enabling errors to be more clearly located.

#### -z NUM, --list-opcodesNUM
List opcodes in this version:

* no NUM, just show names
* NUM = 0, just show names
* NUM = 1, show arguments to each opcode using the format &lt;opname&gt; &lt;outargs&gt; &lt;inargs&gt;
* NUM = 2, show names including deprecated ones
* NUM = 3, show arguments to each opcode, including deprecated ones, using the  format &lt;opname&gt; &lt;outargs&gt; &lt;inargs&gt;

## Performance Configuration and Control

#### -B NUM, --hardwarebufsamps=NUM
Number of audio sample-frames held in the DAC *hardware* buffer. This is a threshold on which *software* audio I/O (above) will wait before returning. A small number reduces audio I/O delay; but the value is often hardware limited, and small values will risk data lates. In the case of portaudio output (the default real-time output), the -B parameter (more precisely, -B / sr) is passed as the "suggested latency" value. Other than that, Csound has no control over how PortAudio interprets the parameter. The default is 1024 on Linux, 4096 on Mac OS X and 16384 on Windows.

#### -b NUM, --iobufsamps=NUM
Number of audio sample-frames per sound i/o *software* buffer. Large is efficient, but small will reduce audio I/O delay and improve the accuracy of the timing of real time events. The default is 256 on Linux, 1024 on MacOS X, and 4096 on Windows. In real-time performance, Csound waits on audio I/O on *NUM* boundaries. It also processes audio (and polls for other input like MIDI) on orchestra *ksmps* boundaries. The two can be made synchronous. For convenience, if NUM is negative, the effective value is *ksmps * -NUM* (audio synchronous with k-period boundaries). With NUM small (e.g. 1) polling is then frequent and also locked to fixed DAC sample boundaries.

Note: if both -iadc and -odac are used at the same time (full duplex real time audio), the -b option should be set to an integer multiple of ksmps.

#### --daemon
Run in daemon mode: do not exit if CSD/orchestra is not given, is empty or does not compile.

#### -k NUM, --control-rate=NUM
Override the control rate ([kr](../opcodes/kr.md)) supplied by the orchestra.

#### -L DEVICE, --score-in=DEVICE
Read line-oriented real-time score events from device *DEVICE*. The name *stdin* will permit score events to be typed at your terminal, or piped from another process. Each line-event is terminated by a carriage-return. Events are coded just like those in a *standard numeric score*, except that an event with p2=0 will be performed immediately, and an event with p2=T will be performed T seconds after arrival. Events can arrive at any time, and in any order. The score *carry* feature is legal here, as are held notes (p3 negative) and string arguments, but ramps and *pp* or *np* references are not.

> :memo: **Note**
>
> The -L flag is only valid on *NIX systems which have pipes. It doesn't work on Windows.

#### --omacro:XXX=YYY
Set orchestra macro XXX to value YYY

#### --port=N
Set UDP port on which to listen for commands and instruments/orchestra code (implies --daemon).  See [UDP Server](../overview/udp-server.md).

#### --udp-echo
Switches on printing of UDP commands on the terminal. Any messages received by the UDP server are echoed (whether they are valid commands or not).

#### --udp-console=address:port
Redirects the console messages to a remote address:port via UDP.

#### --udp-mirror-console=address:port
Mirrors the console messages to a remote address:port via UDP.

#### -r NUM, --sample-rate=NUM
Override the sampling rate ([sr](../opcodes/sr.md)) supplied by the orchestra.

#### --sample-accurate
Start and stop instances of instruments at the nearest sample to the requested time. This is in contrast to traditional Csound which rounds the times to the nearest k-cycle.  Note that this does not work with tied notes, nor does it change the Midi timing (as this is only affected by ksmps size (control rate)).

#### --sched
*Linux only.* Use real-time scheduling and lock memory. (Also requires [-d](#-d-nodisplays) and either [-o dac](#-o-file-outputfile) or [-o devaudio](#-o-file-outputfile)). See also --sched=N below.

#### --sched=N
*Linux only.* Same as --sched, but allows specifying a priority value: if N is positive (in the range 1 to 99) the scheduling policy SCHED_RR will be used with a priority of N; otherwise, SCHED_OTHER is used with the nice level set to N. Can also be used in the format --sched=N,MAXCPU,TIME to enable the use of a "watchdog" thread that terminates Csound if the average CPU usage exceeds MAXCPU percents over a peroid of TIME seconds (new in Csound 5.00).

#### --smacro:XXX=YYY
Set score macro XXX to value YYY

#### --strset
*Csound 5.* The --strset option allows setting strset string values from the command line, in the format '--strsetN=VALUE'. It is useful for passing parameters to the orchestra (e.g. file names).

#### -+skip_seconds=float
(min: 0) Start playback at the specified time (in seconds), skipping earlier events in the score and MIDI file.

#### -t NUM, --tempo=NUM
Use the uninterpreted beats of *score.srt* for this performance, and set the initial tempo at *NUM* beats per minute. When this flag is set, the tempo of score performance is also controllable from within the orchestra. WARNING: this mode of operation is experimental and may be unreliable.

#### -j NUM, --num-threads=NUM
Make *NUM* processes available for rendering.  This is only advantageous if the number of processors on the computer is the same or more that the number of requested processes.  It also may slow rendering down if ksmps is too small.

## Miscellaneous

#### -&commat; FILE
Provide an extended command-line in file &ldquo;FILE&rdquo;

#### -C, --cscore
Use Cscore processing of the scorefile.

#### --default-paths
Reenables adding of directory of CSD/ORC/SCO to search paths, if it has been disabled by a previous [--no-default-paths](#-no-default-paths) (e.g. in [.csound7rc](order-of-precedence.md)).

#### -D, --defer-gen1
Defer GEN01 soundfile loads until performance time.

#### --env:NAME=VALUE
Set environment variable NAME to VALUE. Note: not all environment variables can be set this way, because some are read before parsing the command line. [INCDIR, SADIR, SFDIR, and SSDIR](environment-variables.md) are known to work.

#### --env:NAME+=VALUE
Append VALUE to ';' separated list of search paths in environment variable NAME (should be [INCDIR, SADIR, SFDIR, or SSDIR](environment-variables.md)). If a file is found in multiple directories, the last will be used.

#### --sinesize=integer
Set size of internal sine wave (table -1).  Should be a power of two, and defaults to 16384.

#### --expression-opt
*Note that this option has no affect in Csound7. In Csound 5 only.* Turns on some optimizations in expressions:

* Redundant assignment operations are eliminated whenever possible. This means that for example this line `a1 = a2 + a3` will compile as `a1 Add a2, a3` instead of `#a0 Add a2, a3    a1 = #a0` saving a temporary variable and an opcode call. Less opcode calls result in reduced CPU usage (an average orchestra may compile about 10% faster with --expression-opt, but it depends largely on how many expressions are used, what the control rate is (see also below), etc.; thus, the difference may be less, but also much more).

* Number of a- and k-rate temporary variables is significantly reduced. This expression
    ```
    (a1 + a2 + a3 + a4)
    ```
    will compile as
    ```
    #a0 Add a1, a2
    #a0 Add #a0, a3
    #a0 Add #a0, a4       ; (the result is in #a0)
    ```
    instead of
    ```
    #a0 Add a1, a2
    #a1 Add #a0, a3
    #a2 Add #a1, a4       ; (the result is in #a2)
    ```
    The advantages of less temporary variables are:

      * less cache memory is used, which may improve performance of orchestras with many a-rate expressions and a low control rate (e.g. ksmps = 100)

      * large orchestras may load faster due to less different identifier names
       
      * index overflow errors (i.e. when messages like this *Case2: indx=-56004 (ffff253c); (short)indx = 9532 (253c)* are printed and odd behavior or a Csound crash occurs) may be fixed, because such errors are triggered by too many different (especially a-rate) variable names in a single instrument.

    Note that this optimization (due to technical reasons) is not performed on i-rate temporary variables.

    > :warning: **Warning**
    >
    > When --expression-opt is turned on, it is not allowed to use the i() function with an expression argument, and relying on the value of k-rate expressions at i-time is unsafe.

#### --version
Exits after printing version information.

#### --print_version
Prints the version information at the end of the rendering.

#### --get-system-sr
Prints system sr and exits, requires previous -o dac. If the audio does not support this request then -1 is reported.

#### --help
Display on-line help message.

#### --devices[=x]
List audio devices (x=out, output devices only; x=in, input; else input and output) and exit.

#### --midi-devices[=x]
List midi devices (x=out, output devices only; x=in, input; else input and output) and exit.

#### -I, --i-only
*i-time only.* Allocate and initialize all instruments as per the score, but skip all p-time processing (no k-signals or a-signals, and thus no amplitudes and no sound). Provides a fast validity check of the score pfields and orchestra i-variables.  This option is exclusive of the --syntax-check-only flag.

#### -+ignore_csopts=integer
If set to 1, Csound will ignore all options specified in the csd file's CsOptions section. See [Unified File Format for Orchestras and Scores](the-csd-file-format.md)

#### --ksmps=N
Set ksmps override to N (6.05 and later).

#### -+max_str_len=integer
(min: 10, max: 10000) Maximum length of string variables + 1; defaults to 256 allowing a length of 255 characters. The length of string constants is not limited by this parameter.

#### -N, --notify
Notify (ring the bell) when score or MIDI track is done.

#### --no-default-paths
Disables adding of directory of CSD/ORC/SCO to search paths.

#### --no-expression-opt
Disables expression optimization.

#### -O FILE, --logfile=FILE
Log output to file *FILE*. If *FILE* is null (i.e. *-O null* or *--logfile=null*) all printing of messages to the console is disabled.

> :memo: **Note**
>
> This option only works from the command line and not from .csound7rc or a CsOptions section of a csd file.  It needs to be acted upon before sound proper starts.  It is ignored in .csound7rc and CsOptions.

#### --opcode-lib=LIBNAME
Load plugin library *LIBNAME*.

#### --orc orcname
Set the argument as the orchestra file.  Used when no score is required.  (Csound 5.18 and later).

#### --syntax-check-only
Causes Csound to exit immediately after the orchestra and score parsers finish checking the syntax of the input files and before the orchestra performs the score. This option is exclusive of the --i-only flag.  (Csound 5.08 and later).

#### --simple-sorted-score
Retains the sorted score file score.srt in a simple readable format upon exit.  (New in version 6.14).

An alternative form is to follow immediately with an = and a file name, to select where to write the score.

#### -x FILE, --extract-score=FILE
Extract a portion of the sorted score, score.srt, using the extract file *FILE* (see [Extract](../score/preproc.md#extract)).

#### -t0, --keep-sorted-score
Prevents Csound from deleting the sorted score file, score.srt, upon exit.

#### -U UTILITY, --utility=UTILITY
Invoke the utility program *UTILITY*. Use any invalid name to list the available utilities.
