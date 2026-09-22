<!--
id:midistart
category:Real-time MIDI:System Realtime
-->
# midistart
Reports incoming MIDI Start messages at control rate.

Use `midistart` to reset a sequence or trigger a cue when an external sequencer sends Start. Enable MIDI input with `-M` and enable transport output on the sending device. The opcode takes no arguments.

## Syntax

=== "Modern"
    ``` csound-orc
    kstart = midistart()
    ```

=== "Classic"
    ``` csound-orc
    kstart midistart
    ```

### Performance

`kstart` is 1 when Csound detects a MIDI Start message for the current control cycle, and 0 otherwise. Start uses status byte `0xFA`. It has no channel number, so the opcode has no channel filter.

The result is a pulse, not a lasting playing state. It returns to 0 on the next cycle without a Start message, even if the sender is still playing. MIDI Clock, Stop and Continue messages do not set this flag.

Each call reads the same flag without consuming it. Several instruments can respond to the same Start message. Several Start messages received in one control cycle produce a single 1. Check `kstart` on every cycle rather than detecting only a change from 0 to 1, since consecutive cycles can both receive Start messages.

MIDI Start asks a receiver to play from the beginning. Continue asks it to resume from its current position. `midistart` only reports the message. It does not start Csound, rewind the score or reset a sequence for you. Keep the reader instrument running and put any reset or trigger code inside an `if kstart == 1` block.

Use [midiclockin](midiclockin.md) to follow the sender's clock pulses. Start itself supplies neither a tempo nor a continuing clock.

## Examples

The example plays a short cue each time a sequencer sends MIDI Start. This can help you check that Csound receives the sequencer's transport messages before connecting them to a sequence or a longer sound.

Change `-M0` to select your MIDI input device and set the sender to transmit transport messages. The example listens for one minute. Clock, Stop and Continue messages alone leave it silent.

It uses [midistart.csd](../examples/midistart.csd).

``` csound-csd title="Play a cue when a MIDI sequencer starts" linenums="1"
--8<-- "examples/midistart.csd"
```

## See also

[midicontinue](midicontinue.md), [midiclockin](midiclockin.md), [mrtmsg](mrtmsg.md), [event](event.md), [System realtime messages](../midi/realtime.md), [MIDI input](../midi/input.md)

## Credits

Author Victor Lazzarini, 2025.

New in Csound 7.
