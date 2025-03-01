<!--
id:wiisend
category:Instrument Control:Sensing and Control
-->
# wiisend
Sends data to one of a number of external Nintendo Wiimote controllers.

Plugin opcode in wiimote. This opcode is part of the plugin repository and has to be installed separately. The plugin repository can be found here: [https://github.com/csound/plugins](https://github.com/csound/plugins)

## Syntax
``` csound-orc
kres wiisend kcontrol, kvalue [, knum]
```

### Initialization

This opcode must be used in conjuction with a running _wiiconnect_ opcode.

### Performance

> :memo: **Note**
>
> Please note that these opcodes are currently only supported on Linux.

_kcontrol_ -- the code for which control to write.

_kvalue_ -- the value to write to the control.

_knum_ -- the number of the which Wiimote to access, which defaults to the first one (zero).

On each access a particular data item of the Wiimote is written. The currently implemented controls are given below, together with the macro name defined in the file _wii_mac_:

3 (WII_RUMBLE): starts or stops the Wiimote rumbling, depending on the value of _kvalue_ (0 to stop, 1 to start).

4 (WII_SET_LEDS): set the four LED lights on the Wiimote to the binary representation of _kvalue_.

## Examples

See the example for [wiiconnect](../../opcodes/wiiconnect).

## See Also

[non-MIDI Devices](../../oscnetwork/nonMIDIdevices)

## Credits

Author: John ffitch<br>
Codemist Ltd<br>
2009<br>

New in version 5.11
