<!--
id:fluidLoad
category:Signal Generators:Sample Playback
-->
# fluidLoad
Loads a SoundFont into a fluidEngine, optionally listing banks and presets for SoundFont.

## Syntax
``` csound-orc
isfnum fluidLoad soundfont, ienginenum[, ilistpresets]
```

Plugin opcode in fluidOpcodes. This opcode is part of the plugin repository and has to be installed separately. The plugin repository can be found here: [https://github.com/csound/plugins](https://github.com/csound/plugins)

### Initialization

_isfnum_ -- number assigned to just-loaded
soundfont.

_soundfont_ -- string specifying a SoundFont filename. Note that any number of SoundFonts may be loaded (obviously, by different invocations of fluidLoad).

_ienginenum_ -- engine number assigned from fluidEngine

_ilistpresets_ -- optional, if specified, lists all Fluidsynth programs for the just-loaded SoundFont. A Fluidsynth program is a combination of SoundFont ID, bank number, and preset number that is assigned to a MIDI channel.

### Performance

Invoke fluidLoad in the orchestra header, any number of times. The same SoundFont may be invoked to assign programs to MIDI channels any number of times; the SoundFont is only loaded the first time.

## Examples

Here is an example of the fluidLoad opcode. It uses the file [fluidLoad.csd](../../examples/fluidLoad.csd) and [07AcousticGuitar.sf2](../../examples/07AcousticGuitar.sf2).

``` csound-csd title="Example of the fluidLoad opcode." linenums="1"
--8<-- "examples/fluidLoad.csd"
```

The output should include a line like this:

```
SoundFont:   1  Bank:   0  Preset:   0  Seagul Acoustic Git
```

## See also

[Soundfonts](../../siggen/sample)

More information on soundfonts is in the Floss Manuals: [https://flossmanual.csound.com/midi/reading-midi-files](https://flossmanual.csound.com/midi/reading-midi-files)

For other information on soundfonts look in the Wikipedia: [http://en.wikipedia.org/wiki/Soundfont](http://en.wikipedia.org/wiki/Soundfont)

## Credits

Michael Gogins (gogins at pipeline dot com), Steven Yi. Thanks to Peter Hanappe for Fluidsynth.

New in Csound5.00
