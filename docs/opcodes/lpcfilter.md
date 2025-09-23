<!--
id:lpcfilter
category:Spectral Processing:LPC
-->
# lpcfilter
Streaming linear prediction all-pole filter whose coefficients are obtained from streaming linear prediction analysis.

Two versions exist, one taking input from an audio signal, and the other from a function table.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = lpcfilter(asig, asrc, kflg, kprd, isiz, iord [, iwin])
    ares = lpcfilter(asig, koff, kflg, ifn, isiz, iord [, iwin])
    ```

=== "Classic"
    ``` csound-orc
    ares lpcfilter asig, asrc, kflg, kprd, isiz, iord [, iwin]
    ares lpcfilter asig, koff, kflg, ifn, isiz, iord [, iwin]
    ```

### Initialization

_isiz_ -- size of lpc input frame in samples.

_iord_ -- linear predictor order.

_ifn_ -- streaming LPC analysis source function table

_iwin_ -- window function table number (optional)

### Performance

_ares_ -- output

_asig_ - audio input

_asrc_ -- streaming LPC analysis source signal

_kflg_ -- compute flag, non-zero values switch on linear prediction analysis replacing filter coefficients, zero switch it off, keeping current filter coefficients.

_kprd_ -- analysis period in samples, determining how often new coefficients are computed.

_koff_ -- function table position offset, in samples, determining the start position of analysis frame.

This opcode is part of a suite of streaming linear prediction opcodes. It analyses an input signal, either as an audio input or stored in a function table and produces a set of coefficients for an all-pole filter that models the signal's spectral envelope. This filter is then applied to an arbitrary input, producing a cross-synthesis result.

The fundamental analysis parameters are input frame size and filter order. Longer input frames will produce a more accurate result in terms of frequency resolution, but will also involve more computation. This is due to the computation of the autocorrelation function, which is then used in the coefficient computation. This part is more efficient and depends only on the linear prediction order, which is also the number of coefficients computed. Typical lp orders may range from about 30 to 100 coefficients, but larger values can also be used.

If the LPC source signal is derived from an audio input, then the computation of coefficients is dependent on two parameters, kflg and kprd. The first is an on/off switch that determines whether coefficients are replaced by newly-computed ones or the coefficients are kept fixed to their last value. The other determines the frequency of analyses, by setting a time interval (in samples) between new coefficient computation. This ranges from coefficients being replaced every sample, to never replaced (if the period is larger than the synthesis duration). Overlapped analyses will take place if the value of kprd is less than the input size. Decreasng the spacing of analyses will also increase computation demands.

If the LPC source signal is derived from a function table, then kflg determines wheter an analysis should be performed or not (1 or 0). The value of koff is then used as an offset (in samples) into the function table determining the position of the analysis frame. For example, if kflg is permanently set to 1 and koff is set to ksmps, then at every kcycle an analysis frame will be taken from successive positions in the function table. Changing koff to fewer samples will produce a timestretched result and increasing it will time compress.

Once the signal is extracted from either an audio input or function table then it can be optionally windowed if a function table is provided. While this is optional, it is a recommended procedure (GEN20 can provide the most common windows). The signal is then analysed and coefficients replaced. The all-pole filter is computed as a direct convolution in the time domain.

## Examples

Here is an example of the lpcfilter opcode using an audio input signal as lpc source. It uses the file [lpcfilter.csd](../examples/lpcfilter.csd).

``` csound-csd title="Example of the lpcfilter opcode." linenums="1"
--8<-- "examples/lpcfilter.csd"
```

Here is another example of the lpcfilter opcode, now using a function table as lpc source. It uses the file [lpcfilter-2.csd](../examples/lpcfilter-2.csd).

``` csound-csd title="Another example of the lpcfilter opcode." linenums="1"
--8<-- "examples/lpcfilter-2.csd"
```

## See also

[Streaming Linear Predictive Coding (SLPC) Resynthesis](../spectral/lpcresyn.md)
