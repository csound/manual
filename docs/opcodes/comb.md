<!--
id:comb
category:Signal Modifiers:Reverberation
-->
# comb
Reverberates an input signal with a &#8220;colored&#8221; frequency response.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = comb(asig, krvt, ilpt [, iskip] [, insmps])
    ```

=== "Classic"
    ``` csound-orc
    ares comb asig, krvt, ilpt [, iskip] [, insmps]
    ```

### Initialization

_ilpt_ -- loop time in seconds, which determines the &#8220;echo density&#8221; of the reverberation. This in turn characterizes the &#8220;color&#8221; of the _comb_ filter whose frequency response curve will contain _ilpt_ * _sr_/2 peaks spaced evenly between 0 and _sr_/2 (the Nyquist frequency). Loop time can be as large as available memory will permit. The space required for an _n_ second loop is _n_*_sr_ floating or double numbers (usually 4 or 8 bytes). Delay space is allocated and returned as in [delay](../opcodes/delay.md).

_iskip_ (optional, default=0) -- initial disposition of delay-loop data space (cf. [reson](../opcodes/reson.md)). The default value is 0.

_insmps_ (optional, default=0) -- delay amount, as a number of samples.

### Performance

_krvt_ -- the reverberation time (defined as the time in seconds for a signal to decay to 1/1000, or 60dB down from its original amplitude).

This filter reiterates input with an echo density determined by loop time _ilpt_. The attenuation rate is independent and is determined by _krvt_, the reverberation time (defined as the time in seconds for a signal to decay to 1/1000, or 60dB down from its original amplitude). Output from a comb filter will appear only after _ilpt_ seconds.

## Examples

=== "Modern"
    Here is an example of the comb opcode. It uses the file [comb-modern.csd](../examples/comb-modern.csd).
    ``` csound-csd title="Example of the comb opcode." linenums="1"
    --8<-- "examples/comb-modern.csd"
    ```

=== "Classic"
    Here is an example of the comb opcode. It uses the file [comb.csd](../examples/comb.csd).
    ``` csound-csd title="Example of the comb opcode." linenums="1"
    --8<-- "examples/comb.csd"
    ```

## See also

[Reverberation](../sigmod/reverbtn.md)

## Credits

Barry L. Vercoe<br>
