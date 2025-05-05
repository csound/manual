<!--
id:soundouts
category:Signal I/O:Signal Output
-->
# soundouts
Deprecated. Writes audio output to a disk file.

> :memo: **Note**
>
> The usage of _soundouts_ is discouraged. Please use  [fout](../opcodes/fout.md) instead.


## Syntax
=== "Modern"
    ``` csound-orc
    soundouts(asigl, asigr, ifilcod [, iformat])
    ```

=== "Classic"
    ``` csound-orc
    soundouts asigl, asigr, ifilcod [, iformat]
    ```

### Initialization

_ifilcod_ -- integer or character-string denoting the destination soundfile name. An integer denotes the file soundout.ifilcod; a character-string (in double quotes, spaces permitted) gives the filename itself, optionally a full pathname. If not a full path, the named file is written relative to the directory given by the SFDIR environment variable if defined, or the current directory. See also [GEN01](../scoregens/gen01.md).

_iformat_ (optional, default=0) -- specifies the audio data file format:

*  1 = 8-bit signed char (high-order 8 bits of a 16-bit integer)
*  4 = 16-bit short integers
*  5 = 32-bit long integers
*  6 = 32-bit floats

If _iformat_ = 0 it is taken from the Csound [-o](../invoke/cs-options-alphabetically.md#-o-file-outputfile) command-line flag. The default value is 0.

### Performance

_soundouts_ writes stereo audio output to a disk file in raw (headerless) format without 0dBFS scaling. The expected range of the audio signals depends on the selected sample format.

> :memo: **Note**
>
> Use of [fout](../opcodes/fout.md) is recommended instead of _soundouts_

## See also

[Signal Output](../sigio/output.md)

## Credits

Author: Istvan Varga<br>
