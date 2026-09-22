<!--
id:midistop
category:Real-time MIDI:System Realtime
-->
# midistop
Intended to report incoming MIDI Stop messages at control rate.

> :warning: **Known implementation issue**
>
> The [Csound 7 implementation](https://github.com/csound/csound/blob/9221ecf3f551d0c5d8b15e38efb35b13ccb16729/OOps/midiops.c#L176) reads the clock-pulse field instead of the Stop field. It behaves like [midiclockin](midiclockin.md). A clock pulse can therefore produce a false Stop indication, while a Stop message on its own produces no indication. Do not rely on this version for transport control.

## Syntax

=== "Modern"
    ``` csound-orc
    kstop = midistop()
    ```

=== "Classic"
    ``` csound-orc
    kstop midistop
    ```

### Intended behavior

`kstop` should be 1 for a control cycle in which Csound detects a MIDI Stop message, and 0 otherwise. Stop uses status byte `0xFC`. It has no channel number, so the opcode takes no arguments and has no channel filter.

[MIDI Stop](https://midi.org/summary-of-midi-1-0-messages) asks a receiver to stop the current sequence. A use for this opcode is to pause a step sequencer without losing its current step, so Continue can resume from that position. The instrument must store its position and playing state, and decide what to do with notes that are already sounding.

The opcode only reports a message. It does not stop Csound, turn off instruments or keep a lasting stopped state. After a Stop message, the intended output returns to 0 on the next cycle without another Stop.

Enable MIDI input with `-M`. Once the implementation issue is fixed, check `kstop != 0` each control cycle to handle Stop. Keep the reader instrument running while the sequence is paused so it can also receive Start or Continue.

### Current behavior

| Messages detected in the cycle | Intended output | Output with the known issue |
| --- | --- | --- |
| Stop only | 1 | 0 |
| Timing Clock only | 0 | 1 |
| Stop and Timing Clock | 1 | 1 |
| Neither | 0 | 0 |

The MIDI input code records Stop separately, but this opcode reads the wrong field. Start and Continue alone do not set its output. Some senders keep sending clock while playback is stopped, so clock activity does not tell you whether the sequence is playing.

## Examples

This diagnostic example prints the reported Stop and clock flags whenever either is nonzero. It makes no sound and does not control playback. Use it to check the behavior of the Csound version you are running.

Change `-M0` to select the input device, then send Stop with clock output disabled. A correct implementation prints `Reported stop 1, clock 0`. The affected implementation prints nothing. A clock pulse alone prints `Reported stop 1, clock 1` with the issue, or `Reported stop 0, clock 1` after a fix. Stop and clock arriving together can hide the problem.

The example uses the audio device to run in real time and listens for 30 seconds. It uses [midistop.csd](../examples/midistop.csd).

``` csound-csd title="Compare the Stop and clock flags" linenums="1"
--8<-- "examples/midistop.csd"
```

## See also

[midistart](midistart.md), [midicontinue](midicontinue.md), [midiclockin](midiclockin.md), [mrtmsg](mrtmsg.md), [System realtime messages](../midi/realtime.md), [MIDI input](../midi/input.md)

## Credits

Author Victor Lazzarini, 2025.

New in Csound 7.
