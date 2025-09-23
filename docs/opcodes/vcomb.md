<!--
id:vcomb
category:Signal Modifiers:Reverberation
-->
# vcomb
Variably reverberates an input signal with a &#8220;colored&#8221; frequency response.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = vcomb(asig, krvt, xlpt, imaxlpt [, iskip] [, insmps])
    ```

=== "Classic"
    ``` csound-orc
    ares vcomb asig, krvt, xlpt, imaxlpt [, iskip] [, insmps]
    ```

### Initialization

_imaxlpt_ -- maximum loop time for _klpt_

_iskip_ (optional, default=0) -- initial disposition of delay-loop data space (cf. [reson](../opcodes/reson.md)). The default value is 0.

_insmps_ (optional, default=0) -- delay amount, as a number of samples.

### Performance

_krvt_ -- the reverberation time (defined as the time in seconds for a signal to decay to 1/1000, or 60dB down from its original amplitude).

_xlpt_ -- variable loop time in seconds, same as _ilpt_ in _comb_.  Loop time can be as large as _imaxlpt_.

This filter reiterates input with an echo density determined by loop time _xlpt_. The attenuation rate is independent and is determined by _krvt_, the reverberation time (defined as the time in seconds for a signal to decay to 1/1000, or 60dB down from its original amplitude). Output will appear only after _ilpt_ seconds.

## Examples

Here is an example of the vcomb opcode. It uses the file [vcomb.csd](../examples/vcomb.csd).

``` csound-csd title="Example of the vcomb opcode." linenums="1"
--8<-- "examples/vcomb.csd"
```

## See also

[Reverberation](../sigmod/reverbtn.md)

## Credits

Author: William &#8220;Pete&#8221; Moss<br>
University of Texas at Austin<br>
Austin, Texas USA<br>
January 2002<br>
