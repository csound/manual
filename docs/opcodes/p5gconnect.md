<!--
id:p5gconnect
category:Instrument Control:Sensing and Control
-->
# p5gconnect
Reads data from a P5 Glove controller.

Plugin opcode in p5g. This opcode is part of the plugin repository and has to be installed separately. The plugin repository can be found here: [https://github.com/csound/plugins](https://github.com/csound/plugins)

Opens and at control-rate polls a P5 Glove controller.

## Syntax
``` csound-orc
p5gconnect
```

### Initialization

The opcode locates a P5 Glove attached to the computer by USB, and starts a listener thread to poll the device.

### Performance

Every control cycle the glove is polled for its position, and finger and button states.  These values are read by the _p5gdata_ opcode.

## Examples

Here is an example of the p5g opcodes. It uses the file [p5g.csd](../examples/p5g.csd).

``` csound-csd title="Example of the p5g opcodes." linenums="1"
--8<-- "examples/p5g.csd"
```

## See Also

[non-MIDI Devices](../oscnetwork/nonMIDIdevices.md)

## Credits

Author: John ffitch<br>
Codemist Ltd<br>
2009<br>

New in version 5.12
