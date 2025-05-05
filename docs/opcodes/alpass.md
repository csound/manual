<!--
id:alpass
category:Signal Modifiers:Reverberation
-->
# alpass
Reverberates an input signal with a flat frequency response.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = alpass(asig, xrvt, ilpt [, iskip] [, insmps])
    ```

=== "Classic"
    ``` csound-orc
    ares alpass asig, xrvt, ilpt [, iskip] [, insmps]
    ```

### Initialization

_ilpt_ -- loop time in seconds, which determines the &#8220;echo density&#8221; of the reverberation. This in turn characterizes the &#8220;color&#8221; of the filter whose frequency response curve will contain _ilpt_ * _sr_/2 peaks spaced evenly between 0 and _sr_/2 (the Nyquist frequency). Loop time can be as large as available memory will permit. The space required for an _n_ second loop is 4_n_*_sr_ bytes. The delay space is allocated and returned as in [delay](../opcodes/delay.md).

_iskip_ (optional, default=0) -- initial disposition of delay-loop data space (cf. [reson](../opcodes/reson.md)). The default value is 0.

_insmps_ (optional, default=0) -- delay amount, as a number of samples.

### Performance

_xrvt_ -- the reverberation time (defined as the time in seconds for a signal to decay to 1/1000, or 60dB down from its original amplitude).

This filter reiterates the input with an echo density determined by loop time _ilpt_. The attenuation rate is independent and is determined by _xrvt_, the reverberation time (defined as the time in seconds for a signal to decay to 1/1000, or 60dB down from its original amplitude). Output will begin to appear immediately.

## Examples

=== "Modern"
    Here is an example of the alpass opcode. It uses the file [alpass-modern.csd](../examples/alpass-modern.csd).
    ``` csound-csd title="Example of the alpass opcode." linenums="1"
    --8<-- "examples/alpass-modern.csd"
    ```

=== "Classic"
    Here is an example of the alpass opcode. It uses the file [alpass.csd](../examples/alpass.csd).
    ``` csound-csd title="Example of the alpass opcode." linenums="1"
    --8<-- "examples/alpass.csd"
    ```

## See also

[Reverberation](../sigmod/reverbtn.md)

## Credits

Audio rate parameter introduced in version 6.02

November 2013.
