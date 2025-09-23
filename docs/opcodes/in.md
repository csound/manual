<!--
id:in
category:Signal I/O:Signal Input
-->
# in
Reads mono audio data from an external device or stream.

> :warning: **Warning**
>
> There are two versions of this opcode.  The first is designed to be used only with orchestras that have inchnls=1. Doing so with orchestras with inchnls &gt; 1 will cause incorrect audio input.
>
> The second form will read multiple channels into an array.

## Syntax
=== "Modern"
    ``` csound-orc
    ar1 = in()
    aarray = in()
    ```

=== "Classic"
    ``` csound-orc
    ar1 in
    aarray in
    ```

### Performance

Form 1 reads mono audio data from an external device or stream. If the command-line [-i](../invoke/cs-options-alphabetically.md#-i-file-inputfile) flag is set, sound is read continuously from the audio input stream (e.g. _stdin_ or a soundfile) into an internal buffer. Any number of these opcodes can read freely from this buffer.

The second format will read upto ichnls of audio into an audio array, which must be initialised.

## Examples

Here is an example of the in opcode. It uses the file [in.csd](../examples/in.csd).

``` csound-csd title="Example of the in opcode." linenums="1"
--8<-- "examples/in.csd"
```

## See also

[Signal Input](../sigio/input.md)

## Credits

Authors: Barry L. Vercoe, Matt Ingalls/Mike Berry<br>
MIT, Mills College<br>
1993-1997<br>
Authors: John ffitch<br>
NUIM, 2013<br>

Already in version 3.30

Array version in versio 6.01
