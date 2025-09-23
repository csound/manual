<!--
id:mp3in
category:Signal I/O:Signal Input
-->
# mp3in
Reads mono or stereo audio data from an external MP3 file.

## Syntax
=== "Modern"
    ``` csound-orc
    ar1, ar2 = mp3in(ifilcod[, iskptim, iformat, iskipinit, ibufsize])
    ar1 = mp3in(ifilcod[, iskptim, iformat, iskipinit, ibufsize])
    ```

=== "Classic"
    ``` csound-orc
    ar1, ar2 mp3in ifilcod[, iskptim, iformat, iskipinit, ibufsize]
    ar1 mp3in ifilcod[, iskptim, iformat, iskipinit, ibufsize]
    ```

### Initialization

_ifilcod_ -- integer or character-string denoting the source soundfile name. An integer denotes the file soundin.filcod ; a character-string (in double quotes, spaces permitted) gives the filename itself, optionally a full pathname. If not a full path, the named file is sought first in the current directory, then in that given by the environment variable [SSDIR](../invoke/environment-variables.md) (if defined) then by [SFDIR](../invoke/environment-variables.md).

_iskptim_ (optional) -- time in seconds of input sound to be skipped. The default value is 0.

_iformat_ (optional) -- specifies the audio data file format:  currently not implemented and always defaults to stereo.

_iskipinit_ (optional) -- switches off all initialisation if non zero (default =0).

_ibuffersize_ (optional) -- sets the internal buffer size for reading.  If the value is omitted, zero or negative it defaults to 4096 bytes.

### Performance

Reads audio data from an external MP3 file.

## Examples

Here is an example of the mp3in opcode. It uses the file [mp3in.csd](../examples/mp3in.csd).

``` csound-csd title="Example of the mp3in opcode." linenums="1"
--8<-- "examples/mp3in.csd"
```

## See also

[Signal Input](../sigio/input.md)

## Credits

Author: John ffitch<br>
Codemist Ltd<br>
2009<br>

New in version 5.11

Mono added in 6.05
