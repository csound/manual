<!--
id:fluidControl
category:Signal Generators:Sample Playback
-->
# fluidControl
Sends MIDI note on, note off, and other messages to a SoundFont preset.

## Syntax
``` csound-orc
fluidControl ienginenum, kstatus, kchannel, kdata1, kdata2 [,imsgs]
```

Plugin opcode in fluidOpcodes. This opcode is part of the plugin repository and has to be installed separately. The plugin repository can be found here: [https://github.com/csound/plugins](https://github.com/csound/plugins)

The fluid opcodes provide a simple Csound opcode wrapper around Peter Hanappe's Fluidsynth SoundFont2 synthesizer. This implementation accepts any MIDI note on, note off, controller, pitch bend, or program change message at k-rate. Maximum polyphony is 4096 simultaneously sounding voices. Any number of SoundFonts may be loaded and played simultaneously.

### Initialization

_ienginenum_ -- engine number assigned from fluidEngine

_imsgs_ -- if zero suppresses printing of messages when commands arrive.  Default value is 1.

### Performance

_kstatus_ -- MIDI channel message status byte: 128 for note off, 144 for note on, 176 for control change, 192 for program change, or 224 for pitch bend.

_kchannel_ -- MIDI channel number to which the Fluidsynth program is assigned: from 0 to 255. MIDI channels numbered 16 or higher are virtual channels.

_kdata1_ -- For note on, MIDI key number: from 0 (lowest) to 127 (highest), where 60 is middle C. For continuous controller messages, controller number.

_kdata2_ -- For note on, MIDI key velocity: from 0 (no sound) to 127 (loudest). For continous controller messages, controller value.

Invoke fluidControl in instrument definitions that actually play notes and send control messages. Each instrument definition must consistently use one MIDI channel that was assigned to a Fluidsynth program using fluidLoad.

In this implementation, SoundFont effects such as chorus or reverb are used if and only if they are defaults for the preset. There are some ways of turning effects chorus and reverb on or off using fluidEngine, and of changing some of their parameters with fluidCCi and fluidCCk.

## Examples

Here is a more complex example of the fluidsynth opcodes written by Istvan Varga. It uses the file [fluidControl-advanced.csd](../../examples/fluidControl-advanced.csd).

``` csound-csd title="A more complex example of the fluidsynth opcodes." linenums="1"
--8<-- "examples/fluidControl-advanced.csd"
```

## See also

[Soundfonts](../../siggen/sample)

More information on soundfonts is in the Floss Manuals: [https://flossmanual.csound.com/midi/reading-midi-files](https://flossmanual.csound.com/midi/reading-midi-files)

For other information on soundfonts look in the Wikipedia: [http://en.wikipedia.org/wiki/Soundfont](http://en.wikipedia.org/wiki/Soundfont)

## Credits

Opcodes by Michael Gogins (gogins at pipeline dot com). Thanks to Peter Hanappe for Fluidsynth, and to Steven Yi for seeing that it is necessary to break up the Fluidsynth into several different Csound opcodes.

New in Csound5.00

Optional imsgs parameter introduced in version 6.14.
