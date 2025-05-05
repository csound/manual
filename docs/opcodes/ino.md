<!--
id:ino
category:Signal I/O:Signal Input
-->
# ino
Reads eight-channel audio data from an external device or stream.

> :warning: **Warning**
>
> This opcode is designed to be used only with orchestras that have nchnls_i=8. Doing so with orchestras with nchnls_i &gt; 8 will cause incorrect audio input.

## Syntax
=== "Modern"
    ``` csound-orc
    ar1, ar2, ar3, ar4, ar5, ar6, ar7, ar8 = ino()
    ```

=== "Classic"
    ``` csound-orc
    ar1, ar2, ar3, ar4, ar5, ar6, ar7, ar8 ino
    ```

### Performance

Reads eight-channel audio data from an external device or stream. If the command-line [-i](../invoke/cs-options-alphabetically.md#-i-file-inputfile) flag is set, sound is read continuously from the audio input stream (e.g. _stdin_ or a soundfile) into an internal buffer. Any number of these opcodes can read freely from this buffer.

## See also

[Signal Input](../sigio/input.md)

## Credits

Author: John ffitch
