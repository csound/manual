<!--
id:setctrl
category:Instrument Control:Sensing and Control
-->
# setctrl
Configurable slider controls for realtime user input.

Plugin opcode in control.

Requires Winsound or TCL/TK. _setctrl_ sets a slider to a specific value, or sets a minimum or maximum range.

## Syntax
=== "Modern"
    ``` csound-orc
    setctrl(inum, ival, itype)
    ```

=== "Classic"
    ``` csound-orc
    setctrl inum, ival, itype
    ```

### Initialization

Note that this opcode is not available on Windows due to the implimentation of pipes on that system.

_inum_ -- number of the slider to set

_ival_ -- value to be sent to the slider

_itype_ -- type of value sent to the slider as follows:

* 1 -- set the current value. Initial value is 0.
* 2 -- set the minimum value. Default is 0.
* 3 -- set the maximum value. Default is 127.
* 4 -- set the label. (New in Csound version 4.09)

### Performance

Calling _setctrl_ will create a new slider on the screen. There is no theoretical limit to the number of sliders. Windows and TCL/TK use only integers for slider values, so the values may need rescaling. GUIs usually pass values at a fairly slow rate, so it may be advisable to pass the output of control through _port_.

## Examples

Here is an example of the setctrl opcode. It uses the file [setctrl.csd](../examples/setctrl.csd).

``` csound-csd title="Example of the setctrl opcode." linenums="1"
--8<-- "examples/setctrl.csd"
```

Its output should include lines like this:

```
i1    38.00000
i1    40.00000
i1    43.00000
```

## See also

[Sensing and Control: TCL/TK widgets](../control/sensing.md)

## Credits

Author: John ffitch<br>
University of Bath, Codemist. Ltd.<br>
Bath, UK<br>
May 2000<br>

Example written by Kevin Conder.

New in Csound version 4.06
