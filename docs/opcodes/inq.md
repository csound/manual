<!--
id:inq
category:Signal I/O:Signal Input
-->
# inq
Reads quad audio data from an external device or stream.

> :warning: **Warning**
>
> This opcode is designed to be used only with orchestras that have nchnls_i=4. Doing so with orchestras with nchnls_i &gt; 4 will cause incorrect audio input.

## Syntax
=== "Modern"
    ``` csound-orc
    ar1, ar2,  ar3, a4 = inq()
    ```

=== "Classic"
    ``` csound-orc
    ar1, ar2,  ar3, a4 inq
    ```

### Performance

Reads quad audio data from an external device or stream. If the command-line [-i](../invoke/cs-options-alphabetically.md#-i-file-inputfile) flag is set, sound is read continuously from the audio input stream (e.g. _stdin_ or a soundfile) into an internal buffer. Any number of these opcodes can read freely from this buffer.

## Examples

Here is an example of the inq opcode. It uses the file [inq.csd](../examples/inq.csd).

``` csound-csd title="Example of the inq opcode." linenums="1"
--8<-- "examples/inq.csd"
```

## See also

[Signal Input](../sigio/input.md)

## Credits

Authors: Barry L. Vercoe, Matt Ingalls/Mike Berry<br>
MIT, Mills College<br>
1993-1997<br>
