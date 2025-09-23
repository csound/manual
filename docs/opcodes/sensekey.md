<!--
id:sensekey
category:Instrument Control:Sensing and Control
-->
# sensekey
Returns the ASCII code of a key that has been pressed, or -1 if no key has been pressed.

## Syntax
=== "Modern"
    ``` csound-orc
    kres [, kkeydown] = sensekey()
    ```

=== "Classic"
    ``` csound-orc
    kres [, kkeydown] sensekey
    ```

### Performance

_kres_ - returns the ASCII value of a key which is pressed or released.

_kkeydown_ - returns 1 if the key was pressed, 0 if it was released or if there is no key event.

_kres_ can be used to read keyboard events from stdin and returns the ASCII value of any key that is pressed or released, or it returns -1 when there is no keyboard activity. The value of _kkeydown_ is 1 when a key was pressed, or 0 otherwise. This behavior is emulated by default, so a key release is generated immediately after every key press. To have full functionality, FLTK can be used to capture keyboard events. *FLpanel* (plugin opcode in widgets from the plugins repository) can be used to capture keyboard events and send them to the sensekey opcode, by adding an additional optional argument. See *FLpanel* for more information.

> :memo: **Note**
>
> This opcode can also be written as [sense](../opcodes/sense.md).

## Examples

Here is an example of the sensekey opcode. It uses the file [sensekey.csd](../examples/sensekey.csd).

``` csound-csd title="Example of the sensekey opcode." linenums="1"
--8<-- "examples/sensekey.csd"
```

## See also

[Sensing and Control: Keyboard and mouse sensing](../control/sensing.md)

## Credits

Author: John ffitch<br>
University of Bath, Codemist. Ltd.<br>
Bath, UK<br>
October 2000<br>

New in Csound version 4.09. Renamed in Csound version 4.10.
