<!--
id:diskin2
category:Signal I/O:Signal Input
-->
# diskin2
Reads audio data from a file, and can alter its pitch using one of several available interpolation types, as well as convert the sample rate to match the orchestra sr setting.

_diskin2_ can also read multichannel files with any number of channels in the range 1 to 24 in versions before 5.14, and 40 after.

## Syntax
=== "Modern"
    ``` csound-orc
    a1[, a2[, ... aN]] = diskin2(ifilcod[, kpitch[, iskiptim \
          [, iwrap[, iformat[, iwsize[, ibufsize[, iskipinit]]]]]]])
    ar1[] = diskin2(ifilcod[, kpitch[, iskiptim \
          [, iwrap[, iformat[, iwsize[, ibufsize[, iskipinit]]]]]]])
    ```

=== "Classic"
    ``` csound-orc
    a1[, a2[, ... aN]] diskin2 ifilcod[, kpitch[, iskiptim \
        [, iwrap[, iformat[, iwsize[, ibufsize[, iskipinit]]]]]]]
    ar1[] diskin2 ifilcod[, kpitch[, iskiptim \
        [, iwrap[, iformat[, iwsize[, ibufsize[, iskipinit]]]]]]]
    ```

(in the array output version, the number of output channels does not have an upper limit.)


### Initialization

_ifilcod_ -- integer or character-string denoting the source soundfile name. An integer denotes the file soundin.ifilcod; a character-string (in double quotes, spaces permitted) gives the filename itself, optionally a full pathname. If not a full path, the named file is sought first in the current directory, then in those given by the environment variable [SSDIR](../invoke/environment-variables.md) (if defined) then by [SFDIR](../invoke/environment-variables.md). See also [GEN01](../scoregens/gen01.md). Note: files longer than 2<sup>31</sup>-1 sample frames may not be played correctly on 32-bit platforms; this means a maximum length about 3 hours with a sample rate of 192000 Hz.

_iskiptim_ (optional, defaults to zero) -- time in seconds of input sound to be skipped, assuming _kpitch_=1. Can be negative, to add -_iskiptim_/_kpitch_ seconds of delay instead of skipping sound.

> :memo: **Note**
>
> If _iwrap_ is not 0 (locations are wrapped), _iskiptim_ will not delay the sound if a negative value is used. Instead, the negative value will be "wrapped" from the end of the file.

_iwrap_ (optional, defaults to zero) -- if set to any non-zero value, read locations that are negative or are beyond the end of the file are wrapped to the duration of the sound file instead of assuming zero samples. Useful for playing a file in a loop.

> :memo: **Note**
>
> If _iwrap_ is enabled, the file length should not be shorter than the interpolation window size (see below), otherwise there may be clicks in the sound output.

_iformat_ (optional, defaults to zero) -- sets raw and sample format for raw (headerless) files. This parameter must be zero if the file has a header. Allowed values for raw files are are:

*  1: 16-bit short integers
*  2: 8-bit signed char (high-order 8 bits of a 16-bit integer)
*  3: 8-bit A-law bytes
*  4: 8-bit U-law bytes
*  5: 16-bit short integers
*  6: 32-bit long integers
*  7: 32-bit floats
*  8: 8-bit unsigned int
*  9: 24-bit int
*  10: 64-bit doubles

> :memo: **Note**
>
> This list is not the same as in [GEN01](../scoregens/gen01.md)

_iwsize_ (optional, defaults to zero) -- interpolation window size, in samples. Can be one of the following:

*  1: round to nearest sample (no interpolation, for _kpitch_=1)
*  2: linear interpolation
*  4: cubic interpolation
*  &ge; 8: _iwsize_ point sinc interpolation with anti-aliasing (slow)

Zero or negative values select the default, which is cubic interpolation.

> :memo: **Note**
>
> If interpolation is used, _kpitch_ is automatically scaled by the	ratio of the sample rate of the sound file and the orchestra, so that the file will always be played at the original pitch if _kpitch_ is 1. However, the sample rate conversion is disabled if _iwsize_ is 1.

_ibufsize_ (optional, defaults to 0) -- buffer size in mono samples (not sample frames). This is only the suggested value, the actual setting will be rounded so that the number of sample frames is an integer power of two and is in the range 128 (or _iwsize_ if greater than 128) to 1048576. The default, which is 4096, and is enabled by zero or negative values, should be suitable for most uses, but for non-realtime mixing of many large sound files, a high buffer setting is recommended to improve the efficiency of disk reads. For real time audio output, reading the files from a fast RAM file system (on platforms where this option is available) with a small buffer size may be preferred.

_iskipinit_ (optional, defaults to 0) -- skip initialization if set to any non-zero value.

### Performance

_a1 ... a24_ -- output signals, in the range -0dbfs to 0dbfs. Any samples before the beginning (i.e. negative location) and after the end of the file are assumed to be zero, unless _iwrap_ is non-zero. The number of output arguments must be the same as the number of sound file channels - which can be determined with the [filenchnls](../opcodes/filenchnls.md) opcode, otherwise an init error will occur.

_ar1[]_ --- output signals, in a-rate array of size N, where N is the number of channels in the file. Arrays are automatically allocated to the correct size.

> :memo: **Note**
>
> It is more efficient to read a single file with many channels, than many files with only a single channel, especially with high _iwsize_ settings.

_kpitch_ -- transpose the pitch of input sound by this factor (e.g. 0.5 means one octave lower, 2 is one octave higher, and 1 is the original pitch, which is the default value). Fractional and negative values are allowed (the latter results in playing the file backwards, however, in this case the skip time parameter should be set to some positive value, e.g. the length of the file, or _iwrap_ should be non-zero, otherwise nothing would be played). If interpolation is enabled, and the sample rate of the file differs from the orchestra sample rate, the transpose ratio is automatically adjusted to make sure that _kpitch_=1 plays at the original pitch. Using a high _iwsize_ setting (40 or more) can significantly improve sound quality when transposing up, although at the expense of high CPU usage.

## Examples

Here is an example of the diskin2 opcode. It uses the file [diskin2.csd](../examples/diskin2.csd), [drumsMlp.wav](../examples/drumsMlp.wav).

``` csound-csd title="Example of the diskin2 opcode." linenums="1"
--8<-- "examples/diskin2.csd"
```

## See also

[Signal Input](../sigio/input.md)

## Credits

Author: Istvan Varga<br>
2005<br>

New in version 5.00

kpitch optional in version 6.06
