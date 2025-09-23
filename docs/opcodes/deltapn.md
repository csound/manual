<!--
id:deltapn
category:Signal Modifiers:Delay
-->
# deltapn
Taps a delay line at variable offset times.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = deltapn(xnumsamps)
    ```

=== "Classic"
    ``` csound-orc
    ares deltapn xnumsamps
    ```

### Performance

_xnumsamps_ -- specifies the tapped delay time in number of samples. Each can range from 1 control period to the full delay time of the read/write pair; however, since there is no internal check for adherence to this range, the user is wholly responsible. Each argument can be a constant, a variable, or a time-varying signal.

_deltapn_ is identical to [deltapi](../opcodes/deltapi.md), except delay time is specified in number of samples, instead of seconds (Hans Mikelson).

This opcode can tap into a _delayr_/_delayw_ pair, extracting delayed audio from the _idlt_ seconds of stored sound. There can be any number of _deltap_ and/or _deltapi_ units between a read/write pair. Each receives an audio tap with no change of original amplitude.

This opcode can provide multiple delay taps for arbitrary delay path and feedback networks. They can deliver either constant-time or time-varying taps, and are useful for building chorus effects, harmonizers, and Doppler shifts. Constant-time delay taps (and some slowly changing ones) do not need interpolated readout; they are well served by _deltap_. Medium-paced or fast varying dlt's, however, will need the extra services of _deltapi_.

_delayr_/_delayw_ pairs may be interleaved. To associate a delay tap unit with a specific _delayr_ unit, it not only has to be located between that _delayr_ and the appropriate _delayw_ unit, but must also precede any following _delayr_ units. See Example 2. (This feature added in Csound version 3.57 by Jens Groh and John ffitch).

_N.B._ k-rate delay times are not internally interpolated, but rather lay down stepped time-shifts of audio samples; this will be found quite adequate for slowly changing tap times. For medium to fast-paced changes, however, one should provide a higher resolution audio-rate timeshift as input.

## Examples

Here is an example of the deltapn opcode. It uses the file [deltapn.csd](../examples/deltapn.csd).

``` csound-csd title="Example of the deltapn opcode." linenums="1"
--8<-- "examples/deltapn.csd"
```

## See also

[Delay](../sigmod/delayops.md)
