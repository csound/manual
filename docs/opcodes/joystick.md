<!--
id:joystick
category:Instrument Control:Sensing and Control
-->
# joystick
Reads data from a Linux joystick controller.

Plugin opcode in joystick.

## Syntax
=== "Modern"
    ``` csound-orc
    kres = joystick(kdevice, ktab)
    ```

=== "Classic"
    ``` csound-orc
    kres joystick kdevice, ktab
    ```

### Performance

> :memo: **Note**
>
> Please note that this opcode is currently only supported on GNU/Linux.

_kdevice_ -- the index of the joystick device, either /dev/js_N_ or /dev/input/js_N_.

_ktab_ -- A table to hold input results, should be at least enough elements to store one value for each stick axis and one for each button + 2.  The first two elements of the table are initialized with the number of axes and the number of buttons, respectively, when a joystick is opened. If a joystick is unplugged during performance, the opcode will repeatedly attempt to reopen the device with a delay between attempts.

## Examples

Here is an example of the joystick opcode. It uses the file [joystick.csd](../examples/joystick.csd).

``` csound-csd linenums="1"
--8<-- "examples/joystick.csd"
```

Here is another example of the joystick opcode. It uses the file [joystick-2.csd](../examples/joystick-2.csd).

``` csound-csd linenums="1"
--8<-- "examples/joystick-2.csd"
```

## See also

[Sensing and Control: Keyboard and mouse sensing](../control/sensing.md)

[non-MIDI devices](../oscnetwork/nonMIDIdevices.md)

## Credits

Author: Justin Glenn Smith<br>
2010<br>

New in version 5.17.12
