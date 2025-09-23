<!--
id:areson
category:Signal Modifiers:Standard Filters:Resonant
-->
# areson
A notch filter whose transfer functions are the complements of the reson opcode.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = areson(asig, kcf, kbw [, iscl] [, iskip])
    ares = areson(asig, acf, kbw [, iscl] [, iskip])
    ares = areson(asig, kcf, abw [, iscl] [, iskip])
    ares = areson(asig, acf, abw [, iscl] [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares areson asig, kcf, kbw [, iscl] [, iskip]
    ares areson asig, acf, kbw [, iscl] [, iskip]
    ares areson asig, kcf, abw [, iscl] [, iskip]
    ares areson asig, acf, abw [, iscl] [, iskip]
    ```

### Initialization

_iscl_ (optional, default=0) -- coded scaling factor for resonators. A value of 1 signifies a peak response factor of 1, i.e. all frequencies other than kcf/acf are attenuated in accordance with the (normalized) response curve. A value of 2 raises the response factor so that its overall RMS value equals 1. (This intended equalization of input and output power assumes all frequencies are physically present; hence it is most applicable to white noise.) A zero value signifies no scaling of the signal, leaving that to some later adjustment (see [balance](../opcodes/balance.md)). The default value is 0.

_iskip_ (optional, default=0) -- initial disposition of internal data space. Since filtering incorporates a feedback loop of previous output, the initial status of the storage space used is significant. A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_ares_ -- the output signal at audio rate.

_asig_ -- the input signal at audio rate.

_kcf_/_acf_  -- the center frequency of the filter, or frequency position of the peak response.

_kbw_/_abw_ -- bandwidth of the filter (the Hz difference between the upper and lower half-power points).

_areson_ is a filter whose transfer functions is the complement of [reson](../opcodes/reson.md). Thus _areson_ is a notch filter whose transfer functions represents the &#8220;filtered out&#8221; aspects of their complements. However, power scaling is not normalized in _areson_ but remains the true complement of the corresponding unit. Thus an audio signal, filtered by parallel matching _reson_ and _areson_ units, would under addition simply reconstruct the original spectrum.

This property is particularly useful for controlled mixing of different sources (see [lpreson](../opcodes/lpreson.md)). Complex response curves such as those with multiple peaks can be obtained by using a bank of suitable filters in series. (The resultant response is the product of the component responses.) In such cases, the combined attenuation may result in a serious loss of signal power, but this can be regained by the use of [balance](../opcodes/balance.md).

> :warning: **Warning**
>
> When used with _iscl_ this opcode is not a notch filter but similar to [reson](../opcodes/reson.md).

## Examples

=== "Modern"
    Here is an example of the areson opcode. It uses the file [areson-modern.csd](../examples/areson-modern.csd).
    ``` csound-csd title="Example of the areson opcode." linenums="1"
    --8<-- "examples/areson-modern.csd"
    ```

=== "Classic"
    Here is an example of the areson opcode. It uses the file [areson.csd](../examples/areson.csd).
    ``` csound-csd title="Example of the areson opcode." linenums="1"
    --8<-- "examples/areson.csd"
    ```

## See also

[Standard Filters: Resonant Low-pass filters](../sigmod/standard.md)

## Credits

Audio rate parameters introduced in version 6.02

October 2013.
