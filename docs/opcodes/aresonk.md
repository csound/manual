<!--
id:aresonk
category:Signal Modifiers:Standard Filters:Control
-->
# aresonk
A notch filter whose transfer functions are the complements of the reson opcode.

## Syntax
=== "Modern"
    ``` csound-orc
    kres = aresonk(ksig, kcf, kbw [, iscl] [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    kres aresonk ksig, kcf, kbw [, iscl] [, iskip]
    ```

### Initialization

_iscl_ (optional, default=0) -- coded scaling factor for resonators. A value of 1 signifies a peak response factor of 1, i.e. all frequencies other than kcf are attenuated in accordance with the (normalized) response curve. A value of 2 raises the response factor so that its overall RMS value equals 1. (This intended equalization of input and output power assumes all frequencies are physically present; hence it is most applicable to white noise.) A zero value signifies no scaling of the signal, leaving that to some later adjustment (see [balance](../opcodes/balance.md)). The default value is 0.

_iskip_ (optional, default=0) -- initial disposition of internal data space. Since filtering incorporates a feedback loop of previous output, the initial status of the storage space used is significant. A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_kres_ -- the output signal at control-rate.

_ksig_ -- the input signal at control-rate.

_kcf_ -- the center frequency of the filter, or frequency position of the peak response.

_kbw_ -- bandwidth of the filter (the Hz difference between the upper and lower half-power points).

_aresonk_ is a filter whose transfer functions is the complement of [resonk](../opcodes/resonk.md). Thus _aresonk_ is a notch filter whose transfer functions represents the &#8220;filtered out&#8221; aspects of their complements. However, power scaling is not normalized in _aresonk_ but remains the true complement of the corresponding unit.

## Examples

=== "Modern"
    Here is an example of the aresonk opcode. It uses the file [aresonk-modern.csd](../examples/aresonk-modern.csd).
    ``` csound-csd title="Example of the aresonk opcode." linenums="1"
    --8<-- "examples/aresonk-modern.csd"
    ```

=== "Classic"
    Here is an example of the aresonk opcode. It uses the file [aresonk.csd](../examples/aresonk.csd).
    ``` csound-csd title="Example of the aresonk opcode." linenums="1"
    --8<-- "examples/aresonk.csd"
    ```

## See also

[Standard Filters: Control signal filters](../sigmod/standard.md)
