<!--
id:tvconv
category:Signal Modifiers:Convolution and Morphing
-->
# tvconv
A time-varying convolution (FIR filter) opcode.

_tvconv_ uses two audio signals as the input and coefficients of a time-varying FIR filter. It uses direct convolution or FFT-based partitioned convolution. Either input can be frozen at audio or control rate.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = tvconv(asig1, asig2, xfreez1, xfreez2, iparts, ifils)
    ```

=== "Classic"
    ``` csound-orc
    ares tvconv asig1, asig2, xfreez1, xfreez2, iparts, ifils
    ```

### Initialization

_iparts_ -- partition size in samples, at least 0. Values of 0 or 1 select direct convolution. Larger values select FFT-based convolution and round to the nearest power of two, with ties rounding up.

_ifils_ -- filter size in samples, at least 1. Direct convolution accepts any whole number of samples. FFT-based convolution rounds this to the nearest power of two, with ties rounding up.

Csound discards fractional parts first. If the partition size exceeds the filter size, it swaps the two sizes before choosing the method and rounding.

### Performance

_ares_ -- audio output.

_asig1, asig2_ -- audio input and filter coefficients. Both use the amplitude scale set by _0dbfs_. In either method, the output equals the convolution of the stored inputs divided by _0dbfs_. For example, a coefficient of _0dbfs_ gives a filter tap with a gain of 1.

_xfreez1_ -- update switch for _asig1_. Positive values record new samples; zero or negative values keep the stored samples. This input accepts an audio or control signal, or a constant.

_xfreez2_ -- update switch for _asig2_, with the same behavior as _xfreez1_.

Freezing stops updates to the stored samples. It does not stop convolution or mute the output. Initialization clears all stored samples and pending output.

FFT-based convolution adds a delay equal to its rounded partition size in samples. Divide this size by _sr_ to get the delay in seconds. Direct convolution adds no processing delay. Delays from the filter coefficients apply in both cases.

## Examples

Here is an example of the tvconv opcode. It uses the file [tvconv.csd](../examples/tvconv.csd).

``` csound-csd title="Example of the tvconv opcode." linenums="1"
--8<-- "examples/tvconv.csd"
```

## See also

[Convolution and Morphing](../sigmod/conmorph.md)

## Credits

Author: Victor Lazzarini <br>
2017<br>

New in version 6.09
