<!--
id:diskin
category:Signal I/O:Signal Input
-->
# diskin
Reads audio data from an external device or stream and can alter its pitch.

## Syntax
=== "Modern"
    ``` csound-orc
    ar1 [, ar2 [, ar3 [, ... arN]]] = diskin(ifilcod[, kpitch[, iskiptim \
          [, iwraparound[, iformat[, iskipinit]]]]])
    ```

=== "Classic"
    ``` csound-orc
    ar1 [, ar2 [, ar3 [, ... arN]]] diskin ifilcod[, kpitch[, iskiptim \
        [, iwraparound[, iformat[, iskipinit]]]]]
    ```
Note the N was 24 in versions before 5.14, and 40 after.
``` csound-orc
ar1[] diskin ifilcod[, kpitch[, iskiptim [, iwraparound[, iformat[, iskipinit]]]]]
```
(in this version, the number of output channels is not limited.)

### Initialization

_ifilcod_ -- integer or character-string denoting the source soundfile name. An integer denotes the file soundin.filcod ; a character-string (in double quotes, spaces permitted) gives the filename itself, optionally a full pathname. If not a full path, the named file is sought first in the current directory, then in that given by the environment variable [SSDIR](../invoke/environment-variables.md) (if defined) then by [SFDIR](../invoke/environment-variables.md). See also [GEN01](../scoregens/gen01.md).

_iskptim_ (optional) -- time in seconds of input sound to be skipped. The default value is 0.

_iformat_ (optional) -- ignored if positive but if negative specifies the audio data file format of a raw file:

*  -1 = 8-bit signed char (high-order 8 bits of a 16-bit integer)
*  -2 = 8-bit A-law bytes
*  -3 = 8-bit U-law bytes
*  -4 = 16-bit short integers
*  -5 = 32-bit long integers
*  -6 = 32-bit floats
*  -7 = 8-bit unsigned int (not available in Csound versions older than 5.00)
*  -8 = 24-bit int (not available in Csound versions older than 5.00)
*  -9 = 64-bit doubles (not available in Csound versions older than 5.00)

_iwraparound_ -- 1 = on, 0 = off (wraps around to end of file either direction, enabling looping)

_iskipinit_ switches off all initialisation if non zero (default =0).  This was introduced in 4_23f13 and csound5.

If _iformat_ = 0 it is taken from the soundfile header, and if no header from the Csound [-o](../invoke/cs-options-alphabetically.md#-o-file-outputfile) command-line flag. The default value is 0.

### Performance

_a1 ... a24_ -- output signals, in the range -0dbfs to 0dbfs. Any samples before the beginning (i.e. negative location) and after the end of the file are assumed to be zero, unless _iwrap_ is non-zero. The number of output arguments must be the same as the number of sound file channels - which can be determined with the [filenchnls](../opcodes/filenchnls.md) opcode, otherwise an init error will occur.

_ar1[]_ --- output signals, in a-rate array of size N, where N is the number of channels in the file. Arrays are automatically allocated to the correct size.

_kpitch_ -- can be any real number. A negative number signifies backwards playback. The given number is a pitch ratio, where:

* _1_ = normal pitch (default)
* _2_ = 1 octave higher
* _3_ = 12th higher, etc.
* _.5_ = 1 octave lower
* _.25_ = 2 octaves lower, etc.
* _-1_ = normal pitch backwards
* _-2_ = 1 octave higher backwards, etc.

> :memo: **Note to Windows users**
>
> Windows users typically use back-slashes, &#8220;\&#8221;, when specifying the paths of their files. As an example, a Windows user might use the path &#8220;c:\music\samples\loop001.wav&#8221;. This is problematic because back-slashes are normally used to specify special characters.
>
> To correctly specify this path in Csound, one may alternately:
>
> * _Use forward slashes_: c:/music/samples/loop001.wav
> * _Use back-slash special characters, &#8220;\\\\&#8221;_: c:\\\\music\\\\samples\\\\loop001.wav

## Examples

Here is an example of the diskin opcode. It uses the file [diskin.csd](../examples/diskin.csd), [drumsMlp.wav](../examples/drumsMlp.wav).

``` csound-csd title="Example of the diskin opcode." linenums="1"
--8<-- "examples/diskin.csd"
```

## See also

[Signal Input](../sigio/input.md)

## Credits

Authors: Barry L. Vercoe, Matt Ingalls/Mike Berry<br>
MIT, Mills College<br>
1993-1997<br>

New in version 3.46

kpitch optional in version 6.06

Warning to Windows users added by Kevin Conder, April 2002
