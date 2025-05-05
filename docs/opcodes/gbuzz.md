<!--
id:gbuzz
category:Signal Generators:Dynamic Spectrum Oscillators
-->
# gbuzz
Output is a set of harmonically related cosine partials.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = gbuzz(xamp, xcps, knh, klh, kmul, ifn [, iphs])
    ```

=== "Classic"
    ``` csound-orc
    ares gbuzz xamp, xcps, knh, klh, kmul, ifn [, iphs]
    ```

### Initialization

_ifn_ -- table number of a stored function containing a cosine wave. A large table of at least 8192 points is recommended.

_iphs_ (optional, default=0) -- initial phase of the fundamental frequency, expressed as a fraction of a cycle (0 to 1). A negative value will cause phase initialization to be skipped. The default value is zero

### Performance

The buzz units generate an additive set of harmonically related cosine partials of fundamental frequency _xcps_, and whose amplitudes are scaled so their summation peak equals _xamp_. The selection and strength of partials is determined by the following control parameters:

_knh_ -- total number of harmonics requested. If _knh_ is negative, the absolute value is used. If _knh_ is zero, a value of 1 is used.

_klh_ -- lowest harmonic present. Can be positive, zero or negative. In _gbuzz_ the set of partials can begin at any partial number and proceeds upwards; if _klh_ is negative, all partials below zero will reflect as positive partials without phase change (since cosine is an even function), and will add constructively to any positive partials in the set.

_kmul_ -- specifies the multiplier in the series of amplitude coefficients. This is a power series: if the _klh_th partial has a strength coefficient of A, the (_klh_ + n)th partial will have a coefficient of A * (_kmul_ ** n), i.e. strength values trace an exponential curve. _kmul_ may be positive, zero or negative, and is not restricted to integers.

[buzz](../opcodes/buzz.md) and _gbuzz _are useful as complex sound sources in subtractive synthesis. _buzz_ is a special case of the more general _gbuzz_ in which _klh_ = _kmul_ = 1; it thus produces a set of _knh_ equal-strength harmonic partials, beginning with the fundamental. (This is a band-limited pulse train; if the partials extend to the Nyquist, i.e. _knh_ = int (sr / 2 / fundamental freq.), the result is a real pulse train of amplitude _xamp_.)

Although both _knh_ and _klh_ may be varied during performance, their internal values are necessarily integer and may cause &#8220;pops&#8221; due to discontinuities in the output. _kmul,_ however, can be varied during performance to good effect. _gbuzz_ can be amplitude- and/or frequency-modulated by either control or audio signals.

N.B. This unit has its analog in [GEN11](../scoregens/gen11.md), in which the same set of cosines can be stored in a function table for sampling by an oscillator. Although computationally more efficient, the stored pulse train has a fixed spectral content, not a time-varying one as above.

## Examples

Here is an example of the gbuzz opcode. It uses the file [gbuzz.csd](../examples/gbuzz.csd).

``` csound-orc title="Example of the gbuzz opcode." linenums="1"
--8<-- "examples/gbuzz.csd"
```

## See Also

[Dynamic Spectrum Oscillators](../siggen/dynamic.md)

## Credits

September 2003. Thanks to Kanata Motohashi for correcting the mentions of the _kmul_ parameter.
