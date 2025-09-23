<!--
id:loscil3
category:Signal Generators:Sample Playback
-->
# loscil3
Read sampled sound from a table using cubic interpolation.

Reading with optional sustain and release looping, using cubic interpolation. A version that outputs the exact table position (phase) corresponding to the output sample is provided as an alternative opcode.

## Syntax
=== "Modern"
    ``` csound-orc
    ar1 [,ar2] = loscil3(xamp, kcps, ifn [, ibas] [, imod1] [, ibeg1] [, iend1] \
                         [, imod2] [, ibeg2] [, iend2])
    aph, ar1 [,ar2] = loscil3phs(xamp, kcps, ifn [, ibas] [, imod1] [, ibeg1] \
                                 [, iend1] [, imod2] [, ibeg2] [, iend2])
    ```

=== "Classic"
    ``` csound-orc
    ar1 [,ar2] loscil3 xamp, kcps, ifn [, ibas] [, imod1] [, ibeg1] [, iend1] \
                       [, imod2] [, ibeg2] [, iend2]
    aph, ar1 [,ar2] loscil3phs xamp, kcps, ifn [, ibas] [, imod1] [, ibeg1] \
                               [, iend1] [, imod2] [, ibeg2] [, iend2]
    ```

### Initialization

_ifn_ -- function table number, typically denoting an sampled sound segment with prescribed looping points loaded using [GEN01](../scoregens/gen01.md). The source file may be mono or stereo.

_ibas_ (optional) -- base frequency in _Hz_ of the recorded sound. This optionally overrides the frequency given in the audio file, but is required if the file did not contain one. The default value is 261.626 Hz, i.e. middle C. (New in Csound 4.03). If this value is not known or not present, use 1 here and in _kcps_.

_imod1, imod2_ (optional, default=-1) -- play modes for the sustain and release loops. A value of 1 denotes normal looping, 2 denotes forward &amp; backward looping, 0 denotes no looping. The default value (-1) will defer to the mode and the looping points given in the source file. Make sure you select an appropriate mode if the file does not contain this information.

_ibeg1, iend1, ibeg2, iend2_ (optional, dependent on _mod1, mod2_) -- begin and end points of the sustain and release loops. These are measured in _sample frames_ (a set of samples with the same timestamp, one for each channel. Mono: 1 frame = 1 sample. Stereo: 1 frame = 2 samples etc.) from the beginning of the file, so will look the same whether the sound segment is monaural or stereo.  If no loop points are specified, and a looping mode (_imod1_, _imod2_) is given, the file will be looped for the whole length.

### Performance

_aph_ -- the normalised table position corresponding to the output sample (loscil3phs only).

_ar1, ar2_ -- the output at audio-rate. There is just _ar1_ for mono output. However, there is both _ar1_ and _ar2_ for stereo output.

_xamp_ -- the amplitude of the output signal.

_kcps_ -- the frequency of the output signal in cycles per second.

_loscil3_ is identical to [loscil](../opcodes/loscil.md) except that it uses cubic interpolation. New in Csound version 3.50.

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
> This is mono loscil3:
> ``` csound-orc
> a1 loscil3_ 10000, 1, 1, 1, 1
> ```
> ...and this is stereo loscil3:
> ``` csound-orc
> a1, a2 loscil3_ 10000, 1, 1, 1, 1
> ```

## Examples

Here is an example of the loscil3 opcode. It uses the file [loscil3.csd](../examples/loscil3.csd), [drumsMlp.wav](../examples/drumsMlp.wav) and [drumsSlp.wav](../examples/drumsSlp.wav).

``` csound-csd title="Example of the loscil3 opcode." linenums="1"
--8<-- "examples/loscil3.csd"
```

## See also

[Sample Playback](../siggen/sample.md)

## Credits

Note about the mono/stereo difference was contributed by Rasmus Ekman.
