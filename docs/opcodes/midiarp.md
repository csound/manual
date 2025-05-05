<!--
id:midiarp
category:Real-time MIDI:Note Output
-->
# midiarp
Generates arpeggios based on currently held MIDI notes.

The opcode will output notes in the form of MIDI note numbers, and a metronomic signal that can be used to sequence the notes. Users can choose the rate at which the notes are generated, and may also choose from a set of arpeggio patterns.

## Syntax
=== "Modern"
    ``` csound-orc
    kMidiNoteNum, kTrigger = midiarp(kRate[, kMode])
    ```

=== "Classic"
    ``` csound-orc
    kMidiNoteNum, kTrigger midiarp kRate[, kMode]
    ```

### Performance

_kRate_ -- sets the rate in cycles per second at which new notes will be generated.

_kMode_ -- Optional. Sets the mode of the arpeggio. 0 for up and down, 1, for up, 2 for down, and 3 for random. If left out, it will default to mode 0, up and down.

_kMideNoteNum_ -- the current note number in the arpeggio pattern.

_kTrigger_ -- a metronomic pulse that can be used to trigger playback of the notes in the arpeggio. This signal will output a 1 followed by 0s on each cycle. The frequency is set using the _kRate_ input parameter.

> :memo: **Note**
>
> It is important that the instrument which holds the midiarp opcode is not continuously triggered on each new MIDI note. To prevent this from happening use the massign opcode, as shown in the example below.

## Examples

This example shows how midiarp can be used to trigger arpeggios using a secondary instrument for playback. Instrument 100 listens to incoming MIDI notes, and then triggers playback using instrument 200. _massign_ is used to prevent instrument 100 from being triggered each time a new MIDI note is pressed. This examples uses the file [midiarp.csd](../examples/midiarp.csd).

``` csound-csd title="Example of the midiarp opcode" linenums="1"
--8<-- "examples/midiarp.csd"
```

## See also

[Note-on/Note-off Output](../midi/onoff.md)

## Credits

Author: Rory Walsh<br>
2017<br>
