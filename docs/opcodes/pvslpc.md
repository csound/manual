<!--
id:pvslpc
category:Spectral Processing:LPC
-->
# pvslpc
Streaming linear prediction analysis.

This opcode implements streaming linear prediction analysis from an input signal and outputs an fsig, which can be used with other pvs opcodes.

## Syntax
=== "Modern"
    ``` csound-orc
    fsig = pvslpc(asrc, idftsiz, ihop, iord [, iwin])
    ```

=== "Classic"
    ``` csound-orc
    fsig pvslpc asrc, idftsiz, ihop, iord [, iwin]
    ```

### Initialization

_idftsiz_ -- size of lpc input frame in samples and fsig analysis frame. It needs to be a power-of-two.

_iord_ -- linear predictor order.

_ihop_ -- analysis hop size.

_iwin_ -- window function table number (optional).

### Performance

_fsig_ -- fsig output

_asrc_ -- source signal for lpc analysis

This opcode is part of a suite of streaming linear prediction opcodes. It analyses an input signal and produces a set of LPC coefficients for an all-pole filter that models the signal's spectral envelope. The transfer function for this filter is then computed and its magnitude spectrum is output as a streaming phase vocoder signal.

The fundamental analysis parameters are input frame size and filter order. Longer input frames will produce a more accurate result in terms of frequency resolution, but will also involve more computation. This is due to the computation of the autocorrelation function, which is then used in the coefficient computation. This part is more efficient and depends only on the linear prediction order, which is also the number of coefficients computed. Typical lp orders may range from about 30 to 100 coefficients, but larger values can also be used.

The analyses are produced every hopsize samples. Once the signal is extracted from an audio input then it can be optionally windowed if a function table is provided. While this is optional, it is a recommended procedure (GEN20 can provide the most common windows). The signal is then analysed and coefficients produced. The fsig produced by this opcode is given in AMP-FREQ format. The amplitudes contain the spectral envelope of the input signal, and the frequencies are derived from a fundamental frequency estimation computed from the autocorrelation function. These do not represent the frequencies in the input signal to any level of accuracy; they are only placeholders.

## Examples

Here is an example of the pvslpc opcode using an audio input
signal as lpc source. It uses the file [pvslpc.csd](../examples/pvslpc.csd).

``` csound-csd title="Example of the pvslpc opcode." linenums="1"
--8<-- "examples/pvslpc.csd"
```

## See also

[Streaming Linear Predictive Coding (SLPC) Resynthesis](../spectral/lpcresyn.md)
