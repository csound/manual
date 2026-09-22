<!--
id:midiclockfreq
category:Real-time MIDI:System Realtime
-->
# midiclockfreq
Measures the frequency of incoming MIDI Timing Clock messages in Hz.

Use `midiclockfreq` to estimate the tempo of an external sequencer or drum machine that sends MIDI clock. Enable MIDI input with `-M` and enable clock output on the sending device. MIDI clock has no channel number, and this opcode takes no arguments.

## Syntax

=== "Modern"
    ``` csound-orc
    kfreq = midiclockfreq()
    ```

=== "Classic"
    ``` csound-orc
    kfreq midiclockfreq
    ```

### Performance

`kfreq` is the number of clock pulses per second. When Csound detects a clock pulse, the opcode measures the elapsed time since the previous detected pulse and takes its reciprocal. It keeps the last result between pulses.

[MIDI Timing Clock](https://midi.org/about-midi-part-3midi-messages) sends 24 pulses per quarter note. Convert the frequency to quarter notes per minute with `kbpm = kfreq * 60 / 24`. For example, 48 Hz means 120 BPM. To obtain quarter notes per second, divide `kfreq` by 24.

This measures incoming Timing Clock messages, whose status byte is `0xF8`. It does not read a MIDI file's tempo events or the score tempo. Use [miditempo](miditempo.md) for those.

### Startup and timing

A newly allocated instance returns 0 before it has received any clock pulses. The first pulse has no earlier pulse to measure against, so its reading is not yet a reliable tempo estimate. Wait for at least two pulses. The opcode has no initialization routine to reset its saved timing, so reinitialization or reuse of an instrument instance does not guarantee a fresh estimate.

When clock messages stop, the output keeps its last value. There is no timeout, and MIDI Start, Stop and Continue messages do not reset the estimate. A positive output therefore does not tell you whether the sender is still sending clock or playing a song.

The measurement uses Csound's control-cycle timing. Smaller `ksmps` values give finer timing, but MIDI delivery timing can still make the output fluctuate. The opcode does not average or smooth the result. Several clock messages received within one control cycle count as one detected pulse.

Keep the reader running while you want to follow the clock. If you use its output to control a musical process, smooth the estimate as needed. Frequency alone does not establish beat position or synchronize transport.

## Examples

The example displays incoming clock frequency and the estimated tempo. It prints once per 24 detected pulses, which is once per quarter note for a steady MIDI clock. This also lets the reader collect enough pulses before printing its first estimate.

Set the external sequencer to send MIDI clock and change `-M0` to select its input device. At 120 BPM, the display should stay near 48 Hz and 120 BPM. It stops printing when pulses stop, even though `midiclockfreq` still holds the last estimate.

The example listens for 30 seconds. It makes no sound, but uses the audio device to run in real time.

It uses [midiclockfreq.csd](../examples/midiclockfreq.csd).

``` csound-csd title="Read the tempo of an external MIDI clock" linenums="1"
--8<-- "examples/midiclockfreq.csd"
```

## See also

[miditempo](miditempo.md), [mclock](mclock.md), [portk](portk.md), [System realtime messages](../midi/realtime.md), [MIDI input](../midi/input.md)

## Credits

Author Victor Lazzarini, 2025.

New in Csound 7.
