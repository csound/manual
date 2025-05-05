<!--
id:reson
category:Signal Modifiers:Standard Filters:Resonant
-->
# reson
A second-order resonant filter.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = reson(asig, xcf, xbw [, iscl] [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares reson asig, xcf, xbw [, iscl] [, iskip]
    ```

### Initialization

_iscl_ (optional, default=0) -- coded scaling factor for resonators. A value of 1 signifies a peak response factor of 1, i.e. all frequencies other than kcf are attenuated in accordance with the (normalized) response curve. A value of 2 raises the response factor so that its overall RMS value equals 1. (This intended equalization of input and output power assumes all frequencies are physically present; hence it is most applicable to white noise.) A zero value signifies no scaling of the signal, leaving that to some later adjustment (see [balance](../opcodes/balance.md)). The default value is 0.

_iskip_ (optional, default=0) -- initial disposition of internal data space. Since filtering incorporates a feedback loop of previous output, the initial status of the storage space used is significant. A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_ares_ -- the output signal at audio rate.

_asig_ -- the input signal at audio rate.

_xcf_ -- the center frequency of the filter, or frequency position of the peak response.

_xbw_ -- bandwidth of the filter (the Hz difference between the upper and lower half-power points).

_reson_ is a second-order filter in which _kcf_ controls the center frequency, or frequency position of the peak response, and _kbw_ controls its bandwidth (the frequency difference between the upper and lower half-power points).

## Examples

Here is an example of the reson opcode. It uses the file [reson.csd](../examples/reson.csd).

``` csound-csd title="Example of the reson opcode." linenums="1"
--8<-- "examples/reson.csd"
```

A musical example featuring the reson opcode: [ResonPluck_Cucchi.csd](../examples/musical/ResonPluck_Cucchi.csd) by Stefano Cucchi.

## See also

[Standard Filters: Resonant Low-pass filters](../sigmod/standard.md)

## Credits

Audio rate parameters introduced in version 6.02

November 2013.
