<!--
id:wiidata
category:Instrument Control:Sensing and Control
-->
# wiidata
Reads data fields from a number of external Nintendo Wiimote controllers.

Plugin opcode in wiimote. This opcode is part of the plugin repository and has to be installed separately. The plugin repository can be found here: [https://github.com/csound/plugins](https://github.com/csound/plugins)

## Syntax
``` csound-orc
kres wiidata kcontrol [, knum]
```

### Initialization

This opcode must be used in conjuction with a running _wiiconnect_ opcode.

### Performance

> :memo: **Note**
>
> Please note that these opcodes are currently only supported on Linux.

_kcontrol_ -- the code for which control to read

_knum_ -- the number of the which Wiimote to access, which defaults to the first one.

On each access a particular data item of the Wiimote is read. The currently implemented controls are given below, together with the macro name defined in the file _wii_mac_:

0 (WII_BUTTONS): returns a bit pattern for all buttons that were pressed.

1 (WII_TWO): returns 1 if the button has just been pressed, or 0 otherwise.

2 (WII_ONE): as above.

3 (WII_B): as above.

4 (WII_A): as above.

5 (WII_MINUS): as above.

8 (WII_HOME): as above.

9 (WII_LEFT): as above.

10 (WII_RIGHT): as above.

11 (WII_DOWN): as above.

12 (WII_UP): as above.

13 (WII_PLUS): as above.

If the control number is 100 more than one of these button codes then the current state of the button is returned.  Macros with names like WII_S_TWO etc are defined for this.

If the control number is 200 more than one of these button codes then the return value is 1 if the button i held and 0 otherwise.  Macros with names like WII_H_TWO etc are defined for this.

If the control number is 300 more than one of these button codes then the value is 1 if the button has just been released, and 0 otherwise. Macros with names like WII_R_TWO etc are defined for this.

20 (WII_PITCH): The pitch of the Wiimote.  The value is in degrees between -90 and +90, unless modified by a _wiirange_ call.

21 (WII_ROLL): The roll of the Wiimote.  The value is in degrees between -90 and +90, unless modified by a _wiirange_ call.

23 (WII_FORCE_X): The force applied to the Wiimote in the three axes.

24 (WII_FORCE_Y):

25 (WII_FORCE_Z):

26 (WII_FORCE_TOTAL): The total magnitude of the force applied to the Wiimote.

27 (WII_BATTERY): The percent of the battery that remains.

28 (WII_NUNCHUK_ANG): The angle of the nunchuk joystick in degrees.

29 (WII_NUNCHUK_MAG): The magnitude of the nunchuk joystick from neutral.

30 (WII_NUNCHUK_PITCH):  The pitch of the nunchuk in degrees, in range -90 to +90 unless modified by a _wiirange_ call.

31 (WII_NUNCHUK_ROLL):  The roll of the nunchuk in degrees, in range -90 to +90 unless modified by a _wiirange_ call.

33 (WII_NUNCHUK_Z): The state of the nunchuk Z button.

34 (WII_NUNCHUK_C): The state of the nunchuk C button.

35 (WII_IR1_X): The infrared pointing of the Wiimote.

36 (WII_IR1_Y):

37 (WII_IR1_Z):

## Examples

See the example for [wiiconnect](../opcodes/wiiconnect.md).

## See Also

[non-MIDI Devices](../oscnetwork/nonMIDIdevices.md)

## Credits

Author: John ffitch<br>
Codemist Ltd<br>
2009<br>

New in version 5.11
