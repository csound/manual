<!--
id:fluidEngine
category:Signal Generators:Sample Playback
-->
# fluidEngine
Instantiates a fluidsynth engine.

## Syntax
``` csound-orc
ienginenum fluidEngine [iChorusEnabled] [, iRevervEnabled] [, iNumChannels] [, iPolyphony]
```

Plugin opcode in fluidOpcodes. This opcode is part of the plugin repository and has to be installed separately. The plugin repository can be found here: [https://github.com/csound/plugins](https://github.com/csound/plugins)

Instantiates a fluidsynth engine, and returns _ienginenum_ to identify the engine. _ienginenum_ is passed to other other opcodes for loading and playing SoundFonts and gathering the generated sound.

### Initialization

_ienginenum_ -- engine number assigned from fluidEngine.

_iChorusEnabled_ -- optionally set to 0 to disable any chorus effect in the loaded SoundFonts.

_iReverbEnabled_ -- optionally set to 0 to disable any reverb effect in the loaded SoundFonts.

_iNumChannels_ -- number of channels to use; range is 16-256 and Csound default is 256 (Fluidsynth's default is 16).

_iPolyphony_ -- number of voices to be played in parallel; range is 16-4096 and Csound default is 4096 (Fluidsynth's default is 256). Note: this is not the number of notes played at the same time as a single note may use create multiple voices depending on instrument zones and velocity/key of played note.

## Examples

Here is example of the fluidsynth opcodes using 2 engines. It uses the file [fluidEngine.csd](../../examples/fluidEngine.csd) and [midichn_advanced.mid](../../examples/midichn_advanced.mid).

``` csound-csd title="Example of the fluidsynth opcodes using 2 engines." linenums="1"
--8<-- "examples/fluidEngine.csd"
```

## See also

[Soundfonts](../../siggen/sample)

More information on soundfonts is in the Floss Manuals: [https://flossmanual.csound.com/midi/reading-midi-files](https://flossmanual.csound.com/midi/reading-midi-files)

For other information on soundfonts look in the Wikipedia: [http://en.wikipedia.org/wiki/Soundfont](http://en.wikipedia.org/wiki/Soundfont)

## Credits

Michael Gogins (gogins at pipeline dot com), Steven Yi. Thanks to Peter Hanappe for Fluidsynth.

Optional _iNumChannels_ and _iPolyphony_ parameters added in 5.07

Order of arguments corrected in manual August 2019.
