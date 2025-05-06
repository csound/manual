<!--
id:atone
category:Signal Modifiers:Standard Filters
-->
# atone
A hi-pass filter whose transfer functions are the complements of the [tone](../opcodes/tone.md) opcode.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = atone(asig, khp [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares atone asig, khp [, iskip]
    ```

### Initialization

_iskip_ (optional, default=0) -- initial disposition of internal data space. Since filtering incorporates a feedback loop of previous output, the initial status of the storage space used is significant. A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_ares_ -- the output signal at audio rate.

_asig_ -- the input signal at audio rate.

_khp_ --  the response curve's half-power point, in Hertz. Half power is defined as peak power / root 2.

_atone_ is a filter whose transfer functions is the complement of [tone](../opcodes/tone.md). _atone_ is thus a form of high-pass filter whose transfer functions represent the &#8220;filtered out&#8221; aspects of their complements. However, power scaling is not normalized in _atone_ but remains the true complement of the corresponding unit. Thus an audio signal, filtered by parallel matching _tone_ and _atone_ units, would under addition simply reconstruct the original spectrum.

This property is particularly useful for controlled mixing of different sources (see [lpreson](../opcodes/lpreson.md)). Complex response curves such as those with multiple peaks can be obtained by using a bank of suitable filters in series. (The resultant response is the product of the component responses.) In such cases, the combined attenuation may result in a serious loss of signal power, but this can be regained by the use of [balance](../opcodes/balance.md).

## Examples

=== "Modern"
    Here is an example of the atone opcode. It uses the file [atone-modern.csd](../examples/atone-modern.csd).
    ``` csound-csd title="Example of the atone opcode." linenums="1"
    --8<-- "examples/atone-modern.csd"
    ```

=== "Classic"
    Here is an example of the atone opcode. It uses the file [atone.csd](../examples/atone.csd).
    ``` csound-csd title="Example of the atone opcode." linenums="1"
    --8<-- "examples/atone.csd"
    ```

## See also

[Standard filters: Hi-pass filters](../sigmod/standard.md)
