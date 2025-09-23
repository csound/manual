<!--
id:inx
category:Signal I/O:Signal Input
-->
# inx
Reads a 16-channel audio signal from an external device or stream.

> :warning: **Warning**
>
> This opcode is designed to be used only with orchestras that have nchnls=16. Doing so with orchestras with nchnls &gt; 16 will cause incorrect audio input.

## Syntax
=== "Modern"
    ``` csound-orc
    ar1, ar2, ar3, ar4, ar5, ar6, ar7, ar8, ar9, ar10, ar11, ar12, \
    ar13, ar14, ar15, ar16 = inx()
    ```

=== "Classic"
    ``` csound-orc
    ar1, ar2, ar3, ar4, ar5, ar6, ar7, ar8, ar9, ar10, ar11, ar12, \
    ar13, ar14, ar15, ar16 inx
    ```

### Performance

_inx_ reads a 16-channel audio signal from an external device or stream. If the command-line [-i](../invoke/cs-options-alphabetically.md#-i-file-inputfile) flag is set, sound is read continuously from the audio input stream (e.g. _stdin_ or a soundfile) into an internal buffer.

## See also

[Signal Input](../sigio/input.md)

## Credits

Author: John ffitch<br>
University of Bath/Codemist Ltd.<br>
Bath, UK<br>
May 2000<br>

New in Csound Version 4.07
