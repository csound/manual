<!--
id:gain
category:Signal Modifiers:Amplitude Modifiers
-->
# gain
Adjusts the amplitude audio signal according to a root-mean-square value.

## Syntax
=== "Modern"
    ``` csound-orc
    ares = gain(asig, krms [, ihp] [, iskip])
    ```

=== "Classic"
    ``` csound-orc
    ares gain asig, krms [, ihp] [, iskip]
    ```

### Initialization

_ihp_ (optional, default=10) -- half-power point (in Hz) of a special internal low-pass filter. The default value is 10.

_iskip_ (optional, default=0) -- initial disposition of internal data space (see [reson](../opcodes/reson.md)). The default value is 0.

### Performance

_asig_ -- input audio signal

_gain_ provides an amplitude modification of _asig_ so that the output _ares_ has rms power equal to _krms_. [rms](../opcodes/rms.md) and _gain_ used together (and given matching _ihp_ values) will provide the same effect as [balance](../opcodes/balance.md).

## Examples

Here is an example of the gain opcode. It uses the file [gain.csd](../examples/gain.csd).

``` csound-csd title="Example of the gain opcode." linenums="1"
--8<-- "examples/gain.csd"
```

## See also

[Amplitude Modifiers and Dynamic processing](../sigmod/ampmod.md)

## See Also

[balance](../opcodes/balance.md),
[rms](../opcodes/rms.md)
