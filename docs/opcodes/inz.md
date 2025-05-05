<!--
id:inz
category:Signal I/O:Signal Input
-->
# inz
Reads multi-channel audio samples into a ZAK array from an external device or stream.

## Syntax
=== "Modern"
    ``` csound-orc
    inz(ksig1)
    ```

=== "Classic"
    ``` csound-orc
    inz ksig1
    ```

### Performance

_inz_ reads audio samples in [nchnls](../opcodes/nchnls.md) into a ZAK array starting at _ksig1_. If the command-line [-i](../invoke/cs-options-alphabetically.md#-i-file-inputfile) flag is set, sound is read continuously from the audio input stream (e.g. _stdin_ or a soundfile) into an internal buffer.

## See also

[Signal Input](../sigio/input.md)

## Credits

Author: John ffitch<br>
University of Bath/Codemist Ltd.<br>
Bath, UK<br>
May 2000<br>

New in Csound Version 4.07
