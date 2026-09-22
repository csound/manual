<!--
id:midicontinue
category:Real-time MIDI:System Realtime
-->
# midicontinue
Reports incoming MIDI Continue messages at control rate.

## Syntax

=== "Modern"
    ``` csound-orc
    kcontinue = midicontinue()
    ```

=== "Classic"
    ``` csound-orc
    kcontinue midicontinue
    ```

### Performance

`kcontinue` is 1 for a control cycle in which Csound detects a MIDI Continue message, and 0 otherwise. Continue uses status byte `0xFB`. It has no channel number, so the opcode takes no arguments and has no channel filter.

Several Continue messages received in one control cycle produce a single 1. Each call reads the same flag without consuming it, so several instruments can respond to the same message. The flag remains available when note messages arrive in the same cycle and clears on the next cycle unless another Continue arrives.

[MIDI Continue](https://midi.org/about-midi-part-3midi-messages) asks a receiver to resume playback from its current song position. MIDI Start instead asks it to play from the beginning. Continue does not itself provide a position or a tempo.

A use for this opcode is to resume a paused step sequencer while keeping its saved step. The instrument must store that position and its playing state, then advance from MIDI clock pulses. The opcode only reports a message. It does not resume Csound, start an instrument or keep a playing/stopped state.

Enable MIDI input with `-M`. Test `kcontinue != 0` each control cycle to respond to a Continue message. Consecutive cycles can both contain Continue messages, so a rising-edge detector can miss them.

### Message flags

| Messages detected in the cycle | `midicontinue()` | `midiclockin()` |
| --- | --- | --- |
| Continue only | 1 | 0 |
| Timing Clock only | 0 | 1 |
| Continue and Timing Clock | 1 | 1 |
| Neither | 0 | 0 |

Continue and Timing Clock are independent. Receiving a clock pulse does not imply Continue, and receiving Continue does not imply a clock pulse.

## Examples

The example prints the Continue and clock flags whenever either is nonzero. It makes no sound and does not control transport.

Change `-M0` to select the input device, then send Continue with clock output disabled. The example prints `Reported continue 1, clock 0`. Sending a clock pulse alone prints `Reported continue 0, clock 1`.

The example uses the audio device to run in real time and listens for 30 seconds. It uses [midicontinue.csd](../examples/midicontinue.csd).

``` csound-csd title="Compare the Continue and clock flags" linenums="1"
--8<-- "examples/midicontinue.csd"
```

## See also

[midiclockin](midiclockin.md), [midiclockfreq](midiclockfreq.md), [mrtmsg](mrtmsg.md), [System realtime messages](../midi/realtime.md), [MIDI input](../midi/input.md)

## Credits

Author Victor Lazzarini, 2025.

New in Csound 7.
