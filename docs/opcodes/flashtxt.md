<!--
id:flashtxt
category:Signal I/O:Printing and Display
-->
# flashtxt
Allows text to be displayed from instruments like sliders etc. (only on Unix and Windows at present)

Plugin opcode in control.

## Syntax
=== "Modern"
    ``` csound-orc
    flashtxt( iwhich, String)
    ```

=== "Classic"
    ``` csound-orc
    flashtxt  iwhich, String
    ```

### Initialization

_iwhich_ -- the number of the window.

_String_ -- the string to be displayed.

### Performance

Note that this opcode is not available on Windows due to the implimentation of pipes on that system.

A window is created, identified by the iwhich argument, with the text string displayed.  If the text is replaced by a number then the window id deleted.  Note that the text windows are globally numbered so different instruments can change the text, and the window survives the instance of the instrument.

## Examples

Here is an example of the flashtxt opcode. It uses the file [flashtxt.csd](../examples/flashtxt.csd).

``` csound-csd title="Example of the flashtxt opcode." linenums="1"
--8<-- "examples/flashtxt.csd"
```

## See also

[Sensing and Control: TCL/TK widgets](../control/sensing.md)

## Credits

Author: John ffitch<br>
University of Bath, Codemist Ltd.<br>
Bath, UK<br>

New in Csound version 4.11
