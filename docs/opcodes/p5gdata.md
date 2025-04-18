<!--
id:p5gdata
category:Instrument Control:Sensing and Control
-->
# p5gdata
Reads data fields from an external P5 Glove.

Plugin opcode in p5g. This opcode is part of the plugin repository and has to be installed separately. The plugin repository can be found here: [https://github.com/csound/plugins](https://github.com/csound/plugins)

Reads data fields from a P5 Glove controller.

## Syntax
``` csound-orc
kres p5gdata kcontrol
```

### Initialization

This opcode must be used in conjuction with a running _p5gconnect_ opcode.

### Performance

_kcontrol_ -- the code for which control to read

On each access a particular data item of the P5 glove is read. The currently implemented controls are given below, together with the macro name defined in the file _p5g_mac_:

0 (P5G_BUTTONS): returns a bit pattern for all buttons that were pressed.

1 (P5G_BUTTON_A): returns 1 if the button has just been pressed, or 0 otherwise.

2 (P5G_BUTTON_B): as above.

4 (P5G_BUTTON_C): as above.

8 (P5G_JUSTPUSH):  returns a bit pattern for all buttons that have just been pressed.

9 (P5G_JUSTPU_A):  returns 1 if the A button has just been pressed.

10 (P5G_JUSTPU_B): as above.

12 (P5G_JUSTPU_C): as above.

16 (P5G_RELEASED): returns a bit pattern for all buttons that have just been released.

17 (P5G_RELSED_A): returns 1 if the A button has just been released.

18 (P5G_RELSED_B): as above.

20 (P5G_RELSED_C): as above.

32 (P5G_FINGER_INDEX): returns the clench value of the index finger.

33 (P5G_FINGER_MIDDLE):  as above.

34 (P5G_FINGER_RING):  as above.

35 (P5G_FINGER_PINKY):  as above with little finger.

36 (P5G_FINGER_THUMB):  as above.

37 (P5G_DELTA_X):  The X position of the glove.

38 (P5G_DELTA_Y):  The Y position of the glove.

39 (P5G_DELTA_Z):   The Z position of the glove.

40 (P5G_DELTA_XR):  The X axis change (angle).

41 (P5G_DELTA_YR):  as above.

42 (P5G_DELTA_ZR):  as above.

43 (P5G_ANGLES):  The general angle

## Examples

See the example for [p5gconnect](../opcodes/p5gconnect.md).

## See Also

[non-MIDI Devices](../oscnetwork/nonMIDIdevices.md)

## Credits

Author: John ffitch<br>
Codemist Ltd<br>
2009<br>

New in version 5.12
