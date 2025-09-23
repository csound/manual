<!--
id:soundin
category:Signal I/O:Signal Input
-->
# soundin
Reads audio data from an external device or stream.

Up to 24 channels may be read before v5.14, extended to 40 in later versions.

## Syntax
=== "Modern"
    ``` csound-orc
    ar1[, ar2[, ar3[, ... a24]]] = soundin(ifilcod [, iskptim] [, iformat] \
                                           [, iskipinit] [, ibufsize])
    ```

=== "Classic"
    ``` csound-orc
    ar1[, ar2[, ar3[, ... a24]]] soundin ifilcod [, iskptim] [, iformat] \
                                         [, iskipinit] [, ibufsize]
    ```

### Initialization

_ifilcod_ -- integer or character-string denoting the source soundfile name. An integer denotes the file soundin.filcod; a character-string (in double quotes, spaces permitted) gives the filename itself, optionally a full pathname. If not a full path, the named file is sought first in the current directory, then in that given by the environment variable [SSDIR](../invoke/environment-variables.md) (if defined) then by [SFDIR](../invoke/environment-variables.md). See also [GEN01](../scoregens/gen01.md).

_iskptim_ (optional, default=0) -- time in seconds of input sound to be skipped. The default value is 0. In csound 5.00 and later, this may be negative to add a delay instead of skipping time.

_iformat_ (optional, default=0) -- specifies the audio data file format:

*  1 = 8-bit signed char (high-order 8 bits of a 16-bit integer)
*  2 = 8-bit A-law bytes
*  3 = 8-bit U-law bytes
*  4 = 16-bit short integers
*  5 = 32-bit long integers
*  6 = 32-bit floats
*  7 = 8-bit unsigned int (not available in Csound versions older than 5.00)
*  8 = 24-bit int (not available in Csound versions older than 5.00)
*  9 = 64-bit doubles (not available in Csound versions older than 5.00)

_iskipinit_ -- switches off all initialisation if non zero (default=0). This was introduced in 4_23f13 and csound5.

_ibufsize_ -- buffer size in mono samples (not sample frames). Not available in Csound versions older than 5.00. The default buffer size is 2048.

If _iformat_ = 0 it is taken from the soundfile header, and if no header from the Csound [-o](../invoke/cs-options-alphabetically.md#-o-file-outputfile) command-line flag. The default value is 0.

### Performance

_soundin_ is functionally an audio generator that derives its signal from a pre-existing file. The number of channels read in is controlled by the number of result cells, a1, a2, etc., which must match that of the input file. A _soundin_ opcode opens this file whenever the host instrument is initialized, then closes it again each time the instrument is turned off.

There can be any number of _soundin_ opcodes within a single instrument or orchestra. Two or more of them can read simultaneously from the same external file.

> :memo: **Note to Windows users**
>
> Windows users typically use back-slashes, &#8220;\&#8221;, when specifying the paths of their files. As an example, a Windows user might use the path &#8220;c:\music\samples\loop001.wav&#8221;. This is problematic because back-slashes are normally used to specify special characters.
>
> To correctly specify this path in Csound, one may alternately:
>
> * _Use forward slashes_: c:/music/samples/loop001.wav
> * _Use back-slash special characters, &#8220;\\\\&#8221;_: c:\\\\music\\\\samples\\\\loop001.wav

## Examples

Here is an example of the soundin opcode. It uses the file [soundin.csd](../examples/soundin.csd), [fox.wav](../examples/fox.wav) and [drumsSlp.wav](../examples/drumsSlp.wav).

``` csound-csd title="Example of the soundin opcode." linenums="1"
--8<-- "examples/soundin.csd"
```

## See also

[Signal Input](../sigio/input.md)

## Credits

Authors: Barry L. Vercoe, Matt Ingalls/Mike Berry<br>
MIT, Mills College<br>
1993-1997<br>

Warning to Windows users added by Kevin Conder, April 2002
