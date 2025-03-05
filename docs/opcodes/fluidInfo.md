<!--
id:fluidInfo
category:Signal Generators:Sample Playback
-->
# fluidInfo
Retrieves program information from currently loaded soundfont.

## Syntax
``` csound-orc
SPrograms[] fluidInfo ienginenum
```

Plugin opcode in fluidOpcodes. This opcode is part of the plugin repository and has to be installed separately. The plugin repository can be found here: [https://github.com/csound/plugins](https://github.com/csound/plugins)

Iterates through the current soundfont for program information. Information is passed to a string array.

### Initialization

_SPrograms[]_ -- String array of program information

_ienginenum _ -- engine number assigned from fluidEngine

### Performance

_fluidInfo_ runs at itime only.

## Examples

Here is an example of the fluidInfo opcode. It uses the file [fluidInfo.csd](../../examples/fluidInfo.csd) and [sf_GMbank.sf2](../../examples/sf_GMbank.sf2).

``` csound-csd title="Example of the fluidInfo opcode." linenums="1"
--8<-- "examples/fluidInfo.csd"
```

## See also

[Soundfonts](../../siggen/sample)

More information on soundfonts is in the Floss Manuals: [https://flossmanual.csound.com/midi/reading-midi-files](https://flossmanual.csound.com/midi/reading-midi-files)

For other information on soundfonts look in the Wikipedia: [http://en.wikipedia.org/wiki/Soundfont](http://en.wikipedia.org/wiki/Soundfont)

## Credits

Rory Walsh, based on Steven Yi's fluidLoad opcode.

New in Csound6.12
