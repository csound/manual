<!--
id:ctlchn
category:Real-time MIDI:Input
-->
# ctlchn
Reads MIDI controller messages and returns their value, controller number and channel.

Use `ctlchn` to find which knob or pedal sent a message, or to route controller messages from several MIDI channels. It can run in an instrument started from the score and does not need a MIDI note to trigger it.

## Syntax

=== "Modern"
    ``` csound-orc
    kvalue, knumber, kchannel = ctlchn([ichannel] [, icontroller])
    ```

=== "Classic"
    ``` csound-orc
    kvalue, knumber, kchannel ctlchn [ichannel] [, icontroller]
    ```

### Initialization

`ichannel` selects the MIDI channel to watch. Use 1 through 16 for a single MIDI input port, or 0 for all channels. The default is 0. Csound can report higher channel numbers when it maps several input ports to separate channel ranges.

`icontroller` selects a controller number from 1 through 127. The default of 0 accepts every controller number, including controller 0. To select only controller 0, leave this filter at 0 and check `knumber == 0` when a message arrives.

Both filters are fixed at initialization. To watch one controller on all channels, pass 0 as the first argument. For example, `ctlchn(0, 7)` watches controller 7 on every channel.

### Performance

All three outputs run at control rate.

| Output | Matching controller message | No matching message this cycle |
| --- | --- | --- |
| `kvalue` | Raw controller value from 0 through 127 | -1 |
| `knumber` | Controller number from 0 through 127 | -1 |
| `kchannel` | MIDI channel, starting at 1 | 0 |

Check `kchannel > 0` before using a message. A controller value of zero is valid. These outputs describe a message for the current cycle and do not hold the previous controller value. If you need to keep a setting, assign it to another k-rate variable only when a matching message arrives. [ctrl7](ctrl7.md) reads a controller's stored value and can scale it to a chosen range.

Each instance reads at most one queued MIDI message per control cycle. It consumes non-controller messages and messages that do not match its filters too, returning the no-match values for that cycle. It does not skip ahead through the queue to find a match within the same cycle.

The reader starts at the current MIDI buffer position when it initializes. It does not replay messages that arrived before then. Separate instances have their own read positions.

Enable live MIDI input with `-M` or read a MIDI file with `-F`. See [MIDI input](../midi/input.md) and the [command-line flags](../invoke/cs-options-alphabetically.md).

## Examples

The example prints the channel, controller number and value whenever a controller message arrives. Use it to identify the messages sent by a knob, fader or pedal before assigning that control to an instrument parameter.

It listens to MIDI device 0 for 30 seconds. Change `-M0` to select your device. MIDI notes do not start extra instrument instances because `massign 0, 0` disables that mapping. The example makes no sound, but uses the audio device to run in real time.

It uses [ctlchn.csd](../examples/ctlchn.csd).

``` csound-csd title="Identify incoming MIDI controllers" linenums="1"
--8<-- "examples/ctlchn.csd"
```

To watch just controller 7 on channel 3, replace `ctlchn()` with `ctlchn(3, 7)`.

## See also

[midiin](midiin.md), [ctrl7](ctrl7.md), [midictrl](midictrl.md), [massign](massign.md), [MIDI input and initialization](../midi/input.md)

## Credits

Author John ffitch, 2006.
