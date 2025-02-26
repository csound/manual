<!--
id:fluidSetInterpMethod
category:Signal Generators:Sample Playback
-->
# fluidSetInterpMethod
Set interpolation method for channel in Fluid Engine.

## Syntax
``` csound-orc
fluidSetInterpMethod ienginenum, ichannelnum, iInterpMethod
```

Plugin opcode in fluidOpcodes. This opcode is part of the plugin repository and has to be installed separately. The plugin repository can be found here: [https://github.com/csound/plugins](https://github.com/csound/plugins)

Lower order interpolation methods will render faster at lower fidelity while higher order interpolation methods will render slower at higher fidelity. Default interpolation for a channel is 4th order interpolation.

### Initialization

_ienginenum_ -- engine number assigned from fluidEngine

_ichannelnum_ -- which channel number to use for the preset in the given fluidEngine

_iInterpMethod_ -- interpolation method, can be any of the following

*   _0_ -- No Interpolation
*   _1_ -- Linear Interpolation
*   _4_ -- 4th Order Interpolation (Default)
*   _7_ -- 7th Order Interpolation (Highest)

## Examples

Here is an example of the fluidSetInterpMethod opcode. It uses the file [fluidSetInterpMethod.csd](../../examples/fluidSetInterpMethod.csd) and [07AcousticGuitar.sf2](../../examples/07AcousticGuitar.sf2).

``` csound-csd title="Example of the fluidSetInterpMethod opcode." linenums="1"
--8<-- "examples/fluidSetInterpMethod.csd"
```

## See also

[Soundfonts](../../siggen/sample)

More information on soundfonts is in the Floss Manuals: [https://flossmanual.csound.com/midi/reading-midi-files](https://flossmanual.csound.com/midi/reading-midi-files)

For other information on soundfonts look in the Wikipedia: [http://en.wikipedia.org/wiki/Soundfont](http://en.wikipedia.org/wiki/Soundfont)

## Credits

Author: Steven Yi

New in version 5.07
