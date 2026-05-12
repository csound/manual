<!--
id:xscanmap
category:Signal Generators:Scanned Synthesis
status:deprecated
-->
# xscanmap
Allows the position and velocity of a node in a scanned process to be read.

Plugin opcode in scansyn.

## Syntax
``` csound-orc
kpos, kvel xscanmap iscan, kamp, kvamp [, iwhich]
```

### Initialization

_iscan_ -- which scan process to read

_iwhich_ (optional) -- which node to sense. The default is 0.

### Performance

_kamp_ -- amount to amplify the _kpos_ value.

_kvamp_ -- amount to amplify the _kvel_ value.

The internal state of a node is read. This includes its position and velocity. They are amplified by the _kamp_ and _kvamp_ values.

## Examples

Here is an example of the xscanmap opcode. It uses the file [xscanmap.csd](../examples/xscanmap.csd).
``` csound-csd title="Example of the xscanmap opcode." linenums="1"
--8<-- "examples/xscanmap.csd"
```

## See Also

More information on Scanned Synthesis (as well as several other matrices) is available on the [Scanned Synthesis page](http://www.csounds.com/scanned/) at cSounds.com.

Also an article on these opcodes: [http://www.csounds.com/stevenyi/scanned/yi_scannedSynthesis.html](http://www.csounds.com/stevenyi/scanned/yi_scannedSynthesis.html), written by Steven Yi

## Credits

Author: John ffitch

New in version 4.20
