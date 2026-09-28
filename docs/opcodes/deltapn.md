<!--
id:deltapn
category:Signal Modifiers:Delay
-->
# deltapn
Taps a delay line at variable offset times.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = deltapn(xnumsamps [, indx])
    ```

=== "Classic"
    ``` csound-orc
    ares deltapn xnumsamps [, indx]
    ```

### Initialization

_indx_ (optional, default=0) -- selects a pending _delayr_ at initialization. Zero selects the newest reader. Pass the optional i-rate output of _delayr_ to select that reader. See [Selecting a delay line](delayr.md#selecting-a-delay-line) for index values and placement before _delayw_.

### Performance

_xnumsamps_ -- specifies the tapped delay time in number of samples. Each can range from 1 control period to the full delay time of the read/write pair; however, since there is no internal check for adherence to this range, the user is wholly responsible. Each argument can be a constant, a variable, or a time-varying signal.

_deltapn_ reads whole samples without interpolation and truncates the fractional part of _xnumsamps_. It accepts k-rate or audio-rate delay times in samples. Hans Mikelson wrote this opcode.

This opcode can tap into a _delayr_/_delayw_ pair, extracting delayed audio from the _idlt_ seconds of stored sound. There can be any number of _deltap_ and/or _deltapi_ units between a read/write pair. Each receives an audio tap with no change of original amplitude.

This opcode can provide multiple delay taps for arbitrary delay path and feedback networks. They can deliver either constant-time or time-varying taps, and are useful for building chorus effects, harmonizers, and Doppler shifts. Constant-time delay taps (and some slowly changing ones) do not need interpolated readout; they are well served by _deltap_. Medium-paced or fast varying dlt's, however, will need the extra services of _deltapi_.

_delayr_/_delayw_ pairs may be interleaved. With the default index, put a tap after its reader and before any following _delayr_ or the matching _delayw_. An explicit _indx_ can select an earlier pending reader even when another _delayr_ intervenes. Jens Groh and John ffitch added interleaved read/write pairs in Csound 3.57.

_N.B._ k-rate delay times are not internally interpolated, but rather lay down stepped time-shifts of audio samples; this will be found quite adequate for slowly changing tap times. For medium to fast-paced changes, however, one should provide a higher resolution audio-rate timeshift as input.

## Examples

Here is an example of the deltapn opcode. It uses the file [deltapn.csd](../examples/deltapn.csd).

``` csound-csd title="Example of the deltapn opcode." linenums="1"
--8<-- "examples/deltapn.csd"
```

## See also

[Delay](../sigmod/delayops.md)
