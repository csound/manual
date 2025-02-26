<!--
id:inz
category:Signal I/O:Signal Input
-->
# inz
Reads multi-channel audio samples into a ZAK array from an external device or stream.

## Syntax
``` csound-orc
inz ksig1
```

### Performance

_inz_ reads audio samples in [nchnls](../../opcodes/nchnls) into a ZAK array starting at _ksig1_. If the command-line [-i](../../) flag is set, sound is read continuously from the audio input stream (e.g. _stdin_ or a soundfile) into an internal buffer.

## See also

[Signal Input](../../sigio/input)

## Credits

Author: John ffitch<br>
University of Bath/Codemist Ltd.<br>
Bath, UK<br>
May 2000<br>

New in Csound Version 4.07
