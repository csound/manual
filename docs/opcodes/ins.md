<!--
id:ins
category:Signal I/O:Signal Input
-->
# ins
Reads stereo audio data from an external device or stream.

> :warning: **Warning**
>
> This opcode is designed to be used only with orchestras that have nchnls_i=2. Doing so with orchestras with nchnls_i &gt; 2 will cause incorrect audio input.

## Syntax
=== "Modern"
    ``` csound-orc
    ar1, ar2 = ins()
    ```

=== "Classic"
    ``` csound-orc
    ar1, ar2 ins
    ```

### Performance

Reads stereo audio data from an external device or stream. If the command-line [-i](../invoke/cs-options-alphabetically.md#-i-file-inputfile) flag is set, sound is read continuously from the audio input stream (e.g. _stdin_ or a soundfile) into an internal buffer. Any number of these opcodes can read freely from this buffer.

## Examples

Here is an example of the ins opcode. It uses the file [ins.csd](../examples/ins.csd).

``` csound-csd title="Example of the ins opcode." linenums="1"
--8<-- "examples/ins.csd"
```

## See also

[Signal Input](../sigio/input.md)

## Credits

Authors: Barry L. Vercoe, Matt Ingalls/Mike Berry<br>
MIT, Mills College<br>
1993-1997<br>
