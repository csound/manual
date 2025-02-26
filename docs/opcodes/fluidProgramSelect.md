<!--
id:fluidProgramSelect
category:Signal Generators:Sample Playback
-->
# fluidProgramSelect
Assigns a preset from a SoundFont to a channel on a fluidEngine.

## Syntax
``` csound-orc
fluidProgramSelect ienginenum, ichannelnum, isfnum, ibanknum, ipresetnum
```

Plugin opcode in fluidOpcodes. This opcode is part of the plugin repository and has to be installed separately. The plugin repository can be found here: [https://github.com/csound/plugins](https://github.com/csound/plugins)

### Initialization

_ienginenum_ -- engine number assigned from fluidEngine

_ichannelnum_ -- which channel number to use for the preset in the given fluidEngine

_isfnum_ -- number of the SoundFont from which the preset is assigned

_ibanknum_ -- number of the bank in the SoundFont from which the preset is assigned

_ipresetnum_ -- number of the preset to assign

## Examples

Here is an example of the fluidProgramSelect opcode. It uses the file [fluidProgramSelect.csd](../../examples/fluidProgramSelect.csd).

``` csound-csd title="Example of the fluidProgramSelect opcode." linenums="1"
--8<-- "examples/fluidProgramSelect.csd"
```

Here is another more complex example of the fluidsynth opcodes written by Istvan Varga. It uses the file [fluidcomplex.csd](../../examples/fluidcomplex.csd).

``` csound-csd title="Another more complex example of the fluidsynth opcodes." linenums="1"
--8<-- "examples/fluidcomplex.csd"
```

## See also

[Soundfonts](../../siggen/sample)

More information on soundfonts is in the Floss Manuals: [https://flossmanual.csound.com/midi/reading-midi-files](https://flossmanual.csound.com/midi/reading-midi-files)

For other information on soundfonts look in the Wikipedia: [http://en.wikipedia.org/wiki/Soundfont](http://en.wikipedia.org/wiki/Soundfont)

## Credits

Michael Gogins (gogins at pipeline dot com), Steven Yi. Thanks to Peter Hanappe for Fluidsynth.
