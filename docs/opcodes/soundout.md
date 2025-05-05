<!--
id:soundout
category:Signal I/O:Signal Output
-->
# soundout
Deprecated. Writes audio output to a disk file.

> :memo: **Note**
>
> The usage of _soundout_ is discouraged. Please use  [fout](../opcodes/fout.md) instead.

## Syntax
=== "Modern"
    ``` csound-orc
    soundout(asig1, ifilcod [, iformat])
    ```

=== "Classic"
    ``` csound-orc
    soundout asig1, ifilcod [, iformat]
    ```

### Initialization

_ifilcod_ -- integer or character-string denoting the destination soundfile name. An integer denotes the file soundin.filcod; a character-string (in double quotes, spaces permitted) gives the filename itself, optionally a full pathname. If not a full path, the named file is sought first in the current directory, then in that given by the environment variable [SSDIR](../invoke/environment-variables.md) (if defined) then by [SFDIR](../invoke/environment-variables.md). See also [GEN01](../scoregens/gen01.md).

_iformat_ (optional, default=0) -- specifies the audio data file format:

*  1 = 8-bit signed char (high-order 8 bits of a 16-bit integer)
*  2 = 8-bit A-law bytes
*  3 = 8-bit U-law bytes
*  4 = 16-bit short integers
*  5 = 32-bit long integers
*  6 = 32-bit floats

If _iformat_ = 0 it is taken from the soundfile header, and if no header from the Csound [-o](../invoke/cs-options-alphabetically.md#-o-file-outputfile) command-line flag. The default value is 0.

### Performance

_soundout_ writes audio output to a disk file.

> :memo: **Note**
>
> Use of [fout](../opcodes/fout.md) is recommended instead of _soundout_

## See also

[Signal Output](../sigio/output.md)

## Credits

Author: Barry L. Vercoe, Matt Ingalls/Mike Berry<br>
MIT, Mills College<br>
1993-1997<br>
