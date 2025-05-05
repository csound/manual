<!--
id:loscil
category:Signal Generators:Sample Playback
-->
# loscil
Read sampled sound (mono or stereo) from a table.

Reading with optional sustain and release looping. A version that outputs the exact table position (phase) corresponding to the output sample is provided as an alternative opcode.

## Syntax
=== "Modern"
    ``` csound-orc
    ar1 [,ar2] = loscil(xamp, kcps, ifn [, ibas] [, imod1] [, ibeg1] [, iend1] \
                        [, imod2] [, ibeg2] [, iend2])
    aph, ar1 [,ar2] = loscilphs(xamp, kcps, ifn [, ibas] [, imod1] [, ibeg1] \
                                [, iend1] [, imod2] [, ibeg2] [, iend2])
    ```

=== "Classic"
    ``` csound-orc
    ar1 [,ar2] loscil xamp, kcps, ifn [, ibas] [, imod1] [, ibeg1] [, iend1] \
                      [, imod2] [, ibeg2] [, iend2]
    aph, ar1 [,ar2] loscilphs xamp, kcps, ifn [, ibas] [, imod1] [, ibeg1] \
                              [, iend1] [, imod2] [, ibeg2] [, iend2]
    ```

### Initialization

_ifn_ -- function table number, typically denoting an sampled sound segment with prescribed looping points loaded using [GEN01](../scoregens/gen01.md). The source file may be mono or stereo.

_ibas_ (optional) -- base frequency in _Hz_ of the recorded sound. This optionally overrides the frequency given in the audio file, but is required if the file did not contain one. The default value is 261.626 Hz, i.e. middle C. (New in Csound 4.03). If this value is not known or not present, use 1 here and in _kcps_.

_imod1, imod2_ (optional, default=-1) -- play modes for the sustain and release loops. A value of 1 denotes normal looping, 2 denotes forward &amp; backward looping, 0 denotes no looping. The default value (-1) will defer to the mode and the looping points given in the source file. Make sure you select an appropriate mode if the file does not contain this information.

_ibeg1, iend1, ibeg2, iend2_ (optional, dependent on _mod1, mod2_) -- begin and end points of the sustain and release loops. These are measured in _sample frames_ from the beginning of the file, so will look the same whether the sound segment is monaural or stereo. If no loop points are specified, and a looping mode (_imod1_, _imod2_) is given, the file will be looped for the whole length.

### Performance

_aph_ -- the normalised table position corresponding to the output sample (loscilphs only).

_ar1, ar2_ -- the output at audio-rate. There is just _ar1_ for mono output. However, there is both _ar1_ and _ar2_ for stereo output.

_xamp_ -- the amplitude of the output signal.

_kcps_ -- the frequency of the output signal in cycles per second.

_loscil_ samples the ftable audio at a rate determined by _kcps_, then multiplies the result by _xamp_. The sampling increment for _kcps_ is dependent on the table's base-note frequency _ibas_, and is automatically adjusted if the orchestra _sr_ value differs from that at which the source was recorded. In this unit, ftable is always sampled with interpolation.

If sampling reaches the _sustain loop_ endpoint and looping is in effect, the point of sampling will be modified and _loscil_ will continue reading from within that loop segment. Once the instrument has received a _turnoff_ signal (from the score or from a MIDI noteoff event), the next sustain endpoint encountered will be ignored and sampling will continue towards the _release loop_ end-point, or towards the last sample (henceforth to zeros).

_loscil_ is the basic unit for building a sampling synthesizer. Given a sufficient set of recorded piano tones, for example, this unit can resample them to simulate the missing tones. Locating the sound source nearest a desired pitch can be done via table lookup. Once a sampling instrument has begun, its _turnoff_ point may be unpredictable and require an external _release_ envelope; this is often done by gating the sampled audio with [linenr](../opcodes/linenr.md), which will extend the duration of a turned-off instrument by a specific period while it implements a decay.

If you want to loop the whole file, specify a looping mode in _imod1_ and do not enter any values for _ibeg_ and _iend_.

> :warning: **Note to Windows users**
> 
> Windows users typically use back-slashes, &#8220;\&#8221;, when specifying the paths of their files. As an example, a Windows user might use the path &#8220;c:\music\samples\loop001.wav&#8221;. This is problematic because back-slashes are normally used to specify special characters.
> 
> To correctly specify this path in Csound, one may alternately:
> 
> * _Use forward slashes_: c:/music/samples/loop001.wav
> * _Use back-slash special characters, &#8220;\\\\&#8221;_: c:\\\\music\\\\samples\\\\loop001.wav

> :memo: **Note**
>
> This is mono _loscil_:
> ``` csound-orc
> a1 loscil_ 10000, 1, 1, 1 ,1
> ```
> ...and this is stereo _loscil_:
> ``` csound-orc
> a1, a2 loscil_ 10000, 1, 1, 1 ,1
> ```

## Examples

Here is an example of the loscil opcode. It uses the files [loscil.csd](../examples/loscil.csd), [drumsMlp.wav](../examples/drumsMlp.wav) and [drumsSlp.wav](../examples/drumsSlp.wav).

``` csound-csd title="Example of the loscil opcode." linenums="1"
--8<-- "examples/loscil.csd"
```

## See also

[Sample Playback](../siggen/sample.md)

## Credits

Note about the mono/stereo difference was contributed by Rasmus Ekman.
