<!--
id:wiirange
category:Instrument Control:Sensing and Control
-->
# wiirange
Sets scaling and range limits for certain Wiimote fields.

Plugin opcode in wiimote. This opcode is part of the plugin repository and has to be installed separately. The plugin repository can be found here: [https://github.com/csound/plugins](https://github.com/csound/plugins)

## Syntax
``` csound-orc
wiirange icontrol, iminimum, imaximum [, inum]
```

### Initialization

This opcode must be used in conjuction with a running _wiiconnect_ opcode.

_icontrol_ -- which control is to be scaled. This must be one of 20 (WII_PITCH), 21 (WII_ROLL), 30 (WII_NUNCHUK_PITCH), 31 (WII_NUNCHUK_ROLL).

_iminimum_ -- minimun value for control.

_imaximum_ -- maximum value for control.

> :memo: **Note**
>
> Please note that these opcodes are currently only supported on Linux.

## Examples

See the example for [wiiconnect](../opcodes/wiiconnect.md).

## See Also

[non-MIDI Devices](../oscnetwork/nonMIDIdevices.md)

## Credits

Author: John ffitch<br>
Codemist Ltd<br>
2009<br>

New in version 5.11
