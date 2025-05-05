<!--
id:button
category:Instrument Control:Sensing and Control
-->
# button
Sense on-screen controls. Requires Winsound or TCL/TK.

## Syntax
=== "Modern"
    ``` csound-orc
    kres = button(knum)
    ```

=== "Classic"
    ``` csound-orc
    kres button knum
    ```

### Performance

Note that this opcode is not available on Windows due to the implimentation of pipes on that system.

_kres_ -- value of the button control. If the button has been pushed since the last k-period, then return 1, otherwise return 0.

_knum_ -- the number of the button. If it does not exist, it is made on-screen at initialization.

## Examples

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
September 2000<br>

New in Csound version 4.08
