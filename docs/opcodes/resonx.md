<!--
id:resonx
category:Signal Modifiers:Standard Filters:Resonant
-->
# resonx
Emulates a stack of filters using the reson opcode.

_resonx_ is equivalent to a filters consisting of more layers of [reson](../opcodes/reson.md) with the same arguments, serially connected. Using a stack of a larger number of filters allows a sharper cutoff. They are faster than using a larger number instances in a Csound orchestra of the old opcodes, because only one initialization and k- cycle are needed at time and the audio loop falls entirely inside the cache memory of processor.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = resonx(asig, xcf, xbw [, inumlayer] [, iscl] [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares resonx asig, xcf, xbw [, inumlayer] [, iscl] [, iskip]
    ```

### Initialization

_inumlayer_ (optional) -- number of elements in the filter stack. Default value is 4.

_iscl_ (optional, default=0) -- coded scaling factor for resonators. A value of 1 signifies a peak response factor of 1, i.e. all frequencies other than kcf are attenuated in accordance with the (normalized) response curve. A value of 2 raises the response factor so that its overall RMS value equals 1. (This intended equalization of input and output power assumes all frequencies are physically present; hence it is most applicable to white noise.) A zero value signifies no scaling of the signal, leaving that to some later adjustment (see [balance](../opcodes/balance.md)). The default value is 0.

_iskip_ (optional, default=0) -- initial disposition of internal data space. Since filtering incorporates a feedback loop of previous output, the initial status of the storage space used is significant. A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_asig_ -- input signal

_xcf_ -- the center frequency of the filter, or frequency position of the peak response.

_xbw_ -- bandwidth of the filter (the Hz difference between the upper and lower half-power points)

## Examples

Here is an example of the resonx opcodes. It uses the file [resonx.csd](../examples/resonx.csd).

``` csound-csd title="Example of the resonx opcodes." linenums="1"
--8<-- "examples/resonx.csd"
```

## See also

[Standard Filters: Resonant Low-pass filters](../sigmod/standard.md)

## Credits

Author: Gabriel Maldonado (adapted by John ffitch)<br>
Italy<br>

New in Csound version 3.49

Audio rate parameters introduced in version 6.02

November 2013.
