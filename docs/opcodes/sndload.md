<!--
id:sndload
category:Table Control
-->
# sndload
Loads a sound file into memory for use by [loscilx](../opcodes/loscilx.md).

> :memo: **Note**
>
> This opcode loads the file into memory but it is not available for use adfterwards.  In effect it just wastes memory.

## Syntax
=== "Modern"
    ``` csound-orc
    sndload(Sfname[, ifmt[, ichns[, isr[, ibas[, iamp[, istrt [, ilpmod[, ilps \
            [, ilpe]]]]]]]]])
    ```

=== "Classic"
    ``` csound-orc
    sndload Sfname[, ifmt[, ichns[, isr[, ibas[, iamp[, istrt [, ilpmod[, ilps \
            [, ilpe]]]]]]]]]
    ```

### Initialization

_Sfname_ - file name as a string constant or variable, string p-field, or a number that is used either as an index to strings set with strset, or, if that is not available, a file name in the format soundin.n is used. If the file name does not include a full path, the file is searched in the current directory first, then those specified by [SSDIR](../invoke/environment-variables.md) (if defined), and finally [SFDIR](../invoke/environment-variables.md). If the same file was already loaded previously, it will not be read again, but the parameters ibas, iamp, istrt, ilpmod, ilps, and ilpe are still updated.

_ifmt _(optional, defaults to zero) - default sample format for raw (headerless) sound files; if the file has a header, this is ignored. Can be one of the following:

* -1: do not allow headerless files (fail with an init error)
* 0: use the same format as the one specified on the command line
* 1: 8 bit signed integers
* 2: a-law
* 3: u-law
* 4: 16 bit signed integers
* 5: 32 bit signed integers
* 6: 32 bit floats
* 7: 8 bit unsigned integers
* 8: 24 bit signed integers
* 9: 64 bit floats

_ichns_ (optional, defaults to zero) - default number of channels for raw (headerless) sound files; if the file has a header, this is ignored. Zero or negative values are interpreted as 1 channel.

_isr_ (optional, defaults to zero) - default sample rate for raw (headerless) sound files; if the file has a header, this is ignored. Zero or negative values are interpreted as the orchestra sample rate (sr).

_ibas_ (optional, defaults to zero) - base frequency in Hz. If positive, overrides the value specified in the sound file header; otherwise, the value from the header is used if present, and 1.0 if the file does not include such information.

_iamp_ (optional, defaults to zero) - amplitude scale. If non-zero, overrides the value specified in the sound file header (note: negative values are allowed, and will invert the sound output); otherwise, the value from the header is used if present, and 1.0 if the file does not include such information.

_istrt_ (optional, defaults to -1) - starting position in sample frames, can be fractional. If non-negative, overrides the value specified in the sound file header; otherwise, the value from the header is used if present, and 0 if the file does not include such information. Note: even if this parameter is specified, the whole file is still read into memory.

_ilpmod_ (optional, defaults to -1) - loop mode, can be one of the following:

* any negative value: use the loop information specified in the sound file header, ignoring ilps and ilpe
* 0: no looping (ilps and ilpe are ignored)
* 1: forward looping (wrap around loop end if it is crossed in
forward direction, and wrap around loop start if it is crossed in backward direction)
* 2: backward looping (change direction at loop end if it is crossed in forward direction, and wrap around loop start if it is crossed in backward direction)
* 3: forward-backward looping (change direction at both loop points if they are crossed as described above)

_ilps_ (optional, defaults to 0) - loop start in sample frames (fractional values are allowed), or loop end if ilps is greater than ilpe. Ignored unless ilpmod is set to 1, 2, or 3. If the loop points are equal, the whole sample is looped.

_ilpe_ (optional, defaults to 0) - loop end in sample frames (fractional values are allowed), or loop start if ilps is greater than ilpe.  Ignored unless ilpmod is set to 1, 2, or 3. If the loop points are equal, the whole sample is looped.

## Credits

Written by Istvan Varga.

2006

New in Csound 5.03
