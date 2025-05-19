<!--
id:combinv
category:Signal Modifiers:Reverberation
-->
# combinv
Reverberates an input signal with a &#8220;colored&#8221; frequency response. with a FIR filter.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = combinv(asig, krvt, ilpt [, iskip] [, insmps])
    ```

=== "Classic"
    ``` csound-orc
    ares combinv asig, krvt, ilpt [, iskip] [, insmps]
    ```

### Initialization

_ilpt_ -- loop time in seconds, which determines the &#8220;echo density&#8221; of the reverberation. This in turn characterizes the &#8220;color&#8221; of the _combinv_ filter whose frequency response curve will contain _ilpt_ * _sr_/2 peaks spaced evenly between 0 and _sr_/2 (the Nyquist frequency). Loop time can be as large as available memory will permit. The space required for an _n_ second loop is _n_*_sr_ floating or double numbers (usually 4 or 8 bytes). Delay space is allocated and returned as in [delay](../opcodes/delay.md).

_iskip_ (optional, default=0) -- initial disposition of delay-loop data space (cf. [reson](../opcodes/reson.md)). The default value is 0.

_insmps_ (optional, default=0) -- delay amount, as a number of samples.

### Performance

_krvt_ -- the reverberation time (defined as the time in seconds for a signal to decay to 1/1000, or 60dB down from its original amplitude).

This filter reiterates input with an echo density determined by loop time _ilpt_. The attenuation rate is independent and is determined by _krvt_, the reverberation time (defined as the time in seconds for a signal to decay to 1/1000, or 60dB down from its original amplitude).  Affect from a combinv filter will appear only after _ilpt_ seconds.

## Examples

=== "Modern"
    Here is an example of the combinv opcode. It uses the file [combinv-modern.csd](../examples/combinv-modern.csd).
    ``` csound-csd title="Example of the combinv opcode." linenums="1"
    --8<-- "examples/combinv-modern.csd"
    ```

=== "Classic"
    Here is an example of the combinv opcode. It uses the file [combinv.csd](../examples/combinv.csd).
    ``` csound-csd title="Example of the combinv opcode." linenums="1"
    --8<-- "examples/combinv.csd"
    ```

## See also

[Reverberation](../sigmod/reverbtn.md)

## Credits

Author: John ffitch<br>
October 2012<br>
