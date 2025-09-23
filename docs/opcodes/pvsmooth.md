<!--
id:pvsmooth
category:Spectral Processing:Streaming
-->
# pvsmooth
Smooth the amplitude and frequency time functions of a pv stream using parallel 1st order lowpass IIR filters with time-varying cutoff frequency.

Smooth the amplitude and frequency time functions of a pv stream using a 1st order lowpass IIR with time-varying cutoff frequency. This opcode uses the same filter as the _tone_ opcode, but this time acting separately on the amplitude and frequency time functions that make up a pv stream. The cutoff frequency parameter runs at the control-rate, but unlike _tone_ and _tonek_, it is not specified in Hz, but as fractions of 1/2 frame-rate (actually the pv stream sampling rate), which is easier to understand. This means that the highest cutoff frequency is 1 and the lowest 0; the lower the frequency the smoother the functions and more pronounced the effect will be.

These are filters applied to control signals so the effect is basically blurring the spectral evolution. The effects produced are more or less similar to _pvsblur_, but with two important differences: 1.smoothing of amplitudes and frequencies use separate sets of filters; and 2. there is no increase in computational cost when higher amounts of blurring' (smoothing) are desired.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = pvsmooth(fsigin, kacf, kfcf)
    ```

=== "Classic"
    ``` csound-orc
    fsig pvsmooth fsigin, kacf, kfcf
    ```

### Performance

_fsig_ -- output pv stream

_fsigin_ -- input pv stream.

_kacf_ -- amount of cutoff frequency for amplitude function filtering, between 0 and 1, in fractions of 1/2 frame-rate.

_kfcf_ -- amount of cutoff frequency for frequency function filtering, between 0 and 1, in fractions of 1/2 frame-rate.

> :warning: **Warning**
>
> It is unsafe to use the same f-variable for both input and output of pvs opcodes. Using the same one might lead to undefined behavior on some opcodes. Use a different one on the left and right sides of the opcode.

## Examples

Here is an example of the pvsmooth opcode. It uses the file [pvsmooth.csd](../examples/pvsmooth.csd).

``` csound-csd title="Example of the pvsmooth opcode." linenums="1"
--8<-- "examples/pvsmooth.csd"
```

The formula for calculating the cutoff frequency of the filter: frame rate / hopsize = new frame starts per second (in Hz), then the percentage of half the framerate. For example, looking at the first note in the example, the frame rate is 44100 / 256 = 172,265625 Hz (= 172 new frame starts per second). half of the frame rate is about 86 Hz, and one percent of this is 0.86 Hz.

## See also

[Tools for Real-time Spectral Processing (pvs opcodes)](../spectral/realtime.md)

## Credits

Author: Victor Lazzarini<br>
May 2006 <br>

New plugin in version 5

May 2006.
