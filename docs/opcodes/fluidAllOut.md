<!--
id:fluidAllOut
category:Signal Generators:Sample Playback
-->
# fluidAllOut
Collects all audio from all Fluidsynth engines in a performance.

## Syntax
``` csound-orc
aleft, aright fluidAllOut
```

Plugin opcode in fluidOpcodes. This opcode is part of the plugin repository and has to be installed separately. The plugin repository can be found here: [https://github.com/csound/plugins](https://github.com/csound/plugins)

### Performance

_aleft_ -- Left channel audio output.

_aright_ -- Right channel audio output.

Invoke fluidAllOut in an instrument definition numbered higher than any fluidcontrol instrument definitions. All SoundFonts send their audio output to this one opcode. Send a note with an indefinite duration to this instrument to turn the SoundFonts on for as long as required.

In this implementation, SoundFont effects such as chorus or reverb are used if and only if they are defaults for the preset. There is no means of turning such effects on or off, or of changing their parameters, from Csound.

## Examples

Here is an example of the fluidAllOut opcodes. It uses the file [fluidAllOut.csd](../../examples/fluidAllOut.csd).
``` csound-csd title="Example of the fluidAllOut opcode." linenums="1"
--8<-- "examples/fluidAllOut.csd"
```

## See also

[Soundfonts](../../siggen/sample)

More information on soundfonts is in the Floss Manuals: [https://flossmanual.csound.com/midi/reading-midi-files](https://flossmanual.csound.com/midi/reading-midi-files)

For other information on soundfonts look in the Wikipedia: [http://en.wikipedia.org/wiki/Soundfont](http://en.wikipedia.org/wiki/Soundfont)

## Credits

Opcode by Michael Gogins (gogins at pipeline dot com). Thanks to Peter Hanappe for Fluidsynth, and to Steven Yi for seeing that it is necessary to break up the Fluidsynth into several different Csound opcodes.
