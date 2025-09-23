<!--
id:control
category:Instrument Control:Sensing and Control
-->
# control
Configurable slider controls for realtime user input. Requires Winsound or TCL/TK. It reads a slider's value.

Plugin opcode in control.

## Syntax
=== "Modern"
    ``` csound-orc
    kres = control(knum)
    ```

=== "Classic"
    ``` csound-orc
    kres control knum
    ```

### Performance

Note that this opcode is not available on Windows due to the implimentation of pipes on that system.

_knum_ -- number of the slider to be read.

Calling _control_ will create a new slider on the screen. There is no theoretical limit to the number of sliders. Windows and TCL/TK use only integers for slider values, so the values may need rescaling. GUIs usually pass values at a fairly slow rate, so it may be advisable to pass the output of control through _port_.

## Examples

See the [setctrl](../opcodes/setctrl.md) opcode for an example.

## See also

[Sensing and Control: TCL/TK widgets](../control/sensing.md)

## Credits

Author: John ffitch<br>
University of Bath, Codemist. Ltd.<br>
Bath, UK<br>
May, 2000<br>

New in Csound version 4.06
