<!--
id:fluidCCi
category:Signal Generators:Sample Playback
-->
# fluidCCi
Sends a MIDI controller data message to fluid.

## Syntax
``` csound-orc
fluidCCi iEngineNumber, iChannelNumber, iControllerNumber, iValue
```

Plugin opcode in fluidOpcodes. This opcode is part of the plugin repository and has to be installed separately. The plugin repository can be found here: [https://github.com/csound/plugins](https://github.com/csound/plugins)

Sends a MIDI controller data (MIDI controller number and value to use) message to a fluid engine by number on the user specified MIDI channel number.

### Initialization

_iEngineNumber_ -- engine number assigned from fluidEngine

_iChannelNumber_ -- MIDI channel number to which the Fluidsynth program is assigned: from 0 to 255. MIDI channels numbered 16 or higher are virtual channels.

_iControllerNumber_ -- MIDI controller number to use for this message

_iValue_ -- value to set for controller (usually 0-127)

### Performance

This opcode is useful for setting controller values at init time. For continous changes, use fluidCCk.

## Examples

Here is an example of the fluidCCi opcode. It uses the file [fluidCCi.csd](../../examples/fluidCCi.csd).

``` csound-csd title="Example of the fluidCCi opcode." linenums="1"
--8<-- "examples/fluidCCi.csd"
```

## See also

[Soundfonts](../../siggen/sample)

More information on soundfonts is in the Floss Manuals: [https://flossmanual.csound.com/midi/reading-midi-files](https://flossmanual.csound.com/midi/reading-midi-files)

For other information on soundfonts look in the Wikipedia: [http://en.wikipedia.org/wiki/Soundfont](http://en.wikipedia.org/wiki/Soundfont)

## Credits

Michael Gogins (gogins at pipeline dot com), Steven Yi. Thanks to Peter Hanappe for Fluidsynth.
