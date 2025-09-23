<!--
id:checkbox
category:Instrument Control:Sensing and Control
-->
# checkbox
Sense on-screen controls. Requires Winsound or TCL/TK.

Plugin opcode in control.

## Syntax
=== "Modern"
    ``` csound-orc
    kres = checkbox(knum)
    ```

=== "Classic"
    ``` csound-orc
    kres checkbox knum
    ```

### Performance

Note that this opcode is not available on Windows due to the implimentation of pipes on that system.

_kres_ -- value of the checkbox control. If the checkbox is set (pushed) then return 1, if not, return 0.

_knum_ -- the number of the checkbox. If it does not exist, it is made on-screen at initialization.

## Examples

=== "Modern"
    Here is a simple example of the checkbox opcode. It uses the file [checkbox-modern.csd](../examples/checkbox-modern.csd).
    ``` csound-csd title="Simple example of the checkbox opcode." linenums="1"
    --8<-- "examples/checkbox-modern.csd"
    ```

=== "Classic"
    Here is a simple example of the checkbox opcode. It uses the file [checkbox.csd](../examples/checkbox.csd).
    ``` csound-csd title="Simple example of the checkbox opcode." linenums="1"
    --8<-- "examples/checkbox.csd"
    ```

## See also

[Sensing and Control: TCL/TK widgets](../control/sensing.md)

## Credits

Author: John ffitch<br>
University of Bath, Codemist. Ltd.<br>
Bath, UK<br>
September, 2000<br>

Example written by Kevin Conder.

New in Csound version 4.08
