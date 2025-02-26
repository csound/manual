<!--
id:fluidOut
category:Signal Generators:Sample Playback
-->
# fluidOut
Outputs sound from a given fluidEngine.

## Syntax
``` csound-orc
aleft, aright fluidOut ienginenum
```

Plugin opcode in fluidOpcodes. This opcode is part of the plugin repository and has to be installed separately. The plugin repository can be found here: [https://github.com/csound/plugins](https://github.com/csound/plugins)

### Initialization

_ienginenum_ -- engine number assigned from fluidEngine

### Performance

_aleft_ -- Left channel audio output.

_aright_ -- Right channel audio output.

Invoke fluidOut in an instrument definition numbered higher than any fluidcontrol instrument definitions. All SoundFonts used in the fluidEngine numbered _ienginenum_ send their audio output to this one opcode. Send a note with an indefinite duration to this instrument to turn the SoundFonts on for as long as required.

## Examples

Here is an example of the fluidOut opcode with two fluidOuts. It uses the file [fluidOut.csd](../../examples/fluidOut.csd), [01hpschd.sf2](../../examples/01hpschd.sf2) and [22Bassoon.sf2](../../examples/22Bassoon.sf2).

``` csound-csd title="Example of the fluidOut opcode." linenums="1"
--8<-- "examples/fluidOut.csd"
```

The output should include lines like these:

```
chnl 1 using instr 1
chnl 2 using instr 2

SoundFont:   1  Bank:   0  Preset:   0  Harpsichord I-8
SoundFont:   1  Bank:   0  Preset:  70  Ethan Bassoon mono
```

## See also

[Soundfonts](../../siggen/sample)

More information on soundfonts is in the Floss Manuals: [https://flossmanual.csound.com/midi/reading-midi-files](https://flossmanual.csound.com/midi/reading-midi-files)

For other information on soundfonts look in the Wikipedia: [http://en.wikipedia.org/wiki/Soundfont](http://en.wikipedia.org/wiki/Soundfont)

## Credits

Michael Gogins (gogins at pipeline dot com), Steven Yi. Thanks to Peter Hanappe for Fluidsynth.

New in Csound5.00
