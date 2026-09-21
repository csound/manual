<!--
id:midiclockin
category:Real-time MIDI:System Realtime
-->
# midiclockin
Reports incoming MIDI Timing Clock pulses at control rate.

Use `midiclockin` to advance a sequencer or trigger an event from an external MIDI clock. Enable MIDI input with `-M` and enable clock output on the sending device. The opcode takes no arguments.

## Syntax

=== "Modern"
    ``` csound-orc
    kpulse = midiclockin()
    ```

=== "Classic"
    ``` csound-orc
    kpulse midiclockin
    ```

### Performance

`kpulse` is 1 when Csound detects an incoming MIDI Timing Clock message for the current control cycle, and 0 otherwise. Timing Clock uses status byte `0xF8`. It has no channel number, so the opcode has no channel filter.

The output is a pulse flag, not a frequency or a running count. Read [midiclockfreq](midiclockfreq.md) when you need the estimated clock frequency in Hz. Each `midiclockin` call reads the same flag without consuming it, so several instruments can respond to the same clock.

[MIDI Timing Clock](https://midi.org/about-midi-part-3midi-messages) sends 24 pulses per quarter note. Count 24 detected pulses for a quarter note, 12 for an eighth note or 6 for a sixteenth note. At 120 BPM, a steady clock sends 48 pulses per second.

### Timing and transport

Clock detection has control-cycle resolution. Several messages received during one control cycle produce a single 1, not a message count. Use a small `ksmps` when following a fast clock. MIDI delivery can also group messages together.

Count `kpulse` on every control cycle. Consecutive cycles can both contain a pulse, so using only a rising-edge detector can miss messages.

The opcode reports clock messages independently of MIDI Start, Stop and Continue. Some devices keep sending clock while their sequencer is stopped. A pulse therefore does not mean that a song is playing, and counting pulses alone does not locate the first beat of a bar. Handle transport and song position separately when those matter to your instrument.

## Examples

The example plays a short click after every 24 detected pulses. With a steady 120 BPM clock, the clicks are half a second apart. Counting begins when the score starts the reader, so its first click is not tied to the sender's first beat.

Set the external sequencer or drum machine to send MIDI clock, then change `-M0` to select its input device. The example listens for 30 seconds. Without incoming clock, it stays silent.

It uses [midiclockin.csd](../examples/midiclockin.csd).

``` csound-csd title="Trigger a click from an external MIDI clock" linenums="1"
--8<-- "examples/midiclockin.csd"
```

## See also

[midiclockfreq](midiclockfreq.md), [mclock](mclock.md), [event](event.md), [System realtime messages](../midi/realtime.md), [MIDI input](../midi/input.md)

## Credits

Author Victor Lazzarini, 2025.

New in Csound 7.
