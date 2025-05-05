<!--
id:tvconv
category:Signal Modifiers:Convolution and Morphing
-->
# tvconv
A time-varying convolution (FIR filter) opcode.

An opcode that takes two incoming signals and interprets one of them as the coefficients of linear time-variable finite impulse response filter. This is implemented via direct convolution (for partition sizes of 1 sample) or DFT-based partitioned convolution. The signals can be 'frozen' (i.e. the filter coefficients are kept the same) at any point in time, at a-rate or k-rate.

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

_iparts_ -- partition size, for sizes > 1, a DFT-based partitioned convolution process is used. Otherwise a time-domain delay line FIR is implemented. Partition sizes > 1 are rounded to the nearest power-of-two.

_ifils_ -- filter size. For partition sizes > 1, filter sizes are rounded to the nearest power-of-two. With partition size = 1, since direct convolution is used, filters can be of any size.

### Performance

_ares_ -- audio output.

_asig1, asig2_ -- audio inputs.

_xfreez1_ -- freeze switch for asig1. Coefficients are only updated (ie. the signal is passing into the convolution) if xfreez1 > 0. This input can take an audio or a k-rate signal, or a constant.

_xfreez2_ -- freeze switch for asig2, similar to xfreez1 in operation.

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
