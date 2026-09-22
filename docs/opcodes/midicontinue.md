<!--
id:midicontinue
category:Real-time MIDI:System Realtime
-->
# midicontinue
Intended to report incoming MIDI Continue messages at control rate.

> :warning: **Known implementation issue**
>
> The [Csound 7 implementation](https://github.com/csound/csound/blob/9221ecf3f551d0c5d8b15e38efb35b13ccb16729/OOps/midiops.c#L182) reads the clock-pulse field instead of the Continue field. It behaves like [midiclockin](midiclockin.md). A clock pulse can therefore produce a false Continue indication, while a Continue message on its own produces no indication. Do not rely on this version for transport control.

## Syntax

=== "Modern"
    ``` csound-orc
    kcontinue = midicontinue()
    ```

=== "Classic"
    ``` csound-orc
    kcontinue midicontinue
    ```

### Intended behavior

`kcontinue` should be 1 for a control cycle in which Csound detects a MIDI Continue message, and 0 otherwise. Continue uses status byte `0xFB`. It has no channel number, so the opcode takes no arguments and has no channel filter.

[MIDI Continue](https://midi.org/about-midi-part-3midi-messages) asks a receiver to resume playback from its current song position. MIDI Start instead asks it to play from the beginning. Continue does not itself provide a position or a tempo.

A use for this opcode is to resume a paused step sequencer while keeping its saved step. The instrument must store that position and its playing state, then advance from MIDI clock pulses. The opcode only reports a message. It does not resume Csound, start an instrument or keep a playing/stopped state.

Enable MIDI input with `-M`. Once the implementation issue is fixed, test `kcontinue != 0` each control cycle to respond to a Continue message.

### Current behavior

| Messages detected in the cycle | Intended output | Output with the known issue |
| --- | --- | --- |
| Continue only | 1 | 0 |
| Timing Clock only | 0 | 1 |
| Continue and Timing Clock | 1 | 1 |
| Neither | 0 | 0 |

The MIDI input code records Continue separately, but this opcode reads the wrong field. Clock and Continue arriving together can hide the problem. Sending Continue while clock output is disabled makes the difference clear.

## Examples

This diagnostic example prints the reported Continue and clock flags whenever either is nonzero. It makes no sound and does not control transport. Use it to check the behavior of the Csound version you are running.

Change `-M0` to select the input device, then send Continue with clock output disabled. A correct implementation prints `Reported continue 1, clock 0`. The affected implementation prints nothing. Sending a clock pulse alone prints `Reported continue 1, clock 1` with the issue, or `Reported continue 0, clock 1` after a fix.

The example uses the audio device to run in real time and listens for 30 seconds. It uses [midicontinue.csd](../examples/midicontinue.csd).

``` csound-csd title="Compare the Continue and clock flags" linenums="1"
--8<-- "examples/midicontinue.csd"
```

## See also

[midiclockin](midiclockin.md), [midiclockfreq](midiclockfreq.md), [mrtmsg](mrtmsg.md), [System realtime messages](../midi/realtime.md), [MIDI input](../midi/input.md)

## Credits

Author Victor Lazzarini, 2025.

New in Csound 7.
