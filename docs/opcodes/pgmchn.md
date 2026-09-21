<!--
id:pgmchn
category:Real-time MIDI:Input
-->
# pgmchn
Reads MIDI Program Change messages and returns the program number and channel.

Use `pgmchn` to select a preset from a MIDI keyboard or foot controller, or to handle program selections from several channels in one instrument. It can run in an instrument started from the score.

## Syntax

=== "Modern"
    ``` csound-orc
    kprogram, kchannel = pgmchn([ichannel])
    ```

=== "Classic"
    ``` csound-orc
    kprogram, kchannel pgmchn [ichannel]
    ```

### Initialization

`ichannel` selects the MIDI channel to watch. The default of 0 accepts every channel. Use an integer from 1 to 16 for a channel on a single input port. Csound can report higher channel numbers when it maps several input ports to separate channel ranges. Csound reads the filter at initialization.

### Performance

Both outputs run at control rate.

| Output | Matching Program Change message | No matching message this cycle |
| --- | --- | --- |
| `kprogram` | Program number from 1 to 128 | -1 |
| `kchannel` | MIDI channel, starting at 1 | 0 |

MIDI messages carry program values from 0 to 127. `pgmchn` adds 1, so a MIDI value of 0 gives program 1 and a value of 127 gives program 128. The result does not include a bank number.

Check `kchannel > 0` before using the program number. The outputs do not hold the last program. To keep a preset selected, copy `kprogram` to another k-rate variable only when a matching message arrives. Repeated messages with the same program number are still separate events. Do not rely on a change in program number to detect them.

Each instance reads at most one queued MIDI message per control cycle. A message of another type, or on a different channel from the filter, gives the no-match values for that cycle. The reader does not skip ahead to find a matching message in the same cycle.

The reader starts at the current buffer position when it initializes. It does not replay earlier messages. Separate instances have their own read positions, so reading a message in one instance does not take it away from another.

Enable live MIDI input with `-M` or read a MIDI file with `-F`. Reading with `pgmchn` does not stop Csound's normal handling of Program Change messages. Use [pgmassign](pgmassign.md) to control which instruments those messages select.

Use [midipgm](midipgm.md) when you need the channel's stored program at initialization instead of a stream of incoming messages.

## Examples

The example prints the channel and program for each Program Change message. Use it to check a keyboard or foot controller's program buttons before mapping them to presets. If the device labels its programs from 0 to 127, the printed program will be one higher.

It listens to MIDI device 0 for 30 seconds. Change `-M0` to select your device. The example makes no sound, but uses the audio device to run in real time. MIDI notes do not start extra instruments.

It uses [pgmchn.csd](../examples/pgmchn.csd).

``` csound-csd title="Read program selections from a MIDI controller" linenums="1"
--8<-- "examples/pgmchn.csd"
```

To watch only channel 3, replace `pgmchn()` with `pgmchn(3)`.

## See also

[midipgm](midipgm.md), [pgmassign](pgmassign.md), [ctlchn](ctlchn.md), [midiin](midiin.md), [MIDI input](../midi/input.md)

## Credits

Author John ffitch, 2006.
