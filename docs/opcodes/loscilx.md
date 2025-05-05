<!--
id:loscilx
category:Signal Generators:Sample Playback
-->
# loscilx
Read sampled sound (up to 16 channels) from a table, with optional sustain and release looping.

## Syntax
=== "Modern"
    ``` csound-orc
    ar1 [, ar2, ar3, ar4, ar5, ar6, ar7, ar8, ar9, ar10, ar11, ar12, ar13, ar14, \
    ar15, ar16] = loscilx(xamp, kcps, ifn \
                          [, iwsize, ibas, istrt, imod, ibeg, iend])
    ar[] = loscilx(xamp, kcps, ifn \
                   [, iwsize, ibas, istrt, imod, ibeg, iend])
    ```

=== "Classic"
    ``` csound-orc
    ar1 [, ar2, ar3, ar4, ar5, ar6, ar7, ar8, ar9, ar10, ar11, ar12, ar13, ar14, \
    ar15, ar16] loscilx xamp, kcps, ifn \
                        [, iwsize, ibas, istrt, imod, ibeg, iend]
    ar[] loscilx xamp, kcps, ifn \
                 [, iwsize, ibas, istrt, imod, ibeg, iend]
    ```

### Initialization

_ifn_ -- function table number, typically denoting an sampled sound segment with prescribed looping points loaded using [GEN01](../scoregens/gen01.md). The source file may have up to 16 channels.

_iwsize_ (optional) -- window size used in interpolation. iwsize (optional, defaults to zero) -- interpolation window size, in samples. Can be one of the following:

*  1: round to nearest sample (no interpolation, for _kpitch_=1)
*  2: linear interpolation
*  4: cubic interpolation
*  &gt;= 8: _iwsize_ point sinc interpolation with anti-aliasing (slow)

Zero or negative values select the default, which is cubic interpolation.

_ibas_ (optional) -- base frequency in _Hz_ of the recorded sound. This optionally overrides the frequency given in the audio file, but is required if the file did not contain one. The default value is 261.626 Hz, i.e. middle C. (New in Csound 4.03). If this value is not known or not present, use 1 here and in _kcps_.

_istrt_ (optional, default 0) -- Frame to start reading the data.  If this is not an integer the the data is interpolated (see _iwsize_).

_imod_ (optional, default -1) --  play mode for the sustain and release loops. A value of 1 denotes normal looping, 2 denotes forward &amp; backward looping, 0 denotes no looping. The default value (-1) will defer to the mode and the looping points given in the source file. Make sure you select an appropriate mode if the file does not contain this information.

_ibeg, iend_ (optional, depending on _imod_) -- begin and end points of the sustain and release loops. These are measured in _sample frames_ from the beginning of the file. If no loop points are specified, and a looping mode (_imod_ is given), the file will be looped for the whole length.

### Performance

_ar1, ar2, ... ar[]_ -- the output at audio-rate. The number of outputs must match the number of channels in the sample file.

_xamp_ -- the amplitude of the output signal.

_kcps_ -- the factor to read the file.  For example, a value of 1 has no pitch change, 1.5 is up a fifth and 2 an octave.

_loscilx_ samples the ftable audio at a rate determined by _kcps_, then multiplies the result by _xamp_. The sampling increment for _kcps_ is dependent on the table's base-note frequency _ibas_, and is automatically adjusted if the orchestra _sr_ value differs from that at which the source was recorded. In this unit, ftable is always sampled with interpolation.

If sampling reaches the _sustain loop_ endpoint and looping is in effect, the point of sampling will be modified and _loscil_ will continue reading from within that loop segment. Once the instrument has received a _turnoff_ signal (from the score or from a MIDI noteoff event), the next sustain endpoint encountered will be ignored and sampling will continue towards the _release loop_ end-point, or towards the last sample (henceforth to zeros).

If you want to loop the whole file, specify a looping mode in _imod_ and do not enter any values for _ibeg_ and _iend_.

## Examples

Here is an example of the loscilx opcode. It uses the files [loscilx.csd](../examples/loscilx.csd) and [drumsSlp.wav](../examples/drumsSlp.wav).

``` csound-csd title="Example of the loscilx opcode." linenums="1"
--8<-- "examples/loscilx.csd"
```

## See also

[Sample Playback](../siggen/sample.md)

## Credits

Written by Istvan Varga.

2006

New in Csound 5.03

Array version new in Csound 6.13 (February 2019)
