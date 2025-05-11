<!--
id:buzz
category:Signal Generators:Dynamic Spectrum Oscillators
-->
# buzz
Output is a set of harmonically related sine partials.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = buzz(xamp, xcps, knh, ifn [, iphs])
    ```

=== "Classic"
    ``` csound-orc
    ares buzz xamp, xcps, knh, ifn [, iphs]
    ```

### Initialization

_ifn_ -- table number of a stored function containing a sine wave. A large table of at least 8192 points is recommended.

_iphs_ (optional, default=0) -- initial phase of the fundamental frequency, expressed as a fraction of a cycle (0 to 1). A negative value will cause phase initialization to be skipped. The default value is zero

### Performance

_xamp_ -- amplitude

_xcps_ -- frequency in cycles per second

The _buzz_ units generate an additive set of harmonically related cosine partials of fundamental frequency _xcps_, and whose amplitudes are scaled so their summation peak equals _xamp_. The selection and strength of partials is determined by the following control parameters:

_knh_ -- total number of harmonics requested. New in Csound version 3.57, _knh_ defaults to one. If _knh_ is negative, the absolute value is used.

_buzz_ and [gbuzz](../opcodes/gbuzz.md) are useful as complex sound sources in subtractive synthesis. _buzz_ is a special case of the more general _gbuzz_ in which _klh_ = _kmul_ = 1; it thus produces a set of _knh_ equal-strength harmonic partials, beginning with the fundamental. (This is a band-limited pulse train; if the partials extend to the Nyquist, i.e. _knh_ = int (sr / 2 / fundamental freq.), the result is a real pulse train of amplitude _xamp_.)

Although _knh_ may be varied during performance, its internal value is necessarily integer and may cause &#8220;pops&#8221; due to discontinuities in the output. _buzz_ can be amplitude- and/or frequency-modulated by either control or audio signals.

N.B. This unit has its analog in [GEN11](../scoregens/gen11.md), in which the same set of cosines can be stored in a function table for sampling by an oscillator. Although computationally more efficient, the stored pulse train has a fixed spectral content, not a time-varying one as above.

## Examples

=== "Modern"
    Here is an example of the buzz opcode. It uses the file [buzz-modern.csd](../examples/buzz-modern.csd).
    ``` csound-orc title="Example of the buzz opcode." linenums="1"
    --8<-- "examples/buzz-modern.csd"
    ```

=== "Classic"
    Here is an example of the buzz opcode. It uses the file [buzz.csd](../examples/buzz.csd).
    ``` csound-orc title="Example of the buzz opcode." linenums="1"
    --8<-- "examples/buzz.csd"
    ```

=== "Modern"
    A musical example featuring the buzz opcode: [BuzzFof_Cucchi-modern.csd](../examples/musical/BuzzFof_Cucchi-modern.csd) by Stefano Cucchi.
    ``` csound-orc title="Musical example of the buzz opcode." linenums="1"
    --8<-- "examples//musical/BuzzFof_Cucchi-modern.csd"
    ```

=== "Classic"
    A musical example featuring the buzz opcode: [BuzzFof_Cucchi.csd](../examples/musical/BuzzFof_Cucchi.csd) by Stefano Cucchi.
    ``` csound-orc title="Musical example of the buzz opcode." linenums="1"
    --8<-- "examples//musical/BuzzFof_Cucchi.csd"
    ```

## See Also

[Dynamic Spectrum Oscillators](../siggen/dynamic.md)

## Credits

September 2003. Thanks to Kanata Motohashi for correcting the mentions of the _kmul_ parameter.
