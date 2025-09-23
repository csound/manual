<!--
id:atonek
category:Signal Modifiers:Standard Filters:Control
-->
# atonek
A hi-pass filter whose transfer functions are the complements of the [tonek](../opcodes/tonek.md) opcode.

## Syntax
=== "Modern"
    ``` csound-orc
    kres = atonek(ksig, khp [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    kres atonek ksig, khp [, iskip]
    ```

### Initialization

_iskip_ (optional, default=0) -- initial disposition of internal data space. Since filtering incorporates a feedback loop of previous output, the initial status of the storage space used is significant. A zero value will clear the space; a non-zero value will allow previous information to remain. The default value is 0.

### Performance

_kres_ -- the output signal at control-rate.

_ksig_ -- the input signal at control-rate.

_khp_ --  the response curve's half-power point, in Hertz. Half power is defined as peak power / root 2.

_atonek_ is a filter whose transfer functions is the complement of [tonek](../opcodes/tonek.md). _atonek_ is thus a form of high-pass filter whose transfer functions represent the &#8220;filtered out&#8221; aspects of their complements. However, power scaling is not normalized in _atonek_ but remains the true complement of the corresponding unit.

## Examples

=== "Modern"
    Here is an example of the atonek opcode. It uses the file [atonek-modern.csd](../examples/atonek-modern.csd).
    ``` csound-csd title="Example of the atonek opcode." linenums="1"
    --8<-- "examples/atonek-modern.csd"
    ```

=== "Classic"
    Here is an example of the atonek opcode. It uses the file [atonek.csd](../examples/atonek.csd).
    ``` csound-csd title="Example of the atonek opcode." linenums="1"
    --8<-- "examples/atonek.csd"
    ```

## See also

[Standard Filters: Control signal filters](../sigmod/standard.md)

## Credits

Author: Robin Whittle<br>
Australia<br>
May 1997<br>
