<!--
id:pvscross
category:Spectral Processing:Streaming
-->
# pvscross
Performs cross-synthesis between two source fsigs.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = pvscross(fsrc, fdest, kamp1, kamp2)
    ```

=== "Classic"
    ``` csound-orc
    fsig pvscross fsrc, fdest, kamp1, kamp2
    ```

### Performance

For each bin, the output adds the amplitude from _fsrc_ scaled by _abs(kamp1)_ to the amplitude from _fdest_ scaled by _abs(kamp2)_. It keeps the frequency from _fsrc_. For amplitude+phase input, it keeps the phase from _fsrc_ instead. Unlike [pvcross](pvcross.md), it reads f-signals and does not preserve the spectral envelope.

_kamp1_ and _kamp2_ use their absolute values: negative gains act like positive gains. Values above 1 amplify the input; gains are not clipped to 1. Use values between 0 and 1 for a crossfade.

Both inputs must use amplitude+frequency (format 0) or amplitude+phase (format 1), with matching FFT size, hop size, window size, window type, format and sliding mode. Complex frames and partial tracks are not supported. Use [pvsanal](pvsanal.md) to generate inputs from real-time audio.

For ordinary analysis frames, the output updates when _fsrc_ supplies a new frame, using the latest frame from _fdest_. Sliding signals process each active sample in the control block. Samples before the note starts or after it ends have zero output.

> :warning: **Warning**
>
> It is unsafe to use the same f-variable for both input and output of pvs opcodes. Using the same one might lead to undefined behavior on some opcodes. Use a different one on the left and right sides of the opcode.

## Examples

Here is an example of the use of the _pvscross_ opcode. It uses the file [pvscross.csd](../examples/pvscross.csd).

``` csound-csd title="Example of the _pvscross_ opcode." linenums="1"
--8<-- "examples/pvscross.csd"
```

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Richard Dobson<br>
August 2001 <br>

November 2003. Thanks to Kanata Motohashi, fixed the link to the _pvcross_ opcode.

New in version 4.13
