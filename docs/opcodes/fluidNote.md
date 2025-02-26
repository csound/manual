<!--
id:fluidNote
category:Signal Generators:Sample Playback
-->
# fluidNote
Plays a note on a channel in a fluidSynth engine.

## Syntax
``` csound-orc
fluidNote ienginenum, ichannelnum, imidikey, imidivel
```

Plugin opcode in fluidOpcodes. This opcode is part of the plugin repository and has to be installed separately. The plugin repository can be found here: [https://github.com/csound/plugins](https://github.com/csound/plugins)

### Initialization

_ienginenum_ -- engine number assigned from fluidEngine

_ichannelnum_ -- which channel number to play a note on in the given fluidEngine

_imidikey_ -- MIDI key for note (0-127)

_imidivel_ -- MIDI velocity for note (0-127)

## Examples

Here is an example of the fluidNote opcode. It uses the file [fluidNote.csd](../../examples/fluidNote.csd) and [19Trumpet.sf2](../../examples/19Trumpet.sf2).

``` csound-csd title="Example of the fluidNote opcode." linenums="1"
--8<-- "examples/fluidNote.csd"
```

The output should include a line like this:

```
SoundFont:   1  Bank:   0  Preset:  56  Trumpet metallic
```

## See also

[Soundfonts](../../siggen/sample)

More information on soundfonts is in the Floss Manuals: [https://flossmanual.csound.com/midi/reading-midi-files](https://flossmanual.csound.com/midi/reading-midi-files)

For other information on soundfonts look in the Wikipedia: [http://en.wikipedia.org/wiki/Soundfont](http://en.wikipedia.org/wiki/Soundfont)

## Credits

Michael Gogins (gogins at pipeline dot com), Steven Yi. Thanks to Peter Hanappe for Fluidsynth.
