<!--
id:inch
category:Signal I/O:Signal Input
-->
# inch
Reads from numbered channels in an external audio signal or stream.

## Syntax
=== "Modern"
    ``` csound-orc
    ain1[, ...] = inch(kchan1[,...])
    ```

=== "Classic"
    ``` csound-orc
    ain1[, ...] inch kchan1[,...]
    ```

### Performance

_ain1, ..._ - input audio signals

_kchan1,..._ - channel numbers

_inch_ reads from numbered channels determined by the corresponding _kchan_ into the associated _ain_. If the command-line [-i](../invoke/cs-options-alphabetically.md#-i-file-inputfile) flag is set, sound is read continuously from the audio input stream (e.g. _stdin_ or a soundfile). _inch_ can also be used to receive audio in realtime from the audio interface using _-iadc_.

> :memo: **Note**
>
> The highest number for _kchan_ available for use with _inch_ depends on [nchnls_i](../opcodes/nchnls_i.md). If _kchan_ is greater than _nchnls_i_, _ain_ will be silent. Note that _inch_ will give a warning but not an error in this case.

## Examples

Here is an example of the inch opcode. It uses the file [inch.csd](../examples/inch.csd).

``` csound-csd title="Example of the inch opcode." linenums="1"
--8<-- "examples/inch.csd"
```

## See also

[Signal Input](../sigio/input.md)

## Credits

Author: John ffitch<br>
University of Bath/Codemist Ltd.<br>
Bath, UK<br>
May 2000<br>

New in Csound Version 4.07

Multiple arguments from version 5.13
